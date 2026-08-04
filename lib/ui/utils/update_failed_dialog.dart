import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jira_watcher/ui/utils/reveal_in_file_manager.dart';
import 'package:material_symbols_icons/symbols.dart';

/// Explains an update that did not complete.
///
/// Shown once, on the launch after the attempt. Without it a rollback is silent:
/// the app just reopens on the old version and the user is left guessing.
class UpdateFailedDialog extends StatelessWidget {
  const UpdateFailedDialog({super.key, required this.report});

  /// The raw `update_failed.json` the helper wrote.
  final String report;

  Map<String, dynamic> get _fields {
    try {
      final decoded = jsonDecode(report);
      return decoded is Map<String, dynamic> ? decoded : {};
    } on FormatException {
      return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    final fields = _fields;
    final version = fields['version'] as String?;
    final reason = fields['reason'] as String? ?? report;
    final logPath = fields['log'] as String?;
    final recovery = fields['recovery'] as String?;

    return AlertDialog(
      icon: Icon(Symbols.update_disabled, fill: 1, color: Theme.of(context).colorScheme.error),
      title: Text(version == null ? "The update didn't finish" : "The update to $version didn't finish"),
      constraints: const BoxConstraints(maxWidth: 560),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          Text(reason),
          if (recovery != null)
            Card(
              color: Theme.of(context).colorScheme.errorContainer,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: DefaultTextStyle(
                  style: TextStyle(color: Theme.of(context).colorScheme.onErrorContainer),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 6,
                    children: [
                      const Text(
                        'Your previous version is running from a backup folder. '
                        'Copy its contents back over your install folder when convenient.',
                      ),
                      SelectableText(recovery, style: const TextStyle(fontFamily: 'RobotoMono', fontSize: 11)),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
      actions: [
        if (logPath != null)
          TextButton.icon(
            icon: const Icon(Symbols.menu_book),
            label: const Text('Show log'),
            onPressed: () => revealInFileManager(File(logPath)),
          ),
        TextButton(onPressed: Navigator.of(context).pop, child: const Text('Got it')),
      ],
    );
  }
}
