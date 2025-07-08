import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class APIModel {
  static final APIModel _instance = APIModel._internal();

  factory APIModel() => _instance;

  APIModel._internal();

  String? email;
  String? apiKey;
  String? domain;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    email = prefs.getString('jira_email');
    apiKey = prefs.getString('jira_api_key');
    domain = prefs.getString('jira_domain');
  }

  Future<void> update({String? email, String? apiKey, String? domain}) async {
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
    final authHeader = 'Basic ${base64Encode(utf8.encode('$email:$apiKey'))}';
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
    final response = await request(path, queryParameters: queryParameters);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw Exception('Jira API error: ${response.statusCode}');
  }

  /// Fetch starred projects and store locally
  Future<Set<String>> fetchAndStoreStarredProjects() async {
    try {
      final data = await getJson('/rest/api/3/project/starred');
      final result = (data as List).map((p) => p['key'] as String).toSet();
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('starred_projects', result.toList());
      return result;
    } catch (_) {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getStringList('starred_projects')?.toSet() ?? {};
    }
  }
}
