import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:jira_watcher/utils/encryption_service.dart';
import 'package:loggy/loggy.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class APIDao with UiLoggy {
  static final APIDao _instance = APIDao._internal();

  factory APIDao() => _instance;

  APIDao._internal();

  String? email;
  String? apiKey;
  String? domain;

  String get authHeader => 'Basic ${base64Encode(utf8.encode('$email:$apiKey'))}';

  Future<void> load() async {
    loggy.info('Loading APIDao...');
    final prefs = await SharedPreferences.getInstance();
    email = prefs.getString('jira_email');
    var encApiAKey = prefs.getString('encrypted_jira_api_key');
    if (encApiAKey != null) apiKey = await EncryptionService.decrypt(encApiAKey);
    domain = prefs.getString('jira_domain');
    loggy.info('APIDao Loaded successfully.');
  }

  Future<void> updateCredentials({String? email, String? apiKey, String? domain}) async {
    final prefs = await SharedPreferences.getInstance();
    if (email != null) {
      this.email = email;
      await prefs.setString('jira_email', email);
    }
    if (apiKey != null) {
      this.apiKey = apiKey;
      await prefs.setString('encrypted_jira_api_key', await EncryptionService.encrypt(apiKey));
    }
    if (domain != null) {
      this.domain = domain;
      await prefs.setString('jira_domain', domain);
    }
  }

  bool get isReady => email != null && email!.isNotEmpty && apiKey != null && apiKey!.isNotEmpty && domain != null && domain!.isNotEmpty;

  Future<http.Response> testJiraAuth({
    required String domainOrHost, // e.g. "mycompany" or "mycompany.atlassian.net"
    required String email,
    required String apiToken, // from id.atlassian.com -> Security -> API tokens
  }) async {
    // Normalize host
    var host = domainOrHost.trim();
    host = host.replaceFirst(RegExp(r'^https?://'), '');
    host = host.replaceAll(RegExp(r'/$'), '');
    if (!host.endsWith('.atlassian.net')) host = '$host.atlassian.net';

    final uri = Uri.https(host, '/rest/api/3/myself');

    final basicAuth = 'Basic ${base64Encode(utf8.encode('$email:$apiToken'))}';

    return http.get(
      uri,
      headers: {
        'Authorization': basicAuth,
        'Accept': 'application/json',
      },
    );
  }

  Future<http.Response> myself() async {
    // Normalize host
    var host = domain?.trim();
    if (host == null) {
      throw Exception('host cannot be null in ApiDao.myself()');
    }
    host = host.replaceFirst(RegExp(r'^https?://'), '');
    host = host.replaceAll(RegExp(r'/$'), '');
    if (!host.endsWith('.atlassian.net')) host = '$host.atlassian.net';

    final uri = Uri.https(host, '/rest/api/3/myself');

    final basicAuth = 'Basic ${base64Encode(utf8.encode('$email:$apiKey'))}';

    return http.get(
      uri,
      headers: {
        'Authorization': basicAuth,
        'Accept': 'application/json',
      },
    );
  }

  /// General authenticated request helper
  Future<http.Response> directRequest(
    Uri uri, {
    String method = 'GET',
    Map<String, String>? headers,
    dynamic body,
    Map<String, dynamic>? queryParameters,
  }) async {
    if (!isReady) throw Exception('API credentials not set');

    loggy.debug("Making an api request at $uri");

    final allHeaders = {
      'Authorization': authHeader,
      'Accept': 'application/json',
      if (headers != null) ...headers,
    };

    switch (method.toUpperCase()) {
      case 'POST':
        return await http.post(uri, headers: allHeaders, body: body);
      case 'PUT':
        return await http.put(uri, headers: allHeaders, body: body);
      case 'DELETE':
        return await http.delete(uri, headers: allHeaders, body: body);
      default:
        return await http.get(uri, headers: allHeaders);
    }
  }

  /// General authenticated request helper
  /// endpoint start with rest/api/...
  Future<http.Response> requestAtEndpoint(
    String endpoint, {
    String method = 'GET',
    Map<String, String>? headers,
    dynamic body,
    Map<String, dynamic>? queryParameters,
  }) async {
    final uri = Uri.https(domain!, endpoint, queryParameters);
    return directRequest(uri, body: body, headers: headers, method: method, queryParameters: queryParameters);
  }

  /// Convenience for GET requests, returns decoded JSON
  Future<dynamic> getJson(String path, {Map<String, dynamic>? queryParameters}) async {
    debugPrint(queryParameters?['jql']);
    final response = await requestAtEndpoint(path, queryParameters: queryParameters);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw Exception('Jira API error: ${response.statusCode}');
  }

  ///////// PROJECTS /////////
}

class IssueData {
  dynamic data;
  DateTime lastCacheUpdate;

  /// A distinct way to know which method added this to the cache / null if read from cache or irrelevant.
  String? providerToCache;

  IssueData(this.data, {required this.lastCacheUpdate});
  factory IssueData.fromJson(Map data) => IssueData(
    data['data'],
    lastCacheUpdate: DateTime.parse(data['last_updated']),
    // providerToCache left null
  );

  Map toJson() => {
    'data': data,
    'last_updated': lastCacheUpdate.toIso8601String(),
    'provider_to_cache': providerToCache,
  };

  dynamic operator [](dynamic key) => data[key];

  int? get databaseId => this['id'];
  String? get key => this['key'];
  Map? get changelog => this['changelog'];
  Map? get fields => this['fields'];

  Map? get parent => fields?['parent'];
  Map? get statusCategory => fields?['statusCategory'];
  Map? get priority => fields?['priority'];
  List<String>? get labels => fields?['labels'];
  Map? get commentsData => fields?['comment'];
}

class IssuesDAO {
  static final IssuesDAO _instance = IssuesDAO._internal();

  factory IssuesDAO() => _instance;

  IssuesDAO._internal();

  /////////////////////////////////////////////////////////////////////

  Future<List<IssueData>> jqlSearch(String jql, {int maxResults = 0, String? expand}) async {
    if (kDebugMode) print(jql);
    late final dynamic data;
    data = await APIDao().getJson(
      '/rest/api/3/search/jql',
      queryParameters: {
        'jql': jql,
        'maxResults': '$maxResults',
        if (expand != null) 'expand': expand, //'changelog',
      },
    );
    var time = DateTime.now();
    return ((data['issues'] as List).map((d) => IssueData(d, lastCacheUpdate: time))).toList().cast();
  }
}
