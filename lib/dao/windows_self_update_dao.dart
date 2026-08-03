import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:archive/archive.dart';
import 'package:archive/archive_io.dart';
import 'package:crypto/crypto.dart';
import 'package:jira_watcher/dao/file_download_service.dart';
import 'package:jira_watcher/dao/updates_dao.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:loggy/loggy.dart';
import 'package:path/path.dart' as p;

/// The release publishes no checksum, so there is no way to tell a complete
/// download from a truncated one.
class UpdateChecksumMissing implements Exception {
  @override
  String toString() => "This release doesn't publish a checksum, so the download can't be verified before installing.";
}

class UpdateChecksumMismatch implements Exception {
  UpdateChecksumMismatch(this.expected, this.actual);
  final String expected;
  final String actual;

  @override
  String toString() => 'The downloaded file does not match the published checksum.\nExpected: $expected\nGot:      $actual';
}

class UpdateSizeMismatch implements Exception {
  UpdateSizeMismatch(this.expected, this.actual);
  final int expected;
  final int actual;

  @override
  String toString() => 'The downloaded file is $actual bytes; the release says it should be $expected.';
}

/// An archive entry that tried to escape the directory it was extracted into.
class MaliciousArchiveEntry implements Exception {
  MaliciousArchiveEntry(this.entryName);
  final String entryName;

  @override
  String toString() => 'The archive contains an entry that would write outside the staging folder: "$entryName". Refusing to extract it.';
}

class InvalidUpdatePayload implements Exception {
  InvalidUpdatePayload(this.reason);
  final String reason;

  @override
  String toString() => 'The downloaded archive is not a usable Jira Watcher build: $reason';
}

class StagedBinarySelfTestFailed implements Exception {
  StagedBinarySelfTestFailed(this.exitCode, this.output);
  final int exitCode;
  final String output;

  @override
  String toString() => 'The downloaded build would not start (exit code $exitCode), so it was not installed.\n$output';
}

enum SelfTestOutcome {
  passed,

  /// The staged build is older than [WindowsSelfUpdateDao.selfTestSupportedFrom],
  /// so it has no `--self-test` flag to run.
  skippedUnsupported,
}

/// Downloads, verifies and unpacks a release archive into a staging folder.
///
/// Nothing here touches the installed app: every step happens under the temp
/// directory, so a failure at any point leaves the running install untouched.
/// Replacing it is a separate concern.
class WindowsSelfUpdateDao with GlobalLoggy {
  static final WindowsSelfUpdateDao _instance = WindowsSelfUpdateDao._internal();

  factory WindowsSelfUpdateDao() => _instance;

  WindowsSelfUpdateDao._internal();

  /// Files a Flutter Windows build cannot run without. Checked before the payload
  /// is considered usable, so an archive that merely contains an exe is rejected.
  static const requiredPayloadEntries = [
    'jira_watch.exe',
    'flutter_windows.dll',
    'data/app.so',
    'data/flutter_assets/AssetManifest.bin',
  ];

  static const executableName = 'jira_watch.exe';

  /// The first release whose binary understands `--self-test`.
  ///
  /// Older builds treat it as an unknown argument and start normally, so they
  /// cannot be smoke-tested before installing.
  static const selfTestSupportedFrom = '1.7.0';

  /// What a supported build prints when self-testing.
  static const selfTestMarker = 'jira_watcher self-test ok';

  /// Where the running app lives — the directory that would be replaced.
  Directory get installDirectory => File(Platform.resolvedExecutable).parent;

  Future<Directory> stagingRoot(String version) async {
    final temp = await SettingsModel().tempDir;
    return Directory(p.join(temp.path, 'update', version));
  }

  Future<File> archiveFileFor(String version) async => File(p.join((await stagingRoot(version)).path, 'download', 'update.zip'));

  Future<Directory> payloadDirFor(String version) async => Directory(p.join((await stagingRoot(version)).path, 'payload'));

