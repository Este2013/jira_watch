import 'package:flutter/material.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:jira_platform_api/api.dart' as jira;
import 'package:material_symbols_icons/symbols.dart';

import 'package:jira_watcher/models/details_layout_model.dart';
import 'package:jira_watcher/ui/utils/widgets/app_snackbar.dart';

import 'details_groups_view.dart';
import 'details_properties.dart';

/// The properties the reader has lifted to the top of the tab, as rows laid
/// out like the assignee/priority row above them.
///
/// A row is stored as the ids in it, not as the properties — so a row
/// survives an issue that happens to have none of them, and pinning a field
/// on one project's ticket does not litter every other project's.
class DetailsPinnedSection extends StatefulWidget {
  const DetailsPinnedSection({super.key, required this.properties});

  final List<DetailsProperty> properties;

  @override
  State<DetailsPinnedSection> createState() => _DetailsPinnedSectionState();
}

class _DetailsPinnedSectionState extends State<DetailsPinnedSection> {
  /// Drop zones only exist while something is being dragged — the rest of
  /// the time they would just be empty boxes explaining themselves.
  bool _dragging = false;

  @override
  Widget build(BuildContext context) {
    final layout = DetailsLayoutModel();
    final savedRows = layout.pinnedRows.value;
    if (savedRows.isEmpty) return const SizedBox.shrink();

    final byId = {for (final property in widget.properties) property.id: property};
    final hiddenIds = layout.hiddenPropertyIds.list.toSet();
    final showEmpty = layout.showEmptyProperties.value;

    bool isShowable(DetailsProperty property) => !hiddenIds.contains(property.id) && (property.hasValue || showEmpty);

    // Positions are carried from the saved row, not from what survives
    // filtering: dropping onto a slot has to mean the same thing whether or
    // not this particular issue happens to have the fields either side of
    // it.
    final rows = [
      for (final (rowIndex, row) in savedRows.indexed)
        (
          rowIndex,
          [
            for (final (index, id) in row.indexed)
              if (byId[id] case final property? when isShowable(property)) (index, property),
          ],
        ),
    ].where((entry) => entry.$2.isNotEmpty).toList();

    if (rows.isEmpty && !_dragging) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 8,
      children: [
        for (final (rowIndex, row) in rows)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              for (final (index, property) in row)
                Expanded(
                  child: _PinnedSlot(
                    property: property,
                    rowIndex: rowIndex,
                    index: index,
                    onDragStarted: () => setState(() => _dragging = true),
                    onDragEnded: () => setState(() => _dragging = false),
                  ),
                ),
              if (_dragging)
                _PinnedDropZone(
                  width: 48,
                  onAccept: (id) => layout.movePinned(id, toRow: rowIndex, toIndex: savedRows[rowIndex].length),
                ),
            ],
          ),
        if (_dragging)
          _PinnedDropZone(
            label: 'Drop here for a new row',
            onAccept: (id) => layout.movePinned(id, toRow: savedRows.length, toIndex: 0),
          ),
      ],
    );
  }
}

/// One pinned property, both a place to drop another one and a thing to
/// drag elsewhere.
///
/// Long-press to drag, as the to-do list's own reordering already works
/// here: it needs no handle overlaid on the content, and no click while
/// reading can move anything by accident.
class _PinnedSlot extends StatelessWidget {
  const _PinnedSlot({
    required this.property,
    required this.rowIndex,
    required this.index,
    required this.onDragStarted,
    required this.onDragEnded,
  });

  final DetailsProperty property;
  final int rowIndex;
  final int index;
  final VoidCallback onDragStarted;
  final VoidCallback onDragEnded;

