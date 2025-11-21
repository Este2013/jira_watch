import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jira_watcher/utils/encryption_service.dart';
import 'package:loggy/loggy.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:package_info_plus/package_info_plus.dart' as pkg;

class SettingsModel with GlobalLoggy {
  static final SettingsModel _instance = SettingsModel._internal();
  Future<Uri> get settingsFolderUri async => Uri.directory(await _settingsFolderPath);
 Future <Directory> get settingsFolder async=> Directory(await _settingsFolderPath);
  
  Future<String>get _settingsFolderPath  async {
 if(Platform.isMacOS){
      return join( (await getApplicationSupportDirectory()).path, "com.este", "jira_watcher");
    }
    return join(Platform.environment['APPDATA']!, "com.este", "jira_watcher");
  }

  factory SettingsModel() => _instance;

  late Future<bool> isReady;

  SettingsModel._internal() {
    isReady = SharedPreferences.getInstance().then(
      (prefs) async {
        // GENERAL
        theme.value = prefs.getString('theme') ?? 'system';
        theme.addListener(() => prefs.setString('theme', theme.value));
        _lastAppVersion = prefs.getString('last_app_version') ?? '0.0.0';
        // GENERAL - Updates view settings
        markAsReadOnOpen.value = prefs.getBool('mark_as_read_on_open') ?? true;
        markAsReadOnOpen.addListener(() => prefs.setBool('mark_as_read_on_open', markAsReadOnOpen.value));

        useCompactJiraWorkItemDisplay.value = prefs.getString('use_compact_ticket_display') ?? 'When issue was read';
        useCompactJiraWorkItemDisplay.addListener(() => prefs.setString('use_compact_ticket_display', useCompactJiraWorkItemDisplay.value));

        // CONNECTION
        emailController.text = prefs.getString('jira_email') ?? '';

        var oldAPIKeyStore = prefs.getString('jira_api_key');
        var encryptedAPIKeyStore = prefs.getString('encrypted_jira_api_key');
        if (oldAPIKeyStore != null) {
          prefs.remove('jira_api_key');
          encryptedAPIKeyStore ??= await EncryptionService.encrypt(oldAPIKeyStore);
          prefs.setString('encrypted_jira_api_key', encryptedAPIKeyStore);
        }

        apiKeyController.text = encryptedAPIKeyStore != null ? await EncryptionService.decrypt(encryptedAPIKeyStore) : '';

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

        // PROJECTS
        starredProjects.value = prefs.getStringList('starred_projects') ?? [];
        starredProjects.addListener(() => prefs.setStringList('starred_projects', starredProjects.value ?? []));

        // OVERVIEW FILTERS
        var filterInit = prefs.get('overview_filters');
        if (filterInit == null) {
          filters = ValueNotifier({});
        } else if (filterInit is String) {
          filters = ValueNotifier(jsonDecode(filterInit) as Map<String, dynamic>);
        } else if (filterInit is Map<String, dynamic>) {
          filters = ValueNotifier(filterInit.cast());
        } else {
          loggy.error('preferences\' overview_filters have a wrong type: ${filterInit.runtimeType}. Resetting default settings.');
          filters = ValueNotifier({});
        }
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

  // GENERAL - Updates view settings
  final ValueNotifier<bool> markAsReadOnOpen = ValueNotifier(true);

  final ValueNotifier<String> useCompactJiraWorkItemDisplay = ValueNotifier('When issue was read');

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
    WidgetsFlutterBinding.ensureInitialized();
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
