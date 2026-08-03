import 'package:flutter/material.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/gitlab_tabs_model.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_paginated_list.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_status.dart';
import 'package:jira_watcher/ui/gitlab_widgets/views/gitlab_artifacts_view.dart';
import 'package:jira_watcher/ui/gitlab_widgets/views/gitlab_pipelines_view.dart';
import 'package:jira_watcher/ui/utils/time_utils.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:url_launcher/url_launcher.dart';

class GitLabJobsView extends StatefulWidget {
  const GitLabJobsView({super.key, required this.tab});

  final GitLabProjectTab tab;

  @override
  State<GitLabJobsView> createState() => _GitLabJobsViewState();
}

class _GitLabJobsViewState extends State<GitLabJobsView> {
  static const _scopeOptions = <String?>[null, 'success', 'failed', 'running', 'pending', 'canceled', 'skipped', 'manual'];

  int _reloadToken = 0;

  String? get _scope => widget.tab.viewState['jobScope'] as String?;
  set _scope(String? value) {
    widget.tab.viewState['jobScope'] = value;
    DataModel().gitlabTabs.requestSave();
  }

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          spacing: 8,
          children: [
            DropdownMenu<String?>(
              initialSelection: _scope,
              enableSearch: false,
              requestFocusOnTap: false,
              label: const Text('Status'),
              dropdownMenuEntries: [
                for (final scope in _scopeOptions)
                  DropdownMenuEntry(
                    value: scope,
                    label: scope == null ? 'Any status' : GitLabStatus.from(scope).label,
                    leadingIcon: scope == null ? null : Icon(GitLabStatus.from(scope).icon, size: 18, color: GitLabStatus.from(scope).color),
                  ),
              ],
              onSelected: (value) => setState(() {
                _scope = value;
                _reloadToken++;
              }),
            ),
            const Spacer(),
            IconButton(
              tooltip: 'Refresh',
              icon: const Icon(Symbols.refresh),
              onPressed: () => setState(() => _reloadToken++),
            ),
          ],
        ),
      ),
      const Divider(height: 1),
      Expanded(
        child: GitLabPaginatedList(
          key: ValueKey('jobs|${widget.tab.projectId}|$_scope|$_reloadToken'),
          emptyMessage: 'No jobs match this filter.',
          separated: true,
          fetchPage: (page) => DataModel().gitlab.jobs(
            widget.tab.projectId,
            page: page,
            scope: _scope == null ? null : [_scope!],
          ),
          itemBuilder: (context, job, _) => GitLabJobRow(tab: widget.tab, job: job),
        ),
      ),
    ],
  );
}

/// One job row, shared by the Jobs view and the Artifacts view.
class GitLabJobRow extends StatelessWidget {
  const GitLabJobRow({super.key, required this.tab, required this.job});

  final GitLabProjectTab tab;
  final Map<String, dynamic> job;

  bool get hasArchive => (job['artifacts'] as List?)?.any((a) => (a as Map)['file_type'] == 'archive') ?? false;

  int? get _archiveSize {
    final artifacts = job['artifacts'] as List?;
    if (artifacts == null) return null;
    for (final a in artifacts) {
      if ((a as Map)['file_type'] == 'archive') return (a['size'] as num?)?.toInt();
    }
    return null;
  }

  static String formatBytes(int? value) {
    if (value == null) return '';
    if (value < 1024) return '$value B';
    if (value < 1024 * 1024) return '${(value / 1024).toStringAsFixed(0)} KB';
    if (value < 1024 * 1024 * 1024) return '${(value / (1024 * 1024)).toStringAsFixed(1)} MB';
    return '${(value / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
  }

  @override
  Widget build(BuildContext context) {
    final status = GitLabStatus.from(job['status'] as String?);
    final pipeline = job['pipeline'] as Map?;
    final webUrl = job['web_url'] as String?;
    final expiresAt = job['artifacts_expire_at'] as String?;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        spacing: 12,
        children: [
          GitLabStatusChip(status: status),
          SizedBox(
            width: 84,
            child: Text('#${job['id']}', style: const TextStyle(fontFamily: 'RobotoMono')),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${job['name']}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Row(
                  spacing: 6,
                  children: [
                    Text('${job['stage']}', style: Theme.of(context).textTheme.bodySmall),
                    const Text('·'),
                    const Icon(Symbols.fork_right, size: 13),
                    Flexible(
                      child: Text('${job['ref'] ?? ''}', maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodySmall),
                    ),
                    if (pipeline != null) ...[
                      const Text('·'),
                      Text('pipeline #${pipeline['iid'] ?? pipeline['id']}', style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: 70,
            child: Text(
              formatGitLabDuration(job['duration'] as num?),
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.end,
            ),
          ),
          SizedBox(
            width: 96,
            child: Text(
              timeAgo(timeStr: (job['finished_at'] ?? job['created_at']) as String?),
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.end,
            ),
          ),
          if (hasArchive) ...[
            Tooltip(
              message: expiresAt == null ? 'Artifacts do not expire' : 'Artifacts expire ${timeAgo(timeStr: expiresAt)}',
              child: Text(
                formatBytes(_archiveSize),
                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).hintColor),
              ),
            ),
            IconButton(
              tooltip: 'Browse artifacts',
              visualDensity: VisualDensity.compact,
              icon: const Icon(Symbols.folder_open),
              onPressed: () => showGitLabArtifactBrowser(context, tab, job),
            ),
            IconButton(
              tooltip: 'Download artifacts archive',
              visualDensity: VisualDensity.compact,
              icon: const Icon(Symbols.download),
              onPressed: () => downloadJobArchive(context, tab, job),
            ),
          ] else
            SizedBox(
              width: 96,
              child: Text(
                'no artifacts',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).disabledColor),
              ),
            ),
          if (webUrl != null)
            IconButton(
              tooltip: 'Open in browser',
              visualDensity: VisualDensity.compact,
              icon: const Icon(Symbols.open_in_browser),
              onPressed: () => launchUrl(Uri.parse(webUrl)),
            ),
        ],
      ),
    );
  }
}
