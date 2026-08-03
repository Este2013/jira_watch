import 'package:flutter/material.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/gitlab_tabs_model.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_images.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_paginated_list.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_status.dart';
import 'package:jira_watcher/ui/utils/time_utils.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:url_launcher/url_launcher.dart';

class GitLabMergeRequestsView extends StatefulWidget {
  const GitLabMergeRequestsView({super.key, required this.tab});

  final GitLabProjectTab tab;

  @override
  State<GitLabMergeRequestsView> createState() => _GitLabMergeRequestsViewState();
}

class _GitLabMergeRequestsViewState extends State<GitLabMergeRequestsView> {
  static const _states = ['opened', 'merged', 'closed', 'all'];

  int _reloadToken = 0;

  String get _state => (widget.tab.viewState['mrState'] as String?) ?? 'opened';
  set _state(String value) {
    widget.tab.viewState['mrState'] = value;
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
            SegmentedButton<String>(
              style: SegmentedButton.styleFrom(visualDensity: VisualDensity.compact),
              segments: [
                for (final state in _states)
                  ButtonSegment(
                    value: state,
                    label: Text(state == 'all' ? 'All' : '${state[0].toUpperCase()}${state.substring(1)}'),
                  ),
              ],
              selected: {_state},
              multiSelectionEnabled: false,
              showSelectedIcon: false,
              onSelectionChanged: (selection) => setState(() {
                _state = selection.first;
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
          key: ValueKey('mrs|${widget.tab.projectId}|$_state|$_reloadToken'),
          emptyMessage: 'No ${_state == 'all' ? '' : '$_state '}merge requests.',
          separated: true,
          fetchPage: (page) => DataModel().gitlab.mergeRequests(widget.tab.projectId, page: page, state: _state),
          itemBuilder: (context, mr, _) => _MergeRequestRow(mergeRequest: mr),
        ),
      ),
    ],
  );
}

class _MergeRequestRow extends StatelessWidget {
  const _MergeRequestRow({required this.mergeRequest});

  final Map<String, dynamic> mergeRequest;

  (String, IconData, Color) get _stateBadge => switch (mergeRequest['state']) {
    'merged' => ('Merged', Symbols.merge, const Color(0xFF6E49CB)),
    'closed' => ('Closed', Symbols.cancel, const Color(0xFFDD2B0E)),
    'locked' => ('Locked', Symbols.lock, const Color(0xFF737278)),
    _ => ('Open', Symbols.pending_actions, const Color(0xFF108548)),
  };

  @override
  Widget build(BuildContext context) {
    final (stateLabel, stateIcon, stateColor) = _stateBadge;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = isDark ? HSLColor.fromColor(stateColor).withLightness(.65).toColor() : stateColor;

    final author = mergeRequest['author'] as Map?;
    final isDraft = mergeRequest['draft'] == true;
    final hasConflicts = mergeRequest['has_conflicts'] == true;
    final notes = (mergeRequest['user_notes_count'] as num?)?.toInt() ?? 0;
    final labels = (mergeRequest['labels'] as List?)?.cast<String>() ?? const <String>[];
    final headPipeline = mergeRequest['head_pipeline'] as Map?;
    final webUrl = mergeRequest['web_url'] as String?;
    final reviewers = (mergeRequest['reviewers'] as List?) ?? const [];

    return InkWell(
      onTap: webUrl == null ? null : () => launchUrl(Uri.parse(webUrl)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Tooltip(
              message: stateLabel,
              child: Icon(stateIcon, color: color, fill: 1, size: 20),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
                children: [
                  Row(
                    spacing: 6,
                    children: [
                      if (isDraft)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                          decoration: BoxDecoration(
                            border: Border.all(color: Theme.of(context).hintColor),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text('Draft', style: TextStyle(fontSize: 10)),
                        ),
                      Expanded(
                        child: Text(
                          '${mergeRequest['title']}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 6,
                    children: [
                      Text('!${mergeRequest['iid']}', style: const TextStyle(fontFamily: 'RobotoMono', fontSize: 11)),
                      const Text('·'),
                      const Icon(Symbols.fork_right, size: 12),
                      Flexible(
                        child: Text(
                          '${mergeRequest['source_branch']} → ${mergeRequest['target_branch']}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      const Text('·'),
                      Text(
                        timeAgo(timeStr: (mergeRequest['updated_at'] ?? mergeRequest['created_at']) as String?),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  if (labels.isNotEmpty)
                    Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: [
                        for (final label in labels.take(6))
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Text(label, style: const TextStyle(fontSize: 10)),
                          ),
                      ],
                    ),
                ],
              ),
            ),
            if (hasConflicts)
              Tooltip(
                message: 'Has merge conflicts',
                child: Icon(Symbols.merge_type, size: 18, color: Theme.of(context).colorScheme.error),
              ),
            if (headPipeline != null) GitLabStatusChip(status: GitLabStatus.from(headPipeline['status'] as String?), compact: true),
            if (notes > 0)
              Row(
                spacing: 2,
                children: [
                  const Icon(Symbols.comment, size: 14),
                  Text('$notes', style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            // Reviewers first, since "who still has to look at this" is the
            // question a merge request list usually answers.
            for (final reviewer in reviewers.take(3))
              Tooltip(
                message: 'Reviewer: ${(reviewer as Map)['name']}',
                child: GitLabAvatar(url: reviewer['avatar_url'] as String?, size: 20, fallbackLabel: reviewer['name'] as String?),
              ),
            if (author != null)
              Tooltip(
                message: 'Author: ${author['name']}',
                child: GitLabAvatar(url: author['avatar_url'] as String?, size: 24, fallbackLabel: author['name'] as String?),
              ),
          ],
        ),
      ),
    );
  }
}
