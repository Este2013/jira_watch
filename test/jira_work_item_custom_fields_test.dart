import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/models/jira_work_item_data.dart';

void main() {
  group('JiraWorkItemData.customFields', () {
    JiraWorkItemData withFields(Map<String, dynamic> fields) => JiraWorkItemData({'key': 'TEST-1', 'fields': fields});

    test('keeps only customfield_* keys', () {
      final item = withFields({
        'summary': 'Not a custom field',
        'customfield_10056': 'A custom field',
        'customfield_10057': 42,
      });

      expect(item.customFields, {
        'customfield_10056': 'A custom field',
        'customfield_10057': 42,
      });
    });

    test('drops custom fields that are unset on this issue', () {
      final item = withFields({
        'customfield_10056': 'Set',
        'customfield_10057': null,
      });

      expect(item.customFields, {'customfield_10056': 'Set'});
    });

    test('does not match a key that merely contains "customfield"', () {
      // Guards against the same loose-match mistake the debug Json tab's
      // filter makes (a plain `.contains('customfield')` check) — a real
      // Jira field id always ends in a number.
      final item = withFields({'customfield_notanumber': 'should not match', 'customfield_10056': 'should match'});

      expect(item.customFields, {'customfield_10056': 'should match'});
    });

    test('is empty when there are no fields at all', () {
      final item = JiraWorkItemData({'key': 'TEST-1'});
      expect(item.customFields, isEmpty);
    });
  });

  group('JiraWorkItemData.emptyCustomFieldKeys', () {
    JiraWorkItemData withFields(Map<String, dynamic> fields) => JiraWorkItemData({'key': 'TEST-1', 'fields': fields});

    test('is the complement of customFields — only the unset ones', () {
      final item = withFields({
        'summary': 'Not a custom field',
        'customfield_10056': 'Set',
        'customfield_10057': null,
      });

      expect(item.emptyCustomFieldKeys, ['customfield_10057']);
      expect(item.customFields.keys, ['customfield_10056']);
    });

    test('is empty when every custom field on the issue has a value', () {
      final item = withFields({'customfield_10056': 'Set'});
      expect(item.emptyCustomFieldKeys, isEmpty);
    });
  });
}