  @override
  Widget build(BuildContext context) => DragTarget<String>(
    onWillAcceptWithDetails: (details) => details.data != property.id,
    onAcceptWithDetails: (details) => DetailsLayoutModel().movePinned(details.data, toRow: rowIndex, toIndex: index),
    builder: (context, candidate, _) => Container(
      decoration: candidate.isEmpty
          ? null
          : BoxDecoration(
              border: Border(left: BorderSide(color: Theme.of(context).colorScheme.primary, width: 3)),
            ),
      child: LongPressDraggable<String>(
        data: property.id,
        onDragStarted: onDragStarted,
        onDragEnd: (_) => onDragEnded(),
        onDraggableCanceled: (_, _) => onDragEnded(),
        feedback: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Text(property.name),
          ),
        ),
        childWhenDragging: Opacity(opacity: 0.4, child: DetailsPropertyTile(property: property, isPinned: true, collapsed: true)),
        child: DetailsPropertyTile(property: property, isPinned: true, collapsed: true),
      ),
    ),
  );
}

class _PinnedDropZone extends StatelessWidget {
  const _PinnedDropZone({required this.onAccept, this.label, this.width});

  final ValueChanged<String> onAccept;
  final String? label;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return DragTarget<String>(
      onAcceptWithDetails: (details) => onAccept(details.data),
      builder: (context, candidate, _) => Container(
        width: width,
        height: 44,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: candidate.isEmpty ? colors.outlineVariant : colors.primary, width: candidate.isEmpty ? 1 : 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: label == null ? Icon(Symbols.add, size: 18, color: colors.outline) : Text(label!, style: TextStyle(color: candidate.isEmpty ? colors.outline : colors.primary)),
      ),
    );
  }
}

/// The arrangeable half of the Details tab: everything below Description and
/// Environment that has not been pinned above it, then the footer dates and
/// the layout's own controls.
class DetailsPropertiesSection extends StatelessWidget {
  const DetailsPropertiesSection({super.key, required this.properties, required this.metadata});

  final List<DetailsProperty> properties;
  final Map<String, jira.FieldDetails> metadata;

  @override
  Widget build(BuildContext context) {
    final layout = DetailsLayoutModel();
    final showEmpty = layout.showEmptyProperties.value;
    final hiddenIds = layout.hiddenPropertyIds.list.toSet();
    final visible = properties.where((p) => !hiddenIds.contains(p.id) && !layout.isPinned(p.id) && (p.hasValue || showEmpty)).toList();

    // Resolved for every hidden property, not just the ones this issue
    // happens to have — otherwise something hidden while reading one
    // project's ticket could never be brought back from another's.
    final byId = {for (final property in properties) property.id: property};
    final hiddenNames = {for (final id in hiddenIds) id: byId[id]?.name ?? metadata[id]?.name ?? id};

    // The dates stay where they have always been: last, in their own order,
    // below everything the reader arranges.
    final arranged = visible.where((p) => !p.isFooter).toList();
    final footer = visible.where((p) => p.isFooter);
    final groups = layout.resolvedGroups([for (final property in arranged) property.id]);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 8,
      children: [
        DetailsGroupsView(groups: groups, propertiesById: {for (final property in arranged) property.id: property}),
        if (footer.isNotEmpty)
          const Padding(
            padding: EdgeInsets.only(top: 24, bottom: 8),
            child: Divider(height: 1),
          ),
        for (final property in footer) DetailsPropertyTile(key: Key(property.id), property: property),
        DetailsLayoutFooter(hiddenNames: hiddenNames),
      ],
    );
  }
}

/// One property, with its own right-click menu.
///
/// A context menu rather than a button that appears over the content:
/// nothing overlaps what you are reading, nothing shifts under the cursor,
/// and it is where the rest of the app already puts per-item actions.
class DetailsPropertyTile extends StatelessWidget {
  const DetailsPropertyTile({
    super.key,
    required this.property,
    this.isPinned = false,
    this.collapsed = false,
    this.group,
    this.groups = const [],
  });

  final DetailsProperty property;
  final bool isPinned;

  /// The group this property is rendered in, when it is in the arrangeable
  /// zone — null in a pinned row, where groups do not apply.
  final PropertyGroup? group;

  /// The resolved groups this property's menu would act on. Mutations are
  /// expressed against what is on screen, implicit groups included.
  final List<PropertyGroup> groups;

