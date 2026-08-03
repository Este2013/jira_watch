import 'dart:async';
import 'dart:io';

import 'package:jira_watcher/dao/file_download_service.dart';
import 'package:jira_watcher/dao/updates_dao.dart';
import 'package:jira_watcher/dao/windows_self_update_dao.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:loggy/loggy.dart';

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
