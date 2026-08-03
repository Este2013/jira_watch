import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:jira_watcher/dao/gitlab_dao.dart';
import 'package:loggy/loggy.dart';

/// Progress of a single download. Listenable so a dialog can follow it.
class GitLabDownloadTask extends ChangeNotifier {
  GitLabDownloadTask({required this.label, required this.destination});

  final String label;
  final File destination;

  int received = 0;

  /// Null when the server sends no content-length.
  int? total;

  bool get isIndeterminate => total == null || total == 0;
  double? get fraction => isIndeterminate ? null : (received / total!).clamp(0.0, 1.0);

  bool _cancelled = false;
  bool get isCancelled => _cancelled;
  void cancel() {
    _cancelled = true;
    notifyListeners();
  }

  void _update(int bytes) {
    received += bytes;
    notifyListeners();
  }
}

class GitLabDownloadCancelled implements Exception {
  @override
  String toString() => 'Download cancelled.';
}

class GitLabDownloadFailed implements Exception {
  GitLabDownloadFailed(this.statusCode, this.detail);
  final int statusCode;
  final String detail;

  @override
  String toString() => switch (statusCode) {
    404 => 'GitLab has no such artifact (404). It may have expired.',
    403 => 'You are not allowed to download this artifact (403).',
    _ => 'The download failed with status $statusCode. $detail',
  };
}

/// Streams GitLab artifact files to disk.
class GitLabDownloadService with GlobalLoggy {
  static final GitLabDownloadService _instance = GitLabDownloadService._internal();

  factory GitLabDownloadService() => _instance;

  GitLabDownloadService._internal();

  final http.Client _client = http.Client();

  /// Downloads [path] (relative to the GitLab host) into [destination].
  ///
  /// Streams rather than buffering, since artifacts can be hundreds of megabytes.
  Future<File> download({
    required String path,
    required File destination,
    required GitLabDownloadTask task,
    Map<String, dynamic>? queryParameters,
  }) async {
    final dao = GitLabDao();
    var uri = dao.uriFor(path, queryParameters);
    loggy.info('Downloading $uri to ${destination.path}');

    // followRedirects is off deliberately: GitLab answers artifact requests with
    // a 302 to pre-signed object storage, and package:http would replay the
    // Authorization header to that third party. The pre-signed URL carries its
    // own credentials, so the redirect is followed by hand without auth.
    var response = await dao.send(
      http.Request('GET', uri)..followRedirects = false,
    );

    var redirects = 0;
    while (_isRedirect(response.statusCode)) {
      final location = response.headers['location'];
      if (location == null) break;
      if (++redirects > 5) {
        throw GitLabDownloadFailed(response.statusCode, 'Too many redirects.');
      }
      await response.stream.drain<void>();
      uri = uri.resolve(location);
      loggy.debug('Following artifact redirect to ${uri.host} without credentials');
      response = await _client.send(http.Request('GET', uri)..followRedirects = false);
    }

    if (response.statusCode != 200) {
      final body = await response.stream.bytesToString();
      throw GitLabDownloadFailed(response.statusCode, body.length > 300 ? '${body.substring(0, 300)}…' : body);
    }

    task.total = response.contentLength;

    // Written to a temporary name first, so a cancelled or failed download never
    // leaves a truncated file looking like a complete one.
    final partial = File('${destination.path}.part');
    await partial.parent.create(recursive: true);
    final sink = partial.openWrite();

    try {
      await for (final chunk in response.stream) {
        if (task.isCancelled) {
          await sink.close();
          await partial.delete();
          throw GitLabDownloadCancelled();
        }
        sink.add(chunk);
        task._update(chunk.length);
      }
      await sink.flush();
      await sink.close();
    } on GitLabDownloadCancelled {
      rethrow;
    } on Object {
      await sink.close();
      if (await partial.exists()) await partial.delete();
      rethrow;
    }

    if (await destination.exists()) await destination.delete();
    await partial.rename(destination.path);
    loggy.info('Downloaded ${task.received} bytes to ${destination.path}');
    return destination;
  }

  bool _isRedirect(int code) => code == 301 || code == 302 || code == 303 || code == 307 || code == 308;

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
    // The path segment must stay percent-encoded per segment; Uri.https handles
    // that when the path is passed unencoded.
    path: '/api/v4/projects/$projectId/jobs/$jobId/artifacts/$artifactPath',
    destination: destination,
    task: task,
  );
}
