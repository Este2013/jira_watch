import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/models/app_changelog_data.dart';
import 'package:jira_watcher/models/release_metadata.dart';

void main() {
  group('upsert ordering', () {
    // The update check reads entries.firstOrNull and calls it the newest release,
    // so ordering is correctness, not cosmetics.
    test('puts a new version first', () {
      final result = ReleaseMetadata.upsert(
        existing: {'1.6.0': {}, '1.5.0': {}},
        version: '1.7.0',
        entry: {'changelog': 'x'},
      );
      expect(result.keys.toList(), ['1.7.0', '1.6.0', '1.5.0']);
    });

    test('replaces an existing version without duplicating or reordering it', () {
      final result = ReleaseMetadata.upsert(
        existing: {'1.7.0': {'changelog': 'old'}, '1.6.0': {}},
        version: '1.7.0',
        entry: {'changelog': 'new'},
      );
      expect(result.keys.toList(), ['1.7.0', '1.6.0']);
      expect((result['1.7.0'] as Map)['changelog'], 'new');
    });

    test('re-sorts a document that was already out of order', () {
      final result = ReleaseMetadata.upsert(
        existing: {'1.5.0': {}, '1.6.0': {}},
        version: '1.4.0',
        entry: {},
      );
      expect(result.keys.toList(), ['1.6.0', '1.5.0', '1.4.0']);
    });

    test('sorts numerically, not lexicographically', () {
      final sorted = ReleaseMetadata.sortNewestFirst({'1.9.0': {}, '1.10.0': {}, '1.2.0': {}});
      // '1.10.0' sorts below '1.9.0' as text, which would offer users a stale release.
      expect(sorted.keys.toList(), ['1.10.0', '1.9.0', '1.2.0']);
    });

    test('ranks a numeric beta suffix above its base release', () {
      final sorted = ReleaseMetadata.sortNewestFirst({'1.8.0': {}, '1.8.0.2': {}, '1.8.0.1': {}});
      expect(sorted.keys.toList(), ['1.8.0.2', '1.8.0.1', '1.8.0']);
    });

    test('keeps an unparseable key rather than dropping it', () {
      final sorted = ReleaseMetadata.sortNewestFirst({'1.6.0': {}, 'nightly': {}, '1.7.0': {}});
      expect(sorted.keys.toList(), ['1.7.0', '1.6.0', 'nightly']);
    });
  });

  group('entry', () {
    test('omits absent fields instead of writing nulls', () {
      final entry = ReleaseMetadata.entry(version: '1.7.0', changelog: 'x');
      expect(entry.keys, ['changelog']);
      expect(entry.containsKey('x64Sha256'), isFalse);
    });

    test('lowercases the checksum, since the app compares it lowercased', () {
      final entry = ReleaseMetadata.entry(version: '1.7.0', changelog: 'x', windowsSha256: 'ABCdef123');
      expect(entry['x64Sha256'], 'abcdef123');
    });

    test('carries both a relative Pages path and an absolute Releases url', () {
      // Dual-publishing: already-shipped clients read x64, new ones prefer x64Url.
      final entry = ReleaseMetadata.entry(
        version: '1.7.0',
        changelog: 'x',
        windowsAssetPath: ReleaseMetadata.pagesAssetPath('1.7.0'),
        windowsAssetUrl: 'https://github.com/x/y/releases/download/v1.7.0/z.zip',
      );
      expect(entry['x64'], 'v1.7.0/Binaries (x64).zip');
      expect(entry['x64Url'], startsWith('https://github.com/'));
    });
  });

  group('asset names', () {
    test('keeps the historical Pages filename exactly', () {
      // Shipped clients build this URL from the relative path, so it cannot change.
      expect(ReleaseMetadata.pagesAssetPath('1.7.0'), 'v1.7.0/Binaries (x64).zip');
      expect(ReleaseMetadata.pagesAssetPath('1.7.0', macOS: true), 'v1.7.0/Binaries (osX).zip');
    });

    test('gives the Releases asset a name with no spaces', () {
      // GitHub rewrites spaces in asset filenames to dots.
      final name = ReleaseMetadata.releasesAssetName('1.7.0');
      expect(name, 'jira_watch-1.7.0-windows-x64.zip');
      expect(name, isNot(contains(' ')));
    });
  });

  group('rewriteChangelogs', () {
    test('replaces a drifted changelog and reports the version', () {
      final source = changeLogPlainTextFor('1.6.0')!;
      final (updated, changed) = ReleaseMetadata.rewriteChangelogs({
        '1.6.0': {'changelog': 'stale\twith tabs', 'x64': 'a'},
      });
      expect(changed, ['1.6.0']);
      expect((updated['1.6.0'] as Map)['changelog'], source);
      // Other fields survive the rewrite.
      expect((updated['1.6.0'] as Map)['x64'], 'a');
    });

    test('leaves a matching changelog alone', () {
      final (_, changed) = ReleaseMetadata.rewriteChangelogs({
        '1.6.0': {'changelog': changeLogPlainTextFor('1.6.0')},
      });
      expect(changed, isEmpty);
    });

    test('leaves a version with no source entry untouched', () {
      final (updated, changed) = ReleaseMetadata.rewriteChangelogs({
        '0.0.9': {'changelog': 'from before the changelog existed'},
      });
      expect(changed, isEmpty);
      expect((updated['0.0.9'] as Map)['changelog'], 'from before the changelog existed');
    });
  });

  group('encode / decode', () {
    test('round-trips while preserving order', () {
      final document = ReleaseMetadata.upsert(existing: {'1.6.0': {}}, version: '1.7.0', entry: {'changelog': 'x'});
      expect(ReleaseMetadata.decode(ReleaseMetadata.encode(document)).keys.toList(), ['1.7.0', '1.6.0']);
    });

    test('writes the runic bullet and emoji as real UTF-8, not escapes', () {
      final encoded = ReleaseMetadata.encode({'1.6.0': {'changelog': '✨ Features:\n ᛫ thing'}});
      expect(encoded, contains('✨'));
      expect(encoded, contains('᛫'));
      expect(encoded, isNot(contains(r'\u')));
    });

    test('treats an empty document as an empty map', () {
      // latest_beta.json is currently "{}", and may be blank after a reset.
      expect(ReleaseMetadata.decode('   '), isEmpty);
      expect(ReleaseMetadata.decode('{}'), isEmpty);
    });

    test('rejects a document that is not keyed by version', () {
      expect(() => ReleaseMetadata.decode('[1,2,3]'), throwsFormatException);
    });
  });

  group('isComparableVersion', () {
    test('accepts what the update check can parse and rejects what it cannot', () {
      expect(ReleaseMetadata.isComparableVersion('1.7.0'), isTrue);
      expect(ReleaseMetadata.isComparableVersion('1.8.0.1'), isTrue);
      expect(ReleaseMetadata.isComparableVersion('1.8.0-beta.1'), isFalse);
      expect(ReleaseMetadata.isComparableVersion('nightly'), isFalse);
      expect(ReleaseMetadata.isComparableVersion(''), isFalse);
    });
  });
}
