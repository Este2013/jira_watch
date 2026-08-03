import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:jira_watcher/dao/gitlab_download_service.dart';
import 'package:loggy/loggy.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:path/path.dart' as p;
import 'package:url_launcher/url_launcher.dart';

typedef GitLabDownloadRunner = Future<File> Function(File destination, GitLabDownloadTask task);

/// Asks where to save, runs a download with a progress dialog, and reports the
/// outcome. Returns the saved file, or null if the user backed out.
Future<File?> runGitLabDownload(
  BuildContext context, {
  required String label,
  required String suggestedName,
  required GitLabDownloadRunner run,
}) async {
  final location = await getSaveLocation(suggestedName: suggestedName);
  if (location == null) return null;

  final destination = File(location.path);
  final task = GitLabDownloadTask(label: label, destination: destination);

  if (!context.mounted) return null;

  final result = await showDialog<Object?>(
    context: context,
    barrierDismissible: false,
    builder: (context) => _DownloadProgressDialog(task: task, run: () => run(destination, task)),
  );

  if (!context.mounted) return null;

  if (result is File) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Saved ${p.basename(result.path)}'),
        action: SnackBarAction(
          label: 'Show in folder',
          onPressed: () => revealInFileManager(result),
        ),
      ),
    );
    return result;
  }

  if (result is GitLabDownloadCancelled) return null;

  if (result != null) {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: Icon(Symbols.error, fill: 1, color: Theme.of(context).colorScheme.error),
        title: const Text('Download failed'),
        content: SelectableText('$result'),
        actions: [TextButton(onPressed: Navigator.of(context).pop, child: const Text('Close'))],
      ),
    );
  }
  return null;
}

/// Opens the OS file manager with [file] selected.
Future<void> revealInFileManager(File file) async {
  try {
    if (Platform.isWindows) {
      // The comma form has to be one argument, and explorer exits non-zero even
      // on success, so its exit code is deliberately ignored.
      await Process.run('explorer.exe', ['/select,${file.path}']);
      return;
    }
    if (Platform.isMacOS) {
      await Process.run('open', ['-R', file.path]);
      return;
    }
    await launchUrl(Uri.directory(file.parent.path));
  } on Object catch (e) {
    logError('Could not reveal ${file.path} in the file manager: $e');
  }
}

class _DownloadProgressDialog extends StatefulWidget {
  const _DownloadProgressDialog({required this.task, required this.run});

  final GitLabDownloadTask task;
  final Future<File> Function() run;

  @override
  State<_DownloadProgressDialog> createState() => _DownloadProgressDialogState();
}

class _DownloadProgressDialogState extends State<_DownloadProgressDialog> {
  @override
  void initState() {
    super.initState();
    widget
        .run()
        .then((file) {
          if (mounted) Navigator.of(context).pop(file);
        })
        .onError((error, stack) {
          if (mounted) Navigator.of(context).pop(error);
        });
  }

  static String _bytes(int value) {
    if (value < 1024) return '$value B';
    if (value < 1024 * 1024) return '${(value / 1024).toStringAsFixed(1)} KB';
    if (value < 1024 * 1024 * 1024) return '${(value / (1024 * 1024)).toStringAsFixed(1)} MB';
    return '${(value / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: const Text('Downloading'),
    content: SizedBox(
      width: 420,
      child: AnimatedBuilder(
        animation: widget.task,
        builder: (context, _) {
          final task = widget.task;
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 12,
            children: [
              Text(task.label, maxLines: 2, overflow: TextOverflow.ellipsis),
              LinearProgressIndicator(value: task.fraction),
              Text(
                task.isIndeterminate ? _bytes(task.received) : '${_bytes(task.received)} of ${_bytes(task.total!)}',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).hintColor),
              ),
            ],
          );
        },
      ),
    ),
    actions: [
      TextButton(
        onPressed: widget.task.cancel,
        child: const Text('Cancel'),
      ),
    ],
  );
}
