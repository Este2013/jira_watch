import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:archive/archive.dart';
import 'package:archive/archive_io.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:jira_watcher/dao/file_download_service.dart';
import 'package:jira_watcher/dao/updates_dao.dart';
import 'package:jira_watcher/dao/windows_update_helper.dart';
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

/// The helper process was started but never got as far as writing its log.
class UpdateHelperDidNotStart implements Exception {
  UpdateHelperDidNotStart(this.logPath);
  final String logPath;

  @override
  String toString() =>
      'The updater could not start its helper process, so nothing was changed. '
      'Download the archive and extract it yourself. (Expected a log at $logPath)';
}

class StagedBinarySelfTestFailed implements Exception {
  StagedBinarySelfTestFailed(this.exitCode, this.output);
  final int exitCode;
  final String output;

  @override
  String toString() => 'The downloaded build would not start (exit code $exitCode), so it was not installed.\n$output';
}

/// A reason this install cannot replace itself, phrased for the user.
class UpdateBlocker {
  const UpdateBlocker(this.id, this.message);
  final String id;
  final String message;

  static const unsupportedPlatform = UpdateBlocker(
    'unsupported-platform',
    'Installing updates from inside the app is currently Windows-only.',
  );

  @override
  String toString() => '$id: $message';
}

class UpdatePreflight {
  const UpdatePreflight({required this.blockers});
  final List<UpdateBlocker> blockers;

  bool get canAutoInstall => blockers.isEmpty;

  /// Only the platform blocker means "hide this entirely"; the rest are worth
  /// showing so the user knows why the button is unavailable.
  bool get isUnsupportedPlatform => blockers.any((b) => b.id == UpdateBlocker.unsupportedPlatform.id);

  String get summary => blockers.map((b) => b.message).join('\n\n');
}

/// What a previous update left behind, discovered at startup.
class UpdateAftermath {
  const UpdateAftermath({this.failureReport});

  /// The raw `update_failed.json` contents, when the last attempt did not finish.
  final String? failureReport;

  bool get hadFailure => failureReport != null;
}

class _ProbeResult {
  const _ProbeResult({
    required this.scriptExecutionWorks,
    this.instances = 1,
    this.installFree,
    this.tempFree,
  });

  final bool scriptExecutionWorks;
  final int instances;
  final int? installFree;
  final int? tempFree;
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

  // PREFLIGHT ///////////////////////////////////////////////////////////////

