import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/gitlab_tabs_model.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_images.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_sub_views.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_tab_strip.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:url_launcher/url_launcher.dart';

/// The connected GitLab page: the tab strip plus the active project's views.
class GitLabWorkspaceView extends StatelessWidget {
  const GitLabWorkspaceView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = DataModel().gitlabTabs;
    return AnimatedBuilder(
      animation: Listenable.merge([model.tabs, model.activeProjectId]),
      builder: (context, _) {
        return CallbackShortcuts(
          bindings: {
            const SingleActivator(LogicalKeyboardKey.keyT, control: true): () => showGitLabProjectPicker(context),
          },
          child: Focus(
            child: model.tabs.isEmpty
                ? const _NoTabsView()
                : Column(
                    children: [
                      const GitLabTabStrip(),
                      const Divider(height: 1),
                      Expanded(
                        // Keyed per project so each tab keeps its own state while open.
                        child: IndexedStack(
                          index: model.activeIndex,
                          children: [
                            for (final tab in model.tabs.list) GitLabProjectView(tab: tab, key: ValueKey(tab.projectId)),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}

class _NoTabsView extends StatelessWidget {
  const _NoTabsView();

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        Text('📂', style: TextStyle(fontSize: 72)),
        Text('No project open', style: TextStyle(fontSize: 24)),
        Text(
          'Open one to browse its code, pipelines and releases.',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).hintColor),
        ),
        FilledButton.icon(
          icon: const Icon(Symbols.add),
          label: const Text('Open a project'),
          onPressed: () => showGitLabProjectPicker(context),
        ),
      ],
    ),
  );
}

class GitLabProjectView extends StatefulWidget {
  const GitLabProjectView({super.key, required this.tab});

  final GitLabProjectTab tab;

  @override
  State<GitLabProjectView> createState() => _GitLabProjectViewState();
}

class _GitLabProjectViewState extends State<GitLabProjectView> {
  /// Derived from the sub-view rather than stored, so the two cannot disagree.
  GitLabSection get _section => widget.tab.subView.section;

  void _selectSection(GitLabSection section) {
    final leaves = GitLabSubView.of(section);
    if (leaves.contains(widget.tab.subView)) return;
    setState(() => DataModel().gitlabTabs.setSubView(widget.tab, leaves.first));
  }

  void _selectSubView(GitLabSubView view) => setState(() => DataModel().gitlabTabs.setSubView(widget.tab, view));

  @override
  Widget build(BuildContext context) {
    final leaves = GitLabSubView.of(_section);

    return Column(
      children: [
        _header(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              SegmentedButton<GitLabSection>(
                segments: [
                  for (final section in GitLabSection.values)
                    ButtonSegment(
                      value: section,
                      icon: Icon(section.icon, size: 16),
                      label: Text(section.label),
                    ),
                ],
                selected: {_section},
                multiSelectionEnabled: false,
                showSelectedIcon: false,
                onSelectionChanged: (selection) {
                  if (selection.isNotEmpty) _selectSection(selection.first);
                },
              ),
              const Spacer(),
              // Reserved for per-section actions (refresh, filters, quick downloads).
              const Row(children: []),
            ],
          ),
        ),
        if (leaves.length > 1)
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 12, right: 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SegmentedButton<GitLabSubView>(
                  style: SegmentedButton.styleFrom(visualDensity: VisualDensity.compact),
                  segments: [
                    for (final view in leaves)
                      ButtonSegment(
                        value: view,
                        icon: Icon(view.icon, size: 16),
                        label: Text(view.label),
                      ),
                  ],
                  selected: {widget.tab.subView},
                  multiSelectionEnabled: false,
                  showSelectedIcon: false,
                  onSelectionChanged: (selection) {
                    if (selection.isNotEmpty) _selectSubView(selection.first);
                  },
                ),
              ),
            ),
          ),
        const Padding(
          padding: EdgeInsets.only(top: 8),
          child: Divider(height: 1),
        ),
        Expanded(
          // Only the current section's sub-views stay alive, capping the number
          // of live subtrees per project tab.
          child: IndexedStack(
            key: ValueKey(_section),
            index: leaves.indexOf(widget.tab.subView).clamp(0, leaves.length - 1),
            children: [for (final view in leaves) gitLabSubViewRegistry[view]!(widget.tab)],
          ),
        ),
      ],
    );
  }

  Widget _header() => Padding(
    padding: const EdgeInsets.all(12),
    child: Row(
      spacing: 12,
      children: [
        GitLabAvatar(url: widget.tab.avatarUrl, size: 40, fallbackLabel: widget.tab.name),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.tab.name, style: Theme.of(context).textTheme.titleMedium, maxLines: 1, overflow: TextOverflow.ellipsis),
              Text(
                widget.tab.pathWithNamespace,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).hintColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        if (widget.tab.webUrl != null)
          IconButton(
            tooltip: 'Open in browser',
            icon: const Icon(Symbols.open_in_browser),
            onPressed: () => launchUrl(Uri.parse(widget.tab.webUrl!)),
          ),
      ],
    ),
  );
}
