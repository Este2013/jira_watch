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

  // WORK ITEMS /////////////////////////////////////////////////////////////////////

  Future<(Iterable<JiraWorkItemData>, bool, String?)> fetchLastUpdatedWorkItems({int maxResults = 0, String? nextPageToken, DateTime? before, DateTime? after, List<String>? filterByProjectCodes}) {
    // TODO missing cache check
    return api.fetchLastUpdatedWorkItems(
      maxResults: maxResults,
      before: before,
      after: after,
      filterByProjectCodes: filterByProjectCodes,
      nextPageToken: nextPageToken,
    );
  }

  Future<(Iterable<JiraWorkItemData>, bool, String?)> fetchLastUpdatedWorkItemsByPage({
    required int pageSize,
    int pageIndex = 0,
    String? nextPageToken,
    DateTime? before,
    DateTime? after,
    List<String>? filterByProjectCodes,
  }) {
    // TODO missing cache check
    return fetchLastUpdatedWorkItems(
      maxResults: pageSize,
      nextPageToken: nextPageToken,
      before: before,
      after: after,
      filterByProjectCodes: filterByProjectCodes,
    );
  }

  // LOCAL DATA /////////////////////////////////////////////////////////////////////

  /// Contains for each entry:
  ///  - workitem key (eg. "EVH-1234")
  ///  - last workitem update time that was marked as read.
  /// If a workitem update is more recent than a cache value stored here, then its unread.
  Map<String, DateTime>? syncWorkItemMarkedAsReadTimeCache;
  final Future<File> _workItemMarkedAsReadTimeDataFile =(SettingsModel().settingsFolder).then((value) =>File(
    path
        .join(
           value.path,
          'issue_read_status.csv',
        )
        .replaceFirst(RegExp(r'^\\?/?'), ''),
  ) ,
  ) ;

  Future initWorkItemMarkedAsReadCache() async {
    if (syncWorkItemMarkedAsReadTimeCache == null) {
      loggy.info('initializing syncWorkItemMarkedAsReadTimeCache');
File file =      (await _workItemMarkedAsReadTimeDataFile);
      if (!await file.exists()) {
        loggy.warning('_workItemMarkedAsReadTimeDataFile does not exist. creating it at: ${file.path}');
        try {
          await file.create(recursive: true);
        } on Exception catch (e) {
          loggy.error('_workItemMarkedAsReadTimeDataFile could not be created!\n${e.toString()}');
        }
      }
      syncWorkItemMarkedAsReadTimeCache ??= await file.readAsString().then(
        (strData) {
          var csv = const CsvToListConverter().convert(strData);
          return {for (var line in csv) line.first: DateTime.parse(line.last)};
        },
      );
    }
  }

  Future<Map<String, DateTime>> workItemMarkedAsReadTime() async {
    await initWorkItemMarkedAsReadCache();
    return syncWorkItemMarkedAsReadTimeCache!;
  }

  Future<void> markAsRead(String workItemKey, DateTime time, {bool isRead = true}) async {
    loggy.debug('Marking $workItemKey as ${isRead ? '' : 'un'}read');
    await initWorkItemMarkedAsReadCache();
    if (isRead) {
      if (syncWorkItemMarkedAsReadTimeCache != null) {
        syncWorkItemMarkedAsReadTimeCache![workItemKey] = time;
      }
    } else {
      if (syncWorkItemMarkedAsReadTimeCache != null) {
        syncWorkItemMarkedAsReadTimeCache!.remove(workItemKey);
      }
    }

    String csv = const ListToCsvConverter().convert([
      for (var e in syncWorkItemMarkedAsReadTimeCache!.entries) [e.key, e.value.toIso8601String()],
    ]);
    try {
      await (await _workItemMarkedAsReadTimeDataFile).writeAsString(csv);
    } on Exception catch (e) {
      loggy.error('_workItemMarkedAsReadTimeDataFile could not be written to!\n${e.toString()}');
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
