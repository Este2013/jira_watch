import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/gitlab_tabs_model.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_images.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_paginated_list.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_quick_branch_chips.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_ref_field.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_status.dart';
import 'package:jira_watcher/ui/utils/time_utils.dart';
import 'package:jira_watcher/ui/utils/widgets/app_snackbar.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:url_launcher/url_launcher.dart';

class GitLabCommitsView extends StatefulWidget {
  const GitLabCommitsView({super.key, required this.tab});

  final GitLabProjectTab tab;

  @override
  State<GitLabCommitsView> createState() => _GitLabCommitsViewState();
}

class _GitLabCommitsViewState extends State<GitLabCommitsView> {
  late final TextEditingController _refController;
  int _reloadToken = 0;

  String get _ref => (widget.tab.viewState['commitsRef'] as String?) ?? '';
  set _ref(String value) {
    widget.tab.viewState['commitsRef'] = value;
    DataModel().gitlabTabs.requestSave();
  }

  @override
  void initState() {
    super.initState();
    _refController = TextEditingController(text: _ref);
  }

  @override
  void dispose() {
    _refController.dispose();
    super.dispose();
  }

  /// Wired to both the ref field and the favorite-branch chips, so either one
  /// picking a branch does exactly the same thing: fill the field and reload.
  void _selectRef(String value) => setState(() {
    _ref = value;
    _refController.text = value;
    _reloadToken++;
  });

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          spacing: 8,
          children: [
            GitLabRefField(
              projectId: widget.tab.projectId,
              controller: _refController,
              label: 'Branch or tag (default branch if empty)',
              width: 320,
              onSubmitted: _selectRef,
            ),
            Expanded(
              child: GitLabQuickBranchChips(tab: widget.tab, currentValue: _ref, onResolved: _selectRef),
            ),
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
          key: ValueKey('commits|${widget.tab.projectId}|$_ref|$_reloadToken'),
          emptyMessage: 'No commits found.',
          separated: true,
          fetchPage: (page) => DataModel().gitlab.commits(
            widget.tab.projectId,
            page: page,
            ref: _ref.isEmpty ? null : _ref,
          ),
          itemBuilder: (context, commit, _) => GitLabCommitRow(commit: commit),
        ),
      ),
    ],
  );
}

/// One commit. Shared with the repo graph, which adds a lineage gutter and ref
/// badges around it.
class GitLabCommitRow extends StatelessWidget {
  const GitLabCommitRow({super.key, required this.commit, this.leading, this.refBadges = const []});

  final Map<String, dynamic> commit;

  /// Graph gutter, when rendered by the repo graph.
  final Widget? leading;

  /// Branch and tag names pointing at this commit.
  final List<({String name, bool isTag})> refBadges;

  bool get isMerge => ((commit['parent_ids'] as List?)?.length ?? 0) > 1;

  @override
  Widget build(BuildContext context) {
    final sha = commit['short_id'] as String? ?? shortSha(commit['id'] as String?);
    final webUrl = commit['web_url'] as String?;
    final authorName = commit['author_name'] as String? ?? '';

    return InkWell(
      onTap: webUrl == null ? null : () => launchUrl(Uri.parse(webUrl)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          spacing: 12,
          children: [
            if (leading != null) leading!,
            GitLabAvatar(url: null, size: 24, fallbackLabel: authorName),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 6,
                    children: [
                      if (isMerge)
                        Tooltip(
                          message: 'Merge commit',
                          child: Icon(Symbols.merge, size: 14, color: Theme.of(context).hintColor),
                        ),
                      Expanded(
                        child: Text(
                          '${commit['title']}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      for (final ref in refBadges.take(4))
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                          decoration: BoxDecoration(
                            color: (ref.isTag ? const Color(0xFFB37700) : const Color(0xFF1F75CB)).withValues(alpha: .15),
                            border: Border.all(color: (ref.isTag ? const Color(0xFFB37700) : const Color(0xFF1F75CB)).withValues(alpha: .5)),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 3,
                            children: [
                              Icon(ref.isTag ? Symbols.label : Symbols.fork_right, size: 10),
                              Text(ref.name, style: const TextStyle(fontSize: 10)),
                            ],
                          ),
                        ),
                    ],
                  ),
                  Text(
                    '$authorName · ${timeAgo(timeStr: (commit['committed_date'] ?? commit['created_at']) as String?)}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            SelectableText(sha, style: const TextStyle(fontFamily: 'RobotoMono', fontSize: 12)),
            IconButton(
              tooltip: 'Copy full SHA',
              visualDensity: VisualDensity.compact,
              icon: const Icon(Symbols.content_copy),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: '${commit['id']}'));
                showAppSnackBar(context, const SnackBar(content: Text('Commit SHA copied')));
              },
            ),
          ],
        ),
      ),
    );
  }
}
