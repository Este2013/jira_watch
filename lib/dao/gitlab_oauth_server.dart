import 'dart:async';
import 'dart:io';

import 'package:loggy/loggy.dart';
import 'package:url_launcher/url_launcher.dart';

/// Default loopback port for the GitLab OAuth callback.
///
/// This has to match the redirect URI registered in the GitLab application, so
/// it is user-configurable (see `gitlab_oauth_port` in prefs) to survive a clash.
const int kGitLabDefaultOAuthPort = 47623;

/// Uses the IP literal rather than `localhost` per RFC 8252 section 7.3, which
/// also avoids hosts that resolve `localhost` to ::1 while the listener is IPv4.
String gitlabRedirectUri(int port) => 'http://127.0.0.1:$port/callback';

const String kGitLabOAuthScopes = 'api read_repository read_user';

const String _callbackPath = '/callback';

class GitLabOAuthPortBusyException implements Exception {
  GitLabOAuthPortBusyException(this.port, this.cause);
  final int port;
  final Object cause;

  @override
  String toString() => 'Port $port is already in use, so the GitLab sign-in callback could not be received. '
      'Close whatever is using it, or change the port in the GitLab settings and update the redirect URI in your GitLab application.';
}

class GitLabOAuthCancelledException implements Exception {
  @override
  String toString() => 'GitLab sign-in was cancelled.';
}

class GitLabOAuthTimeoutException implements Exception {
  GitLabOAuthTimeoutException(this.timeout);
  final Duration timeout;

  @override
  String toString() => 'GitLab sign-in was not completed within ${timeout.inMinutes} minutes.';
}

class GitLabOAuthDeniedException implements Exception {
  GitLabOAuthDeniedException(this.error, this.description);
  final String error;
  final String? description;

  @override
  String toString() => 'GitLab refused the authorization request ($error)${description == null ? '' : ': $description'}';
}

class GitLabOAuthStateMismatchException implements Exception {
  @override
  String toString() => 'The GitLab callback carried an unexpected state value, so it was rejected.';
}

/// Opens the system browser at an authorization URL and waits for GitLab to
/// redirect back to a short-lived loopback listener.
///
/// The system browser is used rather than an embedded webview so the user's
/// existing GitLab session, SSO, 2FA and password manager all work.
class LoopbackAuthSession with GlobalLoggy {
  LoopbackAuthSession({
    required this.port,
    required this.expectedState,
    this.timeout = const Duration(minutes: 5),
  });

  final int port;
  final String expectedState;
  final Duration timeout;

  HttpServer? _server;
  Timer? _timeoutTimer;
  Completer<Uri>? _completer;

  /// Returns the full callback URI once GitLab redirects to it.
  Future<Uri> run(Uri authorizeUrl) async {
    final completer = Completer<Uri>();
    _completer = completer;

    try {
      _server = await HttpServer.bind(InternetAddress.loopbackIPv4, port);
    } on SocketException catch (e) {
      loggy.error('Could not bind the OAuth callback listener on port $port: $e');
      _completer = null;
      throw GitLabOAuthPortBusyException(port, e);
    }
    loggy.info('Listening for the GitLab OAuth callback on ${gitlabRedirectUri(port)}');

    _timeoutTimer = Timer(timeout, () {
      loggy.warning('GitLab OAuth flow timed out after ${timeout.inMinutes} minutes');
      _finish(completer, error: GitLabOAuthTimeoutException(timeout));
    });

    _server!.listen(
      (request) => _handleRequest(request, completer),
      onError: (Object e, StackTrace s) {
        loggy.error('OAuth callback listener failed: $e\n$s');
        _finish(completer, error: e);
      },
      cancelOnError: true,
    );

    loggy.info('Opening the system browser for GitLab authorization');
    await launchUrl(authorizeUrl, mode: LaunchMode.externalApplication);

    return completer.future;
  }

  Future<void> cancel() async {
    final completer = _completer;
    if (completer == null) return;
    loggy.info('GitLab OAuth flow cancelled by the user');
    await _finish(completer, error: GitLabOAuthCancelledException());
  }

  Future<void> _handleRequest(HttpRequest request, Completer<Uri> completer) async {
    final uri = request.requestedUri;

    // The browser also asks for things like /favicon.ico; only the callback
    // path may resolve the flow.
    if (uri.path != _callbackPath) {
      request.response.statusCode = HttpStatus.notFound;
      await request.response.close();
      return;
    }

    final params = uri.queryParameters;

    if (params['state'] != expectedState) {
      loggy.error('Rejected an OAuth callback with a mismatched state parameter');
      await _respond(request, title: 'Sign-in rejected', message: 'The callback could not be verified. Please try again from the app.');
      await _finish(completer, error: GitLabOAuthStateMismatchException());
      return;
    }

    final error = params['error'];
    if (error != null) {
      final description = params['error_description'];
      loggy.warning('GitLab denied the authorization request: $error ($description)');
      await _respond(request, title: 'Sign-in denied', message: description ?? error);
      await _finish(completer, error: GitLabOAuthDeniedException(error, description));
      return;
    }

    if (params['code'] == null) {
      loggy.error('OAuth callback carried neither a code nor an error');
      await _respond(request, title: 'Sign-in failed', message: 'GitLab did not return an authorization code.');
      await _finish(completer, error: GitLabOAuthDeniedException('missing_code', null));
      return;
    }

    loggy.info('Received a valid GitLab OAuth callback');
    await _respond(request, title: 'Signed in', message: 'You can close this tab and return to Jira Watcher.');
    await _finish(completer, value: uri);
  }

  Future<void> _respond(HttpRequest request, {required String title, required String message}) async {
    request.response.headers.contentType = ContentType.html;
    request.response.write(
      '<!doctype html><html><head><meta charset="utf-8"><title>$title</title>'
      '<style>body{font-family:system-ui,sans-serif;background:#1b1b1f;color:#e5e1e6;'
      'display:flex;align-items:center;justify-content:center;height:100vh;margin:0}'
      'div{text-align:center}h1{font-weight:500;font-size:1.4rem}p{color:#c8c5ca}</style></head>'
      '<body><div><h1>$title</h1><p>$message</p></div>'
      '<script>setTimeout(function(){window.close()},1)</script></body></html>',
    );
    await request.response.close();
  }

  Future<void> _finish(Completer<Uri> completer, {Uri? value, Object? error}) async {
    _timeoutTimer?.cancel();
    _timeoutTimer = null;
    await _server?.close(force: true);
    _server = null;
    _completer = null;
    if (completer.isCompleted) return;
    if (error != null) {
      completer.completeError(error);
    } else {
      completer.complete(value);
    }
  }
}