  /// Whether this install can be replaced in place, and why not if it cannot.
  ///
  /// Every blocker carries a sentence for the user. A blocked install is offered
  /// the manual download instead — never a half-attempt.
  Future<UpdatePreflight> preflight(NewUpdateData update) async {
    final blockers = <UpdateBlocker>[];

    if (!Platform.isWindows) {
      return UpdatePreflight(blockers: [UpdateBlocker.unsupportedPlatform]);
    }

    final exe = Platform.resolvedExecutable;
    final install = installDirectory;

    if (kDebugMode || exe.contains(r'\build\windows\')) {
      blockers.add(
        UpdateBlocker(
          'development-build',
          "You're running a build from the project tree, so installing over it would be undone by the next build.",
        ),
      );
    }

    if (update.windowsSha256 == null) {
      blockers.add(
        UpdateBlocker(
          'no-checksum',
          "This release doesn't publish a checksum, so the download can't be verified before it replaces your app.",
        ),
      );
    }

    if (!await _isWritable(install)) {
      blockers.add(
        UpdateBlocker(
          'not-writable',
          'Jira Watcher is installed somewhere this account cannot modify (${install.path}). '
              'Download the archive and extract it yourself, or move the app to a folder you own.',
        ),
      );
    }

    final probe = await _runPreflightProbe(exe, install);
    if (!probe.scriptExecutionWorks) {
      blockers.add(
        UpdateBlocker(
          'scripts-blocked',
          'This machine does not allow the helper script that performs the update to run. '
              'Download the archive and extract it yourself.',
        ),
      );
    }
    if (probe.instances > 1) {
      blockers.add(
        UpdateBlocker(
          'multiple-instances',
          'Another Jira Watcher window is open. Close it before updating, so its files are not in use.',
        ),
      );
    }

    // Two copies of the tree live in the install folder briefly, plus the archive
    // and the unpacked payload under temp.
    final needed = (update.windowsSizeBytes ?? 60 * 1024 * 1024) * 3 + 200 * 1024 * 1024;
    if (probe.installFree != null && probe.installFree! < needed) {
      blockers.add(
        UpdateBlocker(
          'low-disk',
          'There is not enough free space on ${install.path[0]}: to install safely '
              '(${_mb(probe.installFree!)} free, about ${_mb(needed)} needed).',
        ),
      );
    }

    // Only a *recent* marker means an update is genuinely in flight. A handover
    // that failed without the app relaunching leaves this behind, and treating a
    // stale one as authoritative would block every future update with no way out
    // but deleting a file by hand.
    final pending = await _pendingUpdateMarker();
    if (await pending.exists()) {
      final age = DateTime.now().difference((await pending.stat()).modified);
      if (age < const Duration(minutes: 10)) {
        blockers.add(
          UpdateBlocker(
            'update-pending',
            'An update is already being applied. Restart Jira Watcher and try again if it seems stuck.',
          ),
        );
      } else {
        loggy.warning('Ignoring a stale pending_update marker from ${age.inMinutes} minutes ago.');
        await pending.delete();
      }
    }

    return UpdatePreflight(blockers: blockers);
  }

  static String _mb(int bytes) => '${(bytes / (1024 * 1024)).round()} MB';

  /// Probes by writing, rather than inspecting ACLs: it is the only answer that
  /// accounts for permissions, read-only volumes and policy at once.
  Future<bool> _isWritable(Directory directory) async {
    final probe = File(p.join(directory.path, '.jw_write_probe_${DateTime.now().microsecondsSinceEpoch}'));
    try {
      await probe.writeAsString('probe');
      await probe.delete();
      return true;
    } on FileSystemException catch (e) {
      loggy.info('Install directory is not writable: $e');
      return false;
    }
  }

  Future<_ProbeResult> _runPreflightProbe(String exePath, Directory install) async {
    try {
      final temp = await SettingsModel().tempDir;
      final script = File(p.join((await _helperDir('probe')).path, 'preflight_probe.ps1'));
      await script.parent.create(recursive: true);
      await script.writeAsString(preflightProbeScript);

      final result = await Process.run(
        'powershell.exe',
        [
          '-NoProfile',
          '-NonInteractive',
          '-ExecutionPolicy',
          'Bypass',
          '-File',
          script.path,
          '-ExePath',
          exePath,
          '-InstallDrive',
          _driveLetter(install.path),
          '-TempDrive',
          _driveLetter(temp.path),
        ],
        workingDirectory: script.parent.path,
      );

      final output = '${result.stdout}';
      if (!output.contains('probe-ok')) {
        loggy.warning('Preflight probe did not run. exit=${result.exitCode} stderr=${result.stderr}');
        return const _ProbeResult(scriptExecutionWorks: false);
      }
      int? read(String key) {
        final match = RegExp('$key=(\\d+)').firstMatch(output);
        return match == null ? null : int.tryParse(match.group(1)!);
      }
      return _ProbeResult(
        scriptExecutionWorks: true,
        instances: read('instances') ?? 1,
        installFree: read('installFree'),
        tempFree: read('tempFree'),
      );
    } on Object catch (e) {
      loggy.warning('Preflight probe failed to launch: $e');
      return const _ProbeResult(scriptExecutionWorks: false);
    }
  }

  static String _driveLetter(String path) => p.rootPrefix(path).replaceAll(RegExp(r'[:\\/]'), '');

  // APPLYING /////////////////////////////////////////////////////////////////

  Future<Directory> _helperDir(String version) async => Directory(p.join((await stagingRoot(version)).path, 'helper'));

  Future<File> _pendingUpdateMarker() async => File(p.join((await SettingsModel().settingsFolder).path, 'pending_update.json'));

  /// How the helper process is started.
  ///
  /// Deliberately not either detached mode. Both map to `DETACHED_PROCESS` on
  /// Windows, which gives the child no console — and `powershell.exe` is a
  /// console-subsystem program, so it dies during startup, silently, because
  /// being detached also means there is no stderr to complain to. Measured: with
  /// either detached mode the helper never ran at all.
  ///
  /// `normal` still outlives this process. Windows does not kill children when
  /// their parent exits; only the stdio pipes break, and the helper writes to its
  /// log file rather than to stdout.
  static const helperLaunchMode = ProcessStartMode.normal;

  /// The flags the helper is always launched with, shared so a test can prove the
  /// combination actually runs a script.
  static List<String> helperArgumentsFor(String scriptPath, List<String> scriptArguments) => [
    '-NoProfile',
    '-NonInteractive',
    '-ExecutionPolicy',
    'Bypass',
    '-WindowStyle',
    'Hidden',
    // Everything after -File is passed to the script, so it goes last.
    '-File',
    scriptPath,
    ...scriptArguments,
  ];

  /// Hands the swap to a helper process and waits for proof that it started.
  ///
  /// The caller must exit promptly afterwards: the helper is waiting for this
  /// process's executable to become unlocked, and does nothing until it does.
  ///
  /// Throws if the helper produced no sign of life, so a launch that silently
  /// fails cannot end with the app closing and nothing happening.
  Future<void> launchHelper({required String version, required Directory payload}) async {
    final helperDir = await _helperDir(version);
    await helperDir.create(recursive: true);

    final script = File(p.join(helperDir.path, 'apply_update.ps1'));
    await script.writeAsString(applyUpdateScript);
    final log = File(p.join(helperDir.path, 'apply_update.log'));
    final markers = await SettingsModel().settingsFolder;

    await (await _pendingUpdateMarker()).writeAsString(
      '{"version": "$version", "startedAt": "${DateTime.now().toIso8601String()}"}',
    );

    final arguments = helperArgumentsFor(script.path, [
      '-OldPid',
      '$pid',
      '-Install',
      installDirectory.path,
      '-Payload',
      payload.path,
      '-Version',
      version,
      '-Markers',
      markers.path,
      '-LogPath',
      log.path,
    ]);

    // Logged in full, and quoted so it can be pasted into a terminal and re-run
    // by hand. Diagnosing a handover from the app's log alone was otherwise
    // guesswork — the helper writes its own log, so when that log is missing
    // there is nothing at all to go on.
    loggy.info('Launching the update helper for $version');
    loggy.info('  running from: ${Platform.resolvedExecutable}');
    loggy.info('  install dir:  ${installDirectory.path}');
    loggy.info('  launch mode:  $helperLaunchMode');
    loggy.info('  command:      ${_quoteCommand('powershell.exe', arguments)}');

    await Process.start(
      'powershell.exe',
      arguments,
      // Must not be the install directory: a child inherits the parent's working
      // directory, and the parent's is the install folder when launched from
      // Explorer — which would leave PowerShell holding a handle on the very
      // folder it is trying to replace.
      workingDirectory: helperDir.path,
      mode: helperLaunchMode,
    );

    // The helper logs before it touches anything, so its log appearing is proof
    // it is alive. Without this check a launch that fails to start ends with the
    // app closing and nothing happening at all — which is exactly what a
    // detached launch used to do.
    if (!await _waitForHelperStart(log)) {
      loggy.error('The helper wrote nothing to ${log.path}; it never started.');
      throw UpdateHelperDidNotStart(log.path);
    }
    loggy.info('The update helper is running; handing over.');
  }

  Future<bool> _waitForHelperStart(File log, {Duration timeout = const Duration(seconds: 10)}) async {
    final deadline = DateTime.now().add(timeout);
    while (DateTime.now().isBefore(deadline)) {
      if (await log.exists() && await log.length() > 0) return true;
      await Future.delayed(const Duration(milliseconds: 100));
    }
    return false;
  }

  /// Renders a command so it can be pasted into a terminal, quoting only what
  /// needs it.
  static String _quoteCommand(String executable, List<String> arguments) =>
      [executable, ...arguments].map((part) => part.contains(' ') ? '"$part"' : part).join(' ');

  // STARTUP BOOKKEEPING //////////////////////////////////////////////////////

  /// Confirms a completed update, tidies up after it, and reports a failed one.
  ///
  /// Called early in `main`. Never throws: a problem here must not stop the app
  /// from starting.
  Future<UpdateAftermath> finishPendingWork(List<String> args) async {
    if (!Platform.isWindows) return const UpdateAftermath();
    try {
      final markers = await SettingsModel().settingsFolder;

      // Written first and cheaply: the helper is watching for it to decide the
      // new version came up, and every second counts against its health window.
      final postUpdateIndex = args.indexOf('--post-update');
      if (postUpdateIndex >= 0 && postUpdateIndex + 1 < args.length) {
        final version = args[postUpdateIndex + 1];
        await File(p.join(markers.path, 'update_ok.$version')).writeAsString(DateTime.now().toIso8601String());
        loggy.info('Confirmed a successful update to $version');
      }

      final pendingUpdate = File(p.join(markers.path, 'pending_update.json'));
      if (await pendingUpdate.exists()) await pendingUpdate.delete();

      String? failure;
      final failed = File(p.join(markers.path, 'update_failed.json'));
      if (await failed.exists()) {
        failure = await failed.readAsString();
        await failed.delete();
        loggy.warning('A previous update did not complete: $failure');
      }

      await _cleanUpAfterUpdate(markers);
      await _sweepStaleStaging();

      return UpdateAftermath(failureReport: failure);
    } on Object catch (e, s) {
      loggy.error('Update bookkeeping failed, continuing startup anyway: $e\n$s');
      return const UpdateAftermath();
    }
  }

  /// Deletes the backup, but only once the new version is confirmed running.
  ///
  /// The version check is what makes the backup trustworthy. Deleting it on the
  /// helper's word alone would turn a recoverable failed update into an
  /// unrecoverable one, so a mismatch keeps the backup and says so loudly.
  Future<void> _cleanUpAfterUpdate(Directory markers) async {
    final pending = File(p.join(markers.path, 'pending_cleanup.json'));
    if (!await pending.exists()) return;

    final expected = RegExp(r'"newVersion"\s*:\s*"([^"]+)"').firstMatch(await pending.readAsString())?.group(1);
    final running = await SettingsModel().appInfo.version;

    if (expected == null || expected != running) {
      loggy.error(
        'An update to $expected was applied but $running is running. Keeping the backup at '
        '${p.join(installDirectory.path, '.jw_update', 'backup')} for recovery.',
      );
      return;
    }

    final work = Directory(p.join(installDirectory.path, '.jw_update'));
    if (await work.exists()) {
      await work.delete(recursive: true);
      loggy.info('Removed the update backup after confirming $running');
    }
    await pending.delete();
    await clearStaging(running);
  }

  /// Removes staging folders left by other versions or by an abandoned attempt.
  Future<void> _sweepStaleStaging() async {
    final temp = await SettingsModel().tempDir;
    final root = Directory(p.join(temp.path, 'update'));
    if (!await root.exists()) return;

    final current = await SettingsModel().appInfo.version;
    final cutoff = DateTime.now().subtract(const Duration(days: 7));
    await for (final entry in root.list()) {
      if (entry is! Directory) continue;
      final version = p.basename(entry.path);
      if (version == current) continue;
      if ((await entry.stat()).modified.isAfter(cutoff)) continue;
      try {
        await entry.delete(recursive: true);
        loggy.info('Swept stale update staging for $version');
      } on Object catch (e) {
        loggy.info('Could not sweep $version staging: $e');
      }
    }
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
