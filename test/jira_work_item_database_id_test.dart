import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/models/jira_work_item_data.dart';

void main() {
  group('JiraWorkItemData.databaseId', () {
    test('reads a string id as-is — Jira\'s actual wire format', () {
      // Real crash: this field is a String on the wire ("id": "10001"), but
      // was declared int? and read straight off the map, which throws the
      // moment anything actually evaluates it (see the Development card,
      // the first caller that did).
      final item = JiraWorkItemData({'id': '10001'});
      expect(item.databaseId, '10001');
    });

    test('also accepts an int id, just in case', () {
      final item = JiraWorkItemData({'id': 10001});
      expect(item.databaseId, '10001');
    });

    test('is null when there is no id at all', () {
      final item = JiraWorkItemData({});
      expect(item.databaseId, isNull);
    });
  });
}
