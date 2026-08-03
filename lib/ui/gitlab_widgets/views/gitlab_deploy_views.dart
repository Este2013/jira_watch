import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:jira_watcher/dao/gitlab_dao.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/gitlab_tabs_model.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_images.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_paginated_list.dart';
import 'package:jira_watcher/ui/utils/expandable_panel.dart';
import 'package:jira_watcher/ui/utils/time_utils.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:url_launcher/url_launcher.dart';

class GitLabReleasesView extends StatefulWidget {
  const GitLabReleasesView({super.key, required this.tab});

  final GitLabProjectTab tab;

  @override
  State<GitLabReleasesView> createState() => _GitLabReleasesViewState();
}

class _GitLabReleasesViewState extends State<GitLabReleasesView> {
  int _reloadToken = 0;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
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
          key: ValueKey('releases|${widget.tab.projectId}|$_reloadToken'),
          emptyMessage: 'This project has no releases.',
          separated: true,
          fetchPage: (page) => DataModel().gitlab.releases(widget.tab.projectId, page: page),
          itemBuilder: (context, release, _) => _ReleaseRow(release: release),
        ),
      ),
    ],
  );
}

class _ReleaseRow extends StatelessWidget {
  const _ReleaseRow({required this.release});

  final Map<String, dynamic> release;

  @override
  Widget build(BuildContext context) {
    final author = release['author'] as Map?;
    final assets = release['assets'] as Map?;
    final links = (assets?['links'] as List?) ?? const [];
    final sources = (assets?['sources'] as List?) ?? const [];
    final description = (release['description'] as String?)?.trim();
    final upcoming = release['upcoming_release'] == true;
    final commit = release['commit'] as Map?;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Row(
            spacing: 12,
            children: [
              Icon(Symbols.rocket_launch, fill: 1, size: 20, color: Theme.of(context).colorScheme.primary),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      spacing: 6,
                      children: [
                        Flexible(
                          child: Text(
                            '${release['name'] ?? release['tag_name']}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                          decoration: BoxDecoration(
                            border: Border.all(color: Theme.of(context).hintColor),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            '${release['tag_name']}',
                            style: const TextStyle(fontSize: 10, fontFamily: 'RobotoMono'),
                          ),
                        ),
                        if (upcoming)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                            decoration: BoxDecoration(
                              color: const Color(0xFFB37700).withValues(alpha: .18),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text('upcoming', style: TextStyle(fontSize: 10)),
                          ),
                      ],
                    ),
                    Text(
                      'released ${timeAgo(timeStr: (release['released_at'] ?? release['created_at']) as String?)}'
                      '${commit == null ? '' : ' · ${commit['short_id']}'}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              if (author != null)
                Tooltip(
                  message: '${author['name']}',
                  child: GitLabAvatar(url: author['avatar_url'] as String?, size: 24, fallbackLabel: author['name'] as String?),
                ),
              if (release['_links'] != null && (release['_links'] as Map)['self'] != null)
                IconButton(
                  tooltip: 'Open in browser',
                  visualDensity: VisualDensity.compact,
                  icon: const Icon(Symbols.open_in_browser),
                  onPressed: () => launchUrl(Uri.parse('${(release['_links'] as Map)['self']}')),
                ),
            ],
          ),
          if (description != null && description.isNotEmpty)
            ExpandablePanel(
              'Release notes',
              isInitiallyExpanded: false,
              content: MarkdownBody(
                data: description,
                selectable: true,
                onTapLink: (text, href, title) {
                  if (href == null) return;
                  final uri = Uri.tryParse(href);
                  if (uri != null && uri.hasScheme) launchUrl(uri);
                },
              ),
            ),
          if (links.isNotEmpty || sources.isNotEmpty)
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final link in links)
                  ActionChip(
                    avatar: const Icon(Symbols.attach_file, size: 14),
                    label: Text('${(link as Map)['name']}', style: const TextStyle(fontSize: 11)),
                    onPressed: () => launchUrl(Uri.parse('${link['url']}')),
                  ),
                for (final source in sources)
                  ActionChip(
                    avatar: const Icon(Symbols.folder_zip, size: 14),
                    label: Text('source (${(source as Map)['format']})', style: const TextStyle(fontSize: 11)),
                    onPressed: () => launchUrl(Uri.parse('${source['url']}')),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}

class GitLabFeatureFlagsView extends StatefulWidget {
  const GitLabFeatureFlagsView({super.key, required this.tab});

