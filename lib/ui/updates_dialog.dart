import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jira_watcher/dao/updates_dao.dart';
import 'package:jira_watcher/dao/windows_self_update_dao.dart';
import 'package:jira_watcher/models/app_update_model.dart';
import 'package:jira_watcher/ui/utils/byte_format.dart';
import 'package:loggy/loggy.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:window_manager/window_manager.dart';

Future<void> fetchNewUpdateDataAndShowResults(BuildContext context, String currentVersion, {bool alertIfNoNewVersion = true}) async {
  var data = await _fetchNewUpdateData(context, currentVersion: currentVersion, alertIfNoNewVersion: alertIfNoNewVersion);
  if (!data.$1) return;
  var newUpdate = data.$2!;
  if (!context.mounted) return;
  // Awaited so an in-flight download has an owner: previously this returned
  // immediately, leaving nothing holding the dialog's work.
  await showDialog(
    context: context,
    // A staged update or a launched helper should not be dismissible by a stray
    // Escape; the dialog re-allows closing when it is safe.
    barrierDismissible: false,
    builder: (context) => NewUpdateAvailableDialog(update: newUpdate, currentVersion: currentVersion),
  );
}

/// Offers a new release, and installs it if this platform can.
class NewUpdateAvailableDialog extends StatefulWidget {
  const NewUpdateAvailableDialog({
    super.key,
    required this.update,
    required this.currentVersion,
    this.preflightOverride,
  });

  final NewUpdateData update;
  final String currentVersion;

  /// See [AppUpdateController.preflightOverride].
  @visibleForTesting
  final UpdatePreflight? preflightOverride;

  @override
  State<NewUpdateAvailableDialog> createState() => _NewUpdateAvailableDialogState();
}

class _NewUpdateAvailableDialogState extends State<NewUpdateAvailableDialog> with UiLoggy {
  late final AppUpdateController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AppUpdateController(
      update: widget.update,
      currentVersion: widget.currentVersion,
      preflightOverride: widget.preflightOverride,
    );
    _controller.runPreflight();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _install() async {
    await _controller.stage();
    if (!mounted) return;
    if (_controller.phase == UpdatePhase.readyToRestart) await _restart();
  }

  /// Launches the helper and closes the app; the helper is waiting for this
  /// process to release its executable before it touches anything.
  Future<void> _restart() async {
    if (!await _controller.applyAndRestart()) return;
    loggy.info('Handing over to the update helper and exiting');

    // Closing the window is a courtesy so it disappears promptly; exiting is the
    // part that matters, since the helper is blocked until this process releases
    // its executable. destroy() has been observed to hang, so it gets a short
    // budget and then we leave regardless.
    try {
      await windowManager.destroy().timeout(const Duration(seconds: 2));
    } on Object catch (e) {
      loggy.warning('Could not close the window cleanly, exiting anyway: $e');
    }
    // Lets the log sink flush before the process goes away.
    await Future.delayed(const Duration(milliseconds: 300));
    exit(0);
  }

