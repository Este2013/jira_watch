import 'dart:async';
import 'dart:io';

import 'package:jira_watch/models/settings_model.dart';
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

  ///////// PROJECTS /////////

  List? _projectsCache;

  /// Fetch projects from Jira API, caching results
  /// https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-projects/#api-rest-api-3-project-get
  ///
  /// Each project is a map as follows: s
  /// ```json{
  ///  "avatarUrls": {
  ///    "16x16": "https://your-domain.atlassian.net/secure/projectavatar?size=xsmall&pid=10000",
  ///    "24x24": "https://your-domain.atlassian.net/secure/projectavatar?size=small&pid=10000",
  ///    "32x32": "https://your-domain.atlassian.net/secure/projectavatar?size=medium&pid=10000",
  ///    "48x48": "https://your-domain.atlassian.net/secure/projectavatar?size=large&pid=10000"
  ///  },
  ///  "id": "10000",
  ///  "insight": {
  ///    "lastIssueUpdateTime": 1619069825000,
  ///    "totalIssueCount": 100
  ///  },
  ///  "key": "EX",
  ///  "name": "Example",
  ///  "projectCategory": {
  ///    "description": "First Project Category",
  ///    "id": "10000",
  ///    "name": "FIRST",
  ///    "self": "https://your-domain.atlassian.net/rest/api/3/projectCategory/10000"
  ///  },
  ///  "self": "https://your-domain.atlassian.net/rest/api/3/project/EX",
  ///  "simplified": false,
  ///  "style": "CLASSIC"
  /// ```
  Future<List> fetchProjects({bool refresh = false}) async {
    if (_projectsCache != null && !refresh) {
      return _projectsCache!;
    }

    final data = await getJson(
      '/rest/api/3/project/',
      // queryParameters: {
      //   'properties': ['id', 'avatarUrls', 'key', 'favourite', 'isPrivate', 'expand', 'issueTypes', 'name', 'url', 'style'],
      // },
    );
    final result = (data as List);
    _projectsCache = result;
    return result;
  }

  /// Use expand to include additional information in the response. This parameter accepts a comma-separated list. Note that the project description, issue types, and project lead are included in all responses by default. Expand options include:
  ///  - description The project description.
  ///  - issueTypes The issue types associated with the project.
  ///  - lead The project lead.
  ///  - projectKeys All project keys associated with the project.
  ///  - issueTypeHierarchy The project issue type hierarchy.
  ///
  /// Or use properties for a select set of returned properties.
  Future fetchSingleProject(String code, {List<String>? expand}) async {
    final data = await getJson(
      '/rest/api/3/project/$code',
      // queryParameters: {
      //   'properties': ['id', 'avatarUrls', 'key', 'favourite', 'isPrivate', 'expand', 'issueTypes', 'name', 'url', 'style'],
      // },
    );
    return data;
  }

  /// Fetch starred projects and store locally
  Future<List> starredProjects({bool refresh = false}) async {
    final projects = await fetchProjects(refresh: refresh);
    return projects.where((p) => p['favourite'] == true).toList();
  }
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

  Future<List<IssueData>> jqlSearch(String jql, {int maxResults = 100, String? expand}) async {
    late final dynamic data;
    data = await APIDao().getJson(
      '/rest/api/3/search',
      queryParameters: {
        'jql': jql,
        'maxResults': '$maxResults',
        if (expand != null) 'expand': expand, //'changelog',
      },
    );
    var time = DateTime.now();
    return ((data['issues'] as List).map((d) => IssueData(d, lastCacheUpdate: time))).toList().cast();
  }

  Future<(Iterable<IssueData>, int)> fetchLastUpdatedIssuesPage({
    required int pageSize,
    int pageIndex = 0,
    DateTime? after,
    List<String>? filterByProjectCodes,
  }) => fetchLastUpdatedIssues(
    maxResults: pageSize,
    startAt: pageIndex * pageSize,
    after: after,
    filterByProjectCodes: filterByProjectCodes,
  );

  Future<(Iterable<IssueData>, int)> fetchLastUpdatedIssues({int maxResults = 100, int startAt = 0, DateTime? after, List<String>? filterByProjectCodes}) async {
    // get projects of interest
    await APIDao().load();
    var starredProjects = SettingsModel().starredProjects.value?.toSet() ?? {};

    // prepare jql query
    String projectFilter = '';
    if (starredProjects.isNotEmpty) {
      final keys = filterByProjectCodes?.join(', ') ?? starredProjects.map((k) => k.trim()).where((k) => k.isNotEmpty).join(',');
      projectFilter = 'project in ($keys) ';
    }

    final jql = '$projectFilter ${after != null ? "AND updated >= ${after.toIso8601String()}" : ""} ORDER BY updated DESC';

    return APIDao()
        .getJson(
          '/rest/api/3/search',
          queryParameters: {
            'jql': jql,
            'maxResults': '$maxResults',
            'startAt': '$startAt',
            'expand': 'changelog',
          },
        )
        .then(
          (data) {
            var now = DateTime.now();
            final issues = (data['issues'] as List).map((e) => IssueData(e, lastCacheUpdate: now));

            // print(data.keys);
            return (issues, data['total'] as int);
          },
        );
  }
}
