import 'package:jira_watch/dao/api_dao.dart';
import 'package:path/path.dart' as path;
import 'dart:io';

/// Accessor to cached data.
///
/// Handles fetching from local memory or API.
class DataModel {
  static final DataModel _instance = DataModel._internal();

  factory DataModel() => _instance;

  DataModel._internal();

  /////////////////////////////////////////////////////////////////////
  /// Returns the path to the temp repository for this app.
  Directory get _tempDir => Directory(
    path.join(
      Directory.systemTemp.path,
      'jira_watch'
      'issues_cache',
    ),
  );

  /// TODO use this and then use the data in the app
  /// Creates the store to all of the project issue data.
  /// Fetches all issues from the API, adds them to local cache, and creates a json store in the local temp/.../issues_cache/ folder.
  /// In the same temp/.../issues_cache/ folder, updates last_project_updates.json to remember the last time we updated.
  ///
  /// EDGE CASE: if the int value returned by fetchLastUpdatedIssues changes during the fetching, the offset startAt is correctly adjusted to not miss issues whose index have changed.
  Future<List<IssueData>> registerProject(String projectCode) async {
    List<IssueData> allIssues = [];
    int startAt = 0;
    int? total;

    do {
      final (issues, fetchedTotal) = await IssuesDAO().fetchLastUpdatedIssues(
        maxResults: 100,
        startAt: startAt,
        filterByProjectCodes: [projectCode],
      );
      if (total == null) {
        total = fetchedTotal;
      } else if (fetchedTotal != total) {
        total = fetchedTotal;
      }
      allIssues.addAll(issues);
      startAt = allIssues.length;
    } while (allIssues.length < total);

    return allIssues;
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
