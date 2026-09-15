/// The reverse of writing chips out as JQL: read a whole JQL string and say
/// what each field was compared to, so the chip filters can be kept in sync
/// with whatever was typed by hand.
///
/// Deliberately narrow. It only recognizes exactly the shapes
/// `UpdatesPropertyFilter.clause` itself ever produces — `field = value` /
/// `field != value`, `field in (v1, v2)` / `field not in (v1, v2)`, `field is
/// [not] EMPTY`, the `(clause OR field is EMPTY)` wrapper for a value kept
/// alongside "No value", and its dual `(clause AND field is not EMPTY)` for a
/// value excluded alongside it — joined with nothing but top-level AND, and
/// at most one clause of each polarity per field (a kept comparison and an
/// excluded one, exactly as a tristate checkbox's two active states can
/// combine on one field). That guarantees a query the chips wrote is always
/// read back losslessly. Anything else typed by hand (a top-level OR, a
/// grouping paren that isn't one of the two wrappers, ORDER BY, a function
/// call with arguments) is outside what a chip can represent at all, and the
/// whole parse fails rather than show chips that lie about part of the query.
library;

import 'package:jira_watcher/models/jql_completion.dart';
import 'package:jira_watcher/models/updates_filters.dart';

/// What a single field was compared to: every value with an opinion, and
/// which of them are excluded rather than kept.
class ParsedJqlClause {
  const ParsedJqlClause({required this.values, this.excludedValues = const {}, this.valueLabels = const {}});

  final Set<String> values;

  /// The subset of [values] the query excluded (`!=`/`not in`/`is not EMPTY`)
  /// rather than kept.
  final Set<String> excludedValues;

  /// Labels this parse can supply on its own — a function's readable name.
  /// Nothing else: a literal's real-world name (an accountId's person) isn't
  /// recoverable from the query text, so the caller merges this against
  /// whatever the field already remembered before overwriting its values.
  final Map<String, String> valueLabels;
}

/// One parsed clause, mid-assembly: a field, the values it named, which of
/// those are excluded, and any labels the parse could supply.
typedef _Clause = (String field, Set<String> values, Set<String> excluded, Map<String, String> labels);

/// Reads [jql] as a flat AND of field comparisons. Returns null the moment
/// anything isn't one of the shapes described above — including an empty
/// parse of a non-blank string, which never happens for well-formed input, so
/// finding one always means something was rejected along the way.
Map<String, ParsedJqlClause>? parseJqlAsFilters(String jql) {
  final trimmed = jql.trim();
  if (trimmed.isEmpty) return const {};

  final tokens = [
    for (final t in tokenizeJql(trimmed))
      if (t.type != JqlTokenType.ws) t,
  ];
  if (tokens.isEmpty) return const {};

  final result = <String, ParsedJqlClause>{};
  for (final segment in _splitTopLevelAnd(tokens)) {
    final parsed = _parseSegment(segment);
    if (parsed == null) return null;
    final (field, values, excluded, labels) = parsed;

    final existing = result[field];
    if (existing == null) {
      result[field] = ParsedJqlClause(values: values, excludedValues: excluded, valueLabels: labels);
      continue;
    }
    // A field named twice is only a shape a chip writes when it is exactly
    // one kept clause and one excluded clause, over disjoint values — a
    // tristate filter with some boxes checked and others dashed.
    final existingIsPure = existing.excludedValues.isEmpty || existing.excludedValues.length == existing.values.length;
    final newIsPure = excluded.isEmpty || excluded.length == values.length;
    final onePositiveOneNegative = existing.excludedValues.isEmpty != excluded.isEmpty;
    if (!existingIsPure || !newIsPure || !onePositiveOneNegative || existing.values.intersection(values).isNotEmpty) return null;
    result[field] = ParsedJqlClause(
      values: {...existing.values, ...values},
      excludedValues: {...existing.excludedValues, ...excluded},
      valueLabels: {...existing.valueLabels, ...labels},
    );
  }
  return result;
}

