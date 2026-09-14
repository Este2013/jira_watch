import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:jira_watcher/dao/gitlab_dao.dart';
import 'package:jira_watcher/dao/jira/jira_api.dart';
import 'package:jira_watcher/dao/jira/jira_auth.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/gitlab_tabs_model.dart';
import 'package:jira_watcher/models/jira_development_field.dart';
import 'package:jira_watcher/models/jira_work_item_data.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:jira_watcher/ui/home.dart';
import 'package:jira_watcher/ui/utils/expandable_panel.dart';

const Map<String, (String, IconData)> _categoryLabels = {
  'repository': ('Repositories', Symbols.folder_code),
  'branch': ('Branches', Symbols.fork_right),
  'commit': ('Commits', Symbols.commit),
  'pullrequest': ('Pull requests', Symbols.merge),
  'build': ('Builds', Symbols.conversion_path),
};

/// The Jira "Development" field, rendered as one card per linked category
/// (repositories, branches, commits, pull requests, builds) instead of the
/// raw pseudo-JSON string Jira serializes it as.
///
/// Two tiers of data, both sourced from Jira, not GitLab directly:
/// - [summary] (always available) comes straight from the field's own raw
///   value — aggregate counts per category, per connected source app.
/// - Per-category detail (actual branch names, commit messages, PR
///   statuses) requires a second, separate call per category to Jira's
///   dev-status API — which is undocumented, so this degrades to
///   summary-only for a category whenever that call fails or its response
///   doesn't look like what's expected, rather than showing nothing at all
///   for the whole field.
class DevelopmentFieldCard extends StatelessWidget {
  const DevelopmentFieldCard({super.key, required this.label, required this.summary, required this.workItem});

  final String label;
  final DevelopmentFieldSummary summary;
  final JiraWorkItemData workItem;

  @override
  Widget build(BuildContext context) {
    if (summary.isEmpty) {
      return Text('$label: nothing linked', style: TextStyle(color: Theme.of(context).hintColor));
    }

    return ExpandablePanel(
      label,
      suffix: !summary.isStale
          ? null
          : Tooltip(
              message: "Jira hasn't refreshed this since it was last opened there — counts may be out of date.",
              child: Icon(Symbols.sync_problem, size: 18, color: Theme.of(context).colorScheme.error),
            ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          for (final entry in summary.categories.entries)
            _DevelopmentCategory(
              key: Key(entry.key),
              dataType: entry.key,
              category: entry.value,
              issueId: workItem.databaseId,
              issueKey: workItem.key,
            ),
        ],
      ),
    );
  }
}

class _DevelopmentCategory extends StatelessWidget {
  const _DevelopmentCategory({super.key, required this.dataType, required this.category, required this.issueId, required this.issueKey});

  final String dataType;
  final DevelopmentFieldCategory category;
  final String? issueId;
  final String? issueKey;

  @override
  Widget build(BuildContext context) {
    final (title, icon) = _categoryLabels[dataType] ?? (dataType, Symbols.hub);
    final sourceNames = category.bySource.map((s) => s.name).toSet().join(', ');

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Row(
              spacing: 8,
              children: [
                Icon(icon, size: 20),
                Text('$title (${category.count})', style: Theme.of(context).textTheme.titleSmall),
                if (sourceNames.isNotEmpty) Text('via $sourceNames', style: TextStyle(color: Theme.of(context).hintColor)),
                if (dataType == 'build' && category.extra['failedBuildCount'] != null) ...[
                  const Spacer(),
                  _BuildTally(extra: category.extra),
                ],
              ],
            ),
            if (issueId == null || category.bySource.isEmpty)
              _ViewInJiraLink(issueKey: issueKey)
            else
              FutureBuilder<List<Map<String, dynamic>>>(
                future: _fetchDetail(issueId!, category, dataType),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Padding(padding: EdgeInsets.symmetric(vertical: 4), child: LinearProgressIndicator());
                  }
                  final items = snapshot.data ?? const [];
                  if (items.isEmpty) {
                    // Either the (undocumented, best-effort) dev-status call
                    // didn't pan out, or this category genuinely has no
                    // itemized detail beyond its own count — either way,
                    // Jira's own issue view is the fallback of last resort.
                    return _ViewInJiraLink(issueKey: issueKey);
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4,
                    children: [for (final item in items) _DevelopmentItemTile(dataType: dataType, item: item)],
                  );
                },
              ),
          ],
        ),
      ),
    );
  }

  /// Best-effort: tries every source this category was reported under
  /// (usually just one) and returns whatever the first successful call
  /// yields. Jira's dev-status API is undocumented — this endpoint, the
  /// `applicationType` value that actually works for a given integration,
  /// and the shape of a "successful" response are all inferred rather than
  /// specified anywhere, so failure here is expected on setups this hasn't
  /// been tried against yet.
  Future<List<Map<String, dynamic>>> _fetchDetail(String issueId, DevelopmentFieldCategory category, String dataType) async {
    for (final source in category.bySource) {
      final response = await JiraApi().developmentDetail(issueId: issueId, applicationType: source.instanceKey, dataType: dataType);
      final items = _extractDetailItems(response, dataType);
      if (items.isNotEmpty) return items;
    }
    return const [];
  }
}