  final GitLabProjectTab tab;

  @override
  State<GitLabFeatureFlagsView> createState() => _GitLabFeatureFlagsViewState();
}

class _GitLabFeatureFlagsViewState extends State<GitLabFeatureFlagsView> {
  int _reloadToken = 0;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            Text(
              'Read-only. Flags are edited on GitLab.',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).hintColor),
            ),
            const Spacer(),
            IconButton(
              tooltip: 'Open feature flags on GitLab',
              icon: const Icon(Symbols.open_in_browser),
              onPressed: () => launchUrl(
                Uri.https(GitLabDao().host, '/${widget.tab.pathWithNamespace}/-/feature_flags'),
              ),
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
          key: ValueKey('flags|${widget.tab.projectId}|$_reloadToken'),
          // Listing flags needs at least the Developer role, so an empty list and
          // a permission error are different things worth wording differently.
          emptyMessage: 'No feature flags, or your role cannot see them (Developer or above is required).',
          separated: true,
          fetchPage: (page) => DataModel().gitlab.featureFlags(widget.tab.projectId, page: page),
          itemBuilder: (context, flag, _) => _FeatureFlagRow(flag: flag),
        ),
      ),
    ],
  );
}

class _FeatureFlagRow extends StatelessWidget {
  const _FeatureFlagRow({required this.flag});

  final Map<String, dynamic> flag;

  @override
  Widget build(BuildContext context) {
    final isActive = flag['active'] == true;
    final strategies = (flag['strategies'] as List?) ?? const [];
    final description = (flag['description'] as String?)?.trim();
    final activeColor = isActive ? const Color(0xFF108548) : Theme.of(context).hintColor;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Tooltip(
            message: isActive ? 'Active' : 'Inactive',
            child: Icon(Symbols.flag, fill: isActive ? 1 : 0, size: 20, color: activeColor),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text(
                  '${flag['name']}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w500, fontFamily: 'RobotoMono'),
                ),
                if (description != null && description.isNotEmpty)
                  Text(description, maxLines: 2, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodySmall),
                if (strategies.isNotEmpty)
                  Wrap(
                    spacing: 6,
                    runSpacing: 4,
                    children: [
                      for (final strategy in strategies)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(_describeStrategy(strategy as Map), style: const TextStyle(fontSize: 10)),
                        ),
                    ],
                  ),
              ],
            ),
          ),
          SizedBox(
            width: 96,
            child: Text(
              timeAgo(timeStr: (flag['updated_at'] ?? flag['created_at']) as String?),
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  /// Renders a strategy as its name plus whichever parameter actually matters —
  /// the percentage for a rollout, the user list for userWithId, and so on.
  static String _describeStrategy(Map strategy) {
    final name = '${strategy['name']}';
    final parameters = strategy['parameters'] as Map?;
    final scopes = (strategy['scopes'] as List?) ?? const [];
    final environments = scopes.map((s) => '${(s as Map)['environment_scope']}').where((e) => e.isNotEmpty && e != 'null').toList();
    final suffix = environments.isEmpty ? '' : ' @ ${environments.join(", ")}';

    if (parameters == null || parameters.isEmpty) return '$name$suffix';
    final detail = parameters['percentage'] ?? parameters['rollout'] ?? parameters['userIds'] ?? parameters['groupId'];
    if (detail == null) return '$name$suffix';
    final isPercentage = parameters.containsKey('percentage') || parameters.containsKey('rollout');
    return '$name: $detail${isPercentage ? '%' : ''}$suffix';
  }
}
