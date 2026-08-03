import 'dart:convert';

import 'package:jira_watcher/models/app_changelog_data.dart';

/// Builds the `latest.json` / `latest_beta.json` documents the app reads to
/// discover updates.
///
/// Kept free of `dart:io` and Flutter so it can be unit-tested directly; the CLI
/// in `tool/release_metadata.dart` supplies the file I/O.
class ReleaseMetadata {
  /// Assets on GitHub Pages, relative to the site root.
  static String pagesAssetPath(String version, {bool macOS = false}) => 'v$version/Binaries (${macOS ? 'osX' : 'x64'}).zip';

  /// GitHub rewrites spaces in release asset filenames to dots, so the Releases
  /// copy gets a shell-safe name of its own. The absolute `x64Url` field means
  /// the two names never have to agree.
  static String releasesAssetName(String version) => 'jira_watch-$version-windows-x64.zip';

  /// A version's entry, as published.
  ///
  /// [sha256] and [sizeBytes] are what let the app verify a download before
  /// replacing itself; without them it refuses to self-install.
  static Map<String, dynamic> entry({
    required String version,
    required String changelog,
    String? windowsAssetPath,
    String? windowsAssetUrl,
    String? windowsSha256,
    int? windowsSizeBytes,
    String? macAssetPath,
  }) => {
    'changelog': changelog,
    if (windowsAssetPath != null) 'x64': windowsAssetPath,
    if (windowsAssetUrl != null) 'x64Url': windowsAssetUrl,
    if (windowsSha256 != null) 'x64Sha256': windowsSha256.toLowerCase(),
    if (windowsSizeBytes != null) 'x64Size': windowsSizeBytes,
    if (macAssetPath != null) 'osX': macAssetPath,
  };

  /// Inserts or replaces [version] in [existing], newest first.
  ///
  /// Order is load-bearing: the update check reads `entries.firstOrNull` and
  /// treats it as the newest release, so a document that is merely
  /// *semantically* correct but ordered wrongly would offer users the wrong
  /// version. Dart's decoded maps preserve insertion order, which is why this is
  /// done here rather than in the workflow's shell.
  static Map<String, dynamic> upsert({
    required Map<String, dynamic> existing,
    required String version,
    required Map<String, dynamic> entry,
  }) {
    final result = <String, dynamic>{version: entry};
    for (final e in existing.entries) {
      if (e.key != version) result[e.key] = e.value;
    }
    return sortNewestFirst(result);
  }

  /// Re-orders by version, newest first, leaving unparseable keys at the end in
  /// their original order rather than dropping them.
  static Map<String, dynamic> sortNewestFirst(Map<String, dynamic> map) {
    final comparable = <String>[];
    final rest = <String>[];
    for (final key in map.keys) {
      (isComparableVersion(key) ? comparable : rest).add(key);
    }
    comparable.sort((a, b) => -compareVersions(a, b));
    return {
      for (final key in [...comparable, ...rest]) key: map[key],
    };
  }

  /// Regenerates every `changelog` from [appChangeLog], leaving versions with no
  /// source entry untouched.
  ///
  /// Returns the new document and the versions it changed, so a caller can show
  /// what a repair pass would do before writing anything.
  static (Map<String, dynamic>, List<String>) rewriteChangelogs(Map<String, dynamic> existing) {
    final changed = <String>[];
    final result = <String, dynamic>{};
    for (final e in existing.entries) {
      final source = changeLogPlainTextFor(e.key);
      final value = Map<String, dynamic>.from(e.value as Map);
      if (source != null && value['changelog'] != source) {
        value['changelog'] = source;
        changed.add(e.key);
      }
      result[e.key] = value;
    }
    return (result, changed);
  }

  /// Release notes for the GitHub Release body.
  static String releaseNotes({required String version, required String changelog}) => '## Jira Watcher $version\n\n$changelog\n';

  /// Four dots at most, digits only — what the app's version comparison accepts.
  static bool isComparableVersion(String version) => RegExp(r'^\d+(\.\d+)*$').hasMatch(version);

  static int compareVersions(String a, String b) {
    final left = a.split('.').map(int.parse).toList();
    final right = b.split('.').map(int.parse).toList();
    for (var i = 0; i < left.length || i < right.length; i++) {
      final l = i < left.length ? left[i] : 0;
      final r = i < right.length ? right[i] : 0;
      if (l != r) return l - r;
    }
    return 0;
  }

  /// Four-space indent, matching the documents already on the server.
  static String encode(Map<String, dynamic> document) => '${const JsonEncoder.withIndent('    ').convert(document)}\n';

  static Map<String, dynamic> decode(String source) {
    if (source.trim().isEmpty) return {};
    final decoded = jsonDecode(source);
    if (decoded is! Map<String, dynamic>) {
      throw FormatException('Expected a JSON object keyed by version, got ${decoded.runtimeType}.');
    }
    return decoded;
  }
}
