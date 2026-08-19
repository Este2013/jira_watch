import 'dart:io';

import 'package:loggy/loggy.dart';
import 'package:url_launcher/url_launcher.dart';

/// Opens the OS file manager with [file] selected.
///
/// Best effort by design: it is always an "also show me this" affordance, never
/// the only way to reach the file, so a failure is logged rather than surfaced.
Future<void> revealInFileManager(File file) async {
  try {
    if (Platform.isWindows) {
      // The comma form has to be a single argument, and explorer exits non-zero
      // even on success, so its exit code is deliberately ignored.
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

/// Opens [file] with whatever the OS has registered as its default handler.
///
/// Routed through the platform's own "open" verb rather than
/// `launchUrl(Uri.file(...))`: url_launcher's desktop implementations treat a
/// bare file path as something to hand to a browser-style opener, which is
/// not guaranteed to be the same thing as "run this file the way Explorer's
/// double-click would".
Future<void> openInDefaultApp(File file) async {
  try {
    if (Platform.isWindows) {
      // 'start' is a cmd builtin, not its own executable, and needs an empty
      // title argument — otherwise a path containing spaces is parsed as the
      // title instead of the target.
      await Process.run('cmd', ['/c', 'start', '', file.path], runInShell: true);
      return;
    }
    if (Platform.isMacOS) {
      await Process.run('open', [file.path]);
      return;
    }
    await Process.run('xdg-open', [file.path]);
  } on Object catch (e) {
    logError('Could not open ${file.path}: $e');
  }
}
