/// The reverse of writing chips out as JQL: read a whole JQL string and say
/// what each field was compared to, so the chip filters can be kept in sync
/// with whatever was typed by hand.
///
/// Deliberately narrow. It only recognizes exactly the shapes
/// `UpdatesPropertyFilter.clause` itself ever produces — `field = value`,
/// `field in (v1, v2)`, `field is EMPTY`, and the `(clause OR field is EMPTY)`
/// wrapper for a value picked alongside "No value" — joined with nothing but
/// top-level AND. That guarantees a query the chips wrote is always read back
/// losslessly. Anything else typed by hand (OR, `!=`, a grouping paren that
/// isn't that one wrapper, ORDER BY, a function call with arguments) is
/// outside what a chip can represent at all, and the whole parse fails rather
/// than show chips that lie about part of the query.
library;

import 'package:jira_watcher/models/jql_completion.dart';
import 'package:jira_watcher/models/updates_filters.dart';

/// What a single field was compared to.
class ParsedJqlClause {
  const ParsedJqlClause({required this.values, this.valueLabels = const {}});

  final Set<String> values;

  /// Labels this parse can supply on its own — a function's readable name.
  /// Nothing else: a literal's real-world name (an accountId's person) isn't
  /// recoverable from the query text, so the caller merges this against
  /// whatever the field already remembered before overwriting its values.
  final Map<String, String> valueLabels;
}

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
    final clause = _parseSegment(segment);
    if (clause == null) return null;
    final (field, values, labels) = clause;
    if (result.containsKey(field)) return null; // the same field twice isn't a shape chips write
    result[field] = ParsedJqlClause(values: values, valueLabels: labels);
  }
  return result;
}

/// Splits at every top-level (depth 0) `AND`. A depth-0 `OR` is left in place
/// — only the one recognized wrapper shape may contain one, and that check
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

/// One clause's (field, values, labels) — or null if this segment is not a
/// shape a chip can represent.
(String, Set<String>, Map<String, String>)? _parseSegment(List<JqlToken> segment) {
  if (segment.isEmpty) return null;

  // The `(clause OR field is EMPTY)` wrapper a chip writes when "No value" is
  // picked alongside real values.
  if (segment.first.text == '(' && segment.last.text == ')') {
    final inner = segment.sublist(1, segment.length - 1);
    final orAt = _findTopLevelOr(inner);
    if (orAt == null) return null;
    final left = inner.sublist(0, orAt);
    final right = inner.sublist(orAt + 1);
    final leftClause = _parseSegment(left);
    if (leftClause == null) return null;
    final (field, values, labels) = leftClause;
    if (!_isEmptyCheck(right, field)) return null;
    return (field, {...values, UpdatesPropertyFilter.emptyValue}, labels);
  }

  if (segment.first.type != JqlTokenType.word) return null;
  final field = segment.first.text;
  var i = 1;

  // `field is EMPTY`
  if (i + 1 < segment.length &&
      segment[i].type == JqlTokenType.word &&
      segment[i].text.toLowerCase() == 'is' &&
      segment[i + 1].type == JqlTokenType.word &&
      segment[i + 1].text.toLowerCase() == 'empty' &&
      i + 2 == segment.length) {
    return (field, {UpdatesPropertyFilter.emptyValue}, const {});
  }

  // `field = value`
  if (i < segment.length && segment[i].type == JqlTokenType.op && segment[i].text == '=') {
    final value = _parseValue(segment.sublist(i + 1));
    if (value == null) return null;
    final (raw, label) = value;
    return (field, {raw}, label == null ? const {} : {raw: label});
  }

  // `field in (v1, v2, ...)`
  if (i < segment.length && segment[i].type == JqlTokenType.word && segment[i].text.toLowerCase() == 'in') {
    i++;
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
    return (field, values, labels);
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

int? _findTopLevelOr(List<JqlToken> tokens) {
  var depth = 0;
  for (var i = 0; i < tokens.length; i++) {
    final tok = tokens[i];
    if (tok.type == JqlTokenType.paren) depth += tok.text == '(' ? 1 : -1;
    if (depth == 0 && tok.type == JqlTokenType.word && tok.text.toLowerCase() == 'or') return i;
  }
  return null;
}

bool _isEmptyCheck(List<JqlToken> tokens, String field) =>
    tokens.length == 3 &&
    tokens[0].type == JqlTokenType.word &&
    tokens[0].text == field &&
    tokens[1].type == JqlTokenType.word &&
    tokens[1].text.toLowerCase() == 'is' &&
    tokens[2].type == JqlTokenType.word &&
    tokens[2].text.toLowerCase() == 'empty';

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
/// existing filter's values follow what the query said for its field (cleared
/// if the field went unmentioned), and any field the query names that isn't a
/// filter yet is added as a new one, via [labelFor] for its display name.
///
/// A value's previously remembered label survives if the value is still
/// picked; the parse's own labels (from a function call) fill in the rest.
UpdatesFilters applyParsedJqlToFilters(UpdatesFilters current, Map<String, ParsedJqlClause> parsed, String Function(String field) labelFor) {
  var result = current;
  for (final filter in current.filters) {
    final clause = parsed[filter.field];
    result = result.withValues(filter.field, clause?.values ?? const {}, valueLabels: {...filter.valueLabels, ...?clause?.valueLabels});
  }
  for (final entry in parsed.entries) {
    if (current.byField(entry.key) != null) continue;
    result = result.add(UpdatesPropertyFilter(field: entry.key, label: labelFor(entry.key), values: entry.value.values, valueLabels: entry.value.valueLabels));
  }
  return result;
}
