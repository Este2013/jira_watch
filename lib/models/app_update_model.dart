import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:jira_watcher/dao/file_download_service.dart';
import 'package:jira_watcher/dao/updates_dao.dart';
import 'package:jira_watcher/dao/windows_self_update_dao.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:loggy/loggy.dart';

enum UpdatePhase {
  /// Preflight has run; the dialog is waiting for the user.
  idle,
  checking,
  downloading,
  extracting,

  /// Validating the tree and proving the staged build starts.
  verifying,

  /// Staged and proven. Nothing installed yet — the app has to exit first.
  readyToRestart,
  applying,
  failed,
}

/// Drives an in-app update and exposes just enough state for the dialog.
///
/// Every phase up to [UpdatePhase.readyToRestart] happens entirely under the temp
/// directory, so cancelling or failing at any point leaves the install untouched.
class AppUpdateController extends ChangeNotifier with GlobalLoggy {
  AppUpdateController({required this.update, required this.currentVersion, this.preflightOverride});

  final NewUpdateData update;
  final String currentVersion;

  /// Stands in for the real check under test.
  ///
  /// A widget test runs on a fake clock, and the real preflight does file and
  /// process I/O started from initState — futures that a fake clock never lets
  /// complete. Without this seam the phase machine and the button states it drives
  /// could not be covered at all.
  @visibleForTesting
  final UpdatePreflight? preflightOverride;

  final _dao = WindowsSelfUpdateDao();

  UpdatePhase phase = UpdatePhase.checking;
  UpdatePreflight? preflight;
  DownloadTask? task;
  Object? error;
  Directory? _payloadRoot;

  bool get canInstall => preflight?.canAutoInstall ?? false;
  bool get showInstallButton => !(preflight?.isUnsupportedPlatform ?? !Platform.isWindows);

  /// Whether the dialog should refuse to close: past this point there is staged
  /// work or a helper in flight that a stray Escape should not orphan.
  bool get isBusy => phase == UpdatePhase.downloading || phase == UpdatePhase.extracting || phase == UpdatePhase.verifying || phase == UpdatePhase.applying;

  Future<void> runPreflight() async {
    _set(UpdatePhase.checking);
    try {
      preflight = preflightOverride ?? await _dao.preflight(update);
      if (!(preflight?.canAutoInstall ?? false)) {
        loggy.info('Self-install unavailable: ${preflight!.blockers.join('; ')}');
      }
    } on Object catch (e, s) {
      // Never leave the dialog stuck mid-check: without this the phase would
      // stay `checking`, which shows a disabled Install button and no reason for
      // it. Failing to determine whether installing is safe is itself a reason
      // not to offer it.
      loggy.error('Preflight could not complete: $e\n$s');
      preflight = UpdatePreflight(
        blockers: [
          UpdateBlocker('preflight-failed', "Couldn't check whether this app can update itself ($e). Download the archive and extract it yourself."),
        ],
      );
    }
    _set(UpdatePhase.idle);
  }

  /// Downloads, verifies, unpacks and smoke-tests, stopping short of installing.
  Future<void> stage() async {
    try {
      error = null;
      task = DownloadTask(label: update.version, destination: await _dao.archiveFileFor(update.version));
      _set(UpdatePhase.downloading);

      final archive = await _dao.downloadAndVerify(update: update, task: task!);

      _set(UpdatePhase.extracting);
      final root = await _dao.extract(archive: archive, version: update.version);

      _set(UpdatePhase.verifying);
      _dao.validatePayload(root);
      await _dao.selfTestStagedBinary(root: root, version: update.version);

      _payloadRoot = root;
      _set(UpdatePhase.readyToRestart);
    } on DownloadCancelled {
      // Not a failure: nothing outside staging was touched, so return to the
      // starting state rather than showing an error.
      loggy.info('Update download cancelled by the user');
      _set(UpdatePhase.idle);
    } on Object catch (e, s) {
      loggy.error('Staging ${update.version} failed: $e\n$s');
      error = e;
      _set(UpdatePhase.failed);
    }
  }

  /// Hands over to the detached helper and closes the app.
  ///
  /// Returns once the helper is running; the caller must then exit, because the
  /// helper is waiting for this executable to be released before it does anything.
  Future<bool> applyAndRestart() async {
    final root = _payloadRoot;
    if (root == null) return false;
    try {
      _set(UpdatePhase.applying);
      await _dao.launchHelper(version: update.version, payload: root);
      return true;
    } on Object catch (e, s) {
      loggy.error('Could not launch the update helper: $e\n$s');
      error = e;
      _set(UpdatePhase.failed);
      return false;
    }
  }

