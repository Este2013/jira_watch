import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:jira_watcher/dao/gitlab_oauth_server.dart';
import 'package:jira_watcher/utils/encryption_service.dart';
import 'package:jira_watcher/utils/pkce.dart';
import 'package:loggy/loggy.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum GitLabConnectionState {
  /// Before [GitLabDao.load] has run.
  unknown,

  /// No host or application id has been entered yet.
  unconfigured,

  /// Configured, but there is no usable token.
  disconnected,
  connecting,
  connected,
  error,
}

class GitLabNotConnectedException implements Exception {
  @override
  String toString() => 'Not connected to GitLab.';
}

class GitLabApiException implements Exception {
  GitLabApiException(this.statusCode, this.body);
  final int statusCode;
  final String body;

  @override
  String toString() => 'GitLab API error $statusCode: $body';
}

/// Raised when GitLab rejects the refresh token. Terminal: the user must reconnect.
class GitLabInvalidGrantException implements Exception {
  GitLabInvalidGrantException(this.body);
  final String body;

  @override
  String toString() => 'GitLab rejected the stored credentials, so you need to sign in again.';
}

class GitLabTokenSet {
  const GitLabTokenSet({
    required this.accessToken,
    required this.refreshToken,
    required this.scope,
    required this.expiresAt,
  });

  final String accessToken;
  final String refreshToken;
  final String scope;

  /// Always UTC, and derived from the local clock at the time of issue — GitLab's
  /// own `created_at` is on the server's clock, which staleness checks can't use.
  final DateTime expiresAt;

  /// One minute of skew, so a request never goes out with a token that expires mid-flight.
  bool get isStale => DateTime.now().toUtc().isAfter(expiresAt.subtract(const Duration(seconds: 60)));

  Set<String> get scopes => scope.split(' ').where((s) => s.isNotEmpty).toSet();
}

class GitLabPage<T> {
  const GitLabPage({required this.items, this.nextPage});

  final List<T> items;

  /// From the `x-next-page` header. GitLab omits `x-total-pages` on keyset
  /// pagination and large collections, so this is the only reliable signal.
  final int? nextPage;

  bool get hasMore => nextPage != null;
}

/// Owns the GitLab connection: OAuth flow, token lifecycle, and authenticated requests.
class GitLabDao with GlobalLoggy {
  static final GitLabDao _instance = GitLabDao._internal();

  factory GitLabDao() => _instance;

  GitLabDao._internal();

  static const _kHost = 'gitlab_host';
  static const _kApplicationId = 'gitlab_application_id';
  static const _kOauthPort = 'gitlab_oauth_port';
  static const _kAccessToken = 'encrypted_gitlab_access_token';
  static const _kRefreshToken = 'encrypted_gitlab_refresh_token';
  static const _kExpiresAt = 'gitlab_token_expires_at';
  static const _kScope = 'gitlab_token_scope';
  static const _kUserCache = 'gitlab_user_cache';

  static const String defaultHost = 'gitlab.com';

  final ValueNotifier<GitLabConnectionState> connection = ValueNotifier(GitLabConnectionState.unknown);

  String host = defaultHost;
  String? applicationId;
  int oauthPort = kGitLabDefaultOAuthPort;

  /// Last known identity, cached so the settings card renders without a round-trip.
  Map<String, dynamic>? cachedUser;

  Object? lastError;

  /// Bumped whenever the credentials change, so image caches keyed on it drop
  /// entries that failed under an old token instead of staying broken all session.
  int authGeneration = 0;

  final http.Client _client = http.Client();

  GitLabTokenSet? _tokens;
  Future<GitLabTokenSet>? _refreshInFlight;
  Future<void>? _connectInFlight;
  LoopbackAuthSession? _activeSession;
  bool _loaded = false;

  bool get isConfigured => host.isNotEmpty && (applicationId?.isNotEmpty ?? false);
  bool get isConnected => _tokens != null;
  GitLabTokenSet? get tokens => _tokens;
  String get redirectUri => gitlabRedirectUri(oauthPort);

  /// A getter so a refreshed token propagates without callers holding a stale string.
  String get authHeader => 'Bearer ${_tokens!.accessToken}';

