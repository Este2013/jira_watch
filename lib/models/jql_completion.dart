/// What the JQL text field's autocomplete offers at the cursor: read what has
/// been typed so far and say whether the caret sits where a field name, an
/// operator, a value, or a clause connector (AND/OR/ORDER BY) belongs.
///
/// Pure and dependency-free on purpose — it reasons about text and an offset,
/// nothing else, so the guesswork here can be tested without a widget tree or
/// a Jira site to talk to. It is deliberately a heuristic rather than a full
/// JQL grammar: it tracks one clause's `field operator value` shape and enough
/// paren-depth to see through an `IN (...)` list or a function call, and falls
/// back to field suggestions — always a safe, non-disruptive guess — the
/// moment the text does something this does not specifically recognize.
library;

enum JqlCompletionMode {
  /// The cursor is where a field name (or `cf[id]`) belongs — the start of a
  /// clause.
  field,

  /// A field has been named; the cursor is where its operator belongs.
  op,

  /// A field and operator are in place; the cursor is where a value belongs.
  value,

  /// A clause looks complete; the cursor is where AND, OR, or ORDER BY would
  /// go next.
  keyword,
}

class JqlCompletionContext {
  const JqlCompletionContext({required this.mode, required this.replaceStart, required this.replaceEnd, required this.prefix, this.field});

  final JqlCompletionMode mode;

  /// The span in the original text that accepting a suggestion replaces —
  /// always `[replaceStart, replaceEnd)` around the token being typed, or a
  /// zero-width insertion point when nothing has been typed yet.
  final int replaceStart;
  final int replaceEnd;

  /// What has been typed of the current token, with any surrounding quotes
  /// removed and escapes undone.
  final String prefix;

  /// The field an [op] or [value] suggestion is for.
  final String? field;
}

enum JqlTokenType { word, quoted, op, paren, comma, ws }

/// One lexical token of a JQL string — shared by the cursor classifier below
/// and by the JQL-to-chips parser in `jql_to_filters.dart`, so the two agree
/// on what a "field", a "value" and an "operator" look like.
class JqlToken {
  const JqlToken(this.type, this.start, this.end, this.text);
  final JqlTokenType type;
  final int start, end;
  final String text;
}

final _tokenPattern = RegExp(
  r'"(?:[^"\\]|\\.)*"?'
  r'|!=|<=|>=|!~'
  r'|[=<>~]'
  r'|[()]'
  r'|,'
  r'|[A-Za-z0-9_.\[\]]+'
  r'|\s+',
);

const _symbolOps = {'=', '!=', '<', '<=', '>', '>=', '~', '!~'};

/// The words JQL treats as part of an operator rather than a value —
/// `assignee IS EMPTY`, `assignee WAS IN (...)`, `status CHANGED`.
const _operatorWords = {'not', 'in', 'is', 'was', 'changed'};

JqlTokenType _classify(String t) {
  if (t.startsWith('"')) return JqlTokenType.quoted;
  if (t == '(' || t == ')') return JqlTokenType.paren;
  if (t == ',') return JqlTokenType.comma;
  if (t.trim().isEmpty) return JqlTokenType.ws;
  if (_symbolOps.contains(t)) return JqlTokenType.op;
  return JqlTokenType.word;
}

/// Splits [text] into [JqlToken]s: quoted strings, comparison operators,
/// parens, commas, bare words (field names, values, `cf[10061]`), and
/// whitespace — everything a JQL string is made of, without judging whether
/// any of it forms a valid query.
List<JqlToken> tokenizeJql(String text) => [
  for (final m in _tokenPattern.allMatches(text)) JqlToken(_classify(m.group(0)!), m.start, m.end, m.group(0)!),
];

JqlToken? _prevNonWs(List<JqlToken> tokens, int fromIndex) {
  for (var i = fromIndex; i >= 0; i--) {
    if (tokens[i].type != JqlTokenType.ws) return tokens[i];
  }
  return null;
}

