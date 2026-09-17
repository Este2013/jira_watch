import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:jira_watcher/models/work_item_tabs_model.dart';
import 'package:jira_watcher/ui/work_items_widgets/work_item_tab_group_dialog.dart';
import 'package:material_symbols_icons/symbols.dart';

/// The Work items strip: the three fixed leading views, the tab-groups
/// dropdown, the group's own tabs (or the neutral ones), and the "+" button
/// that opens a search tab.
class WorkItemsTabStrip extends StatelessWidget {
  const WorkItemsTabStrip({super.key});

  @override
  Widget build(BuildContext context) {
    final model = WorkItemTabsModel();
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          for (final view in WorkItemsLeadingView.values) _LeadingViewTab(view: view, isActive: model.activeLeadingView.value == view),
          const VerticalDivider(width: 17, indent: 8, endIndent: 8),
          const _TabGroupsButton(),
          const SizedBox(width: 4),
          // Loose rather than filled, with the list sized to its content: the
          // add button then sits right after the last tab while there is room
          // for it there, and settles against the right edge once the tabs
          // have taken the width — the way a browser's does.
          Flexible(
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
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

class _LeadingViewTab extends StatelessWidget {
  const _LeadingViewTab({required this.view, required this.isActive});

  final WorkItemsLeadingView view;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Tooltip(
        message: view.label,
        waitDuration: const Duration(milliseconds: 600),
        child: Material(
          color: isActive ? scheme.surfaceContainerHighest : Colors.transparent,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
          child: InkWell(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            onTap: () => WorkItemTabsModel().setActiveLeadingView(view),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(view.icon, fill: isActive ? 1 : 0, size: 20),
            ),
          ),
        ),
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
    return MenuAnchor(
      menuChildren: [
        MenuItemButton(
          leadingIcon: Icon(activeGroup == null ? Symbols.check : null, size: 16),
          onPressed: () => model.selectGroup(null),
          child: const Text('Neutral (no group)'),
        ),
        if (model.groups.list.isNotEmpty) const Divider(height: 1),
        for (final group in model.groups.list)
          MenuItemButton(
            leadingIcon: Icon(group.icon.icon, color: group.color, size: 16, fill: group.id == activeGroup?.id ? 1 : 0),
            onPressed: () => model.selectGroup(group.id),
            child: Text(group.name),
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
    );
  }
}

class _WorkItemTabChip extends StatefulWidget {
  const _WorkItemTabChip({super.key, required this.tab});

  final WorkItemTab tab;

  @override
  State<_WorkItemTabChip> createState() => _WorkItemTabChipState();
}

class _WorkItemTabChipState extends State<_WorkItemTabChip> {
  bool _hovered = false;

  WorkItemTabsModel get _model => WorkItemTabsModel();

  void _close() => _model.close(widget.tab);

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isActive = _model.activeTabId.value == widget.tab.id;
    final showClose = isActive || _hovered;
    final label = widget.tab.isSearchTab ? 'New tab' : (widget.tab.currentKey ?? '?');
    final group = _model.groupById(widget.tab.groupId);

    return Padding(
      padding: const EdgeInsets.only(right: 2),
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: Listener(
          onPointerDown: (event) {
            if (event.buttons == kMiddleMouseButton) _close();
          },
          child: Material(
            color: isActive ? scheme.surfaceContainerHighest : Colors.transparent,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            child: InkWell(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
              onTap: () => _model.setActiveTab(widget.tab),
              onSecondaryTapDown: (details) => _showContextMenu(context, details),
              child: Tooltip(
                message: label,
                waitDuration: const Duration(milliseconds: 600),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 96, maxWidth: 180),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 4),
                    child: Row(
                      children: [
                        if (group != null)
                          Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: Icon(group.icon.icon, size: 14, color: group.color),
                          )
                        else
                          Icon(widget.tab.isSearchTab ? Symbols.search : Symbols.description, size: 14),
                        Expanded(
                          child: Text(
                            label,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: isActive ? FontWeight.w600 : null),
                          ),
                        ),
                        SizedBox(
                          width: 24,
                          child: showClose
                              ? IconButton(
                                  icon: const Icon(Symbols.close),
                                  iconSize: 16,
                                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                                  constraints: const BoxConstraints(),
                                  tooltip: 'Close',
                                  onPressed: _close,
                                )
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showContextMenu(BuildContext context, TapDownDetails details) {
    final model = _model;
    final tab = widget.tab;
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
