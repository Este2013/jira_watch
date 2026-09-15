import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/models/updates_filters.dart';

void main() {
  group('jqlLiteral', () {
    test('quotes every value, so reserved words and spaces are safe', () {
      expect(jqlLiteral('In Progress'), '"In Progress"');
      expect(jqlLiteral('Open'), '"Open"');
    });

    test('escapes quotes and backslashes', () {
      expect(jqlLiteral(r'say "hi"'), r'"say \"hi\""');
      expect(jqlLiteral(r'a\b'), r'"a\\b"');
    });
  });

  group('UpdatesPropertyFilter.clause', () {
    test('an empty filter narrows nothing', () {
      expect(const UpdatesPropertyFilter(field: 'status', label: 'Status').clause, isNull);
    });

    test('one value compares directly', () {
      expect(
        const UpdatesPropertyFilter(field: 'status', label: 'Status', values: {'In Progress'}).clause,
        'status = "In Progress"',
      );
    });

    test('several values become an in-list', () {
      expect(
        const UpdatesPropertyFilter(field: 'priority', label: 'Priority', values: {'High', 'Highest'}).clause,
        'priority in ("High", "Highest")',
      );
    });

    test('the empty sentinel alone asks for unset values', () {
      expect(
        const UpdatesPropertyFilter(field: 'assignee', label: 'Assignee', values: {UpdatesPropertyFilter.emptyValue}).clause,
        'assignee is EMPTY',
      );
    });

    test('the empty sentinel alongside values widens the match', () {
      expect(
        const UpdatesPropertyFilter(field: 'assignee', label: 'Assignee', values: {'5b10a2', UpdatesPropertyFilter.emptyValue}).clause,
        '(assignee = "5b10a2" OR assignee is EMPTY)',
      );
    });
  });

  group('JQL functions as values', () {
    const user = 'com.atlassian.jira.user.ApplicationUser';

    test('a no-argument function of the right type fits', () {
      expect(jqlFunctionFits(call: 'currentUser()', functionTypes: [user], fieldTypes: [user]), isTrue);
    });

    test('a function needing an argument does not', () {
      expect(jqlFunctionFits(call: 'membersOf("")', functionTypes: [user], fieldTypes: [user]), isFalse);
    });

    test('a function returning something else does not', () {
      expect(jqlFunctionFits(call: 'openSprints()', functionTypes: ['com.atlassian.greenhopper.service.sprint.Sprint'], fieldTypes: [user]), isFalse);
    });

    test('reaches the query as a call, not as a quoted string', () {
      final filter = UpdatesPropertyFilter(
        field: 'assignee',
        label: 'Assignee',
        values: {UpdatesPropertyFilter.function('currentUser()')},
      );
      expect(filter.clause, 'assignee in (currentUser())');
    });

    test('mixes with literals', () {
      final filter = UpdatesPropertyFilter(
        field: 'assignee',
        label: 'Assignee',
        values: {UpdatesPropertyFilter.function('currentUser()'), '5b10a2'},
      );
      expect(filter.clause, 'assignee in (currentUser(), "5b10a2")');
    });

    test('is named by its call when nothing better was remembered', () {
      final filter = UpdatesPropertyFilter(
        field: 'assignee',
        label: 'Assignee',
        values: {UpdatesPropertyFilter.function('currentUser()')},
      );
      expect(filter.summary, 'currentUser()');
      expect(filter.copyWith(valueLabels: {UpdatesPropertyFilter.function('currentUser()'): 'Me'}).summary, 'Me');
    });

    test('still widens for unset values', () {
      final filter = UpdatesPropertyFilter(
        field: 'assignee',
        label: 'Assignee',
        values: {UpdatesPropertyFilter.function('currentUser()'), UpdatesPropertyFilter.emptyValue},
      );
      expect(filter.clause, '(assignee in (currentUser()) OR assignee is EMPTY)');
    });
  });

  group('value names', () {
    const filter = UpdatesPropertyFilter(
      field: 'assignee',
      label: 'Assignee',
      values: {'5b10a2', UpdatesPropertyFilter.emptyValue},
      valueLabels: {'5b10a2': 'Esteban'},
    );

    test('names a value by what it was picked as', () {
      expect(filter.labelFor('5b10a2'), 'Esteban');
      expect(filter.labelFor(UpdatesPropertyFilter.emptyValue), 'No value');
    });

    test('falls back to the raw value when nothing was remembered', () {
      expect(filter.labelFor('unknown-id'), 'unknown-id');
    });

    test('sums up one pick by name and several by count', () {
      expect(filter.copyWith(values: {'5b10a2'}).summary, 'Esteban');
      expect(filter.summary, '2 selected');
    });

    test('forgets the names of values no longer picked', () {
      expect(filter.copyWith(values: const {}).valueLabels, isEmpty);
    });
  });

  group('stripSuggestionMarkup', () {
    test('drops the match highlighting Jira adds', () {
      expect(stripSuggestionMarkup('In <b>Prog</b>ress'), 'In Progress');
    });

    test('unescapes what Jira escaped', () {
      expect(stripSuggestionMarkup('R&amp;D &quot;team&quot;'), 'R&D "team"');
    });
  });

  group('jqlFieldLabel', () {
    test('leaves a plain field name alone', () {
      expect(jqlFieldLabel('Summary'), 'Summary');
    });

    test('trims the custom field id Jira appends to disambiguate', () {
      expect(jqlFieldLabel('Team - cf[10061]'), 'Team');
      expect(jqlFieldLabel('Component - Component[Dropdown]'), 'Component');
    });

    test('keeps a name that merely contains a dash', () {
      expect(jqlFieldLabel('Before - After'), 'Before - After');
    });
  });

  group('UpdatesFilters', () {
    test('starts with every default, none of them narrowing anything', () {
      const filters = UpdatesFilters.empty;
      expect(filters.filters.map((f) => f.field), ['status', 'assignee', 'issuetype', 'priority', 'labels']);
      expect(filters.clauses, isEmpty);
      expect(filters.activeCount, 0);
    });

    test('ANDs one clause per active filter, in bar order', () {
      final filters = UpdatesFilters.empty.withValues('status', {'Open'}).withValues('labels', {'blocked', 'urgent'});
      expect(filters.clauses, ['status = "Open"', 'labels in ("blocked", "urgent")']);
      expect(filters.activeCount, 2);
    });

    test('picking values leaves the other filters alone', () {
      final filters = UpdatesFilters.empty.withValues('priority', {'High'});
      expect(filters.byField('status')!.values, isEmpty);
      expect(filters.byField('priority')!.values, {'High'});
    });

    test('a custom filter lands after the defaults', () {
      final filters = UpdatesFilters.empty.add(const UpdatesPropertyFilter(field: 'cf[10061]', label: 'Team'));
      expect(filters.filters.last.field, 'cf[10061]');
      expect(filters.filters.last.isDefault, isFalse);
    });

    test('a field already filtered is not added twice', () {
      final filters = UpdatesFilters.empty.add(const UpdatesPropertyFilter(field: 'status', label: 'Status again'));
      expect(filters.filters.where((f) => f.field == 'status'), hasLength(1));
      expect(filters.byField('status')!.label, 'Status');
    });

    test('removing drops a custom filter but never a default', () {
      final filters = UpdatesFilters.empty.add(const UpdatesPropertyFilter(field: 'cf[10061]', label: 'Team'));
      expect(filters.remove('cf[10061]').byField('cf[10061]'), isNull);
      expect(filters.remove('status').byField('status'), isNotNull);
    });

    test('clearing empties every filter without dropping any', () {
      final filters = UpdatesFilters.empty.withValues('status', {'Open'}).add(const UpdatesPropertyFilter(field: 'cf[10061]', label: 'Team', values: {'Core'}));
      final cleared = filters.cleared();
      expect(cleared.filters.map((f) => f.field), filters.filters.map((f) => f.field));
      expect(cleared.clauses, isEmpty);
    });
  });

  group('UpdatesFilters.resolve', () {
    test('an empty save is just the defaults', () {
      expect(UpdatesFilters.resolve(const []).filters, UpdatesFilters.defaults);
    });

    test('keeps what a default had picked, in the default order', () {
      final resolved = UpdatesFilters.resolve(const [
        UpdatesPropertyFilter(field: 'labels', label: 'Labels', values: {'blocked'}),
        UpdatesPropertyFilter(field: 'status', label: 'Status', values: {'Open'}),
      ]);
      expect(resolved.filters.map((f) => f.field), ['status', 'assignee', 'issuetype', 'priority', 'labels']);
      expect(resolved.byField('labels')!.values, {'blocked'});
      expect(resolved.byField('status')!.values, {'Open'});
    });

    test('custom filters survive in their saved order, after the defaults', () {
      final resolved = UpdatesFilters.resolve(const [
        UpdatesPropertyFilter(field: 'cf[2]', label: 'Squad'),
        UpdatesPropertyFilter(field: 'cf[1]', label: 'Team', values: {'Core'}),
      ]);
      expect(resolved.filters.skip(UpdatesFilters.defaults.length).map((f) => f.label), ['Squad', 'Team']);
      expect(resolved.byField('cf[1]')!.values, {'Core'});
    });

    test('a default keeps being a default even when it was saved as one more entry', () {
      final resolved = UpdatesFilters.resolve(const [
        UpdatesPropertyFilter(field: 'status', label: 'Status', values: {'Open'}),
      ]);
      expect(resolved.byField('status')!.isDefault, isTrue);
    });
  });

  group('UpdatesFilters JSON', () {
    test('round-trips what was picked', () {
      final filters = UpdatesFilters.empty.withValues('status', {'Open', 'In Progress'}).add(const UpdatesPropertyFilter(field: 'cf[10061]', label: 'Team', values: {'Core'}));
      final restored = UpdatesFilters.fromJson(filters.toJson());
      expect(restored.byField('status')!.values, {'Open', 'In Progress'});
      expect(restored.byField('cf[10061]')!.values, {'Core'});
      expect(restored.byField('cf[10061]')!.label, 'Team');
    });

    test('saves empty defaults as nothing at all, but keeps empty custom ones', () {
      final filters = UpdatesFilters.empty.add(const UpdatesPropertyFilter(field: 'cf[1]', label: 'Team'));
      expect(filters.toJson(), [
        {'field': 'cf[1]', 'label': 'Team', 'values': <String>[], 'valueLabels': <String, String>{}},
      ]);
      expect(UpdatesFilters.fromJson(filters.toJson()).byField('cf[1]'), isNotNull);
    });

    test('survives junk on disk', () {
      expect(UpdatesFilters.fromJson(null).filters, UpdatesFilters.defaults);
      expect(UpdatesFilters.fromJson('nonsense').filters, UpdatesFilters.defaults);
      // A readable field name is worth keeping even when its saved values are
      // unreadable: the filter comes back, narrowing nothing.
      final salvaged = UpdatesFilters.fromJson([
        'nope',
        {'label': 'no field'},
        {'field': 'cf[1]', 'values': 'not a list'},
      ]);
      expect(salvaged.filters, hasLength(UpdatesFilters.defaults.length + 1));
      expect(salvaged.byField('cf[1]')!.values, isEmpty);
    });
  });
}
