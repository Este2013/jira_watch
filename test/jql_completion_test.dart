import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/models/jql_completion.dart';

/// Classifies [text] with the cursor at its end, which is by far the common
/// case (typing forward) and keeps every test below readable as plain text.
JqlCompletionContext _at(String text) => classifyJqlCursor(text, text.length);

void main() {
  group('field mode', () {
    test('an empty query starts by naming a field', () {
      final ctx = _at('');
      expect(ctx.mode, JqlCompletionMode.field);
      expect(ctx.prefix, isEmpty);
      expect(ctx.replaceStart, 0);
    });

    test('a partial field name is the prefix to replace', () {
      final ctx = _at('assig');
      expect(ctx.mode, JqlCompletionMode.field);
      expect(ctx.prefix, 'assig');
      expect(ctx.replaceStart, 0);
      expect(ctx.replaceEnd, 5);
    });

    test('after AND, a new field is expected', () {
      final ctx = _at('status = Open AND assig');
      expect(ctx.mode, JqlCompletionMode.field);
      expect(ctx.prefix, 'assig');
      expect(ctx.replaceStart, 18);
    });

    test('after OR too, case-insensitively', () {
      expect(_at('status = Open or ').mode, JqlCompletionMode.field);
    });

    test('inside a grouping paren', () {
      final ctx = _at('(stat');
      expect(ctx.mode, JqlCompletionMode.field);
      expect(ctx.prefix, 'stat');
    });

    test('a bare custom field id in progress', () {
      final ctx = _at('cf[100');
      expect(ctx.mode, JqlCompletionMode.field);
      expect(ctx.prefix, 'cf[100');
    });
  });

  group('operator mode', () {
    test('right after a field name and a space', () {
      final ctx = _at('status ');
      expect(ctx.mode, JqlCompletionMode.op);
      expect(ctx.field, 'status');
      expect(ctx.prefix, isEmpty);
    });

    test('a partially typed operator word', () {
      final ctx = _at('assignee i');
      expect(ctx.mode, JqlCompletionMode.op);
      expect(ctx.field, 'assignee');
      expect(ctx.prefix, 'i');
    });

    test('a fully custom field id still resolves', () {
      final ctx = _at('cf[10061] ');
      expect(ctx.mode, JqlCompletionMode.op);
      expect(ctx.field, 'cf[10061]');
    });
  });

  group('value mode', () {
    test('right after a symbol operator', () {
      final ctx = _at('status = ');
      expect(ctx.mode, JqlCompletionMode.value);
      expect(ctx.field, 'status');
      expect(ctx.prefix, isEmpty);
    });

    test('a partial bare value', () {
      final ctx = _at('status = Op');
      expect(ctx.mode, JqlCompletionMode.value);
      expect(ctx.prefix, 'Op');
    });

    test('inside an open quote, unquoted and unescaped', () {
      final ctx = _at('status = "In Prog');
      expect(ctx.mode, JqlCompletionMode.value);
      expect(ctx.field, 'status');
      expect(ctx.prefix, 'In Prog');
    });

    test('a quote containing an escaped quote', () {
      final ctx = _at(r'summary ~ "say \"hi');
      expect(ctx.mode, JqlCompletionMode.value);
      expect(ctx.prefix, 'say "hi');
    });

    test('right after the word operator "in ("', () {
      final ctx = _at('assignee in (');
      expect(ctx.mode, JqlCompletionMode.value);
      expect(ctx.field, 'assignee');
      expect(ctx.prefix, isEmpty);
    });

    test('a second item in a list, right after the comma', () {
      final ctx = _at('assignee in ("5b10a2", ');
      expect(ctx.mode, JqlCompletionMode.value);
      expect(ctx.field, 'assignee');
    });

    test('still inside the list mid-word for the second item', () {
      final ctx = _at('assignee in ("5b10a2", jo');
      expect(ctx.mode, JqlCompletionMode.value);
      expect(ctx.field, 'assignee');
      expect(ctx.prefix, 'jo');
    });

    test('after a function call nested inside the list', () {
      final ctx = _at('assignee in (currentUser(), ');
      expect(ctx.mode, JqlCompletionMode.value);
      expect(ctx.field, 'assignee');
    });

    test('"not in" is recognized as one operator', () {
      final ctx = _at('assignee not in (');
      expect(ctx.mode, JqlCompletionMode.value);
      expect(ctx.field, 'assignee');
    });

    test('"is not" is recognized as one operator', () {
      final ctx = _at('status is not ');
      expect(ctx.mode, JqlCompletionMode.value);
      expect(ctx.field, 'status');
    });
  });

  group('keyword mode', () {
    test('a complete simple clause offers AND/OR next', () {
      final ctx = _at('status = Open ');
      expect(ctx.mode, JqlCompletionMode.keyword);
    });

    test('a complete quoted-value clause too', () {
      final ctx = _at('status = "In Progress" ');
      expect(ctx.mode, JqlCompletionMode.keyword);
    });

    test('a closed value list reads as complete', () {
      final ctx = _at('assignee in ("5b10a2") ');
      expect(ctx.mode, JqlCompletionMode.keyword);
    });

    test('a bare function value clause', () {
      final ctx = _at('assignee = currentUser() ');
      expect(ctx.mode, JqlCompletionMode.keyword);
    });
  });

  group('multi-clause queries', () {
    test('an earlier finished clause does not leak into a later one', () {
      final ctx = _at('status = Open AND assignee = ');
      expect(ctx.mode, JqlCompletionMode.value);
      expect(ctx.field, 'assignee');
    });

    test('a clause grouped in parens still resolves within it', () {
      final ctx = _at('(status = Open OR priority = ');
      expect(ctx.mode, JqlCompletionMode.value);
      expect(ctx.field, 'priority');
    });

    test('leaving the group offers a fresh field', () {
      final ctx = _at('(status = Open) AND ');
      expect(ctx.mode, JqlCompletionMode.field);
    });
  });

  group('replace span', () {
    test('replaces only the token being typed, not the whole query', () {
      final ctx = _at('status = Op');
      expect(ctx.replaceStart, 9);
      expect(ctx.replaceEnd, 11);
    });

    test('an empty prefix is a zero-width insertion point', () {
      final ctx = _at('status = ');
      expect(ctx.replaceStart, ctx.replaceEnd);
      expect(ctx.replaceStart, 9);
    });
  });

  group('cursor in the middle of longer text', () {
    test('classifies at the cursor, ignoring text after it', () {
      final text = 'status = Open AND assignee = currentUser()';
      final ctx = classifyJqlCursor(text, 'status = '.length);
      expect(ctx.mode, JqlCompletionMode.value);
      expect(ctx.field, 'status');
      expect(ctx.prefix, isEmpty);
    });
  });
}