  void _openManualDownload() {
    final asset = Platform.isWindows ? widget.update.windowsAssetUri : widget.update.macAssetUri;
    if (asset != null) launchUrl(asset);
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: _controller,
    builder: (context, _) => PopScope(
      canPop: !_controller.isBusy,
      child: AlertDialog(
        title: Text('A new ${widget.update.isBeta ? "beta " : ""}update is available!'),
        content: ScrollbarTheme(
          data: ScrollbarThemeData(thumbVisibility: WidgetStatePropertyAll(true)),
          child: SizedBox(
            // Wide enough for four action buttons on one row; the dialog sizes
            // itself to its content, so this is what gives the actions their room.
            width: 520,
            height: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 16,
              children: [
                Row(
                  children: [
                    Expanded(child: Text('Version ${widget.update.version}', style: Theme.of(context).textTheme.titleMedium)),
                    Text('(Current: ${widget.currentVersion})'),
                  ],
                ),
                if (widget.update.changelog == null)
                  Expanded(child: Center(child: Text('No changelog :(')))
                else
                  Expanded(
                    child: Card(
                      child: Padding(
                        padding: EdgeInsetsGeometry.all(16),
                        child: SingleChildScrollView(child: Text(widget.update.changelog!)),
                      ),
                    ),
                  ),
                _status(),
              ],
            ),
          ),
        ),
        actions: [_actions()],
      ),
    ),
  );

  /// The area under the changelog: progress, a blocker explanation, or an error.
  Widget _status() {
    final phase = _controller.phase;

    if (phase == UpdatePhase.failed) {
      return Card(
        color: Theme.of(context).colorScheme.errorContainer,
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            spacing: 8,
            children: [
              Icon(Symbols.error, fill: 1, color: Theme.of(context).colorScheme.onErrorContainer),
              Expanded(
                child: SelectableText(
                  '${_controller.error}',
                  style: TextStyle(color: Theme.of(context).colorScheme.onErrorContainer),
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (phase == UpdatePhase.readyToRestart) {
      return Card(
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            spacing: 8,
            children: [
              const Icon(Symbols.check_circle, fill: 1, color: Colors.green),
              Expanded(child: Text('Version ${widget.update.version} is ready. Jira Watcher will close and reopen — it takes a few seconds.')),
            ],
          ),
        ),
      );
    }

    if (_controller.isBusy) {
      final task = _controller.task;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 6,
        children: [
          Text(switch (phase) {
            UpdatePhase.downloading => 'Downloading version ${widget.update.version}...',
            UpdatePhase.extracting => 'Unpacking...',
            UpdatePhase.verifying => 'Checking the download...',
            _ => 'Installing...',
          }),
          if (phase == UpdatePhase.downloading && task != null)
            AnimatedBuilder(
              animation: task,
              builder: (context, _) => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 4,
                children: [
                  LinearProgressIndicator(value: task.fraction),
                  Text(
                    task.isIndeterminate ? formatBytes(task.received) : '${formatBytes(task.received)} of ${formatBytes(task.total)}',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).hintColor),
                  ),
                ],
              ),
            )
          else
            const LinearProgressIndicator(),
        ],
      );
    }

    // Idle, but installing is unavailable — say why rather than leaving a dead button.
    final preflight = _controller.preflight;
    if (phase == UpdatePhase.idle && preflight != null && !preflight.canAutoInstall && !preflight.isUnsupportedPlatform) {
      return Text(
        preflight.summary,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).hintColor),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _actions() {
    final phase = _controller.phase;

    if (_controller.isBusy) {
      return Row(
        children: [
          const Spacer(),
          TextButton(
            // Safe at every busy phase before the helper starts: nothing outside
            // the temp folder has been touched.
            onPressed: phase == UpdatePhase.downloading ? _controller.cancel : null,
            child: const Text('Cancel'),
          ),
        ],
      );
    }

    if (phase == UpdatePhase.readyToRestart) {
      return Row(
        spacing: 8,
        children: [
          TextButton(onPressed: Navigator.of(context).pop, child: const Text('Later')),
          const Spacer(),
          FilledButton.icon(
            onPressed: _restart,
            icon: const Icon(Symbols.restart_alt),
            label: const Text('Restart & install'),
          ),
        ],
      );
    }

    return Row(
      spacing: 8,
      children: [
        TextButton(onPressed: Navigator.of(context).pop, child: Text(phase == UpdatePhase.failed ? 'Close' : 'Not now')),
        const Spacer(),
        TextButton(
          onPressed: () => launchUrl(Uri.parse('https://github.com/Este2013/jira_watch/releases')),
          child: const Text('GitHub'),
        ),
        // No icon: it sits next to the primary action's icon, where a second one
        // reads as competing rather than helpful — and it costs width.
        TextButton(
          onPressed: _openManualDownload,
          child: const Text('Download'),
        ),
        if (_controller.showInstallButton)
          Tooltip(
            message: _controller.canInstall ? 'Download and install, then reopen' : (_controller.preflight?.summary ?? ''),
            child: FilledButton.icon(
              onPressed: (_controller.canInstall && phase == UpdatePhase.idle) ? _install : null,
              icon: const Icon(Symbols.system_update),
              label: Text(phase == UpdatePhase.failed ? 'Try again' : 'Install update'),
            ),
          ),
      ],
    );
  }
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
          Icon(Symbols.check_circle, color: Colors.green),
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
          Icon(Symbols.check_circle, color: Colors.green),
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
