import 'dart:async';
import 'dart:math';

import 'package:csv/csv.dart';
import 'package:jira_watcher/dao/api_dao.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:jira_watcher/models/to_do_tasks_models.dart';
import 'package:loggy/loggy.dart';
import 'package:path/path.dart' as path;
import 'dart:io';

import 'jira_api_model.dart';

/// Accessor to cached data.
///
/// Handles fetching from local memory or API.
class DataModel with UiLoggy {
  static final DataModel _instance = DataModel._internal();

  factory DataModel() => _instance;

  DataModel._internal() {
    api = APIModel();
    todoTasks = ToDoTasksModel();
  }

  late final APIModel api;
  late final ToDoTasksModel todoTasks;

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
  Map<String, DateTime>? syncIssueMarkedAsReadTimeCache;
  final File _issueMarkedAsReadTimeDataFile = File(
    path
        .join(
          SettingsModel().settingsFolder.path,
          'issue_read_status.csv',
        )
        .replaceFirst(RegExp(r'^\\?/?'), ''),
  );

  Future initIssueMarkedAsReadCache() async {
    if (syncIssueMarkedAsReadTimeCache == null) {
      loggy.info('initializing syncIssueMarkedAsReadTimeCache');
      if (!await _issueMarkedAsReadTimeDataFile.exists()) {
        loggy.warning('_issueMarkedAsReadTimeDataFile does not exist. creating it at: ${_issueMarkedAsReadTimeDataFile.path}');
        try {
          await _issueMarkedAsReadTimeDataFile.create(recursive: true);
        } on Exception catch (e) {
          loggy.error('_issueMarkedAsReadTimeDataFile could not be created!\n${e.toString()}');
        }
      }
      syncIssueMarkedAsReadTimeCache ??= await _issueMarkedAsReadTimeDataFile.readAsString().then(
        (strData) {
          var csv = const CsvToListConverter().convert(strData);
          return {for (var line in csv) line.first: DateTime.parse(line.last)};
        },
      );
    }
  }

  Future<Map<String, DateTime>> issueMarkedAsReadTime() async {
    await initIssueMarkedAsReadCache();
    return syncIssueMarkedAsReadTimeCache!;
  }

  Future<void> markAsRead(String issueKey, DateTime time, {bool isRead = true}) async {
    loggy.debug('Marking $issueKey as ${isRead ? '' : 'un'}read');
    await initIssueMarkedAsReadCache();
    if (isRead) {
      if (syncIssueMarkedAsReadTimeCache != null) {
        syncIssueMarkedAsReadTimeCache![issueKey] = time;
      }
    } else {
      if (syncIssueMarkedAsReadTimeCache != null) {
        syncIssueMarkedAsReadTimeCache!.remove(issueKey);
      }
    }

    String csv = const ListToCsvConverter().convert([
      for (var e in syncIssueMarkedAsReadTimeCache!.entries) [e.key, e.value.toIso8601String()],
    ]);
    try {
      await _issueMarkedAsReadTimeDataFile.writeAsString(csv);
    } on Exception catch (e) {
      loggy.error('_issueMarkedAsReadTimeDataFile could not be written to!\n${e.toString()}');
    }
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
