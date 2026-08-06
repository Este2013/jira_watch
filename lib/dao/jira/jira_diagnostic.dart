import 'dart:async';

import 'package:jira_platform_api/api.dart' as jira;
import 'package:jira_watcher/dao/api_dao.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:loggy/loggy.dart';

/// Exercises the generated Jira client against the real site, before anything in
/// the app depends on it.
///
/// The package's own tests stub the network with hand-written JSON, which cannot
/// catch the failure that actually matters: a real response deserialising wrongly
/// because the spec describes a field loosely. This runs the same three calls the
/// app makes, against real credentials, and reports what came back.
///
/// Deliberately read-only, and deliberately reads credentials from the existing
/// [APIDao] rather than replacing it — so this can be checked while the app still
/// runs entirely on the old layer.
Stream<String> diagnoseJiraApi() async* {
  final dao = APIDao();
  await dao.load();

  yield 'Credentials';
  yield '  site:  ${dao.domain ?? "(none)"}';
  yield '  email: ${dao.email ?? "(none)"}';
  yield '  token: ${dao.apiKey == null ? "(none)" : "present, ${dao.apiKey!.length} chars"}';

  if (!dao.isReady) {
    yield '';
    yield 'No usable credentials, so there is nothing to test. Sign in first.';
    return;
  }

  final client = jira.ApiClient(
    basePath: 'https://${dao.domain}',
    authentication: jira.HttpBasicAuth(username: dao.email!, password: dao.apiKey!),
  );
  yield '  basePath resolved to ${client.basePath}';

  // 1. Who am I ---------------------------------------------------------------
  yield '';
  yield 'GET /myself through the generated client ...';
  final jira.User? me;
  try {
    final started = DateTime.now();
    me = await jira.MyselfApi(client).getCurrentUser();
    yield '  ${DateTime.now().difference(started).inMilliseconds} ms';
  } on jira.ApiException catch (e) {
    yield '  FAILED ${e.code}: ${e.message}';
    yield e.code == 401
        ? '  A 401 means the email and API token were rejected.'
        : '  Unexpected status; the request reached Jira but was refused.';
    return;
  } on Object catch (e) {
    yield '  FAILED before Jira answered: $e';
    return;
  }

  if (me == null) {
    yield '  Jira answered but the body did not deserialise into a User.';
    return;
  }
  yield '  accountId:   ${me.accountId}';
  yield '  displayName: ${me.displayName}';
  yield '  active:      ${me.active}';

  // Compared against the layer the app still uses, because matching account ids
  // is the cheapest proof that swapping one for the other is safe.
  yield '';
  yield 'Cross-checking against the current APIModel path ...';
  try {
    final legacy = await dao.myself();
    final matches = legacy.statusCode == 200 && legacy.body.contains('"accountId":"${me.accountId}"');
    yield legacy.statusCode == 200
        ? (matches
              ? '  Both paths report the same account. Equivalent.'
              : '  Both succeeded but reported DIFFERENT accounts — investigate before migrating.')
        : '  The old path returned ${legacy.statusCode} while the new one succeeded.';
  } on Object catch (e) {
    yield '  The old path threw while the new one succeeded: $e';
  }

  // 2. A JQL search, the app's busiest call ------------------------------------
  //
  // Bounded on purpose. /search/jql refuses an unrestricted query outright —
  // "Unbounded JQL queries are not allowed here" — so this mirrors how the app
  // builds its own filter, from the starred projects, rather than asking for
  // everything. Anything migrated onto this endpoint has to stay bounded too.
  final starred = SettingsModel().starredProjects.value?.map((k) => k.trim()).where((k) => k.isNotEmpty).toList() ?? const [];
  final jql = starred.isEmpty
      // Still bounded, just by time instead, so this works before any project is starred.
      ? 'updated >= -14d ORDER BY updated DESC'
      : 'project in (${starred.join(",")}) ORDER BY updated DESC';

  yield '';
  yield 'GET /search/jql through the generated client ...';
  yield '  jql: $jql';
  String? sampleKey;
  try {
    final started = DateTime.now();
    final results = await jira.IssueSearchApi(client).searchAndReconsileIssuesUsingJql(
      jql: jql,
      maxResults: 3,
      fields: ['summary', 'updated', 'status'],
    );
    yield '  ${DateTime.now().difference(started).inMilliseconds} ms';
    final issues = results?.issues ?? const [];
    yield '  returned ${issues.length} issue(s)';
    for (final issue in issues) {
      yield '    ${issue.key}  ${(issue.fields)?['summary'] ?? "(no summary field)"}';
    }
    sampleKey = issues.isEmpty ? null : issues.first.key;
  } on jira.ApiException catch (e) {
    yield '  FAILED ${e.code}: ${e.message}';
    if (e.code == 400 && '${e.message}'.contains('Unbounded')) {
      yield '  The query needs a restriction — star a project, or narrow it by date.';
    }
  } on Object catch (e) {
    yield '  FAILED: $e';
  }

  // 3. One issue, checking the boundary the renderer depends on ---------------
  if (sampleKey == null) {
    yield '';
    yield 'No issue to fetch, so the single-issue check was skipped.';
    return;
  }

  yield '';
  yield 'GET /issue/$sampleKey with a changelog and comments ...';
  try {
    final started = DateTime.now();
    final issue = await jira.IssuesApi(client).getIssue(
      sampleKey,
      fields: ['summary', 'description', 'comment', 'status', 'assignee'],
      expand: 'changelog',
    );
    yield '  ${DateTime.now().difference(started).inMilliseconds} ms';

    if (issue == null) {
      yield '  Jira answered but the body did not deserialise into an IssueBean.';
      return;
    }
    yield '  key:    ${issue.key}';
    yield '  fields: ${issue.fields?.keys.length ?? 0} present';

    // The check that matters most for the migration. The spec does not describe
    // Atlassian Document Format at all — Comment.body carries only a prose
    // description — so the generator types these as untyped objects and the app's
    // AdfRenderer keeps consuming raw maps exactly as it does today. If these
    // arrive as anything other than a map, the renderer boundary has moved and
    // AdfRenderer would need rework.
    final description = issue.fields?['description'];
    yield '';
    yield 'Atlassian Document Format boundary';
    yield '  description runtime type: ${description.runtimeType}';
    if (description is Map) {
      yield '  arrives as a map, with keys ${description.keys.take(4).toList()}';
      yield '  AdfRenderer can consume this unchanged.';
    } else if (description == null) {
      yield '  this issue has no description; try another to check ADF.';
    } else {
      yield '  NOT a map — AdfRenderer expects a map, so this needs looking at.';
    }

    final comment = issue.fields?['comment'];
    if (comment is Map) {
      final comments = comment['comments'];
      yield '  comments: ${comments is List ? comments.length : "?"} '
          '(body type: ${comments is List && comments.isNotEmpty ? (comments.first as Map)['body'].runtimeType : "n/a"})';
    }

    final changelog = issue.changelog;
    yield '  changelog entries: ${changelog?.histories?.length ?? 0}';
  } on jira.ApiException catch (e) {
    yield '  FAILED ${e.code}: ${e.message}';
  } on Object catch (e, s) {
    logError('Jira diagnostic failed fetching $sampleKey: $e\n$s');
    yield '  FAILED: $e';
  }

  yield '';
  yield 'Done. Every call above went through the generated client; the app itself';
  yield 'is still running on the old layer.';
}
