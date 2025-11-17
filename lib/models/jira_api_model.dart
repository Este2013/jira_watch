import 'dart:async';

import 'package:http/http.dart';
import 'package:jira_watcher/dao/api_dao.dart';
import 'package:jira_watcher/models/settings_model.dart';

/// Specialized in fetching data from the interwebs
class APIModel {
  static final APIModel _instance = APIModel._internal();

  factory APIModel() => _instance;
  APIModel._internal() {
    dao = APIDao();
  }

  late APIDao dao;

  Future<Response>? _cacheMyself;
  Future<Response> myself({bool allowCache = true}) async {
    if (allowCache && _cacheMyself != null) {
      return _cacheMyself!;
    }
    _cacheMyself = dao.myself();
    return _cacheMyself!;
  }

  // PROJECTS /////////////////////////////////////////////////////////////////////

  Future fetchProjects() async => dao.getJson(
    '/rest/api/3/project/',
    // queryParameters: {
    //   'properties': ['id', 'avatarUrls', 'key', 'favourite', 'isPrivate', 'expand', 'issueTypes', 'name', 'url', 'style'],
    // },
  );

  /// Use expand to include additional information in the response. This parameter accepts a comma-separated list. Note that the project description, issue types, and project lead are included in all responses by default. Expand options include:
  ///  - description The project description.
  ///  - issueTypes The issue types associated with the project.
  ///  - lead The project lead.
  ///  - projectKeys All project keys associated with the project.
  ///  - issueTypeHierarchy The project issue type hierarchy.
  ///
  /// Or use properties for a select set of returned properties.
  Future fetchSingleProject(String code, {List<String>? expand}) async {
    final data = await dao.getJson(
      '/rest/api/3/project/$code',
      queryParameters: {
        if (expand != null && expand.isNotEmpty) 'expand': expand.join(','),
        // 'properties': ['id', 'avatarUrls', 'key', 'favourite', 'isPrivate', 'expand', 'issueTypes', 'name', 'url', 'style'],
      },
    );
    return data;
  }

  // ISSUES /////////////////////////////////////////////////////////////////////

  /// https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-issue-search/#api-rest-api-3-search-jql-get
  Future jqlSearch(
    String jql, {
    List<String> expand = const [],
    List<String> fields = const ['id'],
    List<String> excludedFields = const [],
  }) {
    var data = dao.getJson(
      '/rest/api/3/search/jql',
      queryParameters: {
        'jql': jql,
        if (expand.isNotEmpty) 'expand': expand.join(','),
        'fields': [...fields, ...excludedFields.map((e) => '-$e')].join(','),
      },
    );
    return data;
  }

  Future<Response> getIssue(String issueKey, {List<String> expand = const []}) {
    return dao.requestAtEndpoint(
      '/rest/api/3/issue/$issueKey',
      queryParameters: {
        if (expand.isNotEmpty) 'expand': expand.join(','),
      },
    );
  }

  Future<(Iterable<JiraWorkItemData>, bool, String?)> fetchLastUpdatedIssues({
    int maxResults = 0,
    DateTime? before,
    DateTime? after,
    List<String>? filterByProjectCodes,
    String? nextPageToken,
  }) async {
    // get projects of interest
    await APIDao().load();
    var starredProjects = SettingsModel().starredProjects.value?.toSet() ?? {};

    // prepare jql query
    String projectFilter = '';
    if (starredProjects.isNotEmpty) {
      final keys = filterByProjectCodes?.join(', ') ?? starredProjects.map((k) => k.trim()).where((k) => k.isNotEmpty).join(',');
      projectFilter = 'project in ($keys) ';
    }

    String dateToJiraString(DateTime d) => d.toIso8601String().replaceAll('T', ' ').substring(0, 16);

    final jql = '$projectFilter ${before != null ? "AND updated <= \"${dateToJiraString(before)}\"" : ""} ${after != null ? "AND updated >= \"${dateToJiraString(after)}\"" : ""} ORDER BY updated DESC';

    return APIDao()
        .getJson(
          '/rest/api/3/search/jql',
          queryParameters: {
            'jql': jql,
            'nextPageToken': nextPageToken,
            'fields': '*all',
            'maxResults': '$maxResults',
            'expand': 'changelog',
          },
        )
        .then(
          (data) {
            var now = DateTime.now();
            final issues = (data['issues'] as List).map((e) => JiraWorkItemData(e, lastCacheUpdate: now));

            // print(data.keys);
            return (issues, data['isLast'] as bool, data['nextPageToken'] as String?);
          },
        );
  }
}