  /// Downloads the release archive and verifies it against the published
  /// checksum, hashing as the bytes arrive rather than re-reading the file.
  ///
  /// Throws before returning if the checksum is absent or wrong, so no caller can
  /// accidentally proceed with an unverified archive.
  Future<File> downloadAndVerify({
    required NewUpdateData update,
    required DownloadTask task,
    bool requireChecksum = true,
  }) async {
    final uri = update.windowsAssetUri;
    if (uri == null) throw InvalidUpdatePayload('the release publishes no Windows archive');

    final expected = update.windowsSha256;
    if (expected == null && requireChecksum) throw UpdateChecksumMissing();

    final destination = await archiveFileFor(update.version);
    final digest = _DigestSink();
    final hasher = sha256.startChunkedConversion(digest);

    await FileDownloadService().download(
      uri: uri,
      destination: destination,
      task: task,
      onChunk: hasher.add,
    );
    hasher.close();

    final actual = digest.value.toString();
    final size = await destination.length();
    loggy.info('Downloaded ${update.version}: $size bytes, sha256 $actual');

    final expectedSize = update.windowsSizeBytes;
    if (expectedSize != null && expectedSize != size) {
      await destination.delete();
      throw UpdateSizeMismatch(expectedSize, size);
    }
    if (expected != null && expected != actual) {
      // Deleted rather than kept: a mismatching archive is not something to retry
      // extracting, and leaving it invites exactly that.
      await destination.delete();
      throw UpdateChecksumMismatch(expected, actual);
    }
    return destination;
  }

  /// Computes the SHA-256 of an already-downloaded file.
  Future<String> hashOf(File file) async {
    final digest = _DigestSink();
    final hasher = sha256.startChunkedConversion(digest);
    await for (final chunk in file.openRead()) {
      hasher.add(chunk);
    }
    hasher.close();
    return digest.value.toString();
  }

  /// Unpacks [archive] into the version's payload folder, off the UI isolate.
  ///
  /// Returns the directory the build actually lives in, which is the payload
  /// folder itself for the archive shape this project publishes.
  Future<Directory> extract({required File archive, required String version}) async => extractTo(archive: archive, payload: await payloadDirFor(version));

  /// The path-explicit half of [extract], so the extraction guards can be tested
  /// without a plugin-backed temp directory.
  Future<Directory> extractTo({required File archive, required Directory payload}) async {
    if (await payload.exists()) await payload.delete(recursive: true);
    await payload.create(recursive: true);

    // Extraction is CPU- and IO-bound over ~150 MB, so it runs in an isolate to
    // keep the progress dialog responsive. The result is a record rather than an
    // exception so nothing unsendable has to cross the isolate boundary.
    final archivePath = archive.path;
    final payloadPath = payload.path;
    final result = await Isolate.run(() => _extractZip(archivePath, payloadPath));

    if (result.maliciousEntry != null) throw MaliciousArchiveEntry(result.maliciousEntry!);
    if (result.error != null) throw InvalidUpdatePayload(result.error!);
    loggy.info('Extracted ${result.entries} entries into $payloadPath');

    return resolvePayloadRoot(payload);
  }

  /// Finds the build inside an extracted archive.
  ///
  /// This project's archives put the build loose at the root, but an archive
  /// wrapped in a single folder is handled too rather than being rejected.
  Directory resolvePayloadRoot(Directory extracted) {
    if (File(p.join(extracted.path, executableName)).existsSync()) return extracted;

    final children = extracted.listSync();
    final directories = children.whereType<Directory>().toList();
    if (children.length == 1 && directories.length == 1) return resolvePayloadRoot(directories.single);

    throw InvalidUpdatePayload('no $executableName at the archive root or in a single top-level folder');
  }

  /// Rejects a payload that is missing anything a Flutter build needs to run.
  void validatePayload(Directory root) {
    for (final entry in requiredPayloadEntries) {
      final file = File(p.join(root.path, p.joinAll(entry.split('/'))));
      if (!file.existsSync()) throw InvalidUpdatePayload('$entry is missing');
      if (file.lengthSync() == 0) throw InvalidUpdatePayload('$entry is empty');
    }
  }

