import 'package:csv/csv.dart';
import 'package:http/http.dart';
import 'package:jira_watcher/dao/api_dao.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:loggy/loggy.dart';
import 'package:path/path.dart' as path;
import 'dart:io';

/// Accessor to cached data.
///
/// Handles fetching from local memory or API.
class DataModel with UiLoggy {
  static final DataModel _instance = DataModel._internal();

  factory DataModel() => _instance;

  DataModel._internal() {
    api = APIModel();
  }

  late final APIModel api;

  // PROJECTS /////////////////////////////////////////////////////////////////////

  List? _projectsDataCache;

  /// Returns the path to the temp repository for this app.
  // ignore: unused_element
  Directory get _tempDir => Directory(
    path.join(
      Directory.systemTemp.path,
      'jira_watch'
      'issues_cache',
    ),
  );

  /// Fetch projects from Jira API, caching results
  /// https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-projects/#api-rest-api-3-project-get
  ///
  /// Each project is a map as follows:
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
    if (_projectsDataCache != null && !refresh) {
      return _projectsDataCache!;
    }

    final data = await api.fetchProjects();
    final result = (data as List);
    _projectsDataCache = result;
    return result;
  }

  /// Fetch starred (cloud-side) projects and store locally
  Future<List> starredProjects({bool refresh = false}) async {
    final projects = await fetchProjects(refresh: refresh);
    return projects.where((p) => p['favourite'] == true).toList();
  }

  Future fetchSingleProject(String code, {List<String>? expand}) {
    // TODO missing cache check
    return api.fetchSingleProject(code, expand: expand);
  }

  // ISSUES /////////////////////////////////////////////////////////////////////

  Future<(Iterable<IssueData>, bool, String?)> fetchLastUpdatedIssues({int maxResults = 0, String? nextPageToken, DateTime? before, DateTime? after, List<String>? filterByProjectCodes}) {
    // TODO missing cache check
    return api.fetchLastUpdatedIssues(
      maxResults: maxResults,
      before: before,
      after: after,
      filterByProjectCodes: filterByProjectCodes,
      nextPageToken: nextPageToken,
    );
  }

  Future<(Iterable<IssueData>, bool, String?)> fetchLastUpdatedIssuesByPage({
    required int pageSize,
    int pageIndex = 0,
    String? nextPageToken,
    DateTime? before,
    DateTime? after,
    List<String>? filterByProjectCodes,
  }) {
    // TODO missing cache check
    return fetchLastUpdatedIssues(
      maxResults: pageSize,
      nextPageToken: nextPageToken,
      before: before,
      after: after,
      filterByProjectCodes: filterByProjectCodes,
    );
  }

  // LOCAL DATA /////////////////////////////////////////////////////////////////////
  /// Contains for each entry:
  ///  - issue key (eg. "EVH-1234")
  ///  - last issue update time that was marked as read.
  /// If an issue update is more recent than a cache value stored here, then its unread.
  Future<Map<String, DateTime>>? _issueMarkedAsReadTimeCache;
  final File _issueMarkedAsReadTimeDataFile = File(
    path
        .join(
          SettingsModel().settingsFolder.path,
          'issue_read_status.csv',
        )
        .replaceFirst(RegExp(r'^\\?/?'), ''),
  );

  Future<Map<String, DateTime>> issueMarkedAsReadTime() async {
    if (!await _issueMarkedAsReadTimeDataFile.exists()) {
      await _issueMarkedAsReadTimeDataFile.create(recursive: true);
    }
    _issueMarkedAsReadTimeCache ??= _issueMarkedAsReadTimeDataFile.readAsString().then(
      (strData) {
        var csv = const CsvToListConverter().convert(strData);
        return {for (var line in csv) line.first: DateTime.parse(line.last)};
      },
    );
    return _issueMarkedAsReadTimeCache!;
  }

  Future<void> markAsRead(String issueKey, DateTime time, {bool isRead = true}) async {
    loggy.debug('Marking $issueKey as ${isRead ? '' : 'un'}read');
    if (!await _issueMarkedAsReadTimeDataFile.exists()) {
      loggy.warning('_issueMarkedAsReadTimeDataFile does not exist. creating it at: ${_issueMarkedAsReadTimeDataFile.path}');
      try {
        await _issueMarkedAsReadTimeDataFile.create(recursive: true);
      } on Exception catch (e) {
        loggy.error('_issueMarkedAsReadTimeDataFile could not be created!\n${e.toString()}');
      }
    }
    var data = await _issueMarkedAsReadTimeCache ?? {};
    if (isRead) {
      data[issueKey] = time;
    } else {
      data.remove(issueKey);
    }
    String csv = const ListToCsvConverter().convert([
      for (var e in data.entries) [e.key, e.value.toIso8601String()],
    ]);
    _issueMarkedAsReadTimeCache = Future.value(data);
    try {
      await _issueMarkedAsReadTimeDataFile.writeAsString(csv);
    } on Exception catch (e) {
      loggy.error('_issueMarkedAsReadTimeDataFile could not be written to!\n${e.toString()}');
    }
  }
}

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

  Future<Response> getIssue(String issueKey) {
    return dao.request('/rest/api/3/issue/$issueKey');
  }

  Future<(Iterable<IssueData>, bool, String?)> fetchLastUpdatedIssues({
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
            final issues = (data['issues'] as List).map((e) => IssueData(e, lastCacheUpdate: now));

            // print(data.keys);
            return (issues, data['isLast'] as bool, data['nextPageToken'] as String?);
          },
        );
  }
}

/// Deep-merges [src] into [dest], modifying and returning [dest].
// ignore: unused_element
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
