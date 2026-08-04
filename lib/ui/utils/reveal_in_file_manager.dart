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
