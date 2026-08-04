import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/gitlab_tabs_model.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_images.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_sub_views.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_tab_strip.dart';
import 'package:jira_watcher/ui/utils/widgets/animated_icons.dart';
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

class _GitLabProjectViewState extends State<GitLabProjectView> with TickerProviderStateMixin {
  /// Drives the sub-view tab bar.
  ///
  /// Rebuilt whenever the section changes, because a [TabController]'s length is
  /// fixed and each section has a different number of sub-views.
  TabController? _subViewTabs;

  /// Derived from the sub-view rather than stored, so the two cannot disagree.
  GitLabSection get _section => widget.tab.subView.section;

  List<GitLabSubView> get _leaves => GitLabSubView.of(_section);

  @override
  void initState() {
    super.initState();
    _rebuildTabController();
  }

  @override
  void dispose() {
    _subViewTabs?.dispose();
    super.dispose();
  }

  void _rebuildTabController() {
    _subViewTabs?.removeListener(_onTabChanged);
    _subViewTabs?.dispose();
    final leaves = _leaves;
    _subViewTabs = TabController(
      length: leaves.length,
      initialIndex: leaves.indexOf(widget.tab.subView).clamp(0, leaves.length - 1),
      vsync: this,
    )..addListener(_onTabChanged);
  }

  void _onTabChanged() {
    final controller = _subViewTabs;
    // Wait for the indicator to settle, so the swap happens once per change
    // rather than on every animation frame.
    if (controller == null || controller.indexIsChanging) return;
    final selected = _leaves[controller.index];
    if (selected != widget.tab.subView) _selectSubView(selected);
  }

  void _selectSection(GitLabSection section) {
    final leaves = GitLabSubView.of(section);
    if (leaves.contains(widget.tab.subView)) return;
    setState(() {
      DataModel().gitlabTabs.setSubView(widget.tab, leaves.first);
      _rebuildTabController();
    });
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
              const Spacer(),
              // Reserved for per-section actions (refresh, filters, quick downloads).
              const Row(children: []),
            ],
          ),
        ),
        if (leaves.length > 1)
          // The tab bar draws its own full-width divider, so it replaces the one
          // below rather than sitting on top of it.
          TabBar(
            controller: _subViewTabs,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: [
              for (final view in leaves)
                Tab(
                  height: 44,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 8,
                    children: [
                      // Matches how the nav rail and settings tabs treat selection.
                      IconFilledOnSelection(
                        Icon(view.icon, size: 18),
                        isSelected: view == widget.tab.subView,
                      ),
                      Text(view.label),
                    ],
                  ),
                ),
            ],
          )
        else
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
        Expanded(
          child: Center(
            child: SegmentedButton<GitLabSection>(
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
          ),
        ),
        Spacer(),
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
