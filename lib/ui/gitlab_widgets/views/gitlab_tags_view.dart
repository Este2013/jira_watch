import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/gitlab_tabs_model.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_paginated_list.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_status.dart';
import 'package:jira_watcher/ui/utils/time_utils.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:url_launcher/url_launcher.dart';

class GitLabTagsView extends StatefulWidget {
  const GitLabTagsView({super.key, required this.tab});

  final GitLabProjectTab tab;

  @override
  State<GitLabTagsView> createState() => _GitLabTagsViewState();
}

class _GitLabTagsViewState extends State<GitLabTagsView> {
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
                  labelText: 'Search tags',
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
          key: ValueKey('tags|${widget.tab.projectId}|$_search|$_reloadToken'),
          emptyMessage: 'No tags match that search.',
          separated: true,
          fetchPage: (page) => DataModel().gitlab.tags(
            widget.tab.projectId,
            page: page,
            search: _search.isEmpty ? null : _search,
          ),
          itemBuilder: (context, tag, _) => _TagRow(tag: tag),
        ),
      ),
    ],
  );
}

class _TagRow extends StatelessWidget {
  const _TagRow({required this.tag});

  final Map<String, dynamic> tag;

  @override
  Widget build(BuildContext context) {
    final commit = tag['commit'] as Map?;
    final release = tag['release'] as Map?;
    final message = (tag['message'] as String?)?.trim();
    final isProtected = tag['protected'] == true;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Symbols.label, size: 18, fill: 1),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 2,
              children: [
                Row(
                  spacing: 6,
                  children: [
                    Flexible(
                      child: Text(
                        '${tag['name']}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.w500, fontFamily: 'RobotoMono'),
                      ),
                    ),
                    if (isProtected)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                        decoration: BoxDecoration(
                          border: Border.all(color: Theme.of(context).hintColor),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text('protected', style: TextStyle(fontSize: 10, color: Theme.of(context).hintColor)),
                      ),
                    if (release != null)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                        decoration: BoxDecoration(
                          color: const Color(0xFF108548).withValues(alpha: .15),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text('release', style: TextStyle(fontSize: 10)),
                      ),
                  ],
                ),
                if (message != null && message.isNotEmpty)
                  Text(message, maxLines: 2, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodySmall),
                if (commit != null)
                  Text(
                    '${shortSha(commit['short_id'] as String? ?? commit['id'] as String?)} · ${commit['title']}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).hintColor),
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
          if (tag['web_url'] != null)
            IconButton(
              tooltip: 'Open in browser',
              visualDensity: VisualDensity.compact,
              icon: const Icon(Symbols.open_in_browser),
              onPressed: () => launchUrl(Uri.parse('${tag['web_url']}')),
            ),
        ],
      ),
    );
  }
}
