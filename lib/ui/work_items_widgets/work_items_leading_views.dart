import 'package:flutter/material.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/work_item_tabs_model.dart';
import 'package:jira_watcher/ui/updates_widgets/updates_view_single_work_item/work_item_details_view.dart';
import 'package:jira_watcher/ui/utils/under_constuction_notice.dart';
import 'package:material_symbols_icons/symbols.dart';

/// The content behind one of the strip's fixed leading items.
class WorkItemsLeadingViewContent extends StatelessWidget {
  const WorkItemsLeadingViewContent({super.key, required this.view});

  final WorkItemsLeadingView view;

  @override
  Widget build(BuildContext context) => switch (view) {
    WorkItemsLeadingView.pinnedWorkItems => const _PinnedWorkItemsView(),
    // Dashboards (saved filter/JQL views, explored from within this one tab)
    // and Mind map are their own, later phases of this feature.
    WorkItemsLeadingView.dashboards => const UnderConstructionNotice(),
    WorkItemsLeadingView.mindMap => const UnderConstructionNotice(),
  };
}

/// Every currently open tab — every pinned work item — grouped the way the
/// strip itself is: by tab group, with the neutral ones on their own. Picking
/// one jumps straight to its tab.
class _PinnedWorkItemsView extends StatelessWidget {
  const _PinnedWorkItemsView();

  @override
  Widget build(BuildContext context) {
    final model = WorkItemTabsModel();
    final resolved = model.tabs.list.where((t) => !t.isSearchTab).toList();

    if (resolved.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            const Text('📌', style: TextStyle(fontSize: 72)),
            const Text('Nothing pinned yet', style: TextStyle(fontSize: 24)),
            Text(
              'Pin a work item from anywhere in the app — "Keep for later" opens it here.',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).hintColor),
            ),
          ],
        ),
      );
    }

    final neutral = resolved.where((t) => t.groupId == null).toList();
    final byGroup = <WorkItemTabGroup, List<WorkItemTab>>{
      for (final group in model.groups.list)
        if (resolved.any((t) => t.groupId == group.id)) group: resolved.where((t) => t.groupId == group.id).toList(),
    };

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        for (final entry in byGroup.entries) ...[
          _GroupHeader(group: entry.key),
          for (final tab in entry.value) _PinnedTile(tab: tab),
          const SizedBox(height: 16),
        ],
        if (neutral.isNotEmpty) ...[
          if (byGroup.isNotEmpty) const _NeutralHeader(),
          for (final tab in neutral) _PinnedTile(tab: tab),
        ],
      ],
    );
  }
}

class _GroupHeader extends StatelessWidget {
  const _GroupHeader({required this.group});

  final WorkItemTabGroup group;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      spacing: 8,
      children: [
        Icon(group.icon.icon, color: group.color, size: 18),
        Text(group.name, style: Theme.of(context).textTheme.titleSmall),
      ],
    ),
  );
}

class _NeutralHeader extends StatelessWidget {
  const _NeutralHeader();

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Text('Neutral', style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).hintColor)),
  );
}

class _PinnedTile extends StatelessWidget {
  const _PinnedTile({required this.tab});

  final WorkItemTab tab;

  @override
  Widget build(BuildContext context) {
    final key = tab.currentKey;
    if (key == null) return const SizedBox.shrink();
    return FutureBuilder<Map<String, dynamic>?>(
      key: ValueKey('Pinned $key'),
      future: DataModel().jiraApi.workItem(key),
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          return IssueLinkTile(
            snapshot.data!,
            onSelect: (_) => WorkItemTabsModel().setActiveTab(tab),
            trailing: IconButton(
              tooltip: 'Unpin (close the tab)',
              icon: const Icon(Symbols.close),
              onPressed: () => WorkItemTabsModel().close(tab),
            ),
          );
        }
        if (snapshot.hasError) {
          return ListTile(
            tileColor: Colors.red.withAlpha(40),
            leading: const Icon(Symbols.error),
            title: Text(key),
            onTap: () => WorkItemTabsModel().setActiveTab(tab),
          );
        }
        return const ListTile(
          leading: SizedBox.square(dimension: 20, child: CircularProgressIndicator(strokeWidth: 2)),
          title: Text('Loading…'),
        );
      },
    );
  }
}