/// What the JQL editor should offer for [text] with the caret at [cursor].
JqlCompletionContext classifyJqlCursor(String text, int cursor) {
  cursor = cursor.clamp(0, text.length);
  final tokens = tokenizeJql(text.substring(0, cursor));

  // The token being typed right now: the last one, if it actually touches the
  // cursor — a trailing space, comma or paren means the next token has not
  // started yet, so there is nothing to replace, only to insert.
  JqlToken? partial;
  var contextTokens = tokens;
  if (tokens.isNotEmpty) {
    final last = tokens.last;
    if (last.end == cursor && last.type != JqlTokenType.ws && last.type != JqlTokenType.paren && last.type != JqlTokenType.comma) {
      partial = last;
      contextTokens = tokens.sublist(0, tokens.length - 1);
    }
  }

  final replaceStart = partial?.start ?? cursor;
  var prefix = partial?.text ?? '';
  if (partial?.type == JqlTokenType.quoted) {
    var inner = prefix.substring(1);
    if (inner.endsWith('"')) inner = inner.substring(0, inner.length - 1);
    prefix = inner.replaceAll(r'\"', '"').replaceAll(r'\\', r'\');
  }

  // Walk backward from the cursor to where the current clause starts: a
  // top-level AND/OR, or a grouping '(' — as opposed to one opening a value
  // list (`in (`) or a function call (`currentUser(`), which is content of
  // the clause and is walked straight through via the depth count.
  final clause = <JqlToken>[];
  var depth = 0;
  var i = contextTokens.length - 1;
  while (i >= 0) {
    final tok = contextTokens[i];
    if (tok.type == JqlTokenType.ws) {
      i--;
      continue;
    }
    if (tok.type == JqlTokenType.paren && tok.text == ')') {
      depth++;
      clause.insert(0, tok);
      i--;
      continue;
    }
    if (tok.type == JqlTokenType.paren && tok.text == '(') {
      if (depth > 0) {
        depth--;
        clause.insert(0, tok);
        i--;
        continue;
      }
      final before = _prevNonWs(contextTokens, i - 1);
      final opensValue = before != null && before.type == JqlTokenType.word && before.text.toLowerCase() != 'and' && before.text.toLowerCase() != 'or';
      if (opensValue) {
        clause.insert(0, tok);
        i--;
        continue;
      }
      break; // a genuine grouping paren: the clause starts after it
    }
    if (depth == 0 && tok.type == JqlTokenType.word) {
      final w = tok.text.toLowerCase();
      if (w == 'and' || w == 'or') break;
    }
    clause.insert(0, tok);
    i--;
  }

  if (clause.isEmpty || clause.first.type != JqlTokenType.word) {
    return JqlCompletionContext(mode: JqlCompletionMode.field, replaceStart: replaceStart, replaceEnd: cursor, prefix: prefix);
  }
  final field = clause.first.text;

  var opEnd = 1;
  final opWords = <String>[];
  while (opEnd < clause.length && clause[opEnd].type == JqlTokenType.word && _operatorWords.contains(clause[opEnd].text.toLowerCase())) {
    opWords.add(clause[opEnd].text.toLowerCase());
    opEnd++;
  }
  var hasOperator = opWords.isNotEmpty;
  if (!hasOperator && opEnd < clause.length && clause[opEnd].type == JqlTokenType.op) {
    opEnd++;
    hasOperator = true;
  }

  if (!hasOperator) {
    return JqlCompletionContext(mode: JqlCompletionMode.op, replaceStart: replaceStart, replaceEnd: cursor, prefix: prefix, field: field);
  }

  final afterOp = clause.sublist(opEnd);
  final last = afterOp.isEmpty ? null : afterOp.last;
  final pendingListItem = last != null && (last.type == JqlTokenType.comma || (last.type == JqlTokenType.paren && last.text == '('));
  final openParens = afterOp.where((t) => t.type == JqlTokenType.paren && t.text == '(').length - afterOp.where((t) => t.type == JqlTokenType.paren && t.text == ')').length;

  if (afterOp.isEmpty || pendingListItem || openParens > 0) {
    return JqlCompletionContext(mode: JqlCompletionMode.value, replaceStart: replaceStart, replaceEnd: cursor, prefix: prefix, field: field);
  }
  return JqlCompletionContext(mode: JqlCompletionMode.keyword, replaceStart: replaceStart, replaceEnd: cursor, prefix: prefix);
}
