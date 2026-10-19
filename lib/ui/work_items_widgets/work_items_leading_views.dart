import 'package:flutter/material.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/work_item_tabs_model.dart';
import 'package:jira_watcher/ui/updates_widgets/updates_view_single_work_item/work_item_details_view.dart';
import 'package:jira_watcher/ui/utils/widgets/work_item_list_preview.dart';
import 'package:jira_watcher/ui/work_items_widgets/dashboards_view.dart';
import 'package:jira_watcher/ui/work_items_widgets/mind_map/mind_map_view.dart';
import 'package:material_symbols_icons/symbols.dart';

/// The content behind one of the strip's fixed leading items.
class WorkItemsLeadingViewContent extends StatelessWidget {
  const WorkItemsLeadingViewContent({super.key, required this.view});

  final WorkItemsLeadingView view;

  @override
  Widget build(BuildContext context) => switch (view) {
    // Deliberately not `const`: this widget itself is rebuilt fresh by its
    // own parent, but a `const` child is canonicalized to one identical
    // instance regardless — and Flutter skips rebuilding a child that is
    // identical to what is already there, freezing it after its first
    // render. Both of these read live model state (DashboardsView owns its
    // own listening, so it would in fact survive being const, but there is
    // no upside to being the one exception in this switch), so neither can
    // afford it.
    WorkItemsLeadingView.dashboards => const DashboardsView(),
    WorkItemsLeadingView.pinnedWorkItems => _PinnedWorkItemsView(),
    WorkItemsLeadingView.mindMap => MindMapView(),
  };
}

/// The pinned work items: a permanent list, kept apart from the tabs, with
/// whichever one is picked shown beside it — or in a dialog, when the window
/// is too narrow to hold both (see [WorkItemListPreview]).
class _PinnedWorkItemsView extends StatelessWidget {
  const _PinnedWorkItemsView();

  /// The list is kept to a readable column rather than stretched across a
  /// wide window, the same as Confluence's own reading view.
  static const double _maxListWidth = 800;

  WorkItemTabsModel get _model => WorkItemTabsModel();

  @override
  Widget build(BuildContext context) {
    final keys = _model.pinnedKeys.list;
    if (keys.isEmpty) return const _NothingPinnedYet();

    return WorkItemListPreview(
      availableKeys: keys,
      placeholder: '← Pick a pinned work item to read it here',
      listBuilder: (selectedKey, onSelect) => Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: _maxListWidth),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            children: [
              for (final key in keys)
                _PinnedTile(
                  key: ValueKey(key),
                  workItemKey: key,
                  isSelected: key == selectedKey,
                  onSelect: () => onSelect(key),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NothingPinnedYet extends StatelessWidget {
  const _NothingPinnedYet();

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 16,
      children: [
        const Text('📌', style: TextStyle(fontSize: 72)),
        const Text('Nothing pinned yet', style: TextStyle(fontSize: 24)),
        Text(
          'Pin a work item from anywhere in the app — it stays here until you unpin it, whatever becomes of your tabs.',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).hintColor),
        ),
      ],
    ),
  );
}

class _PinnedTile extends StatefulWidget {
  const _PinnedTile({super.key, required this.workItemKey, required this.isSelected, required this.onSelect});

  final String workItemKey;
  final bool isSelected;
  final VoidCallback onSelect;

  @override
  State<_PinnedTile> createState() => _PinnedTileState();
}

class _PinnedTileState extends State<_PinnedTile> {
  /// Fetched once per tile rather than inside `build`: this list rebuilds
  /// every time anything in the model moves — picking a different pin
  /// included — and a future built in `build` would re-request every pinned
  /// work item on every one of those.
  late final Future<Map<String, dynamic>?> _workItem = DataModel().jiraApi.workItem(widget.workItemKey);

  @override
  Widget build(BuildContext context) {
    final workItemKey = widget.workItemKey;
    final isSelected = widget.isSelected;
    final onSelect = widget.onSelect;
    final model = WorkItemTabsModel();
    final actions = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          tooltip: 'Open as a tab in this group',
          icon: const Icon(Symbols.tab),
          onPressed: () => model.openWorkItem(workItemKey),
        ),
        IconButton(
          tooltip: 'Unpin',
          icon: const Icon(Symbols.keep_off),
          onPressed: () => model.unpin(workItemKey),
        ),
      ],
    );

    return ColoredBox(
      color: isSelected ? Theme.of(context).colorScheme.surfaceContainerHighest : Colors.transparent,
      child: FutureBuilder<Map<String, dynamic>?>(
        future: _workItem,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return IssueLinkTile(snapshot.data!, onSelect: (_) => onSelect(), trailing: actions);
          }
          if (snapshot.hasError) {
            return ListTile(
              tileColor: Colors.red.withAlpha(40),
              leading: const Icon(Symbols.error),
              title: Text(workItemKey),
              subtitle: const Text('Jira would not return this one'),
              trailing: actions,
              onTap: onSelect,
            );
          }
          return ListTile(
            leading: const SizedBox.square(dimension: 20, child: CircularProgressIndicator(strokeWidth: 2)),
            title: Text(workItemKey),
            trailing: actions,
            onTap: onSelect,
          );
        },
      ),
    );
  }
}
