import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/ui/utils/byte_format.dart';

void main() {
  group('formatBytes', () {
    test('picks a unit and keeps one decimal so progress visibly moves', () {
      expect(formatBytes(0), '0 B');
      expect(formatBytes(512), '512 B');
      expect(formatBytes(1024), '1.0 KB');
      expect(formatBytes(1536), '1.5 KB');
      expect(formatBytes(48974388), '46.7 MB');
      expect(formatBytes(2 * 1024 * 1024 * 1024), '2.00 GB');
    });

    test('renders nothing for an unknown size rather than "null"', () {
      // Reached whenever a server sends no content-length.
      expect(formatBytes(null), '');
    });

    test('switches unit exactly at the boundary', () {
      expect(formatBytes(1023), '1023 B');
      expect(formatBytes(1024 * 1024 - 1), '1024.0 KB');
      expect(formatBytes(1024 * 1024), '1.0 MB');
    });
  });

  group('formatBytesCompact', () {
    test('drops the decimal for KB, so a column of rows stays readable', () {
      expect(formatBytesCompact(1536), '2 KB');
      expect(formatBytesCompact(48974388), '46.7 MB');
      expect(formatBytesCompact(null), '');
    });
  });
}
