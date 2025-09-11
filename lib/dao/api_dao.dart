import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class APIDao {
  static final APIDao _instance = APIDao._internal();

  factory APIDao() => _instance;

  APIDao._internal();

  String? email;
  String? apiKey;
  String? domain;

  String get authHeader => 'Basic ${base64Encode(utf8.encode('$email:$apiKey'))}';

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    email = prefs.getString('jira_email');
    apiKey = prefs.getString('jira_api_key');
    domain = prefs.getString('jira_domain');
  }

  Future<void> updateCredentials({String? email, String? apiKey, String? domain}) async {
    final prefs = await SharedPreferences.getInstance();
    if (email != null) {
      this.email = email;
      await prefs.setString('jira_email', email);
    }
    if (apiKey != null) {
      this.apiKey = apiKey;
      await prefs.setString('jira_api_key', apiKey);
    }
    if (domain != null) {
      this.domain = domain;
      await prefs.setString('jira_domain', domain);
    }
  }

  bool get isReady => email != null && email!.isNotEmpty && apiKey != null && apiKey!.isNotEmpty && domain != null && domain!.isNotEmpty;

  /// General authenticated request helper
  Future<http.Response> request(
    String path, {
    String method = 'GET',
    Map<String, String>? headers,
    dynamic body,
    Map<String, dynamic>? queryParameters,
  }) async {
    if (!isReady) throw Exception('API credentials not set');
    final uri = Uri.https(domain!, path, queryParameters);
    print(uri);
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

  /// Convenience for GET requests, returns decoded JSON
  Future<dynamic> getJson(String path, {Map<String, dynamic>? queryParameters}) async {
    print(queryParameters?['jql']);
    final response = await request(path, queryParameters: queryParameters);
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
  factory IssueData.fromJson(data) => IssueData(
    data['data'],
    lastCacheUpdate: DateTime.parse(data['last_updated']),
    // providerToCache left null
  );

  Map toJson() => {
    'data': data,
    'last_updated': lastCacheUpdate.toIso8601String(),
    'provider_to_cache': providerToCache,
  };

  operator [](dynamic key) => data[key];

  int? get databaseId => this['id'];
  String? get key => this['key'];
  Map? get changelog => this['changelog'];
  Map? get fields => this['fields'];

  Map? get parent => fields?['parent'];
  Map? get statusCategory => fields?['statusCategory'];
  Map? get priority => fields?['priority'];
  List<String>? get labels => fields?['labels'];
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
