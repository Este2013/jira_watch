import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/ui/to_do_widgets/to_do_main.dart';

void main() {
  group('parseTaskSearch', () {
    test('plain text with no tags', () {
      final (tags, freeText) = parseTaskSearch('fix the thing');
      expect(tags, isEmpty);
      expect(freeText, 'fix the thing');
    });

    test('a single tag with no other text', () {
      final (tags, freeText) = parseTaskSearch('#bug');
      expect(tags, ['bug']);
      expect(freeText, isEmpty);
    });

    test('multiple tags plus free text, in any order', () {
      final (tags, freeText) = parseTaskSearch('#bug fix the thing #urgent');
      expect(tags, ['bug', 'urgent']);
      expect(freeText, 'fix the thing');
    });

    test('tags are lowercased for matching, free text is not otherwise altered', () {
      final (tags, freeText) = parseTaskSearch('#Bug Fix the Thing');
      expect(tags, ['bug']);
      expect(freeText, 'fix the thing', reason: 'freeText is lowercased overall for case-insensitive matching');
    });

    test('empty input yields no tags and empty free text', () {
      final (tags, freeText) = parseTaskSearch('');
      expect(tags, isEmpty);
      expect(freeText, isEmpty);
    });
  });
}
