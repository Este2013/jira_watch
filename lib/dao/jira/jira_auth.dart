import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jira_platform_api/api.dart' as jira;
import 'package:jira_watcher/utils/encryption_service.dart';
import 'package:loggy/loggy.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The Atlassian site credentials, and the two forms the rest of the app needs
/// them in: a generated-client [jira.Authentication], and a raw header.
///
/// Replaces the credential half of the old `APIDao`. The preference keys are
/// unchanged on purpose — an existing install must keep working without asking
/// anyone to sign in again.
class JiraAuth with GlobalLoggy {
  static final JiraAuth _instance = JiraAuth._internal();

  factory JiraAuth() => _instance;

  JiraAuth._internal();

  static const _emailKey = 'jira_email';
  static const _tokenKey = 'encrypted_jira_api_key';
  static const _domainKey = 'jira_domain';

  String? email;
  String? domain;

  /// The API token, decrypted. Stored encrypted; never written out in the clear.
  String? apiToken;

  /// Notified when the credentials change, so a cached client can be discarded.
  final List<void Function()> _listeners = [];
  void addListener(void Function() listener) => _listeners.add(listener);

  bool get isReady =>
      (email?.isNotEmpty ?? false) && (apiToken?.isNotEmpty ?? false) && (domain?.isNotEmpty ?? false);

  /// `https://your-site.atlassian.net`, for building links into the web UI.
  ///
  /// Returns null rather than a half-formed URL when there is no site yet, so a
  /// caller cannot accidentally produce `https://null/...`.
  String? get siteUrl => (domain?.isNotEmpty ?? false) ? 'https://$domain' : null;

  /// For the places that cannot use a typed client: image and video fetches, and
  /// the document renderer's raw attachment reads.
  String get authHeader => 'Basic ${base64Encode(utf8.encode('$email:$apiToken'))}';

  jira.Authentication get authentication =>
      jira.HttpBasicAuth(username: email ?? '', password: apiToken ?? '');

  Future<void> load() async {
    loggy.info('Loading Jira credentials...');
    final prefs = await SharedPreferences.getInstance();
    email = prefs.getString(_emailKey);
    domain = prefs.getString(_domainKey);

    final encrypted = prefs.getString(_tokenKey);
    apiToken = encrypted == null ? null : await EncryptionService.decrypt(encrypted);

    loggy.info('Jira credentials loaded (ready: $isReady).');
    _notify();
  }

  Future<void> update({String? email, String? apiToken, String? domain}) async {
    loggy.info('Updating Jira credentials...');
    final prefs = await SharedPreferences.getInstance();

    if (email != null) {
      this.email = email;
      await prefs.setString(_emailKey, email);
    }
    if (domain != null) {
      this.domain = domain;
      await prefs.setString(_domainKey, domain);
    }
    if (apiToken != null) {
      this.apiToken = apiToken;
      await prefs.setString(_tokenKey, await EncryptionService.encrypt(apiToken));
    }

    loggy.info('Jira credentials updated.');
    _notify();
  }

  /// Checks credentials that have not been saved yet, for the sign-in screen.
  ///
  /// Deliberately a bare request rather than a generated call: it runs before
  /// there is anything configured to build a client from, and the caller wants
  /// the status code — a 401 means the token is wrong, a 404 means the site is.
  static Future<http.Response> test({
    required String domainOrHost,
    required String email,
    required String apiToken,
  }) {
    final host = normaliseHost(domainOrHost);
    return http.get(
      Uri.https(host, '/rest/api/3/myself'),
      headers: {
        'Authorization': 'Basic ${base64Encode(utf8.encode('$email:$apiToken'))}',
        'Accept': 'application/json',
      },
    );
  }

  /// Accepts what someone is likely to type — `mycompany`,
  /// `mycompany.atlassian.net`, or a full URL — and yields a bare host.
  static String normaliseHost(String input) {
    var host = input.trim().replaceFirst(RegExp(r'^https?://'), '').replaceAll(RegExp(r'/+$'), '');
    if (!host.endsWith('.atlassian.net')) host = '$host.atlassian.net';
    return host;
  }

  void _notify() {
    for (final listener in _listeners) {
      listener();
    }
  }
}