  void cancel() => task?.cancel();

  void _set(UpdatePhase next) {
    phase = next;
    notifyListeners();
  }
}

/// Narrates a full staging run for the diagnostics dialog.
///
/// Downloads the newest published archive, verifies it, unpacks it, checks the
/// result is a real build and proves it can start — reporting each step. Nothing
/// outside the temp directory is touched, so this is safe to run at any time.
///
/// Deliberately exercises whatever the server currently publishes, even when that
/// is older than the running build: the point is to prove the pipeline works
/// against a real archive.
Stream<String> diagnoseUpdateStaging() async* {
  final dao = WindowsSelfUpdateDao();

  if (!Platform.isWindows) {
    yield 'Self-install is Windows-only for now; nothing to test on this platform.';
    return;
  }

  yield 'Running from: ${Platform.resolvedExecutable}';
  yield 'Install directory: ${dao.installDirectory.path}';
  yield 'Current version: ${await SettingsModel().appInfo.version}';

  yield '';
  yield 'Asking the server what the newest published release is...';
  final NewUpdateData? update;
  try {
    update = await fetchNewestPublished();
  } on Object catch (e) {
    yield 'Could not reach the update server: $e';
    return;
  }
  if (update == null) {
    yield 'The server published no releases, so there is nothing to stage.';
    return;
  }

  yield 'Newest published: ${update.version}';
  yield 'Archive URL: ${update.windowsAssetUri}';
  final publishedHash = update.windowsSha256;
  yield publishedHash == null
      ? 'No checksum published for this version — a real install would refuse it. Staging anyway to exercise the pipeline.'
      : 'Published sha256: $publishedHash';
  if (update.windowsSizeBytes != null) yield 'Published size: ${update.windowsSizeBytes} bytes';

  final staging = await dao.stagingRoot(update.version);
  yield 'Staging under: ${staging.path}';

  final task = DownloadTask(label: update.version, destination: await dao.archiveFileFor(update.version));
  yield '';
  yield 'Downloading...';

  final File archive;
  try {
    archive = await dao.downloadAndVerify(
      update: update,
      task: task,
      // Relaxed on purpose: older releases predate the checksum field, and this
      // diagnostic should still be able to prove the rest of the pipeline works.
      requireChecksum: false,
    );
  } on Object catch (e) {
    yield 'Download or verification failed: $e';
    return;
  }

  final size = await archive.length();
  yield 'Downloaded $size bytes';
  final computed = await dao.hashOf(archive);
  yield 'Computed sha256: $computed';
  if (publishedHash != null) {
    yield publishedHash == computed ? 'Checksum matches ✓' : 'CHECKSUM MISMATCH — a real install would refuse this';
  } else {
    yield 'Nothing to compare against. This is the value that belongs in latest.json as x64Sha256.';
  }

  yield '';
  yield 'Extracting...';
  final Directory root;
  try {
    root = await dao.extract(archive: archive, version: update.version);
  } on Object catch (e) {
    yield 'Extraction failed: $e';
    return;
  }
  yield 'Payload root: ${root.path}';

  yield '';
  yield 'Validating the extracted build...';
  try {
    dao.validatePayload(root);
  } on Object catch (e) {
    yield 'Validation failed: $e';
    return;
  }
  for (final entry in WindowsSelfUpdateDao.requiredPayloadEntries) {
    yield '  $entry present';
  }

  yield '';
  yield 'Starting the staged build with --self-test...';
  try {
    final outcome = await dao.selfTestStagedBinary(root: root, version: update.version);
    yield switch (outcome) {
      SelfTestOutcome.passed => 'The staged build starts and exits cleanly ✓',
      SelfTestOutcome.skippedUnsupported =>
        'Skipped: ${update.version} predates ${WindowsSelfUpdateDao.selfTestSupportedFrom}, which introduced --self-test. '
            'Running it would launch a second copy of the app rather than smoke-testing it.',
    };
  } on Object catch (e) {
    yield 'Self-test failed: $e';
    return;
  }

  yield '';
  yield 'Cleaning up staging...';
  try {
    await dao.clearStaging(update.version);
    yield 'Removed ${staging.path}';
  } on Object catch (e) {
    logWarning('Could not clear update staging: $e');
    yield 'Could not remove staging (harmless, it is under temp): $e';
  }

  yield '';
  yield 'Staging pipeline OK. Replacing the installed app is not part of this test.';
}
