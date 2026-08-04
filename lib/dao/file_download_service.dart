import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:loggy/loggy.dart';

/// Lets a caller supply its own send — GitLab injects an authenticated one that
/// refreshes its token; the updater uses the plain client.
typedef SendRequest = Future<http.StreamedResponse> Function(http.BaseRequest request);

/// Progress of a single download. Listenable so a dialog can follow it.
class DownloadTask extends ChangeNotifier {
  DownloadTask({required this.label, required this.destination});

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

class DownloadCancelled implements Exception {
  @override
  String toString() => 'Download cancelled.';
}

class DownloadFailed implements Exception {
  DownloadFailed(this.statusCode, this.detail, {this.describe});

  final int statusCode;
  final String detail;

  /// Lets a caller phrase common statuses in its own terms, so a GitLab error
  /// never surfaces in an app-update dialog or vice versa.
  final String Function(int statusCode, String detail)? describe;

  @override
  String toString() =>
      describe?.call(statusCode, detail) ??
      switch (statusCode) {
        404 => 'The file could not be found on the server (404).',
        403 => 'Access to this file was denied (403).',
        _ => 'The download failed with status $statusCode. $detail',
      };
}

/// Streams a file to disk with progress, cancellation and optional hashing.
class FileDownloadService with GlobalLoggy {
  static final FileDownloadService _instance = FileDownloadService._internal();

  factory FileDownloadService() => _instance;

  FileDownloadService._internal();

  final http.Client _client = http.Client();

  /// Downloads [uri] into [destination].
  ///
  /// Streams rather than buffering, since both GitLab artifacts and app release
  /// archives run to hundreds of megabytes.
  ///
  /// [onChunk] sees every byte as it arrives, which lets a caller hash during
  /// the transfer instead of re-reading the finished file.
  Future<File> download({
    required Uri uri,
    required File destination,
    required DownloadTask task,
    SendRequest? send,
    void Function(List<int> chunk)? onChunk,
    Map<String, String>? headers,
    String Function(int statusCode, String detail)? describe,
  }) async {
    loggy.info('Downloading $uri to ${destination.path}');

    // Redirects are followed by hand with followRedirects off, because
    // package:http would replay the Authorization header to the redirect
    // target. Artifact and release downloads both 302 to object storage or a
    // CDN, which must never receive our credentials — the pre-signed URL
    // carries its own.
    final first = http.Request('GET', uri)..followRedirects = false;
    if (headers != null) first.headers.addAll(headers);

    var response = await (send ?? _client.send)(first);

    var redirects = 0;
    while (_isRedirect(response.statusCode)) {
      final location = response.headers['location'];
      if (location == null) break;
      if (++redirects > 5) {
        throw DownloadFailed(response.statusCode, 'Too many redirects.', describe: describe);
      }
      await response.stream.drain<void>();
      uri = uri.resolve(location);
      loggy.debug('Following redirect to ${uri.host} without credentials');
      response = await _client.send(http.Request('GET', uri)..followRedirects = false);
    }

    if (response.statusCode != 200) {
      final body = await response.stream.bytesToString();
      throw DownloadFailed(
        response.statusCode,
        body.length > 300 ? '${body.substring(0, 300)}…' : body,
        describe: describe,
      );
    }

    task.total = response.contentLength;

    // Written under a temporary name first, so a cancelled or failed download
    // never leaves a truncated file that looks complete.
    final partial = File('${destination.path}.part');
    await partial.parent.create(recursive: true);
    final sink = partial.openWrite();

    try {
      await for (final chunk in response.stream) {
        if (task.isCancelled) {
          await sink.close();
          await partial.delete();
          throw DownloadCancelled();
        }
        sink.add(chunk);
        onChunk?.call(chunk);
        task._update(chunk.length);
      }
      await sink.flush();
      await sink.close();
    } on DownloadCancelled {
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
}
