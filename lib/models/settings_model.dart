import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:package_info_plus/package_info_plus.dart' as pkg;

class SettingsModel {
  static final SettingsModel _instance = SettingsModel._internal();

  factory SettingsModel() => _instance;

  late Future<bool> isReady;

  SettingsModel._internal() {
    isReady = SharedPreferences.getInstance().then(
      (prefs) {
        // GENERAL
        theme.value = prefs.getString('theme') ?? 'system';
        // CONNECTION
        emailController.text = prefs.getString('jira_email') ?? '';
        apiKeyController.text = prefs.getString('jira_api_key') ?? '';
        var domain = prefs.getString('jira_domain') ?? '';

        if (domain.startsWith(
          //https://elgato.atlassian.net/
          'https://',
        )) {
          domain = domain.replaceFirst('https://', '');
        }
        if (domain.split('/').length > 1) {
          domain = domain.split('/').first;
        }
        if (domain.endsWith(
          //https://elgato.atlassian.net/
          '.atlassian.net',
        )) {
          domain = domain.replaceFirst('.atlassian.net', '');
        }
        if (domain.isNotEmpty) domainController.text = domain;

        // GENERAL
        _lastAppVersion = prefs.getString('last_app_version') ?? '0.0.0';

        // PROJECTS
        starredProjects.value = prefs.getStringList('starred_projects') ?? [];
        starredProjects.addListener(() => prefs.setStringList('starred_projects', starredProjects.value ?? []));

        // FILTERS
        filters = ValueNotifier(jsonDecode(prefs.getString('overview_filters') ?? '{}') as Map<String, dynamic>);
        filters.addListener(() => prefs.setString('overview_filters', jsonEncode(filters.value)));
        return true;
      },
      onError: (_) => false,
    );
  }

  // GENERAL
  /// system, light, dark
  final ValueNotifier<String> theme = ValueNotifier('system');
  PackageInfoData appInfo = PackageInfoData();
  // This is only modified once, when the homepage is loaded in ...\lib\ui\home\home.dart.
  late final String _lastAppVersion;
  String get lastAppVersion {
    appInfo.version.then(
      (v) => SharedPreferences.getInstance().then((prefs) => prefs.setString('last_app_version', v)),
    );
    return _lastAppVersion;
  }

  // CONNECTION

  final TextEditingController emailController = TextEditingController();
  final TextEditingController apiKeyController = TextEditingController();
  final TextEditingController domainController = TextEditingController(text: 'elgato');

  // FOLDERS
  Future<Directory> tempDir = getTemporaryDirectory().then((v) => Directory(join(v.path, 'jira_watch_cache')));

  // PROJECTS
  late ValueNotifier<List<String>?> starredProjects = ValueNotifier(null);

  // FILTERS
  late ValueNotifier<Map<String, dynamic>> filters;
}

class PackageInfoData {
  PackageInfoData() {
    _info = pkg.PackageInfo.fromPlatform().then<Map<String, String>>(
      (packageInfo) => {
        'appName': packageInfo.appName,
        'packageName': packageInfo.packageName,
        'version': packageInfo.version,
        'buildNumber': packageInfo.buildNumber,
      },
    );
  }
  late Future<Map<String, String>> _info;

  Future<String> get appName => _info.then((v) => v["appName"]!);
  Future<String> get packageName => _info.then((v) => v["packageName"]!);
  Future<String> get version => _info.then((v) => v["version"]!);
  Future<String> get buildNumber => _info.then((v) => v["buildNumber"]!);
}