  /// Never throws: a keystore or decryption problem degrades to [GitLabConnectionState.disconnected]
  /// rather than taking down app startup.
  Future<void> load() async {
    if (_loaded) return;
    _loaded = true;
    loggy.info('Loading GitLabDao...');
    final prefs = await SharedPreferences.getInstance();

    host = prefs.getString(_kHost) ?? defaultHost;
    applicationId = prefs.getString(_kApplicationId);
    oauthPort = prefs.getInt(_kOauthPort) ?? kGitLabDefaultOAuthPort;

    final rawUser = prefs.getString(_kUserCache);
    if (rawUser != null) {
      try {
        cachedUser = jsonDecode(rawUser) as Map<String, dynamic>;
      } on FormatException catch (e) {
        loggy.warning('Discarding an unreadable cached GitLab user: $e');
        await prefs.remove(_kUserCache);
      }
    }

    final encAccess = prefs.getString(_kAccessToken);
    final encRefresh = prefs.getString(_kRefreshToken);
    final expiresAtRaw = prefs.getString(_kExpiresAt);

    if (encAccess != null && encRefresh != null && expiresAtRaw != null) {
      try {
        _tokens = GitLabTokenSet(
          accessToken: await EncryptionService.decrypt(encAccess),
          refreshToken: await EncryptionService.decrypt(encRefresh),
          scope: prefs.getString(_kScope) ?? kGitLabOAuthScopes,
          expiresAt: DateTime.parse(expiresAtRaw).toUtc(),
        );
      } on Object catch (e) {
        loggy.warning('Stored GitLab tokens could not be read ($e). Clearing them; the user will reconnect.');
        await _wipeTokens();
      }
    }

    _publishIdleState();
    loggy.info('GitLabDao loaded (${connection.value.name}).');
  }

  Future<void> saveConnectionSettings({String? host, String? applicationId, int? oauthPort}) async {
    final prefs = await SharedPreferences.getInstance();
    if (host != null) {
      this.host = _normalizeHost(host);
      await prefs.setString(_kHost, this.host);
    }
    if (applicationId != null) {
      this.applicationId = applicationId.trim();
      await prefs.setString(_kApplicationId, this.applicationId!);
    }
    if (oauthPort != null) {
      this.oauthPort = oauthPort;
      await prefs.setInt(_kOauthPort, oauthPort);
    }
    if (!isConnected) _publishIdleState();
  }

  static String _normalizeHost(String raw) {
    var h = raw.trim();
    h = h.replaceFirst(RegExp(r'^https?://'), '');
    h = h.replaceAll(RegExp(r'/+$'), '');
    if (h.contains('/')) h = h.split('/').first;
    return h;
  }

  void _publishIdleState() => connection.value = isConnected
      ? GitLabConnectionState.connected
      : isConfigured
      ? GitLabConnectionState.disconnected
      : GitLabConnectionState.unconfigured;

  // OAUTH /////////////////////////////////////////////////////////////////////

  /// Single-flight: a double-click would otherwise open two browser tabs and the
  /// second loopback bind would fail.
  Future<void> connect() => _connectInFlight ??= _doConnect().whenComplete(() => _connectInFlight = null);

  Future<void> cancelConnect() => _activeSession?.cancel() ?? Future.value();

  Future<void> _doConnect() async {
    if (!isConfigured) {
      throw StateError('A GitLab host and application id are required before connecting.');
    }
    loggy.info('Starting the GitLab OAuth flow against $host');
    lastError = null;
    connection.value = GitLabConnectionState.connecting;

    // Per-attempt only: a cancelled-then-retried flow must not accept a stale code.
    final pkce = await PkcePair.generate();
    final state = PkcePair.randomUrlSafeString(16);
    final redirect = redirectUri;

    final session = LoopbackAuthSession(port: oauthPort, expectedState: state);
    _activeSession = session;

    try {
      final callback = await session.run(
        _uri('/oauth/authorize', {
          'client_id': applicationId,
          'redirect_uri': redirect,
          'response_type': 'code',
          'state': state,
          'scope': kGitLabOAuthScopes,
          'code_challenge': pkce.codeChallenge,
          'code_challenge_method': 'S256',
        }),
      );

      final tokens = await _exchange({
        'client_id': applicationId!,
        'code': callback.queryParameters['code']!,
        'grant_type': 'authorization_code',
        'redirect_uri': redirect,
        'code_verifier': pkce.codeVerifier,
      });

      await _persistTokens(tokens);
      authGeneration++;
      await _cacheUser();
      connection.value = GitLabConnectionState.connected;
      loggy.info('Connected to GitLab as ${cachedUser?['username']}');
    } on GitLabOAuthCancelledException {
      _publishIdleState();
      rethrow;
    } on Object catch (e, s) {
      loggy.error('GitLab OAuth flow failed: $e\n$s');
      lastError = e;
      connection.value = GitLabConnectionState.error;
      rethrow;
    } finally {
      _activeSession = null;
    }
  }

