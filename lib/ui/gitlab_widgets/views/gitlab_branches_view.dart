import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/gitlab_tabs_model.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_paginated_list.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_status.dart';
import 'package:jira_watcher/ui/utils/time_utils.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:url_launcher/url_launcher.dart';

class GitLabBranchesView extends StatefulWidget {
  const GitLabBranchesView({super.key, required this.tab});

  final GitLabProjectTab tab;

  @override
  State<GitLabBranchesView> createState() => _GitLabBranchesViewState();
}

class _GitLabBranchesViewState extends State<GitLabBranchesView> {
  final _searchController = TextEditingController();
  Timer? _debounce;
  int _reloadToken = 0;
  String _search = '';

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), () {
      setState(() {
        _search = value.trim();
        _reloadToken++;
      });
    });
  }

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          spacing: 8,
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                controller: _searchController,
                onChanged: _onSearchChanged,
                decoration: const InputDecoration(
                  isDense: true,
                  prefixIcon: Icon(Symbols.search, size: 18),
                  labelText: 'Search branches',
                ),
              ),
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
          key: ValueKey('branches|${widget.tab.projectId}|$_search|$_reloadToken'),
          emptyMessage: 'No branches match that search.',
          separated: true,
          fetchPage: (page) => DataModel().gitlab.branches(
            widget.tab.projectId,
            page: page,
            search: _search.isEmpty ? null : _search,
          ),
          itemBuilder: (context, branch, _) => _BranchRow(branch: branch),
        ),
      ),
    ],
  );
}

class _BranchRow extends StatelessWidget {
  const _BranchRow({required this.branch});

  final Map<String, dynamic> branch;

  @override
  Widget build(BuildContext context) {
    final commit = branch['commit'] as Map?;
    final isDefault = branch['default'] == true;
    final isProtected = branch['protected'] == true;
    final isMerged = branch['merged'] == true;
    final webUrl = branch['web_url'] as String?;
    final name = branch['name'] as String? ?? '';

    return InkWell(
      onTap: webUrl == null ? null : () => launchUrl(Uri.parse(webUrl)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          spacing: 12,
          children: [
            const Icon(Symbols.fork_right, size: 18),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 6,
                    children: [
                      Flexible(
                        child: Text(
                          name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.w500, fontFamily: 'RobotoMono'),
                        ),
                      ),
                      if (isDefault) _badge(context, 'default', Theme.of(context).colorScheme.primary),
                      if (isProtected) _badge(context, 'protected', Theme.of(context).hintColor),
                      if (isMerged) _badge(context, 'merged', const Color(0xFF6E49CB)),
                    ],
                  ),
                  if (commit != null)
                    Text(
                      '${shortSha(commit['short_id'] as String? ?? commit['id'] as String?)} · ${commit['title']}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                ],
              ),
            ),
            if (commit != null)
              SizedBox(
                width: 110,
                child: Text(
                  timeAgo(timeStr: (commit['committed_date'] ?? commit['created_at']) as String?),
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.end,
                ),
              ),
            IconButton(
              tooltip: 'Copy branch name',
              visualDensity: VisualDensity.compact,
              icon: const Icon(Symbols.content_copy),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: name));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Copied $name')));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _badge(BuildContext context, String text, Color color) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
    decoration: BoxDecoration(
      border: Border.all(color: color),
      borderRadius: BorderRadius.circular(4),
    ),
    child: Text(text, style: TextStyle(fontSize: 10, color: color)),
  );
}
