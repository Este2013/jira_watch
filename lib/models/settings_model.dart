import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsModel {
  static final SettingsModel _instance = SettingsModel._internal();

  factory SettingsModel() => _instance;

  late Future<bool> isReady;
  late ValueNotifier<List<String>?> starredProjects = ValueNotifier(null);

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
        domainController.text = domain;

        // PROJECTS
        starredProjects.value = prefs.getStringList('starred_projects') ?? [];
        starredProjects.addListener(() => prefs.setStringList('starred_projects', starredProjects.value ?? []));

        return true;
      },
      onError: (_) => false,
    );
  }

  // GENERAL
  /// system, light, dark
  final ValueNotifier<String> theme = ValueNotifier('system');

  // CONNECTION

  final TextEditingController emailController = TextEditingController();
  final TextEditingController apiKeyController = TextEditingController();
  final TextEditingController domainController = TextEditingController();

  // FOLDERS
  Future<Directory> tempDir = getTemporaryDirectory().then((v) => Directory(join(v.path, 'jira_watch_cache')));
}
