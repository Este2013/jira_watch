import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/models/jira_development_field.dart';

void main() {
  group('DevelopmentFieldSummary.parse', () {
    // Real raw value from STUDIO-1604 (Jira "Development" custom field) —
    // note this is a Java/Groovy map toString(), not JSON, except for the
    // embedded `json=` entry.
    const raw =
        '{repository={count=6, dataType=repository}, '
        'build={count=4, dataType=build, failedBuildCount=1, successfulBuildCount=3, unknownBuildCount=0}, '
        'json={"cachedValue":{"errors":[],"summary":{'
        '"build":{"overall":{"count":4,"lastUpdated":"2026-07-08T12:44:24.000+0200","failedBuildCount":1,"successfulBuildCount":3,"unknownBuildCount":0,"dataType":"build"},'
        '"byInstanceType":{"cloud-providers":{"count":4,"name":"Other providers"}}},'
        '"repository":{"overall":{"count":6,"lastUpdated":"2026-07-08T12:24:49.000+0200","dataType":"repository"},'
        '"byInstanceType":{"oAuth-gitlab-jira-connect-gitlab.com":{"count":6,"name":"GitLab"}}}'
        '}},"isStale":true}}';

    test('extracts the embedded json= entry despite the outer non-JSON map syntax', () {
      final summary = DevelopmentFieldSummary.parse(raw);
      expect(summary, isNotNull);
      expect(summary!.isStale, isTrue);
      expect(summary.categories.keys, containsAll(['build', 'repository']));
    });

    test('parses a category\'s overall counts and per-source breakdown', () {
      final summary = DevelopmentFieldSummary.parse(raw)!;
      final repo = summary.categories['repository']!;
      expect(repo.dataType, 'repository');
      expect(repo.count, 6);
      expect(repo.lastUpdated, DateTime.parse('2026-07-08T12:24:49.000+0200'));
      expect(repo.bySource, hasLength(1));
      expect(repo.bySource.single.instanceKey, 'oAuth-gitlab-jira-connect-gitlab.com');
      expect(repo.bySource.single.name, 'GitLab');
      expect(repo.bySource.single.count, 6);
    });

    test('keeps a category\'s extra fields beyond count/lastUpdated/dataType', () {
      final summary = DevelopmentFieldSummary.parse(raw)!;
      final build = summary.categories['build']!;
      expect(build.extra, {'failedBuildCount': 1, 'successfulBuildCount': 3, 'unknownBuildCount': 0});
    });

    test('returns null for a value with no embedded json entry at all', () {
      expect(DevelopmentFieldSummary.parse('{}'), isNull);
      expect(DevelopmentFieldSummary.parse(''), isNull);
      expect(DevelopmentFieldSummary.parse('not even map-shaped'), isNull);
    });

    test('is not confused by a brace inside a quoted string within the embedded json', () {
      const trickyRaw = r'{foo=bar, json={"cachedValue":{"summary":{"branch":{"overall":{"count":1,"dataType":"branch","note":"a { b } c"},"byInstanceType":{}}}}},"isStale":false}}';
      final summary = DevelopmentFieldSummary.parse(trickyRaw);
      expect(summary, isNotNull);
      expect(summary!.categories['branch']!.extra['note'], 'a { b } c');
    });
  });
}
