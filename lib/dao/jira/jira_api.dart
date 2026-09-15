import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jira_platform_api/api.dart' as jira;
import 'package:jira_software_api/api.dart' as agile;
import 'package:jira_watcher/dao/jira/jira_auth.dart';
import 'package:jira_watcher/models/jira_work_item_data.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:loggy/loggy.dart';

/// Jira access for the app.
///
/// Two layers on purpose. The generated API classes are exposed directly, so any
/// of the 721 published operations is reachable without adding a method here —
/// that was the whole point of generating them. On top sit the handful of
/// conveniences the app already had, which deliberately return **raw decoded
/// JSON** rather than typed models.
///
/// That raw boundary is not laziness. `JiraWorkItemData`, the update views and
/// `AdfRenderer` all read untyped maps today, and Atlassian Document Format is
/// not described by the spec at all — `Comment.body` carries a prose description
/// and no type, so the generator emits `Object?` regardless. Typing these paths
/// would mean rewriting the renderer for no gain. New code should prefer the
/// typed API classes below.
class JiraApi with GlobalLoggy {
  static final JiraApi _instance = JiraApi._internal();

  factory JiraApi() => _instance;

  JiraApi._internal() {
    // Credentials can change while running — the sign-in screen writes them — so
    // a cached client has to be discarded rather than kept pointing at the old site.
    JiraAuth().addListener(_invalidateClients);
  }

  jira.ApiClient? _platformClient;
  agile.ApiClient? _agileClient;

  void _invalidateClients() {
    _platformClient = null;
    _agileClient = null;
  }

  jira.ApiClient get client => _platformClient ??= jira.ApiClient(
    basePath: JiraAuth().siteUrl ?? 'https://unconfigured.invalid',
    authentication: JiraAuth().authentication,
  );

  agile.ApiClient get agileClient => _agileClient ??= agile.ApiClient(
    basePath: JiraAuth().siteUrl ?? 'https://unconfigured.invalid',
    authentication: agile.HttpBasicAuth(username: JiraAuth().email ?? '', password: JiraAuth().apiToken ?? ''),
  );

  // The generated surface. Anything not covered by a convenience below is one of
  // these, or one of the ~90 other classes constructed the same way.
  jira.MyselfApi get myselfApi => jira.MyselfApi(client);
  jira.IssuesApi get issues => jira.IssuesApi(client);
  jira.IssueSearchApi get search => jira.IssueSearchApi(client);
  jira.ProjectsApi get projects => jira.ProjectsApi(client);
  jira.IssueCommentsApi get comments => jira.IssueCommentsApi(client);
  jira.IssueWorklogsApi get worklogs => jira.IssueWorklogsApi(client);
  jira.IssueAttachmentsApi get attachments => jira.IssueAttachmentsApi(client);
  jira.IssueFieldsApi get fieldsApi => jira.IssueFieldsApi(client);
  jira.IssueRemoteLinksApi get remoteLinksApi => jira.IssueRemoteLinksApi(client);
  jira.JQLApi get jql => jira.JQLApi(client);
  agile.BoardApi get boards => agile.BoardApi(agileClient);
  agile.SprintApi get sprints => agile.SprintApi(agileClient);

  /// Fields the single-work-item view renders itself, so it can offer to hide
  /// them from the raw field dump.
  static const defaultFields = [
    'assignee',
    'attachment',
    'comment',
    'components',
    'created',
    'creator',
    'description',
    'environment',
    'fixVersions',
    'issuelinks',
    'issuetype',
    'labels',
    'lastViewed',
    'priority',
    'project',
    'reporter',
    'resolutiondate',
    'status',
    'statusCategory',
    'statuscategorychangedate',
    'summary',
    'updated',
    'versions',
    'watches',
  ];

  // CURRENT USER //////////////////////////////////////////////////////////////

  Map<String, dynamic>? _cachedMyself;

  /// The signed-in user, as a raw map.
  ///
  /// Cached because several widgets ask "is this me?" while rendering, and it
  /// cannot change without the credentials changing.
  Future<Map<String, dynamic>?> myself({bool allowCache = true}) async {
    if (allowCache && _cachedMyself != null) return _cachedMyself;
    final response = await myselfApi.getCurrentUserWithHttpInfo();
    if (response.statusCode != 200) {
      loggy.warning('GET /myself returned ${response.statusCode}');
      return null;
    }
    return _cachedMyself = _decode(response);
  }

  /// The raw response, for the one caller that needs the status code: startup
  /// distinguishes an expired token (401) from any other failure.
  Future<http.Response> myselfRaw() => myselfApi.getCurrentUserWithHttpInfo();

  // WORK ITEMS ////////////////////////////////////////////////////////////////

  /// A single work item as raw JSON, which is what [JiraWorkItemData] and the
  /// views consume.
  Future<Map<String, dynamic>?> workItem(String key, {List<String> expand = const []}) async {
    final response = await issues.getIssueWithHttpInfo(
      key,
      expand: expand.isEmpty ? null : expand.join(','),
    );
    if (response.statusCode != 200) {
      loggy.warning('GET /issue/$key returned ${response.statusCode}');
      return null;
    }
    return _decode(response);
  }

