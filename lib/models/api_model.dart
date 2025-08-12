import 'dart:async';
import 'dart:io';

import 'package:jira_watch/models/settings_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

class APIModel {
  static final APIModel _instance = APIModel._internal();

  factory APIModel() => _instance;

  APIModel._internal();

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
        print(uri);
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
}

class IssuesModel {
  static final IssuesModel _instance = IssuesModel._internal();

  factory IssuesModel() => _instance;

  IssuesModel._internal() {}

  /////////////////////////////////////////////////////////////////////

  late Future<List<IssueData>?> issuesCache;

  void updateCache(List<IssueData> newData) async {
    var cache = await issuesCache;
    if (cache == null) {
      _storeCache(newData);
      return;
    }
    var newCache = <IssueData>[];
    for (var i in newData) {
      IssueData? overriden = cache.where((element) => element['key'] == i['key']).firstOrNull;
      if (overriden == null) {
        newCache.add(i);
        continue;
      }
      newCache.add(
        IssueData(_mergeMaps(overriden.data, i.data), lastCacheUpdate: i.lastCacheUpdate),
      );
    }
    _storeCache(newData);
  }

  void _storeCache(List<IssueData>? newCache) {
    if (newCache == null) {
      SettingsModel().tempDir.then((tempDir) async {
        File(path.join(tempDir.path, 'issues_cache.json')).delete();
      });
      return;
    }

    SettingsModel().tempDir.then((tempDir) async {
      var cacheFile = File(path.join(tempDir.path, 'issues_cache.json'));
      if (!await cacheFile.exists()) {
        cacheFile.create(recursive: true);
      }
      cacheFile.writeAsString(
        jsonEncode({
          'cacheData': newCache.map((e) => e.toJson()),
          'last_updated': DateTime.now().toIso8601String(),
        }),
      );
    });
  }

  Future<List<IssueData>?> loadCache() => SettingsModel().tempDir.then((tempDir) async {
    var cacheFile = File(path.join(tempDir.path, 'issues_cache.json'));
    if (await cacheFile.exists()) {
      return cacheFile.readAsString().then(
        (value) => jsonDecode(value)['cacheData'].map((e) => IssueData.fromJson(e)).toList(),
      );
    }
    return null;
  });

  /////////////////////////////////////////////////////////////////////

  Future<List<IssueData>> jqlSearch(String jql, {int maxResults = 100, String? expand}) async {
    late final dynamic data;
    data = await APIModel().getJson(
      '/rest/api/3/search',
      queryParameters: {
        'jql': jql,
        'maxResults': '$maxResults',
        if (expand != null) 'expand': expand, //'changelog',
      },
    );
    var time = DateTime.now();
    print(data);
    return ((data['issues'] as List).map((d) => IssueData(d, lastCacheUpdate: time))).toList().cast();
  }

  Stream<FutureOr<(Iterable<IssueData>, int)>> getLastUpdatedIssuesPageCached({
    required int pageSize,
    required Stream<int> pageIndexStream,
  }) async* {
    Map<int, Iterable<IssueData>> cache = {};
    int resultNb = -1;

    // for each requested index, decide cache vs. fetch
    yield* pageIndexStream.asyncMap<(Iterable<IssueData>, int)>((pageIndex) async {
      if (cache.containsKey(pageIndex)) {
        // already loaded → return cached immediately
        return (cache[pageIndex]!, resultNb);
      }
      // first time → fetch from network

      final res = (await fetchLastUpdatedIssuesPage(
        pageSize: pageSize,
        pageIndex: pageIndex,
      ));
      final page = res.$1.toList();
      if (resultNb != res.$2) {
        resultNb = res.$2;
        cache = {};
      }

      cache[pageIndex] = page;
      return (page, resultNb);
    });
  }

  Future<(Iterable<IssueData>, int)> fetchLastUpdatedIssuesPage({required int pageSize, int pageIndex = 0, DateTime? after}) => fetchLastUpdatedIssues(
    maxResults: pageSize,
    startAt: pageIndex * pageSize,
    after: after,
  );

  Future<(Iterable<IssueData>, int)> fetchLastUpdatedIssues({int maxResults = 100, int startAt = 0, DateTime? after}) async {
    // get projects of interest
    await APIModel().load();
    final prefs = await SharedPreferences.getInstance();
    var starredProjects = prefs.getStringList('starred_projects')?.toSet() ?? {};

    // prepare jql query
    String projectFilter = '';
    if (starredProjects.isNotEmpty) {
      final keys = starredProjects.map((k) => k.trim()).where((k) => k.isNotEmpty).join(',');
      projectFilter = 'project in ($keys) ';
    }

    final jql = '$projectFilter ${after != null ? "AND updated >= ${after.toIso8601String()}" : ""} ORDER BY updated DESC';

    // print(jql);

    return APIModel()
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

  Stream<IssueData> getLastUpdatedIssues({acceptCache = true}) async* {
    Future<(IssueData, DateTime?)?>? mostRecentlyUpdatedFromCache;
    if (acceptCache) {
      // Filter the cache by only what was added by this method specifically.

      mostRecentlyUpdatedFromCache = issuesCache.then((cache) async {
        if (cache == null || cache.isEmpty) {
          return null;
        }
        return cache
            .map(
              (e) => (e, DateTime.tryParse(e['fields']['updated'])),
            )
            .where((element) => element.$2 != null)
            .reduce((value, element) {
              if (value.$2!.isBefore(element.$2!)) {
                return element;
              }
              return value;
            });
      });
    }

    // get projects of interest
    await APIModel().load();
    final prefs = await SharedPreferences.getInstance();
    var starredProjects = prefs.getStringList('starred_projects')?.toSet() ?? {};

    // prepare jql query
    DateTime? after = mostRecentlyUpdatedFromCache == null ? null : (await mostRecentlyUpdatedFromCache)?.$2;
    String projectFilter = '';
    if (starredProjects.isNotEmpty) {
      final keys = starredProjects.map((k) => k.trim()).where((k) => k.isNotEmpty).join(',');
      projectFilter = 'project in ($keys) ';
    }

    final jql = '$projectFilter ${after != null ? "AND updated >= ${after.toIso8601String()}" : ""} ORDER BY updated DESC';
    print(jql);
    // fetch data

    final data = await APIModel().getJson(
      '/rest/api/3/search',
      queryParameters: {
        'jql': jql,
        'maxResults': '100',
        'startAt': '0',
        'expand': 'changelog',
      },
    );

    var now = DateTime.now();
    final issues = (data['issues'] as List).map((e) => IssueData(data, lastCacheUpdate: now));
    yield* Stream.fromIterable(issues);
  }
}

/// Deep-merges [src] into [dest], modifying and returning [dest].
Map<String, dynamic> _mergeMaps(
  Map<String, dynamic> dest,
  Map<String, dynamic> src,
) {
  src.forEach((key, srcValue) {
    final destValue = dest[key];
    if (srcValue is Map<String, dynamic> && destValue is Map<String, dynamic>) {
      // both sides are maps → recurse
      _mergeMaps(destValue, srcValue);
    } else {
      // otherwise overwrite (or insert new)
      dest[key] = srcValue;
    }
  });
  return dest;
}