/// Splits at every top-level (depth 0) `AND`. A depth-0 `OR` is left in place
/// — only the recognized wrapper shapes may contain one, and that check
/// happens per segment, where the wrapper's own parens hold depth above 0 for
/// everything between them.
List<List<JqlToken>> _splitTopLevelAnd(List<JqlToken> tokens) {
  final segments = <List<JqlToken>>[];
  var current = <JqlToken>[];
  var depth = 0;
  for (final tok in tokens) {
    if (tok.type == JqlTokenType.paren) depth += tok.text == '(' ? 1 : -1;
    if (depth == 0 && tok.type == JqlTokenType.word && tok.text.toLowerCase() == 'and') {
      segments.add(current);
      current = [];
      continue;
    }
    current.add(tok);
  }
  segments.add(current);
  return segments;
}

/// One clause — or null if this segment is not a shape a chip can represent.
_Clause? _parseSegment(List<JqlToken> segment) {
  if (segment.isEmpty) return null;

  // The `(clause OR field is EMPTY)` / `(clause AND field is not EMPTY)`
  // wrappers a chip writes when "No value" is kept, or excluded, alongside
  // real values.
  if (segment.first.text == '(' && segment.last.text == ')') {
    final inner = segment.sublist(1, segment.length - 1);

    final orAt = _findTopLevelWord(inner, 'or');
    if (orAt != null) {
      final left = _parseSegment(inner.sublist(0, orAt));
      if (left == null) return null;
      final (field, values, excluded, labels) = left;
      // An OR only wraps a purely kept clause — De Morgan's turns "or" into
      // "and" the moment any part of it is excluded instead.
      if (excluded.isNotEmpty || !_isEmptyCheck(inner.sublist(orAt + 1), field, negative: false)) return null;
      return (field, {...values, UpdatesPropertyFilter.emptyValue}, excluded, labels);
    }

    final andAt = _findTopLevelWord(inner, 'and');
    if (andAt != null) {
      final left = _parseSegment(inner.sublist(0, andAt));
      if (left == null) return null;
      final (field, values, excluded, labels) = left;
      // Its dual only wraps a purely excluded clause.
      if (values.length != excluded.length || !_isEmptyCheck(inner.sublist(andAt + 1), field, negative: true)) return null;
      return (field, {...values, UpdatesPropertyFilter.emptyValue}, {...excluded, UpdatesPropertyFilter.emptyValue}, labels);
    }

    return null;
  }

  if (segment.first.type != JqlTokenType.word) return null;
  final field = segment.first.text;
  var i = 1;

  // `field is EMPTY` / `field is not EMPTY`
  if (i < segment.length && segment[i].type == JqlTokenType.word && segment[i].text.toLowerCase() == 'is') {
    final negative = i + 1 < segment.length && segment[i + 1].type == JqlTokenType.word && segment[i + 1].text.toLowerCase() == 'not';
    final emptyAt = negative ? i + 2 : i + 1;
    if (emptyAt < segment.length && emptyAt + 1 == segment.length && segment[emptyAt].type == JqlTokenType.word && segment[emptyAt].text.toLowerCase() == 'empty') {
      return (field, {UpdatesPropertyFilter.emptyValue}, negative ? {UpdatesPropertyFilter.emptyValue} : const {}, const {});
    }
    return null;
  }

  // `field = value` / `field != value`
  if (i < segment.length && segment[i].type == JqlTokenType.op && (segment[i].text == '=' || segment[i].text == '!=')) {
    final negative = segment[i].text == '!=';
    final value = _parseValue(segment.sublist(i + 1));
    if (value == null) return null;
    final (raw, label) = value;
    return (field, {raw}, negative ? {raw} : const {}, label == null ? const {} : {raw: label});
  }

  // `field in (v1, v2, ...)` / `field not in (v1, v2, ...)`
  final isNot = i < segment.length && segment[i].type == JqlTokenType.word && segment[i].text.toLowerCase() == 'not';
  final inAt = isNot ? i + 1 : i;
  if (inAt < segment.length && segment[inAt].type == JqlTokenType.word && segment[inAt].text.toLowerCase() == 'in') {
    i = inAt + 1;
    if (i >= segment.length || segment[i].text != '(' || segment.last.text != ')') return null;
    final items = segment.sublist(i + 1, segment.length - 1);
    final values = <String>{};
    final labels = <String, String>{};
    for (final part in _splitTopLevelComma(items)) {
      final value = _parseValue(part);
      if (value == null) return null;
      final (raw, label) = value;
      values.add(raw);
      if (label != null) labels[raw] = label;
    }
    if (values.isEmpty) return null;
    return (field, values, isNot ? values : const {}, labels);
  }

  return null;
}

