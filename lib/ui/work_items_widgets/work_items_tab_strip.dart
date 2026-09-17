import 'package:flutter/material.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:jira_watcher/models/work_item_tabs_model.dart';
import 'package:jira_watcher/ui/utils/widgets/browser_tab_chip.dart';
import 'package:jira_watcher/ui/work_items_widgets/work_item_tab_group_dialog.dart';
import 'package:material_symbols_icons/symbols.dart';

/// The Work items strip: the three fixed leading views, the tab-groups
/// dropdown (once there is at least one group to pick), the group's own tabs
/// (or the neutral ones), and the "+" button that opens a search tab.
class WorkItemsTabStrip extends StatelessWidget {
  const WorkItemsTabStrip({super.key});

  @override
  Widget build(BuildContext context) {
    final model = WorkItemTabsModel();
    return SizedBox(
      height: 40,
      child: Row(
        // A horizontal ListView stretches its own children to the viewport's
        // full cross-axis extent — sliver mechanics, not something a plain
        // Row child gets by default — which is why the work item tabs below
        // (inside one) already fill the strip's height while these leading
        // ones, sitting directly in this Row, did not. Stretching the whole
        // Row gives every direct child that same full-height look.
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (final view in WorkItemsLeadingView.values)
            BrowserTabChip(
              tooltip: view.label,
              leading: Icon(view.icon, fill: model.activeLeadingView.value == view ? 1 : 0, size: 18),
              isActive: model.activeLeadingView.value == view,
              onTap: () => model.setActiveLeadingView(view),
            ),
          const VerticalDivider(width: 17, indent: 8, endIndent: 8),
          // Furniture only once it has something to offer: with no group yet
          // defined, the only way to make one is still there (a tab's own
          // right-click menu), just not as a second, mostly-empty button here.
          // Not `const`: it reads live model state (which group is selected,
          // what groups exist), and a `const` instance would be canonicalized
          // and then never rebuilt once Flutter sees the identical child again.
          if (model.groups.list.isNotEmpty) _TabGroupsButton(),
          // Loose rather than filled, with the list sized to its content: the
          // add button then sits right after the last tab while there is room
          // for it there, and settles against the right edge once the tabs
          // have taken the width — the way a browser's does.
          Flexible(
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 4),
              children: [for (final tab in model.visibleTabs) _WorkItemTabChip(key: ValueKey(tab.id), tab: tab)],
            ),
          ),
          IconButton(
            tooltip: 'Open a work item',
            icon: const Icon(Symbols.add),
            onPressed: () => model.openSearchTab(),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}

class _TabGroupsButton extends StatelessWidget {
  const _TabGroupsButton();

  @override
  Widget build(BuildContext context) {
    final model = WorkItemTabsModel();
    final activeGroup = model.groupById(model.selectedGroupId.value);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: MenuAnchor(
        menuChildren: [
          MenuItemButton(
            leadingIcon: Icon(activeGroup == null ? Symbols.check : null, size: 16),
            onPressed: () => model.selectGroup(null),
            child: const Text('Neutral (no group)'),
          ),
          const Divider(height: 1),
          for (final group in model.groups.list)
            // A Row of siblings rather than a button nested inside a button:
            // the "..." has to open the edit dialog on its own tap without
            // that also registering as a select-this-group tap on the
            // MenuItemButton wrapped around it.
            Row(
              children: [
                Expanded(
                  child: MenuItemButton(
                    leadingIcon: Icon(group.icon.icon, color: group.color, size: 16, fill: group.id == activeGroup?.id ? 1 : 0),
                    onPressed: () => model.selectGroup(group.id),
                    child: Text(group.name),
                  ),
                ),
                IconButton(
                  tooltip: 'Edit or delete "${group.name}"',
                  icon: const Icon(Symbols.more_horiz, size: 16),
                  visualDensity: VisualDensity.compact,
                  onPressed: () => showDialog(
                    context: context,
                    builder: (_) => WorkItemTabGroupDialog(group: group),
                  ),
                ),
              ],
            ),
          const Divider(height: 1),
          MenuItemButton(
            leadingIcon: const Icon(Symbols.add, size: 16),
            onPressed: () => showDialog(context: context, builder: (_) => const WorkItemTabGroupDialog()),
            child: const Text('New group...'),
          ),
        ],
        builder: (context, controller, child) => IconButton(
          tooltip: activeGroup == null ? 'Tab groups' : 'Group: ${activeGroup.name}',
          onPressed: () => controller.isOpen ? controller.close() : controller.open(),
          icon: activeGroup == null ? const Icon(Symbols.tab_group) : Icon(activeGroup.icon.icon, color: activeGroup.color, fill: 1),
        ),
      ),
    );
  }
}

class _WorkItemTabChip extends StatelessWidget {
  const _WorkItemTabChip({super.key, required this.tab});

  final WorkItemTab tab;

  WorkItemTabsModel get _model => WorkItemTabsModel();

  @override
  Widget build(BuildContext context) {
    final isActive = _model.activeTabId.value == tab.id;
    final label = tab.isSearchTab ? 'New tab' : (tab.currentKey ?? '?');
    final group = _model.groupById(tab.groupId);

    return BrowserTabChip(
      tooltip: label,
      isActive: isActive,
      onTap: () => _model.setActiveTab(tab),
      onClose: () => _model.close(tab),
      closeTooltip: 'Close',
      onSecondaryTapDown: (details) => _showContextMenu(context, details),
      leading: group != null ? Icon(group.icon.icon, size: 16, color: group.color) : Icon(tab.isSearchTab ? Symbols.search : Symbols.description, size: 16),
      label: label,
    );
  }

  void _showContextMenu(BuildContext context, TapDownDetails details) {
    final model = _model;
    final group = model.groupById(tab.groupId);
    showContextMenu(
      context,
      contextMenu: ContextMenu(
        position: details.globalPosition,
        entries: <ContextMenuEntry>[
          MenuItem(label: Center(child: Text(tab.isSearchTab ? 'New tab' : (tab.currentKey ?? '?'))), enabled: false),
          const MenuDivider(),
          MenuItem.submenu(
            label: const Text('Add to group'),
            icon: const Icon(Symbols.tab_group),
            items: [
              for (final candidate in model.groups.list)
                MenuItem(
                  label: Text(candidate.name),
                  icon: Icon(candidate.icon.icon, color: candidate.color),
                  onSelected: (_) => model.addTabToGroup(tab, candidate.id),
                ),
              if (model.groups.list.isNotEmpty) const MenuDivider(),
              MenuItem(
                label: const Text('New group...'),
                icon: const Icon(Symbols.add),
                onSelected: (_) => showDialog(
                  context: context,
                  builder: (_) => WorkItemTabGroupDialog(assignTab: tab),
                ),
              ),
            ],
          ),
          if (group != null) ...[
            MenuItem(label: const Text('Remove from group'), icon: const Icon(Symbols.remove_circle_outline), onSelected: (_) => model.addTabToGroup(tab, null)),
            MenuItem(
              label: const Text('Edit group...'),
              icon: const Icon(Symbols.edit),
              onSelected: (_) => showDialog(
                context: context,
                builder: (_) => WorkItemTabGroupDialog(group: group),
              ),
            ),
          ],
          const MenuDivider(),
          MenuItem(label: const Text('Close'), icon: const Icon(Symbols.close), onSelected: (_) => model.close(tab)),
          MenuItem(label: const Text('Close others'), icon: const Icon(Symbols.close_fullscreen), onSelected: (_) => model.closeOthers(tab)),
        ],
      ),
    );
  }
}
