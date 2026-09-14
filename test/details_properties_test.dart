import 'package:flutter_test/flutter_test.dart';
import 'package:jira_platform_api/api.dart' as jira;
import 'package:jira_watcher/models/jira_work_item_data.dart';
import 'package:jira_watcher/ui/updates_widgets/updates_view_single_work_item/details_properties.dart';

void main() {
  JiraWorkItemData issueWith(Map<String, dynamic> fields) => JiraWorkItemData({'id': '1', 'key': 'TEST-1', 'fields': fields});

  jira.FieldDetails named(String name, {String? custom}) => jira.FieldDetails(
    name: name,
    schema: jira.JsonTypeBean(type: 'string', custom: custom),
  );

  group('buildDetailsProperties', () {
    test('offers the built-in properties even when this issue has no value for them', () {
      final properties = buildDetailsProperties(issueWith({'created': '2026-01-01T00:00:00.000+0100'}), const {});
      final byId = {for (final p in properties) p.id: p};

      // Present, so a layout can place them — but flagged valueless, which
      // is what keeps them off screen unless asked for.
      expect(byId['attachment']?.hasValue, isFalse);
      expect(byId['updated']?.hasValue, isFalse);
      expect(byId['created']?.hasValue, isTrue);
    });

    test('never offers a field the Details tab lays out itself', () {
      final properties = buildDetailsProperties(
        issueWith({
          'created': '2026-01-01T00:00:00.000+0100',
          'assignee': {'accountId': 'x'},
          'description': {'type': 'doc', 'content': []},
        }),
        const {},
      );

      expect(properties.map((p) => p.id), isNot(anyElement(isIn(fixedDetailsFieldKeys))));
    });

    test('names custom fields from field metadata, falling back to the raw id', () {
      final properties = buildDetailsProperties(
        issueWith({'created': 'x', 'customfield_11101': 'a value', 'customfield_99999': 'another'}),
        {'customfield_11101': named('Team')},
      );
      final byId = {for (final p in properties) p.id: p};

      expect(byId['customfield_11101']?.name, 'Team');
      expect(byId['customfield_99999']?.name, 'customfield_99999');
    });

    test('counts a present-but-empty value as no value', () {
      // A field can be set to something that says nothing: an empty list of
      // options, an empty object, or the "{}" some integrations write.
      final properties = buildDetailsProperties(
        issueWith({
          'created': 'x',
          'customfield_10001': <dynamic>[],
          'customfield_10002': <String, dynamic>{},
          'customfield_10003': '{}',
          'customfield_10004': '   ',
          'customfield_10005': 'actually says something',
        }),
        const {},
      );
      final byId = {for (final p in properties) p.id: p};

      expect(byId['customfield_10001']?.hasValue, isFalse);
      expect(byId['customfield_10002']?.hasValue, isFalse);
      expect(byId['customfield_10003']?.hasValue, isFalse);
      expect(byId['customfield_10004']?.hasValue, isFalse);
      expect(byId['customfield_10005']?.hasValue, isTrue);
    });

    test('counts an empty attachment list as no value', () {
      final properties = buildDetailsProperties(issueWith({'created': 'x', 'attachment': <dynamic>[]}), const {});
      expect({for (final p in properties) p.id: p}['attachment']?.hasValue, isFalse);
    });

    test('includes unset custom fields, marked as having no value', () {
      final properties = buildDetailsProperties(
        issueWith({'created': 'x', 'customfield_11101': null}),
        {'customfield_11101': named('Team')},
      );
      final byId = {for (final p in properties) p.id: p};

      expect(byId['customfield_11101'], isNotNull);
      expect(byId['customfield_11101']!.hasValue, isFalse);
    });

    test('drops custom fields with nothing readable to say, set or unset', () {
      final properties = buildDetailsProperties(
        issueWith({'created': 'x', 'customfield_10001': '0|i0ary3:', 'customfield_10002': null}),
        {
          'customfield_10001': named('Rank', custom: 'com.pyxis.greenhopper.jira:gh-lexo-rank'),
          'customfield_10002': named('Epic Link', custom: 'com.pyxis.greenhopper.jira:gh-epic-link'),
        },
      );

      expect(properties.map((p) => p.id), isNot(contains('customfield_10001')));
      expect(properties.map((p) => p.id), isNot(contains('customfield_10002')));
    });

    test('keeps the dates as the footer, and nothing else in it', () {
      final properties = buildDetailsProperties(
        issueWith({'created': 'x', 'updated': 'y', 'attachment': [], 'customfield_11101': 'a value'}),
        {'customfield_11101': named('Team')},
      );

      expect(
        properties.where((p) => p.isFooter).map((p) => p.id),
        ['created', 'updated', 'resolutiondate', 'statuscategorychangedate', 'lastViewed'],
      );
      expect(properties.where((p) => !p.isFooter).map((p) => p.id), ['attachment', 'issuelinks', 'customfield_11101']);
    });

    test('refuses to let attachments or related work items be hidden', () {
      final properties = buildDetailsProperties(
        issueWith({'created': 'x', 'customfield_11101': 'a value'}),
        {'customfield_11101': named('Team')},
      );
      final byId = {for (final p in properties) p.id: p};

      expect(byId['attachment']?.canHide, isFalse);
      expect(byId['issuelinks']?.canHide, isFalse);
      // Everything else is fair game.
      expect(byId['customfield_11101']?.canHide, isTrue);
      expect(byId['created']?.canHide, isTrue);
    });

    test('marks Related work items full width and a Development field locked', () {
      const developmentValue = '{repository={count=1, dataType=repository}, json={"cachedValue":{"summary":{"repository":{"overall":{"count":1,"dataType":"repository"},"byInstanceType":{}}}},"isStale":false}}';
      final properties = buildDetailsProperties(
        issueWith({'created': 'x', 'customfield_10000': developmentValue}),
        {'customfield_10000': named('Development')},
      );
      final byId = {for (final p in properties) p.id: p};

      expect(byId['issuelinks']?.isFullWidth, isTrue);
      expect(byId['customfield_10000']?.isLocked, isTrue);
      expect(byId['attachment']?.isLocked, isFalse);
    });

    test('is empty for an issue with no fields at all', () {
      expect(buildDetailsProperties(JiraWorkItemData({'key': 'TEST-1'}), const {}), isEmpty);
    });
  });
}