  /// A JQL search, as raw JSON.
  ///
  /// The endpoint rejects an unrestricted query outright — "Unbounded JQL queries
  /// are not allowed here" — so every caller has to narrow it, by project or by
  /// date. That is a constraint of the endpoint, not of this method.
  Future<Map<String, dynamic>?> jqlSearch(
    String jql, {
    int maxResults = 0,
    String? nextPageToken,
    List<String> fields = const ['id'],
    List<String> expand = const [],
  }) async {
    final response = await search.searchAndReconsileIssuesUsingJqlWithHttpInfo(
      jql: jql,
      maxResults: maxResults == 0 ? null : maxResults,
      nextPageToken: nextPageToken,
      fields: fields,
      expand: expand.isEmpty ? null : expand.join(','),
    );
    if (response.statusCode != 200) {
      loggy.warning('GET /search/jql returned ${response.statusCode}: ${response.body}');
      return null;
    }
    return _decode(response);
  }

  /// The updates list: work items ordered by recency, one page at a time.
  ///
  /// [extraClauses] are ANDed in as-is — the property filters build them, and
  /// they are the one part of the query this method does not write itself.
  ///
  /// Returns the items, whether this was the last page, and the token for the
  /// next one.
  Future<(Iterable<JiraWorkItemData>, bool, String?)> lastUpdatedWorkItems({
    int maxResults = 0,
    DateTime? before,
    DateTime? after,
    List<String>? filterByProjectCodes,
    List<String> extraClauses = const [],
    String? nextPageToken,
  }) async {
    final starred = SettingsModel().starredProjects.value?.toSet() ?? {};
    final keys = filterByProjectCodes?.join(', ') ?? starred.map((k) => k.trim()).where((k) => k.isNotEmpty).join(',');

    // Bounded by project, which is also what keeps the endpoint from rejecting it.
    final clauses = <String>[
      if (keys.isNotEmpty) 'project in ($keys)',
      if (before != null) 'updated <= "${_jiraDate(before)}"',
      if (after != null) 'updated >= "${_jiraDate(after)}"',
      ...extraClauses,
    ];
    final jql = '${clauses.join(' AND ')} ORDER BY updated DESC';

    final data = await jqlSearch(
      jql,
      maxResults: maxResults,
      nextPageToken: nextPageToken,
      fields: ['*all'],
      expand: ['changelog'],
    );
    if (data == null) return (const <JiraWorkItemData>[], true, null);

    final now = DateTime.now();
    final issues = (data['issues'] as List? ?? const []).map((e) => JiraWorkItemData(e, lastCacheUpdate: now));
    return (issues, data['isLast'] as bool? ?? true, data['nextPageToken'] as String?);
  }

  // JQL AUTOCOMPLETE //////////////////////////////////////////////////////////

  /// The values Jira itself would suggest for [fieldName] in a JQL query,
  /// optionally narrowed to those matching [query].
  ///
  /// Each suggestion carries the literal to put in the query (`value`) and what
  /// to show the user (`displayName`) — the two differ wherever a field is
  /// backed by ids, which is exactly where filtering by display name would
  /// break on a rename. Site-wide rather than per-project: this endpoint takes
  /// no project, so a project tab narrows the results, not the suggestions.
  ///
  /// Returns nothing rather than throwing when the field cannot be
  /// autocompleted (Jira answers 400 for those), which the picker shows as an
  /// empty list.
  Future<List<jira.AutoCompleteSuggestion>> fieldSuggestions(String fieldName, {String? query}) async {
    try {
      final data = await jql.getFieldAutoCompleteForQueryString(
        fieldName: fieldName,
        fieldValue: (query == null || query.isEmpty) ? null : query,
      );
      return data?.results ?? const [];
    } on jira.ApiException catch (e) {
      loggy.warning('No autocomplete for JQL field $fieldName: ${e.code}');
      return const [];
    }
  }

  jira.JQLReferenceData? _jqlReferenceCache;

  /// What Jira's own query editor knows about this site: every field it can be
  /// queried by, and every function that can stand in for a value
  /// (`currentUser()`, `openSprints()`…). Cached — it only moves when an admin
  /// adds or removes a field.
  Future<jira.JQLReferenceData?> jqlReferenceData({bool refresh = false}) async {
    if (_jqlReferenceCache != null && !refresh) return _jqlReferenceCache;
    try {
      return _jqlReferenceCache = await jql.getAutoComplete();
    } on jira.ApiException catch (e) {
      loggy.warning('GET /jql/autocompletedata returned ${e.code}');
      return null;
    }
  }

  /// The fields behind the custom property filter's menu.
  Future<List<jira.FieldReferenceData>> jqlFields({bool refresh = false}) async =>
      (await jqlReferenceData(refresh: refresh))?.visibleFieldNames ?? const [];