/// Pulls whatever list of items looks right out of a dev-status detail
/// response, tolerant of more than one plausible shape — this endpoint has
/// no published schema to code against precisely.
List<Map<String, dynamic>> _extractDetailItems(Map<String, dynamic>? response, String dataType) {
  if (response == null) return const [];
  final detail = response['detail'];
  if (detail is! List) return const [];

  const pluralKeys = {'repository': 'repositories', 'branch': 'branches', 'commit': 'commits', 'pullrequest': 'pullRequests', 'build': 'builds'};
  final key = pluralKeys[dataType] ?? '${dataType}s';

  final items = <Map<String, dynamic>>[];
  for (final entry in detail) {
    if (entry is! Map) continue;
    final list = entry[key];
    if (list is List) items.addAll(list.whereType<Map>().map((m) => m.cast<String, dynamic>()));
  }
  return items;
}

class _BuildTally extends StatelessWidget {
  const _BuildTally({required this.extra});
  final Map<String, dynamic> extra;

  @override
  Widget build(BuildContext context) {
    final failed = extra['failedBuildCount'] as int? ?? 0;
    final succeeded = extra['successfulBuildCount'] as int? ?? 0;
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        if (succeeded > 0) _tally(context, Symbols.check_circle, Colors.green, succeeded),
        if (failed > 0) _tally(context, Symbols.cancel, Theme.of(context).colorScheme.error, failed),
      ],
    );
  }

  Widget _tally(BuildContext context, IconData icon, Color color, int count) => Row(
    mainAxisSize: MainAxisSize.min,
    spacing: 2,
    children: [
      Icon(icon, size: 14, color: color),
      Text('$count'),
    ],
  );
}

class _ViewInJiraLink extends StatelessWidget {
  const _ViewInJiraLink({required this.issueKey});
  final String? issueKey;

  @override
  Widget build(BuildContext context) {
    final site = JiraAuth().siteUrl;
    if (site == null || issueKey == null) return const SizedBox.shrink();
    return TextButton.icon(
      onPressed: () => launchUrl(Uri.parse('$site/browse/$issueKey')),
      icon: const Icon(Symbols.open_in_new, size: 16),
      label: const Text('View in Jira'),
    );
  }
}

/// One branch/commit/pull-request/build/repository, formatted by whichever
/// of its fields are actually present — undocumented API, so this reads
/// defensively rather than assuming every field dev-status might send.
class _DevelopmentItemTile extends StatelessWidget {
  const _DevelopmentItemTile({required this.dataType, required this.item});

  final String dataType;
  final Map<String, dynamic> item;

  String? get _title => (item['name'] ?? item['displayId'] ?? item['id'])?.toString();
  String? get _url => item['url']?.toString();
  String? get _status => item['status']?.toString() ?? item['state']?.toString();

  DateTime? get _timestamp {
    final raw = item['lastUpdated'] ?? item['authorTimestamp'] ?? item['createdDate'] ?? item['timestamp'];
    if (raw is! String) return null;
    return DateTime.tryParse(raw);
  }

