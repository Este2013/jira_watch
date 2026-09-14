import 'package:flutter_test/flutter_test.dart';
import 'package:jira_platform_api/api.dart' as jira;
import 'package:jira_watcher/ui/updates_widgets/updates_view_single_work_item/custom_fields_view.dart';

void main() {
  group('classifyCustomField', () {
    jira.FieldDetails withCustomSchema(String custom) => jira.FieldDetails(schema: jira.JsonTypeBean(type: 'string', custom: custom));

    test('hides the Rank field (LexoRank) as opaque', () {
      final kind = classifyCustomField('0|i0ary3:', withCustomSchema('com.pyxis.greenhopper.jira:gh-lexo-rank'));
      expect(kind, CustomFieldRenderKind.hiddenOpaque);
    });

    test('hides the Epic Link field as redundant', () {
      final kind = classifyCustomField('STUDIO-812', withCustomSchema('com.pyxis.greenhopper.jira:gh-epic-link'));
      expect(kind, CustomFieldRenderKind.hiddenRedundant);
    });

    test('hides a "Time in status"-style delimited blob as opaque', () {
      final kind = classifyCustomField('5_*:*_1_*:*_0_*|*_10102_*:*_1_*:*_5450227', null);
      expect(kind, CustomFieldRenderKind.hiddenOpaque);
    });

    test('classifies a Team-shaped value (name + avatarUrl, no accountId) as option, not user', () {
      // Real shape reported for a "Team" custom field.
      final value = {
        'id': '8ee7039b-8549-4c65-a249-a52891201e16',
        'name': 'Windows Platform',
        'avatarUrl': 'https://example.test/avatar.svg',
        'isVisible': true,
        'isVerified': false,
        'title': 'Windows Platform',
        'isShared': true,
      };
      expect(classifyCustomField(value, null), CustomFieldRenderKind.option);
    });

    test('classifies an actual Jira user (has accountId) as user', () {
      final value = {'accountId': 'abc123', 'displayName': 'Esteban Aragon'};
      expect(classifyCustomField(value, null), CustomFieldRenderKind.user);
    });

    test('classifies a Development field value by shape alone', () {
      const raw = '{repository={count=1, dataType=repository}, json={"cachedValue":{"summary":{"repository":{"overall":{"count":1,"dataType":"repository"},"byInstanceType":{}}}},"isStale":false}}';
      expect(classifyCustomField(raw, null), CustomFieldRenderKind.development);
    });
  });
}