/// A single value token or a zero-argument function call, as `(rawValue,
/// label)` — the model's own encoding for a picked value, with a readable
/// label only where the parse can supply one (a function's name).
(String, String?)? _parseValue(List<JqlToken> tokens) {
  if (tokens.isEmpty) return null;
  if (tokens.length == 1) {
    final tok = tokens.single;
    if (tok.type == JqlTokenType.word) return (tok.text, null);
    if (tok.type == JqlTokenType.quoted) return (_unquote(tok.text), null);
    return null;
  }
  // A bare, zero-argument function call: `currentUser()`.
  if (tokens.length == 3 && tokens[0].type == JqlTokenType.word && tokens[1].text == '(' && tokens[2].text == ')') {
    final call = '${tokens[0].text}()';
    return (UpdatesPropertyFilter.function(call), jqlFunctionLabel(call));
  }
  return null;
}

String _unquote(String quoted) {
  var inner = quoted.startsWith('"') ? quoted.substring(1) : quoted;
  if (inner.endsWith('"')) inner = inner.substring(0, inner.length - 1);
  return inner.replaceAll(r'\"', '"').replaceAll(r'\\', r'\');
}

/// The index of the first top-level (depth 0) word matching [word], or null.
int? _findTopLevelWord(List<JqlToken> tokens, String word) {
  var depth = 0;
  for (var i = 0; i < tokens.length; i++) {
    final tok = tokens[i];
    if (tok.type == JqlTokenType.paren) depth += tok.text == '(' ? 1 : -1;
    if (depth == 0 && tok.type == JqlTokenType.word && tok.text.toLowerCase() == word) return i;
  }
  return null;
}

bool _isEmptyCheck(List<JqlToken> tokens, String field, {required bool negative}) {
  final expected = negative ? ['is', 'not', 'empty'] : ['is', 'empty'];
  if (tokens.length != expected.length + 1) return false;
  if (tokens[0].type != JqlTokenType.word || tokens[0].text != field) return false;
  for (var i = 0; i < expected.length; i++) {
    if (tokens[i + 1].type != JqlTokenType.word || tokens[i + 1].text.toLowerCase() != expected[i]) return false;
  }
  return true;
}

List<List<JqlToken>> _splitTopLevelComma(List<JqlToken> tokens) {
  final parts = <List<JqlToken>>[];
  var current = <JqlToken>[];
  var depth = 0;
  for (final tok in tokens) {
    if (tok.type == JqlTokenType.paren) depth += tok.text == '(' ? 1 : -1;
    if (depth == 0 && tok.type == JqlTokenType.comma) {
      parts.add(current);
      current = [];
      continue;
    }
    current.add(tok);
  }
  parts.add(current);
  return parts;
}

/// Applies a successful [parseJqlAsFilters] result onto [current]: every
/// existing filter's values (and which of them are excluded) follow what the
/// query said for its field, cleared if the field went unmentioned; any field
/// the query names that isn't a filter yet is added as a new one, via
/// [labelFor] for its display name.
///
/// A value's previously remembered label survives if the value is still
/// picked; the parse's own labels (from a function call) fill in the rest.
UpdatesFilters applyParsedJqlToFilters(UpdatesFilters current, Map<String, ParsedJqlClause> parsed, String Function(String field) labelFor) {
  var result = current;
  for (final filter in current.filters) {
    final clause = parsed[filter.field];
    result = result.withValues(
      filter.field,
      clause?.values ?? const {},
      excludedValues: clause?.excludedValues ?? const {},
      valueLabels: {...filter.valueLabels, ...?clause?.valueLabels},
    );
  }
  for (final entry in parsed.entries) {
    if (current.byField(entry.key) != null) continue;
    result = result.add(
      UpdatesPropertyFilter(
        field: entry.key,
        label: labelFor(entry.key),
        values: entry.value.values,
        excludedValues: entry.value.excludedValues,
        valueLabels: entry.value.valueLabels,
      ),
    );
  }
  return result;
}
