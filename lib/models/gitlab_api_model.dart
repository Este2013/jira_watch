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
}
