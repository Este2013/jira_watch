import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        domainController.text = prefs.getString('jira_domain') ?? '';
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
}
