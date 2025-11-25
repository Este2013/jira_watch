import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jira_watcher/dao/updates_dao.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> fetchNewUpdateDataAndShowResults(BuildContext context, String currentVersion, {bool alertIfNoNewVersion = true}) async {
  var data = await _fetchNewUpdateData(context, currentVersion: currentVersion, alertIfNoNewVersion: alertIfNoNewVersion);
  if (!data.$1) return;
  var newUpdate = data.$2!;
  showDialog(
    // ignore: use_build_context_synchronously
    context: context,
    builder: (context) => AlertDialog(
      title: Text('A new ${newUpdate.isBeta ? "beta " : ""}update is available!'),
      content: ScrollbarTheme(
        data: ScrollbarThemeData(thumbVisibility: WidgetStatePropertyAll(true)),
        child: SizedBox(
          width: 400,
          height: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 16,
            children: [
              Row(
                children: [
                  Expanded(child: Text('Version ${newUpdate.version}', style: Theme.of(context).textTheme.titleMedium)),
                  Text('(Current: $currentVersion)'),
                ],
              ),
              if (newUpdate.metadata['changelog'] == null)
                Expanded(child: Center(child: Text(newUpdate.metadata['changelog'] ?? 'No changelog :(')))
              else
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsetsGeometry.all(16),
                      child: SingleChildScrollView(child: Text(newUpdate.metadata['changelog'] ?? 'No changelog :(')),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      actions: [
        Row(
          spacing: 8,
          children: [
            TextButton(onPressed: Navigator.of(context).pop, child: Text('Not now')),
            Spacer(),
            TextButton(
              onPressed: () => launchUrl(Uri.parse('https://github.com/Este2013/jira_watch/releases')),
              child: Text('GitHub'),
            ),
            FilledButton.icon(
              onPressed: () => launchUrl(Uri.parse('https://este2013.github.io/jira_watch/${newUpdate.metadata['x64']}')),
              icon: Icon(Symbols.download),
              label: Text('Download'),
            ),
          ],
        ),
      ],
    ),
  );
}

Future<(bool, NewUpdateData?)> _fetchNewUpdateData(BuildContext context, {required String currentVersion, bool alertIfNoNewVersion = true}) async {
  return fetchNewUpdateData(
    context: context,
    currentVersion: currentVersion,
    onEmpty: alertIfNoNewVersion
        ? (context) => showDialog(
            // ignore: use_build_context_synchronously
            context: context,
            builder: (context) => _UpToDateDialog('Server has no latest version data (empty response)'),
          )
        : null,
    onNoData: alertIfNoNewVersion
        ? (context) => showDialog(
            // ignore: use_build_context_synchronously
            context: context,
            builder: (context) => _UpToDateDialog('Server has no latest version data (no entries: empty map)'),
          )
        : null,
    onLatest: alertIfNoNewVersion
        ? (context, mostRecent) => showDialog(
            // ignore: use_build_context_synchronously
            context: context,
            builder: (context) => _UpToDateDialog('You are running the server\'s latest version ($mostRecent)'),
          )
        : null,
    onAheadOfServer: alertIfNoNewVersion
        ? (context, mostRecent) => showDialog(
            context: context,
            builder: (context) => _AheadOfReleaseDialog('The server\'s latest version is $mostRecent. You\'re ahead of us!'),
          )
        : null,
  );
}

class _UpToDateDialog extends StatelessWidget {
  const _UpToDateDialog(this.details);
  final String details;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        spacing: 8,
        children: [
          Icon(Icons.check_circle, color: Colors.green),
          Text('You are up to date'),
        ],
      ),
      content: Text(details),
      actions: [
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: Text('Got it'),
        ),
      ],
    );
  }
}

class _AheadOfReleaseDialog extends StatelessWidget {
  const _AheadOfReleaseDialog(this.details);
  final String details;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        spacing: 8,
        children: [
          Icon(Icons.check_circle, color: Colors.green),
          Text('Now wait a second 🤨'),
        ],
      ),
      content: Text(details),
      actions: [
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: Text('Got it'),
        ),
      ],
    );
  }
}