  /// Runs the staged executable's self-test and requires it to exit cleanly.
  ///
  /// This is what catches a corrupted extraction, a missing VC++ runtime, or the
  /// new exe being quarantined by antivirus — while the installed app is still
  /// completely untouched. Without it, those failures would only surface after
  /// the swap, when recovery is far more expensive.
  ///
  /// Skipped for builds older than [selfTestSupportedFrom], which do not
  /// recognise the flag. Running them would start a whole second copy of the app
  /// — writing to the same log file and showing a window — and then time out,
  /// which looks identical to a real failure. Updates only ever move forward, so
  /// in practice this only skips a deliberate downgrade.
  Future<SelfTestOutcome> selfTestStagedBinary({
    required Directory root,
    required String version,
    Duration timeout = const Duration(seconds: 30),
  }) async {
    if (isVersionStrictlyAbove(selfTestSupportedFrom, baseline: version)) {
      loggy.info('Skipping the staged self-test: $version predates $selfTestSupportedFrom, which introduced --self-test.');
      return SelfTestOutcome.skippedUnsupported;
    }

    final exe = File(p.join(root.path, executableName));
    loggy.info('Self-testing ${exe.path}');

    final process = await Process.start(
      exe.path,
      ['--self-test'],
      workingDirectory: root.path,
    );
    final stdoutText = process.stdout.transform(const SystemEncoding().decoder).join();
    final stderrText = process.stderr.transform(const SystemEncoding().decoder).join();

    var timedOut = false;
    final exitCode = await process.exitCode.timeout(
      timeout,
      onTimeout: () {
        timedOut = true;
        process.kill();
        return -1;
      },
    );

    final output = [await stdoutText, await stderrText].where((s) => s.trim().isNotEmpty).join('\n');

    if (exitCode != 0) {
      throw StagedBinarySelfTestFailed(
        exitCode,
        timedOut ? 'It did not exit within ${timeout.inSeconds}s.\n$output' : (output.isEmpty ? '(no output)' : output),
      );
    }
    // Not fatal on its own: the exit code is the contract, and stdout capture
    // from a GUI-subsystem process is the less reliable signal of the two.
    if (!output.contains(selfTestMarker)) {
      loggy.warning('Staged build exited 0 but did not print the self-test marker. Output: $output');
    }
    return SelfTestOutcome.passed;
  }

  Future<void> clearStaging(String version) async {
    final root = await stagingRoot(version);
    if (await root.exists()) {
      await root.delete(recursive: true);
      loggy.info('Cleared staging for $version');
    }
  }
}

/// Extraction result, kept to sendable types so it can cross an isolate boundary.
typedef _ExtractResult = ({int entries, String? error, String? maliciousEntry});

/// Runs in a background isolate; must stay a top-level function.
_ExtractResult _extractZip(String archivePath, String destinationPath) {
  final input = InputFileStream(archivePath);
  var entries = 0;
  try {
    final archive = ZipDecoder().decodeStream(input);

    for (final file in archive.files) {
      // Never materialise a link: on Windows it needs privilege, and it is a
      // classic way to redirect a write outside the target directory.
      if (file.isSymbolicLink) continue;

      final relative = p.normalize(file.name.replaceAll('\\', '/'));
      if (p.isAbsolute(relative) || relative.startsWith('..') || relative.contains(':')) {
        return (entries: entries, error: null, maliciousEntry: file.name);
      }

      final target = p.join(destinationPath, p.joinAll(relative.split('/')));
      // The real zip-slip guard: normalisation alone can be defeated, so the
      // resolved path is checked against the destination.
      if (!p.isWithin(destinationPath, target)) {
        return (entries: entries, error: null, maliciousEntry: file.name);
      }

      if (file.isDirectory) {
        Directory(target).createSync(recursive: true);
        continue;
      }
      Directory(p.dirname(target)).createSync(recursive: true);
      final output = OutputFileStream(target);
      try {
        file.writeContent(output);
      } finally {
        output.closeSync();
      }
      entries++;
    }
  } on Object catch (e) {
    return (entries: entries, error: '$e', maliciousEntry: null);
  } finally {
    input.closeSync();
  }
  if (entries == 0) return (entries: 0, error: 'the archive is empty', maliciousEntry: null);
  return (entries: entries, error: null, maliciousEntry: null);
}

/// Collects the single digest a chunked hash conversion produces.
///
/// Hand-rolled to avoid depending on package:convert's AccumulatorSink for one
/// four-line class.
class _DigestSink implements Sink<Digest> {
  late Digest value;

  @override
  void add(Digest data) => value = data;

  @override
  void close() {}
}
