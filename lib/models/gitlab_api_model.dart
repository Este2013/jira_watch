import 'dart:async';

import 'package:jira_watcher/dao/gitlab_dao.dart';

/// Endpoint-specific wrapper over [GitLabDao], mirroring how `APIModel` sits over `APIDao`.
class GitLabApiModel {
  static final GitLabApiModel _instance = GitLabApiModel._internal();

  factory GitLabApiModel() => _instance;

  GitLabApiModel._internal() {
    dao = GitLabDao();
    // load() never throws and is idempotent, which matters because home.dart's
    // IndexedStack builds every page at startup.
    isReady = dao.load().then((_) => true);
  }

  late final GitLabDao dao;
  late final Future<bool> isReady;

  /// Reporter — the lowest role that can actually see pipelines and artifacts.
  static const int _minAccessLevel = 20;

  Future<Map<String, dynamic>> currentUser({bool allowCache = true}) async {
    if (allowCache && dao.cachedUser != null) return dao.cachedUser!;
    return await dao.getJson('/api/v4/user') as Map<String, dynamic>;
  }

  Future<GitLabPage> topLevelGroups({int page = 1, String? search}) => dao.getJsonPage(
    '/api/v4/groups',
    page: page,
    queryParameters: {
      'top_level_only': true,
      'min_access_level': 10,
      'order_by': 'name',
      'sort': 'asc',
      if (search != null && search.isNotEmpty) 'search': search,
    },
  );

  Future<GitLabPage> subgroups(int groupId, {int page = 1, String? search}) => dao.getJsonPage(
    '/api/v4/groups/$groupId/subgroups',
    page: page,
    queryParameters: {
      'min_access_level': 10,
      'order_by': 'name',
      'sort': 'asc',
      if (search != null && search.isNotEmpty) 'search': search,
    },
  );

  Future<GitLabPage> groupProjects(int groupId, {int page = 1, String? search}) => dao.getJsonPage(
    '/api/v4/groups/$groupId/projects',
    page: page,
    queryParameters: {
      'min_access_level': _minAccessLevel,
      'order_by': 'name',
      'sort': 'asc',
      'simple': true,
      if (search != null && search.isNotEmpty) 'search': search,
    },
  );

  /// Flat search across the instance — what users reach for when they know the
  /// project name but not where it lives in the group tree.
  Future<GitLabPage> searchProjects({required String search, int page = 1}) => dao.getJsonPage(
    '/api/v4/projects',
    page: page,
    queryParameters: {
      'search': search,
      'membership': true,
      'simple': true,
      'order_by': 'last_activity_at',
      'sort': 'desc',
      'min_access_level': _minAccessLevel,
    },
  );

  /// Projects the user is a member of, including personal-namespace ones that
  /// `top_level_only` group browsing never surfaces.
  Future<GitLabPage> myProjects({int page = 1}) => dao.getJsonPage(
    '/api/v4/projects',
    page: page,
    queryParameters: {
      'membership': true,
      'simple': true,
      'order_by': 'last_activity_at',
      'sort': 'desc',
      'min_access_level': _minAccessLevel,
    },
  );

  Future<Map<String, dynamic>> project(int projectId) async => await dao.getJson('/api/v4/projects/$projectId') as Map<String, dynamic>;

  // PIPELINES /////////////////////////////////////////////////////////////////

  /// Note that the list response omits `duration`, `user`, `started_at` and
  /// `finished_at` — those need [pipeline] per row.
  Future<GitLabPage> pipelines(
    int projectId, {
    int page = 1,
    String? status,
    String? ref,
    String? source,
  }) => dao.getJsonPage(
    '/api/v4/projects/$projectId/pipelines',
    page: page,
    queryParameters: {
      'order_by': 'id',
      'sort': 'desc',
      if (status != null && status.isNotEmpty) 'status': status,
      if (ref != null && ref.isNotEmpty) 'ref': ref,
      if (source != null && source.isNotEmpty) 'source': source,
    },
  );

  Future<Map<String, dynamic>> pipeline(int projectId, int pipelineId) async =>
      await dao.getJson('/api/v4/projects/$projectId/pipelines/$pipelineId') as Map<String, dynamic>;

  Future<GitLabPage> pipelineJobs(int projectId, int pipelineId, {int page = 1, bool includeRetried = false}) => dao.getJsonPage(
    '/api/v4/projects/$projectId/pipelines/$pipelineId/jobs',
    page: page,
    perPage: 100,
    queryParameters: {'include_retried': includeRetried},
  );

  // REPOSITORY ////////////////////////////////////////////////////////////////

  Future<GitLabPage> branches(int projectId, {String? search, int page = 1, int perPage = 20}) => dao.getJsonPage(
    '/api/v4/projects/$projectId/repository/branches',
    page: page,
    perPage: perPage,
    queryParameters: {if (search != null && search.isNotEmpty) 'search': search},
  );

  Future<GitLabPage> tags(int projectId, {String? search, int page = 1, int perPage = 20}) => dao.getJsonPage(
    '/api/v4/projects/$projectId/repository/tags',
    page: page,
    perPage: perPage,
    queryParameters: {
      'order_by': 'updated',
      'sort': 'desc',
      if (search != null && search.isNotEmpty) 'search': search,
    },
  );

  // JOBS //////////////////////////////////////////////////////////////////////

  Future<GitLabPage> jobs(int projectId, {int page = 1, List<String>? scope}) => dao.getJsonPage(
    '/api/v4/projects/$projectId/jobs',
    page: page,
    queryParameters: {
      'order_by': 'id',
      'sort': 'desc',
      if (scope != null && scope.isNotEmpty) 'scope[]': scope,
    },
  );

  Future<Map<String, dynamic>> job(int projectId, int jobId) async => await dao.getJson('/api/v4/projects/$projectId/jobs/$jobId') as Map<String, dynamic>;

  // ARTIFACTS /////////////////////////////////////////////////////////////////

  /// Lists entries inside a job's artifact archive without extracting it.
  ///
  /// This endpoint only exists from GitLab 18.8, so a self-managed instance may
  /// not have it — see [GitLabDao.artifactBrowsingAvailable].
  Future<GitLabPage> artifactTree(
    int projectId,
    int jobId, {
    String? path,
    bool recursive = false,
    int page = 1,
    int perPage = 100,
  }) => dao.getJsonPage(
    '/api/v4/projects/$projectId/jobs/$jobId/artifacts/tree',
    page: page,
    perPage: perPage,
    queryParameters: {
      if (path != null && path.isNotEmpty) 'path': path,
      if (recursive) 'recursive': true,
    },
  );

  /// Every entry in a job's archive, following pagination to the end.
  ///
  /// Used by the quick-download rules, which have to regex-match against the
  /// full file list rather than one page of it.
  Future<List<Map<String, dynamic>>> artifactTreeAll(int projectId, int jobId, {String? path}) async {
    final all = <Map<String, dynamic>>[];
    int? page = 1;
    while (page != null) {
      final result = await artifactTree(projectId, jobId, path: path, recursive: true, page: page);
      all.addAll(result.items.map((e) => (e as Map).cast<String, dynamic>()));
      page = result.nextPage;
      // Guard against a pathological archive pinning the UI.
      if (all.length > 20000) break;
    }
    return all;
  }

  // INSTANCE //////////////////////////////////////////////////////////////////

  Future<Map<String, dynamic>> version() async => await dao.getJson('/api/v4/version') as Map<String, dynamic>;
}