  Future<void> disconnect() async {
    loggy.info('Disconnecting from GitLab');
    final refresh = _tokens?.refreshToken;
    if (refresh != null && applicationId != null) {
      // Best effort: a failure here must not stop the local wipe.
      try {
        await _client.post(
          _uri('/oauth/revoke'),
          body: {'client_id': applicationId!, 'token': refresh},
        );
      } on Object catch (e) {
        loggy.warning('Could not revoke the GitLab token server-side: $e');
      }
    }
    await _wipeTokens();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kUserCache);
    cachedUser = null;
    authGeneration++;
    _publishIdleState();
  }

  /// Exposed for the settings page, so the refresh path can be exercised by hand.
  Future<GitLabTokenSet> refreshNow() {
    final current = _tokens;
    if (current == null) throw GitLabNotConnectedException();
    return _refresh(current);
  }

  Future<GitLabTokenSet> _exchange(Map<String, String> body) async {
    final response = await _client.post(_uri('/oauth/token'), body: body);
    if (response.statusCode != 200) {
      if (response.body.contains('invalid_grant')) {
        throw GitLabInvalidGrantException(response.body);
      }
      throw GitLabApiException(response.statusCode, response.body);
    }
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return GitLabTokenSet(
      accessToken: data['access_token'] as String,
      refreshToken: data['refresh_token'] as String,
      scope: (data['scope'] as String?) ?? kGitLabOAuthScopes,
      expiresAt: DateTime.now().toUtc().add(Duration(seconds: (data['expires_in'] as num?)?.toInt() ?? 7200)),
    );
  }

  /// GitLab rotates the refresh token on every use and can revoke the whole token
  /// family if one is reused, so refreshes must never run concurrently.
  Future<GitLabTokenSet> _refresh(GitLabTokenSet basedOn) => _refreshInFlight ??= _doRefresh(basedOn).whenComplete(() => _refreshInFlight = null);

  Future<GitLabTokenSet> _doRefresh(GitLabTokenSet basedOn) async {
    // Compare-and-swap: if someone already rotated past the token this caller
    // used, adopt theirs instead of burning another rotation.
    if (!identical(_tokens, basedOn)) return _tokens!;

    loggy.info('Refreshing the GitLab access token');
    try {
      final refreshed = await _exchange({
        'client_id': applicationId!,
        'refresh_token': basedOn.refreshToken,
        'grant_type': 'refresh_token',
        'redirect_uri': redirectUri,
      });
      await _persistTokens(refreshed);
      return refreshed;
    } on GitLabInvalidGrantException catch (e) {
      // Terminal. Never auto-retry: a retry would burn the rotation chain further.
      loggy.warning('GitLab rejected the refresh token; requiring a reconnect. $e');
      await _wipeTokens();
      authGeneration++;
      _publishIdleState();
      rethrow;
    }
  }

  /// Persists before assigning, so a crash mid-way leaves the old token on disk
  /// (recoverable by reconnecting) rather than a rotated token living only in RAM.
  Future<void> _persistTokens(GitLabTokenSet tokens) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kAccessToken, await EncryptionService.encrypt(tokens.accessToken));
    await prefs.setString(_kRefreshToken, await EncryptionService.encrypt(tokens.refreshToken));
    await prefs.setString(_kExpiresAt, tokens.expiresAt.toIso8601String());
    await prefs.setString(_kScope, tokens.scope);
    _tokens = tokens;
  }

  Future<void> _wipeTokens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kAccessToken);
    await prefs.remove(_kRefreshToken);
    await prefs.remove(_kExpiresAt);
    await prefs.remove(_kScope);
    _tokens = null;
  }

  Future<void> _cacheUser() async {
    final data = await getJson('/api/v4/user') as Map<String, dynamic>;
    cachedUser = data;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _kUserCache,
      jsonEncode({
        'id': data['id'],
        'username': data['username'],
        'name': data['name'],
        'avatar_url': data['avatar_url'],
        'web_url': data['web_url'],
      }),
    );
  }

  // REQUESTS //////////////////////////////////////////////////////////////////

  /// Single choke point for every GitLab URL, so supporting instances served from
  /// a sub-path stays a one-place change.
  Uri _uri(String path, [Map<String, dynamic>? queryParameters]) => Uri.https(
    host,
    path,
    queryParameters == null
        ? null
        : {
            for (final e in queryParameters.entries)
              if (e.value != null) e.key: '${e.value}',
          },
  );

  Uri uriFor(String path, [Map<String, dynamic>? queryParameters]) => _uri(path, queryParameters);

  /// The one primitive every other request helper is built on.
  ///
  /// Streaming rather than buffering, so large downloads (pipeline artifacts) can
  /// share the token-refresh logic instead of bypassing it.
  Future<http.StreamedResponse> send(http.BaseRequest request, {bool allowRetryOn401 = true}) async {
    await _ensureFresh();
    final used = _tokens;

    // A finalized request cannot be re-sent, so the replay clone is built up front.
    final retryCandidate = allowRetryOn401 ? _replayable(request) : null;

    _applyAuth(request, used);
    var response = await _client.send(request);

    if (response.statusCode == 401 && retryCandidate != null && used != null) {
      loggy.info('GitLab returned 401; refreshing the token and retrying once');
      await response.stream.drain<void>();
      final fresh = await _refresh(used);
      _applyAuth(retryCandidate, fresh);
      response = await _client.send(retryCandidate);
    }

    if (response.statusCode == 429) {
      loggy.warning('GitLab rate limit reached. Retry-After: ${response.headers['retry-after'] ?? 'unspecified'}');
    }
    return response;
  }

  /// Only attached for our own host: GitLab avatar and artifact URLs routinely
  /// point at third parties (gravatar, object storage), which must never see the token.
  void _applyAuth(http.BaseRequest request, GitLabTokenSet? tokens) {
    if (tokens == null) return;
    if (request.url.host != host.split(':').first) return;
    request.headers['Authorization'] = 'Bearer ${tokens.accessToken}';
  }

  http.Request? _replayable(http.BaseRequest request) {
    if (request is! http.Request) return null;
    if (request.bodyBytes.isNotEmpty) return null;
    return http.Request(request.method, request.url)
      ..followRedirects = request.followRedirects
      ..maxRedirects = request.maxRedirects
      ..persistentConnection = request.persistentConnection
      ..headers.addAll(request.headers);
  }

  Future<void> _ensureFresh() async {
    final current = _tokens;
    if (current == null) throw GitLabNotConnectedException();
    if (current.isStale) await _refresh(current);
  }

  Future<http.Response> request(
    String path, {
    String method = 'GET',
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    bool followRedirects = true,
  }) async {
    final req = http.Request(method, _uri(path, queryParameters))
      ..followRedirects = followRedirects
      ..headers['Accept'] = 'application/json';
    if (headers != null) req.headers.addAll(headers);
    loggy.debug('GitLab $method ${req.url}');
    return http.Response.fromStream(await send(req));
  }

  Future<dynamic> getJson(String path, {Map<String, dynamic>? queryParameters}) async {
    final response = await request(path, queryParameters: queryParameters);
    if (response.statusCode != 200) throw GitLabApiException(response.statusCode, response.body);
    return jsonDecode(response.body);
  }

  Future<GitLabPage<dynamic>> getJsonPage(
    String path, {
    int page = 1,
    int perPage = 20,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await request(
      path,
      queryParameters: {...?queryParameters, 'page': page, 'per_page': perPage},
    );
    if (response.statusCode != 200) throw GitLabApiException(response.statusCode, response.body);
    final raw = response.headers['x-next-page'];
    return GitLabPage<dynamic>(
      items: (jsonDecode(response.body) as List).cast<dynamic>(),
      nextPage: (raw == null || raw.isEmpty) ? null : int.tryParse(raw),
    );
  }

  // DIAGNOSTICS ///////////////////////////////////////////////////////////////

  Stream<String> diagnoseConnection() async* {
    yield 'Host: $host';
    yield 'Application id: ${applicationId == null || applicationId!.isEmpty ? "(not set)" : "${applicationId!.substring(0, applicationId!.length.clamp(0, 8))}…"}';
    yield 'Redirect URI: $redirectUri';
    yield 'Configured? $isConfigured';
    yield 'Connection state: ${connection.value.name}';

    final t = _tokens;
    if (t == null) {
      yield 'No token stored. Connect from Settings > GitLab first.';
      return;
    }
    yield 'Granted scopes: ${t.scopes.join(", ")}';
    yield 'Access token expires at ${t.expiresAt.toLocal()} (stale? ${t.isStale})';

    yield '';
    yield 'Requesting /api/v4/user ...';
    try {
      final user = await getJson('/api/v4/user') as Map<String, dynamic>;
      yield 'Signed in as ${user['name']} (@${user['username']}), id ${user['id']}';
    } on Object catch (e) {
      yield 'Request failed: $e';
      return;
    }

    yield '';
    yield 'Requesting the first page of top-level groups ...';
    try {
      final groups = await getJsonPage('/api/v4/groups', queryParameters: {'top_level_only': true});
      yield 'Received ${groups.items.length} group(s); more pages available? ${groups.hasMore}';
    } on Object catch (e) {
      yield 'Request failed: $e';
    }
  }
}
