import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:jira_watcher/dao/gitlab_download_service.dart';
import 'package:jira_watcher/models/notification_center_model.dart';
import 'package:jira_watcher/ui/utils/byte_format.dart';
import 'package:jira_watcher/ui/utils/reveal_in_file_manager.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:path/path.dart' as p;

// Moved out of this file so the updater can reach it too; re-exported so the
// GitLab call sites that import this one keep compiling unchanged.
export 'package:jira_watcher/ui/utils/reveal_in_file_manager.dart' show revealInFileManager;

typedef GitLabDownloadRunner = Future<File> Function(File destination, GitLabDownloadTask task);

/// Asks where to save, then runs a download in the background behind a loud
/// notification rather than a blocking dialog — the reader can keep working
/// in whatever view they started it from. Returns the saved file, or null if
/// the user backed out or the download was cancelled.
///
/// One notification, reused for the whole lifetime of the download: it starts
/// out showing live progress and a Cancel action, and is edited in place —
/// same id, same position in the list — into either a finished download's
/// "Show in folder" / "Open" actions or a failure's error text.
Future<File?> runGitLabDownload({
  required String label,
  required String suggestedName,
  required GitLabDownloadRunner run,
}) async {
  final location = await getSaveLocation(suggestedName: suggestedName);
  if (location == null) return null;

  final destination = File(location.path);
  final task = GitLabDownloadTask(label: label, destination: destination);
  final notificationId = 'gitlab-download-${DateTime.now().microsecondsSinceEpoch}';

  void reportProgress() {
    final notification = NotificationCenterModel().byId(notificationId);
    if (notification == null) return;
    notification.subtitle = task.isIndeterminate ? formatBytes(task.received) : '${formatBytes(task.received)} of ${formatBytes(task.total)}';
  }

  task.addListener(reportProgress);

  NotificationCenterModel().add(
    AppNotification(
      id: notificationId,
      title: 'Downloading ${p.basename(suggestedName)}',
      subtitle: 'Starting…',
      leading: const SizedBox.square(dimension: 20, child: CircularProgressIndicator(strokeWidth: 2)),
      loud: true,
      actions: [AppNotificationAction(label: 'Cancel', icon: Symbols.close, onPressed: task.cancel)],
    ),
  );

  try {
    final file = await run(destination, task);
    task.removeListener(reportProgress);

    final notification = NotificationCenterModel().byId(notificationId);
    if (notification != null) {
      notification.title = 'Downloaded ${p.basename(file.path)}';
      notification.subtitle = formatBytes(task.received);
      notification.leading = const Icon(Symbols.check_circle, fill: 1, color: Colors.green);
      notification.actions = [
        AppNotificationAction(label: 'Show in folder', icon: Symbols.folder_open, onPressed: () => revealInFileManager(file)),
        AppNotificationAction(label: 'Open', icon: Symbols.open_in_new, onPressed: () => openInDefaultApp(file)),
      ];
    }
    return file;
  } on GitLabDownloadCancelled {
    task.removeListener(reportProgress);
    // Cancelling was deliberate — nothing to keep around once it is done.
    NotificationCenterModel().remove(notificationId);
    return null;
  } on Object catch (error) {
    task.removeListener(reportProgress);
    final notification = NotificationCenterModel().byId(notificationId);
    if (notification != null) {
      notification.title = 'Download failed';
      notification.subtitle = '$error';
      notification.leading = Icon(Symbols.error, fill: 1, color: Colors.red.shade400);
      notification.actions = const [];
    }
    return null;
  }
}
