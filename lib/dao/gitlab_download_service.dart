import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:jira_watcher/dao/file_download_service.dart';
import 'package:jira_watcher/dao/gitlab_dao.dart';
import 'package:loggy/loggy.dart';

// The download mechanics are generic and live in FileDownloadService; these
// aliases keep the GitLab-facing names its call sites already use.
typedef GitLabDownloadTask = DownloadTask;
typedef GitLabDownloadCancelled = DownloadCancelled;

/// Phrases the statuses GitLab actually returns for artifacts, so the shared
/// downloader's generic wording is not what the user sees here.
String _gitlabWording(int statusCode, String detail) => switch (statusCode) {
  404 => 'GitLab has no such artifact (404). It may have expired.',
  403 => 'You are not allowed to download this artifact (403).',
  _ => 'The download failed with status $statusCode. $detail',
};

/// Downloads GitLab artifacts, adding the instance URL and authentication on top
/// of [FileDownloadService].
class GitLabDownloadService with GlobalLoggy {
  static final GitLabDownloadService _instance = GitLabDownloadService._internal();

  factory GitLabDownloadService() => _instance;

  GitLabDownloadService._internal();

  /// Downloads [path] (relative to the configured GitLab host) into [destination].
  Future<File> download({
    required String path,
    required File destination,
    required GitLabDownloadTask task,
    Map<String, dynamic>? queryParameters,
  }) {
    final dao = GitLabDao();
    return FileDownloadService().download(
      uri: dao.uriFor(path, queryParameters),
      destination: destination,
      task: task,
      // Keeps GitLab's token refresh and 401 retry on the first request; the
      // shared core still declines to replay it across redirects.
      send: (http.BaseRequest request) => dao.send(request),
      describe: _gitlabWording,
    );
  }

  /// Whole artifact archive for a job.
  Future<File> downloadJobArchive({
    required int projectId,
    required int jobId,
    required File destination,
    required GitLabDownloadTask task,
  }) => download(
    path: '/api/v4/projects/$projectId/jobs/$jobId/artifacts',
    destination: destination,
    task: task,
  );

  /// A single file from inside a job's artifact archive.
  Future<File> downloadArtifactFile({
    required int projectId,
    required int jobId,
    required String artifactPath,
    required File destination,
    required GitLabDownloadTask task,
  }) => download(
    path: '/api/v4/projects/$projectId/jobs/$jobId/artifacts/$artifactPath',
    destination: destination,
    task: task,
  );
}
