import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:jira_watcher/models/details_layout_model.dart';

import 'details_layout_view.dart';
import 'details_properties.dart';

/// What a drag in the arrangeable zone is carrying: a property being moved
/// between groups, or a whole group being moved between positions.
///
/// One payload type for both, so a drop zone that accepts either is a
/// single [DragTarget] rather than two nested ones fighting over the same
/// hit test.
class DetailsDrag {
  const DetailsDrag.property(String this.propertyId) : groupId = null;
  const DetailsDrag.group(String this.groupId) : propertyId = null;

  final String? propertyId;
  final String? groupId;
}

/// How many of a row's units each width takes. Six divides by two and three,
/// which is what "half" and "third" need.
const _rowUnits = 6;

int _unitsOf(GroupWidth width) => _rowUnits ~/ width.columns;

/// The arrangeable properties, boxed into groups and tiled across rows.
///
/// Groups are packed greedily: each takes the units its width asks for, and
/// a group that will not fit in what is left of a row starts the next one.
/// Order is a flat list, so "where a group sits" stays one number however
/// the rows happen to fall out.
class DetailsGroupsView extends StatefulWidget {
  const DetailsGroupsView({super.key, required this.groups, required this.propertiesById});

  final List<PropertyGroup> groups;
  final Map<String, DetailsProperty> propertiesById;

  @override
  State<DetailsGroupsView> createState() => _DetailsGroupsViewState();
}

class _DetailsGroupsViewState extends State<DetailsGroupsView> {
  /// Insert bars only exist while something is being dragged; the rest of
  /// the time they would be empty boxes explaining themselves.
  bool _dragging = false;

  @override
  Widget build(BuildContext context) {
    final rows = _packRows();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 8,
      children: [
        for (final row in rows) ...[
          if (_dragging) _InsertBar(groups: widget.groups, toIndex: row.first.$1),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              for (final (index, group, units) in row)
                Expanded(
                  flex: units,
                  child: _GroupTile(
                    group: group,
                    groups: widget.groups,
                    properties: _propertiesOf(group),
                    index: index,
                    onDragStarted: () => setState(() => _dragging = true),
                    onDragEnded: () => setState(() => _dragging = false),
                  ),
                ),
              // Keeps a half-width group looking half width when nothing
              // came along to sit beside it.
              if (row.fold(0, (sum, entry) => sum + entry.$3) case final used when used < _rowUnits) Spacer(flex: _rowUnits - used),
            ],
          ),
        ],
        if (_dragging) _InsertBar(groups: widget.groups, toIndex: widget.groups.length),
      ],
    );
  }

  List<DetailsProperty> _propertiesOf(PropertyGroup group) => [
    for (final id in group.propertyIds) ?widget.propertiesById[id],
  ];

  /// Whether this group has to take a whole row whatever width it was given
  /// — Related work items is a list of rows, and reads badly in a column.
  bool _isForcedFullWidth(PropertyGroup group) => _propertiesOf(group).any((property) => property.isFullWidth);

  List<List<(int, PropertyGroup, int)>> _packRows() {
    final rows = <List<(int, PropertyGroup, int)>>[];
    var current = <(int, PropertyGroup, int)>[];
    var used = 0;

    for (final (index, group) in widget.groups.indexed) {
      final units = _isForcedFullWidth(group) ? _rowUnits : _unitsOf(group.width);
      if (used + units > _rowUnits && current.isNotEmpty) {
        rows.add(current);
        current = [];
        used = 0;
      }
      current.add((index, group, units));
      used += units;
    }
    if (current.isNotEmpty) rows.add(current);
    return rows;
  }
}

/// A place to drop a group, or a property that should become one, between
/// two rows.
class _InsertBar extends StatelessWidget {
  const _InsertBar({required this.groups, required this.toIndex});

  final List<PropertyGroup> groups;
  final int toIndex;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final layout = DetailsLayoutModel();

    return DragTarget<DetailsDrag>(
      onAcceptWithDetails: (details) {
        final drag = details.data;
        if (drag.groupId case final groupId?) {
          layout.reorderGroup(groups, groupId, toIndex: toIndex);
        } else if (drag.propertyId case final propertyId?) {
          layout.movePropertyToNewGroupAt(groups, propertyId, toIndex: toIndex);
        }
      },
      builder: (context, candidate, _) => Container(
        height: candidate.isEmpty ? 10 : 28,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: candidate.isEmpty ? null : colors.primaryContainer,
          border: Border.all(color: candidate.isEmpty ? colors.outlineVariant : colors.primary),
          borderRadius: BorderRadius.circular(6),
        ),
        child: candidate.isEmpty ? null : Text('Place here', style: TextStyle(color: colors.onPrimaryContainer, fontSize: 12)),
      ),
    );
  }
}

/// One group: either a bare property, or a titled card holding several.
class _GroupTile extends StatelessWidget {
  const _GroupTile({
    required this.group,
    required this.groups,
    required this.properties,
    required this.index,
    required this.onDragStarted,
    required this.onDragEnded,
  });

  final PropertyGroup group;
  final List<PropertyGroup> groups;
  final List<DetailsProperty> properties;
  final int index;
  final VoidCallback onDragStarted;
  final VoidCallback onDragEnded;

  /// A group holding an integration's own card — Development, and anything
  /// like it — is a unit. Its contents are that app's view, not a set of
  /// Jira fields to shuffle.
  bool get _isLocked => properties.any((property) => property.isLocked);

