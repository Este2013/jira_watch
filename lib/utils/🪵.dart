// ignore_for_file: file_names

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:loggy/loggy.dart';
import 'package:path/path.dart';

class FileLogPrinter extends LoggyPrinter {
  IOSink? _sink;
  late final Future<void> _initFuture;

  int maxLoggerNameLength = 30;

  static Future<File> logFile =SettingsModel().settingsFolder.then((value) => File(join(value.path, 'app_log.txt').replaceAll(RegExp(r'^[\/\\]?'), '')));

  FileLogPrinter() {
    _initFuture = _init();
  }

  Future<void> _init() async {
var file = (await logFile);
    if (await file.exists()) {
      await file.delete();
    }
    await file.create(recursive: true);

    // Append mode
    _sink = file.openWrite(mode: FileMode.append);

    debugPrint('📄 Log file initialized at: ${file.path}');
  }

  @override
  void onLog(LogRecord record) async {
    await _initFuture;

    final time = record.time.toIso8601String();
    final level = record.level.name.padRight(7);
    if (record.loggerName.length > maxLoggerNameLength) maxLoggerNameLength = record.loggerName.length;

    final message = createMsgFromRecord(
      time,
      level,
      record,
    );

    _sink?.writeln(message);
    // _sink?.flush();

    // Optional: also print to console
    if (kDebugMode) {
      debugPrint(message);
    }
  }

  String createMsgFromRecord(String time, String level, LogRecord record) => createMsg(time, level, record.loggerName, record.message);
  String createMsg(String time, String level, String loggerName, String message) => '$time $level : [${loggerName.padRight(maxLoggerNameLength)}] ${message.replaceAll('\n', '\n    | ')}';

  Future<void> close() async {
    await _sink?.flush();
    await _sink?.close();
  }
}
