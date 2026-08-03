// Writes the release metadata the app reads to discover updates.
//
// Run from CI after building and hashing the release archive:
//
//   dart run tool/release_metadata.dart \
//     --version 1.7.0 --track main \
//     --sha256 <hex> --size <bytes> \
//     --asset-url https://github.com/.../jira_watch-1.7.0-windows-x64.zip \
//     --json gh-pages/latest.json --notes-out release_notes.md
//
// This tool — rather than the workflow's shell — owns the writes on purpose.
// The changelog contains a runic bullet and emoji, and PowerShell 5.1 decodes a
// redirected child's stdout using the OEM code page, so piping the text through
// the shell would corrupt it. Dart writes UTF-8 directly.
//
// Repair pass, run by hand:
//
//   dart run tool/release_metadata.dart --rewrite-all --json gh-pages/latest.json [--apply]

import 'dart:io';

import 'package:jira_watcher/models/app_changelog_data.dart';
import 'package:jira_watcher/models/release_metadata.dart';

void main(List<String> args) async {
  final options = _parse(args);

  final jsonPath = options['json'];
  if (jsonPath == null) _fail('--json <path to latest.json> is required.');

  // _fail returns Never, so the analyzer promotes these to non-null for us.
  final file = File(jsonPath);
  final existing = file.existsSync() ? ReleaseMetadata.decode(file.readAsStringSync()) : <String, dynamic>{};

  if (options.containsKey('rewrite-all')) {
    _rewriteAll(file, existing, apply: options.containsKey('apply'));
    return;
  }

  final version = options['version'];
  if (version == null) _fail('--version is required.');
  if (!ReleaseMetadata.isComparableVersion(version)) {
    _fail(
      'Version "$version" is not dotted-numeric. The app compares versions by '
      'parsing each dot-separated part as an integer, so a key like '
      '"1.8.0-beta.1" would break the update check for everyone on that track. '
      'Use a numeric suffix instead, e.g. 1.8.0.1 for the first beta.',
    );
  }

  // Fail here rather than shipping a release whose notes are empty: the
  // changelog lives in lib/models/app_changelog_data.dart and is easy to forget.
  final changelog = changeLogPlainTextFor(version);
  if (changelog == null) {
    _fail(
      'No changelog entry for $version in lib/models/app_changelog_data.dart. '
      'Add one before releasing.',
    );
  }

  if (existing.containsKey(version) && !options.containsKey('force')) {
    _fail('$version is already published in ${file.path}. Pass --force to overwrite it.');
  }

  final sha256 = options['sha256'];
  final size = options['size'] == null ? null : int.tryParse(options['size']!);
  if (sha256 == null || size == null) {
    stderr.writeln(
      'warning: no --sha256/--size given, so clients will refuse to self-install '
      'this release and will fall back to a manual download.',
    );
  }

  final entry = ReleaseMetadata.entry(
    version: version,
    changelog: changelog,
    windowsAssetPath: options['asset'] ?? ReleaseMetadata.pagesAssetPath(version),
    windowsAssetUrl: options['asset-url'],
    windowsSha256: sha256,
    windowsSizeBytes: size,
    macAssetPath: options['mac-asset'],
  );

  final updated = ReleaseMetadata.upsert(existing: existing, version: version, entry: entry);
  file.parent.createSync(recursive: true);
  file.writeAsStringSync(ReleaseMetadata.encode(updated));
  stdout.writeln('Wrote $version to ${file.path} (${updated.length} versions, newest first).');

  final notesOut = options['notes-out'];
  if (notesOut != null) {
    File(notesOut).writeAsStringSync(ReleaseMetadata.releaseNotes(version: version, changelog: changelog));
    stdout.writeln('Wrote release notes to $notesOut.');
  }
}

/// Regenerates every changelog from the in-app source, reporting the drift.
void _rewriteAll(File file, Map<String, dynamic> existing, {required bool apply}) {
  final (updated, changed) = ReleaseMetadata.rewriteChangelogs(existing);

  if (changed.isEmpty) {
    stdout.writeln('Every changelog already matches lib/models/app_changelog_data.dart.');
    return;
  }

  stdout.writeln('${changed.length} version(s) differ from the in-app changelog:');
  for (final version in changed) {
    final before = (existing[version] as Map)['changelog'] as String? ?? '';
    final after = (updated[version] as Map)['changelog'] as String? ?? '';
    stdout.writeln('  $version  ${_describeDrift(before, after)}');
  }

  if (!apply) {
    stdout.writeln('\nNothing written. Re-run with --apply to rewrite ${file.path}.');
    return;
  }
  file.writeAsStringSync(ReleaseMetadata.encode(ReleaseMetadata.sortNewestFirst(updated)));
  stdout.writeln('\nRewrote ${file.path}.');
}

/// The section emoji, matched as literal sequences rather than in a character
/// class: these are astral characters, and Dart's regex classes work on UTF-16
/// code units, so `[✨🪲🧼🐛]` would match a lone surrogate and fire on everything.
const _sectionEmotes = ['✨', '🪲', '🧼', '🐛'];

/// Names what actually differs, so a repair pass is reviewable without eyeballing
/// two blocks of near-identical text.
String _describeDrift(String before, String after) {
  final reasons = <String>[];
  if (before.contains('\t')) reasons.add('tabs');
  // Any line, not just the last: the drift shows up mid-document too.
  if (RegExp(r'[ \t]+$', multiLine: true).hasMatch(before)) reasons.add('trailing whitespace');
  if (_sectionEmotes.any((e) => RegExp('${RegExp.escape(e)}\\S').hasMatch(before))) {
    reasons.add('missing space after section emoji');
  }
  if (RegExp(r'(^|\n)᛫').hasMatch(before)) reasons.add('bullet missing its leading space');
  if (reasons.isEmpty) reasons.add('text differs');
  return '${reasons.join(', ')} (${before.length} → ${after.length} chars)';
}

Map<String, String?> _parse(List<String> args) {
  const flags = {'force', 'rewrite-all', 'apply'};
  final result = <String, String?>{};
  for (var i = 0; i < args.length; i++) {
    final arg = args[i];
    if (!arg.startsWith('--')) _fail('Unexpected argument "$arg".');
    final name = arg.substring(2);
    if (flags.contains(name)) {
      result[name] = null;
      continue;
    }
    if (i + 1 >= args.length) _fail('--$name expects a value.');
    result[name] = args[++i];
  }
  return result;
}

Never _fail(String message) {
  stderr.writeln('error: $message');
  exit(1);
}