  /// Passed to the property: a pinned row asks for panels closed, since it
  /// is a strip to glance at rather than somewhere to unfold a document.
  final bool collapsed;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onSecondaryTapDown: (details) => _showMenu(context, details),
    child: property.build(context, collapsed: collapsed),
  );

  void _showMenu(BuildContext context, TapDownDetails details) {
    final layout = DetailsLayoutModel();
    showContextMenu(
      context,
      onItemSelected: (_) {},
      contextMenu: ContextMenu(
        position: details.globalPosition,
        entries: <ContextMenuEntry>[
          MenuItem(label: Center(child: Text(property.name)), enabled: false),
          const MenuDivider(),
          if (isPinned)
            MenuItem(
              label: const Text('Unpin'),
              icon: const Icon(Symbols.keep_off),
              onSelected: (_) => layout.unpin(property.id),
            )
          else ...[
            MenuItem(
              label: const Text('Pin to the top'),
              icon: const Icon(Symbols.keep),
              // Shown disabled rather than left out, so it reads as a
              // decision about this property rather than a missing feature.
              enabled: property.canPin,
              onSelected: (_) => layout.pin(property.id),
            ),
            MenuItem(
              label: const Text('Pin to a new row'),
              icon: const Icon(Symbols.add_row_below),
              enabled: property.canPin,
              onSelected: (_) => layout.pinToNewRow(property.id),
            ),
          ],
          if (group case final group?) ...[
            const MenuDivider(),
            MenuItem(
              label: const Text('Move to its own group'),
              icon: const Icon(Symbols.move_group),
              // Nothing to move out of when it is already alone.
              enabled: !property.isLocked && group.propertyIds.length > 1,
              onSelected: (_) => layout.movePropertyToOwnGroup(groups, property.id),
            ),
            MenuItem(
              label: Text(group.name.isEmpty ? 'Name this group' : 'Rename "${group.name}"'),
              icon: const Icon(Symbols.edit),
              onSelected: (_) => renameGroupDialog(context, groups, group),
            ),
            for (final width in GroupWidth.values)
              MenuItem(
                label: Text(width.label),
                icon: Icon(group.width == width ? Symbols.check : Symbols.width_normal),
                onSelected: (_) => layout.setGroupWidth(groups, group.id, width),
              ),
          ],
          const MenuDivider(),
          MenuItem(
            label: const Text('Hide on every issue'),
            icon: const Icon(Symbols.visibility_off),
            enabled: property.canHide,
            onSelected: (_) => _hide(context),
          ),
        ],
      ),
    );
  }

  void _hide(BuildContext context) {
    final layout = DetailsLayoutModel();
    final wasPinned = layout.isPinned(property.id);
    layout.hide(property.id);
    showAppSnackBar(
      context,
      SnackBar(
        content: Text('Hid "${property.name}" on every issue'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            layout.restore(property.id);
            if (wasPinned) layout.pin(property.id);
          },
        ),
      ),
    );
  }
}

/// The layout's own controls, at the bottom of the tab: whether to show
/// properties this issue left blank, and a way back for anything hidden.
class DetailsLayoutFooter extends StatelessWidget {
  const DetailsLayoutFooter({super.key, required this.hiddenNames});

  /// Every hidden property, by id, with the best name available for it.
  final Map<String, String> hiddenNames;

  @override
  Widget build(BuildContext context) {
    final layout = DetailsLayoutModel();

    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Row(
              children: [
                Icon(Symbols.tune, size: 18, color: Theme.of(context).hintColor),
                const SizedBox(width: 8),
                Expanded(child: Text('Layout', style: Theme.of(context).textTheme.titleSmall)),
                Text('Show properties without a value', style: Theme.of(context).textTheme.bodyMedium),
                Switch(
                  value: layout.showEmptyProperties.value,
                  onChanged: (show) => layout.setShowEmptyProperties(show: show),
                ),
              ],
            ),
            if (hiddenNames.isNotEmpty) ...[
              Text('Hidden — click to bring back', style: Theme.of(context).textTheme.labelMedium),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  for (final entry in hiddenNames.entries)
                    ActionChip(
                      avatar: const Icon(Symbols.visibility, size: 16),
                      label: Text(entry.value),
                      onPressed: () => layout.restore(entry.key),
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