  @override
  Widget build(BuildContext context) {
    final title = _title;
    if (title == null) return const SizedBox.shrink();
    final timestamp = _timestamp;

    return InkWell(
      onTap: dataType == 'branch' ? () => _openBranch(context) : (_url == null ? null : () => launchUrl(Uri.parse(_url!))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          spacing: 8,
          children: [
            Flexible(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(decoration: _url != null ? TextDecoration.underline : null),
              ),
            ),
            if (_status != null) _StatusChip(status: _status!),
            if (timestamp != null) Text(_relativeTime(timestamp), style: TextStyle(color: Theme.of(context).hintColor, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  /// A branch is the one item type worth trying to open inside this app's
  /// own GitLab view rather than just a browser tab — everything else
  /// (a build, a PR) is either already a GitLab-hosted page with no
  /// matching in-app view, or (a commit) not worth a whole tab for.
  Future<void> _openBranch(BuildContext context) async {
    final repoName = (item['repository'] as Map?)?['name']?.toString();
    final branchName = item['name']?.toString();
    if (repoName == null || branchName == null || !GitLabDao().isConnected) {
      await _openExternally(context);
      return;
    }

    final tab = await _findGitLabProject(repoName);
    if (tab == null) {
      if (!context.mounted) return;
      await _openExternally(context);
      return;
    }

    currentHomePage.value = HomePage.gitlab;
    DataModel().gitlabTabs.openProject(tab);
  }

  Future<GitLabProjectTab?> _findGitLabProject(String repoName) async {
    try {
      final page = await DataModel().gitlab.searchProjects(search: repoName);
      for (final project in page.items) {
        final p = project as Map;
        final path = p['path_with_namespace']?.toString();
        final name = p['name']?.toString();
        if (path?.toLowerCase() == repoName.toLowerCase() || name?.toLowerCase() == repoName.toLowerCase()) {
          return GitLabProjectTab(
            projectId: p['id'] as int,
            pathWithNamespace: path ?? repoName,
            name: name ?? repoName,
            avatarUrl: p['avatar_url'] as String?,
            webUrl: p['web_url'] as String?,
            subView: GitLabSubView.branches,
          );
        }
      }
    } on Object {
      // Best effort — falling through to the external-browser path below is
      // exactly as good a fallback for "couldn't reach GitLab" as for "no match".
    }
    return null;
  }

  Future<void> _openExternally(BuildContext context) async {
    final url = _url;
    if (url == null) return;

    final remember = SettingsModel().openGitlabLinksExternally.value;
    if (remember == true) {
      launchUrl(Uri.parse(url));
      return;
    }

    if (!context.mounted) return;
    final choice = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Open in browser?'),
        content: const Text("This branch isn't in a GitLab project you have open in this app, so it'll open in your browser instead."),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Just this once')),
          FilledButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Always')),
        ],
      ),
    );
    if (choice == null) return;
    if (choice) SettingsModel().openGitlabLinksExternally.value = true;
    launchUrl(Uri.parse(url));
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.status});
  final String status;

  @override
  Widget build(BuildContext context) {
    final upper = status.toUpperCase();
    final color = switch (upper) {
      'OPEN' || 'OPENED' => Colors.blue,
      'MERGED' => Colors.purple,
      'DECLINED' || 'CLOSED' => Theme.of(context).colorScheme.error,
      'SUCCESSFUL' || 'SUCCESS' => Colors.green,
      'FAILED' => Theme.of(context).colorScheme.error,
      _ => Theme.of(context).hintColor,
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(color: color.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(4)),
      child: Text(
        status,
        style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w600),
      ),
    );
  }
}

String _relativeTime(DateTime time) {
  final diff = DateTime.now().difference(time);
  if (diff.inDays >= 1) return '${diff.inDays} day${diff.inDays == 1 ? '' : 's'} ago';
  if (diff.inHours >= 1) return '${diff.inHours} hour${diff.inHours == 1 ? '' : 's'} ago';
  if (diff.inMinutes >= 1) return '${diff.inMinutes} minute${diff.inMinutes == 1 ? '' : 's'} ago';
  return 'just now';
}
