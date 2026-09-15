import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/models/jql_to_filters.dart';
import 'package:jira_watcher/models/updates_filters.dart';

void main() {
  group('parseJqlAsFilters', () {
    test('a blank query is a valid empty parse', () {
      expect(parseJqlAsFilters(''), <String, ParsedJqlClause>{});
      expect(parseJqlAsFilters('   '), <String, ParsedJqlClause>{});
    });

    test('a single equality', () {
      final parsed = parseJqlAsFilters('status = "Open"')!;
      expect(parsed['status']!.values, {'Open'});
    });

    test('a bare (unquoted) value', () {
      final parsed = parseJqlAsFilters('priority = High')!;
      expect(parsed['priority']!.values, {'High'});
    });

    test('an in-list of several literals', () {
      final parsed = parseJqlAsFilters('labels in ("blocked", "urgent")')!;
      expect(parsed['labels']!.values, {'blocked', 'urgent'});
    });

    test('field is EMPTY', () {
      final parsed = parseJqlAsFilters('assignee is EMPTY')!;
      expect(parsed['assignee']!.values, {UpdatesPropertyFilter.emptyValue});
    });

    test('is/empty read case-insensitively', () {
      final parsed = parseJqlAsFilters('assignee IS empty')!;
      expect(parsed['assignee']!.values, {UpdatesPropertyFilter.emptyValue});
    });

    test('a value alongside "No value", the wrapper a chip writes', () {
      final parsed = parseJqlAsFilters('(status = "Open" OR status is EMPTY)')!;
      expect(parsed['status']!.values, {'Open', UpdatesPropertyFilter.emptyValue});
    });

    test('a bare zero-argument function reads as a function value, named', () {
      final parsed = parseJqlAsFilters('assignee = currentUser()')!;
      final value = parsed['assignee']!.values.single;
      expect(UpdatesPropertyFilter.isFunction(value), isTrue);
      expect(parsed['assignee']!.valueLabels[value], 'Current user');
    });

    test('a function mixed with literals in a list', () {
      final parsed = parseJqlAsFilters('assignee in (currentUser(), "5b10a2")')!;
      expect(parsed['assignee']!.values, hasLength(2));
      expect(parsed['assignee']!.values.contains('5b10a2'), isTrue);
    });

    test('a function alongside "No value", nested inside the wrapper', () {
      final parsed = parseJqlAsFilters('(assignee in (currentUser(), "5b10a2") OR assignee is EMPTY)')!;
      expect(parsed['assignee']!.values, hasLength(3));
      expect(parsed['assignee']!.values.contains(UpdatesPropertyFilter.emptyValue), isTrue);
    });

    test('several ANDed clauses', () {
      final parsed = parseJqlAsFilters('status = "Open" AND labels in ("a", "b") AND assignee is EMPTY')!;
      expect(parsed.keys, {'status', 'labels', 'assignee'});
      expect(parsed['status']!.values, {'Open'});
      expect(parsed['labels']!.values, {'a', 'b'});
      expect(parsed['assignee']!.values, {UpdatesPropertyFilter.emptyValue});
    });

    test('AND reads case-insensitively', () {
      final parsed = parseJqlAsFilters('status = "Open" and priority = "High"')!;
      expect(parsed.keys, {'status', 'priority'});
    });

    test('a custom field id is a field like any other', () {
      final parsed = parseJqlAsFilters('cf[10061] = "Core"')!;
      expect(parsed['cf[10061]']!.values, {'Core'});
    });

    test('rejects a top-level OR outside the recognized wrapper', () {
      expect(parseJqlAsFilters('status = "Open" OR status = "Closed"'), isNull);
    });

    test('rejects an operator no chip ever writes', () {
      expect(parseJqlAsFilters('status != "Open"'), isNull);
    });

    test('rejects "not in"', () {
      expect(parseJqlAsFilters('assignee not in ("5b10a2")'), isNull);
    });

    test('rejects a trailing ORDER BY', () {
      expect(parseJqlAsFilters('status = "Open" ORDER BY updated DESC'), isNull);
    });

    test('rejects a function call carrying arguments', () {
      expect(parseJqlAsFilters('assignee = membersOf("jira-users")'), isNull);
    });

    test('rejects the same field named twice', () {
      expect(parseJqlAsFilters('status = "Open" AND status = "Closed"'), isNull);
    });

    test('rejects a grouping paren that is not the empty-value wrapper', () {
      expect(parseJqlAsFilters('(status = "Open" OR priority = "High")'), isNull);
    });

    test('rejects trailing garbage after a clause', () {
      expect(parseJqlAsFilters('status = "Open" whatever'), isNull);
    });
  });

  group('round-tripping what a chip filter itself writes', () {
    void expectRoundTrip(UpdatesPropertyFilter filter) {
      final clause = filter.clause!;
      final parsed = parseJqlAsFilters(clause)!;
      expect(parsed[filter.field]!.values, filter.values, reason: clause);
    }

    test('a single literal', () => expectRoundTrip(const UpdatesPropertyFilter(field: 'status', label: 'Status', values: {'Open'})));

    test(
      'several literals',
      () => expectRoundTrip(const UpdatesPropertyFilter(field: 'labels', label: 'Labels', values: {'blocked', 'urgent'})),
    );

    test(
      'a function value',
      () => expectRoundTrip(UpdatesPropertyFilter(field: 'assignee', label: 'Assignee', values: {UpdatesPropertyFilter.function('currentUser()')})),
    );

    test(
      'a literal alongside "No value"',
      () => expectRoundTrip(
        const UpdatesPropertyFilter(field: 'assignee', label: 'Assignee', values: {'5b10a2', UpdatesPropertyFilter.emptyValue}),
      ),
    );

    test(
      'a function and a literal alongside "No value"',
      () => expectRoundTrip(
        UpdatesPropertyFilter(
          field: 'assignee',
          label: 'Assignee',
          values: {UpdatesPropertyFilter.function('currentUser()'), '5b10a2', UpdatesPropertyFilter.emptyValue},
        ),
      ),
    );
  });

  group('applyParsedJqlToFilters', () {
    String label(String field) => field == 'cf[1]' ? 'Team' : field;

    test('carries parsed values onto matching existing filters', () {
      final current = UpdatesFilters.empty;
      final parsed = parseJqlAsFilters('status = "Open" AND labels in ("a", "b")')!;
      final result = applyParsedJqlToFilters(current, parsed, label);
      expect(result.byField('status')!.values, {'Open'});
      expect(result.byField('labels')!.values, {'a', 'b'});
    });

    test('clears a filter the query no longer mentions', () {
      final current = UpdatesFilters.empty.withValues('status', {'Open'});
      final result = applyParsedJqlToFilters(current, const {}, label);
      expect(result.byField('status')!.values, isEmpty);
    });

    test('adds a field the query mentions that has no chip yet', () {
      final current = UpdatesFilters.empty;
      final parsed = parseJqlAsFilters('cf[1] = "Core"')!;
      final result = applyParsedJqlToFilters(current, parsed, label);
      expect(result.byField('cf[1]')!.values, {'Core'});
      expect(result.byField('cf[1]')!.label, 'Team');
      expect(result.byField('cf[1]')!.isDefault, isFalse);
    });

    test('keeps an added-but-empty custom filter when the query says nothing about it', () {
      final current = UpdatesFilters.empty.add(const UpdatesPropertyFilter(field: 'cf[1]', label: 'Team'));
      final result = applyParsedJqlToFilters(current, const {}, label);
      expect(result.byField('cf[1]'), isNotNull);
      expect(result.byField('cf[1]')!.values, isEmpty);
    });

    test('keeps a previously remembered label for a value that is still picked', () {
      final current = UpdatesFilters.empty.withValues('assignee', {'5b10a2'}, valueLabels: {'5b10a2': 'Esteban'});
      final parsed = parseJqlAsFilters('assignee = "5b10a2"')!;
      final result = applyParsedJqlToFilters(current, parsed, label);
      expect(result.byField('assignee')!.labelFor('5b10a2'), 'Esteban');
    });

    test('drops a remembered label once its value is no longer picked', () {
      final current = UpdatesFilters.empty.withValues('assignee', {'5b10a2'}, valueLabels: {'5b10a2': 'Esteban'});
      final parsed = parseJqlAsFilters('assignee = "5c20b3"')!;
      final result = applyParsedJqlToFilters(current, parsed, label);
      expect(result.byField('assignee')!.valueLabels.containsKey('5b10a2'), isFalse);
      expect(result.byField('assignee')!.labelFor('5c20b3'), '5c20b3');
    });
  });
}
