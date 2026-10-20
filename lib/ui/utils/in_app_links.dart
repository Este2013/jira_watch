/// Opening a link inside the app, when the app has a better view of it than a
/// browser does.
///
/// A link to a work item or a wiki page on the reader's own site points at
/// something this app already renders — with its history, its comments, its
/// attachments and its own navigation. Handing that to a browser throws all of
/// it away and asks them to sign in again. So a URL is checked against the site
/// the app is signed in to first, and only a genuinely external one is
/// launched.
///
/// Deliberately conservative: anything not recognisably one of those two, or
/// not on this site, goes to the browser untouched. A link that silently fails
/// to open is worse than one that opens in the wrong window.
library;

import 'package:flutter/material.dart';
import 'package:jira_watcher/dao/jira/jira_auth.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/jira_work_item_data.dart';
import 'package:jira_watcher/ui/confluence_widgets/confluence_adf.dart';
import 'package:jira_watcher/ui/confluence_widgets/confluence_workspace_view.dart';
import 'package:jira_watcher/ui/updates_widgets/issue_ui_elements.dart';
import 'package:jira_watcher/ui/updates_widgets/updates_view_single_work_item/single_work_item_view.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:url_launcher/url_launcher.dart';

/// What the app can show for itself.
enum InAppLinkKind {
  jiraWorkItem('Work item', Symbols.task_alt),
  confluencePage('Wiki page', Symbols.book_2);

  const InAppLinkKind(this.label, this.icon);

  final String label;
  final IconData icon;
}

/// A URL that points somewhere this app can open.
class InAppLink {
  const InAppLink(this.kind, this.id);

  final InAppLinkKind kind;

  /// The work item key, or the Confluence page id.
  final String id;
}

/// The work item key in a Jira URL.
///
/// `/browse/KEY` is the canonical shape. A board or backlog URL carries the
/// issue in `selectedIssue` instead, which is what the address bar holds when
/// someone copies a link while looking at a board.
String? _jiraKeyIn(Uri uri) {
  final selected = uri.queryParameters['selectedIssue']?.trim();
  if (selected != null && _keyPattern.hasMatch(selected)) return selected.toUpperCase();

  final segments = uri.pathSegments;
  final browseAt = segments.indexOf('browse');
  if (browseAt >= 0 && browseAt + 1 < segments.length) {
    final candidate = segments[browseAt + 1].trim();
    if (_keyPattern.hasMatch(candidate)) return candidate.toUpperCase();
  }
  return null;
}

final _keyPattern = RegExp(r'^[A-Za-z][A-Za-z0-9_]*-[0-9]+$');

/// Where [url] points, when that is somewhere this app can show — null for
/// everything else, including the same kinds of page on someone else's site.
InAppLink? inAppLinkFor(String url) {
  final site = JiraAuth().domain?.trim().toLowerCase();
  if (site == null || site.isEmpty) return null;

  final uri = Uri.tryParse(url.trim());
  if (uri == null || !uri.hasScheme || uri.host.toLowerCase() != site) return null;

  // The wiki lives under /wiki on an Atlassian Cloud site, and shares its host
  // with Jira — so which product a URL belongs to is a question about the path,
  // not the host.
  if (uri.pathSegments.contains('wiki')) {
    final pageId = confluencePageIdIn(url);
    return pageId == null ? null : InAppLink(InAppLinkKind.confluencePage, pageId);
  }

  final key = _jiraKeyIn(uri);
  return key == null ? null : InAppLink(InAppLinkKind.jiraWorkItem, key);
}

/// Opens [url] in the app where it can, and in the browser otherwise.
///
/// The two products are opened differently, and not arbitrarily: a work item
/// has a tab of its own to go to, where it keeps its place and its back
/// button. A wiki page has no equivalent — a Confluence tab is a *space*, and a
/// bare page id does not say which space it belongs to — so it opens in the
/// same reading dialog the Confluence view itself uses for a linked page.
Future<void> openLink(BuildContext context, String url) async {
  final destination = inAppLinkFor(url);
  if (destination == null) {
    await _launch(url);
    return;
  }

  switch (destination.kind) {
    case InAppLinkKind.confluencePage:
      await showConfluenceArticleDialog(context, destination.id);

    case InAppLinkKind.jiraWorkItem:
      // Inside a work item tab already: move within it, the way every other
      // issue reference in that tab does, rather than stacking a dialog over
      // the thing the reader is reading.
      final scope = IssueNavigationScope.maybeOf(context);
      if (scope != null) {
        scope.onOpen(destination.id);
        return;
      }
      final issue = await DataModel().jiraApi.workItem(destination.id);
      if (!context.mounted) return;
      // Jira would not give it up — it may be restricted, or deleted. The
      // browser at least shows the reader why.
      if (issue == null) {
        await _launch(url);
        return;
      }
      await showDialog(
        context: context,
        builder: (_) => SingleJiraWorkItemDialog(
          JiraWorkItemData(issue, lastCacheUpdate: DateTime.now()),
          initialTab: JiraWorkItemTab.details,
        ),
      );
  }
}

Future<void> _launch(String url) async {
  final uri = Uri.tryParse(url.trim());
  if (uri == null) return;
  await launchUrl(uri);
}