  /// A single unnamed property renders as just itself, so a reader who
  /// never arranges anything sees the plain list they always did.
  bool get _isBare => group.name.isEmpty && properties.length == 1;

  @override
  Widget build(BuildContext context) {
    if (properties.isEmpty) return const SizedBox.shrink();

    final body = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 8,
      children: [
        for (final (position, property) in properties.indexed)
          _PropertySlot(
            property: property,
            group: group,
            groups: groups,
            position: position,
            locked: _isLocked,
            onDragStarted: onDragStarted,
            onDragEnded: onDragEnded,
          ),
      ],
    );

    if (_isBare) return _acceptingDrops(context, body);

    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 8,
          children: [_header(context), _acceptingDrops(context, body)],
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    final title = Row(
      children: [
        Icon(_isLocked ? Symbols.lock : Symbols.drag_indicator, size: 16, color: Theme.of(context).hintColor),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            group.name.isEmpty ? 'Group' : group.name,
            style: Theme.of(context).textTheme.titleSmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        GroupMenuButton(group: group, groups: groups),
      ],
    );

    return LongPressDraggable<DetailsDrag>(
      data: DetailsDrag.group(group.id),
      onDragStarted: onDragStarted,
      onDragEnd: (_) => onDragEnded(),
      onDraggableCanceled: (_, _) => onDragEnded(),
      feedback: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(group.name.isEmpty ? 'Group' : group.name),
        ),
      ),
      child: title,
    );
  }

  /// The whole group takes drops, appending to the end — dropping onto a
  /// particular property means "before this one", which its own slot
  /// handles.
  Widget _acceptingDrops(BuildContext context, Widget child) => DragTarget<DetailsDrag>(
    onWillAcceptWithDetails: (details) => !_isLocked && details.data.propertyId != null && !group.propertyIds.contains(details.data.propertyId),
    onAcceptWithDetails: (details) => DetailsLayoutModel().moveProperty(
      groups,
      details.data.propertyId!,
      toGroupId: group.id,
      toIndex: group.propertyIds.length,
    ),
    builder: (context, candidate, _) => Container(
      decoration: candidate.isEmpty
          ? null
          : BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.primary, width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
      child: child,
    ),
  );
}

/// One property inside a group: a place to drop another one before it, and
/// something to drag elsewhere.
class _PropertySlot extends StatelessWidget {
  const _PropertySlot({
    required this.property,
    required this.group,
    required this.groups,
    required this.position,
    required this.locked,
    required this.onDragStarted,
    required this.onDragEnded,
  });

  final DetailsProperty property;
  final PropertyGroup group;
  final List<PropertyGroup> groups;
  final int position;
  final bool locked;
  final VoidCallback onDragStarted;
  final VoidCallback onDragEnded;

  @override
  Widget build(BuildContext context) {
    final tile = DetailsPropertyTile(property: property, group: group, groups: groups);
    if (locked) return tile;

    return DragTarget<DetailsDrag>(
      onWillAcceptWithDetails: (details) => details.data.propertyId != null && details.data.propertyId != property.id,
      onAcceptWithDetails: (details) => DetailsLayoutModel().moveProperty(groups, details.data.propertyId!, toGroupId: group.id, toIndex: position),
      builder: (context, candidate, _) => Container(
        decoration: candidate.isEmpty
            ? null
            : BoxDecoration(
                border: Border(top: BorderSide(color: Theme.of(context).colorScheme.primary, width: 3)),
              ),
        child: LongPressDraggable<DetailsDrag>(
          data: DetailsDrag.property(property.id),
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
          childWhenDragging: Opacity(opacity: 0.4, child: tile),
          child: tile,
        ),
      ),
    );
  }
}

/// The group's own actions, on its header. A group with a header is one the
/// reader made deliberately, so a visible button beats hiding them behind a
/// right-click they have no reason to try.
class GroupMenuButton extends StatelessWidget {
  const GroupMenuButton({super.key, required this.group, required this.groups});

  final PropertyGroup group;
  final List<PropertyGroup> groups;

  @override
  Widget build(BuildContext context) => PopupMenuButton<void>(
    icon: const Icon(Symbols.more_vert, size: 18),
    tooltip: 'Group options',
    itemBuilder: (context) => [
      PopupMenuItem(
        onTap: () => renameGroupDialog(context, groups, group),
        child: const Row(spacing: 8, children: [Icon(Symbols.edit), Text('Rename group')]),
      ),
      const PopupMenuDivider(),
      for (final width in GroupWidth.values)
        PopupMenuItem(
          onTap: () => DetailsLayoutModel().setGroupWidth(groups, group.id, width),
          child: Row(
            spacing: 8,
            children: [Icon(group.width == width ? Symbols.check : null), Text(width.label)],
          ),
        ),
    ],
  );
}

/// Asks for a group's name. An empty name is allowed and means "no title" —
/// which, for a group of one, puts it back to rendering as a bare property.
Future<void> renameGroupDialog(BuildContext context, List<PropertyGroup> groups, PropertyGroup group) async {
  final controller = TextEditingController(text: group.name);
  final name = await showDialog<String>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Name this group'),
      content: TextField(
        controller: controller,
        autofocus: true,
        decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Group name', hintText: 'Leave empty for no title'),
        onSubmitted: (value) => Navigator.of(context).pop(value),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
        FilledButton(onPressed: () => Navigator.of(context).pop(controller.text), child: const Text('Save')),
      ],
    ),
  );
  controller.dispose();
  if (name != null) DetailsLayoutModel().renameGroup(groups, group.id, name);
}