  /// The JQL functions this site offers, for the smart values a picker can
  /// offer alongside the literal ones.
  Future<List<jira.FunctionReferenceData>> jqlFunctions({bool refresh = false}) async =>
      (await jqlReferenceData(refresh: refresh))?.visibleFunctionNames ?? const [];

  // PROJECTS //////////////////////////////////////////////////////////////////

  Future<List<dynamic>> allProjects() async {
    final response = await projects.getAllProjectsWithHttpInfo();
    if (response.statusCode != 200) {
      loggy.warning('GET /project returned ${response.statusCode}');
      return const [];
    }
    return jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;
  }

  Future<Map<String, dynamic>?> project(String keyOrId, {List<String>? expand}) async {
    final response = await projects.getProjectWithHttpInfo(
      keyOrId,
      expand: (expand == null || expand.isEmpty) ? null : expand.join(','),
    );
    if (response.statusCode != 200) {
      loggy.warning('GET /project/$keyOrId returned ${response.statusCode}');
      return null;
    }
    return _decode(response);
  }

  // REMOTE LINKS //////////////////////////////////////////////////////////////

  /// This issue's "Web Links" — added via Jira's own Link > paste-a-URL
  /// flow. Entirely separate from `issuelinks` (issue-to-issue links,
  /// already part of the issue's own `fields`) and from custom fields, so
  /// this is its own endpoint.
  ///
  /// Raw JSON, not the generated typed response: the spec's `200` schema
  /// for this endpoint is a single object rather than the array the API
  /// actually returns, so the generated `getRemoteIssueLinks()` decodes
  /// wrong — `getRemoteIssueLinksWithHttpInfo` sidesteps that.
  Future<List<dynamic>> remoteLinks(String issueIdOrKey) async {
    final response = await remoteLinksApi.getRemoteIssueLinksWithHttpInfo(issueIdOrKey);
    if (response.statusCode != 200) {
      loggy.warning('GET /issue/$issueIdOrKey/remotelink returned ${response.statusCode}');
      return const [];
    }
    return jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;
  }

  // DEVELOPMENT (dev-status) ////////////////////////////////////////////////////

  /// Branch/commit/pull-request/build detail behind a "Development" field's
  /// summary. Jira's dev-status API — undocumented, not part of the public
  /// REST spec, so there is no generated client for it, no guarantee this
  /// endpoint or its parameters stay stable, and no confirmed set of valid
  /// [applicationType] values; it is whatever key the field's own summary
  /// reported this data under. Returns null on anything unexpected rather
  /// than throwing — every caller treats that identically to "no detail
  /// available", falling back to the summary counts alone.
  Future<Map<String, dynamic>?> developmentDetail({required String issueId, required String applicationType, required String dataType}) async {
    final site = JiraAuth().siteUrl;
    if (site == null) return null;
    final uri = Uri.parse(
      '$site/rest/dev-status/1.0/issue/detail',
    ).replace(queryParameters: {'issueId': issueId, 'applicationType': applicationType, 'dataType': dataType});
    try {
      final response = await authenticatedGet(uri);
      if (response.statusCode != 200) {
        loggy.warning('GET /rest/dev-status/1.0/issue/detail ($dataType via $applicationType) returned ${response.statusCode}');
        return null;
      }
      return jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    } on Object catch (e) {
      loggy.warning('GET /rest/dev-status/1.0/issue/detail ($dataType via $applicationType) failed: $e');
      return null;
    }
  }

  // FIELDS ////////////////////////////////////////////////////////////////////

  /// Every field this site knows about — built in and custom — with each
  /// one's display name and schema (type). Raw issue JSON only ever carries
  /// a custom field's id (`customfield_10056`); this is what turns that back
  /// into something a reader recognizes and a renderer knows how to format.
  /// Typed, unlike most of this class's conveniences — [FieldDetails]
  /// already fully describes this response, no ADF-shaped surprises here.
  Future<List<jira.FieldDetails>> allFields() async {
    try {
      return await fieldsApi.getFields() ?? const [];
    } on jira.ApiException catch (e) {
      loggy.warning('GET /field returned ${e.code}: ${e.message}');
      return const [];
    }
  }

  // RAW ///////////////////////////////////////////////////////////////////////

  /// An authenticated GET at an arbitrary URL on the site.
  ///
  /// For content the API describes only as a link — attachment bodies, media —
  /// where there is no typed operation to call.
  Future<http.Response> authenticatedGet(Uri uri, {Map<String, String>? headers}) => http.get(
    uri,
    headers: {
      'Authorization': JiraAuth().authHeader,
      'Accept': '*/*',
      ...?headers,
    },
  );

  /// Decoded as UTF-8 explicitly: Jira serves summaries and comments containing
  /// non-ASCII, and `response.body` would decode them as latin-1.
  Map<String, dynamic> _decode(http.Response response) => jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

  static String _jiraDate(DateTime d) => d.toIso8601String().replaceAll('T', ' ').substring(0, 16);
}
