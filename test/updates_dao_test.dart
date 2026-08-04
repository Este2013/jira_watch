import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/dao/updates_dao.dart';

void main() {
  group('isVersionStrictlyAbove', () {
    test('compares dotted numeric versions', () {
      expect(isVersionStrictlyAbove('1.7.0', baseline: '1.6.2'), isTrue);
      expect(isVersionStrictlyAbove('1.6.2', baseline: '1.7.0'), isFalse);
      expect(isVersionStrictlyAbove('1.7.0', baseline: '1.7.0'), isFalse);
      expect(isVersionStrictlyAbove('2.0.0', baseline: '1.99.99'), isTrue);
    });

    test('zero-pads a shorter baseline, so a beta 4-tuple ranks above its release', () {
      // This is what makes numeric-only beta keys like 1.8.0.1 work.
      expect(isVersionStrictlyAbove('1.8.0.1', baseline: '1.8.0'), isTrue);
      expect(isVersionStrictlyAbove('1.8.0.2', baseline: '1.8.0.1'), isTrue);
      // And why a stable release is never offered as a downgrade to a beta user.
      expect(isVersionStrictlyAbove('1.8.0', baseline: '1.8.0.1'), isFalse);
    });

    test('treats a non-numeric version as not-newer instead of throwing', () {
      // A single bad key published to the server would otherwise crash the
      // update check for every user.
      expect(() => isVersionStrictlyAbove('1.8.0-beta.1', baseline: '1.7.0'), returnsNormally);
      expect(isVersionStrictlyAbove('1.8.0-beta.1', baseline: '1.7.0'), isFalse);
      expect(isVersionStrictlyAbove('1.7.0', baseline: 'not-a-version'), isFalse);
      expect(isVersionStrictlyAbove('', baseline: '1.7.0'), isFalse);
    });
  });

  group('NewUpdateData asset URLs', () {
    NewUpdateData withMetadata(Map<String, dynamic> metadata) => NewUpdateData(version: '1.7.0', metadata: metadata);

    test('percent-encodes a relative path containing a space and parentheses', () {
      final update = withMetadata({'x64': 'v1.7.0/Binaries (x64).zip'});
      final uri = update.windowsAssetUri!;

      // http.get throws on a URI holding a raw space, which is why this cannot
      // be built by string interpolation.
      expect(uri.toString(), 'https://este2013.github.io/jira_watch/v1.7.0/Binaries%20(x64).zip');
      expect(uri.toString(), isNot(contains(' ')));
      // The decoded segment must still be the real filename.
      expect(uri.pathSegments.last, 'Binaries (x64).zip');
    });

    test('prefers an absolute url when the release publishes one', () {
      final update = withMetadata({
        'x64': 'v1.7.0/Binaries (x64).zip',
        'x64Url': 'https://github.com/Este2013/jira_watch/releases/download/v1.7.0/jira_watch-1.7.0-windows-x64.zip',
      });
      expect(update.windowsAssetUri.toString(), contains('github.com'));
    });

    test('resolves the macOS asset independently of the Windows one', () {
      final update = withMetadata({'x64': 'v1.5.0/Binaries (x64).zip', 'osX': 'v1.5.0/Binaries (osX).zip'});
      expect(update.macAssetUri!.pathSegments.last, 'Binaries (osX).zip');
      expect(update.windowsAssetUri!.pathSegments.last, 'Binaries (x64).zip');
    });

    test('is null when the platform has no asset', () {
      final update = withMetadata({'x64': 'v1.7.0/Binaries (x64).zip'});
      expect(update.macAssetUri, isNull);
      expect(withMetadata({}).windowsAssetUri, isNull);
      expect(withMetadata({'x64': ''}).windowsAssetUri, isNull);
    });

    test('normalises the checksum to lowercase hex and reads the size', () {
      final update = withMetadata({'x64Sha256': 'ABCDEF0123', 'x64Size': 12345});
      expect(update.windowsSha256, 'abcdef0123');
      expect(update.windowsSizeBytes, 12345);
      // Absent checksum is what blocks self-install.
      expect(withMetadata({}).windowsSha256, isNull);
    });
  });
}
