import 'package:flutter/material.dart';
import 'package:jira_watcher/models/work_item_tabs_model.dart';
import 'package:material_symbols_icons/symbols.dart';

/// Creates a new tab group, or edits/deletes an existing one.
///
/// Creating one from a tab's context menu ("New group...") both makes the
/// group and moves that tab into it, then selects the group — the group
/// exists for a reason, so it should not immediately show as empty.
class WorkItemTabGroupDialog extends StatefulWidget {
  const WorkItemTabGroupDialog({super.key, this.group, this.assignTab});

  /// The group being edited, or null to create a new one.
  final WorkItemTabGroup? group;

  /// A tab to move into the group as soon as it is created. Ignored while
  /// editing an existing group.
  final WorkItemTab? assignTab;

  @override
  State<WorkItemTabGroupDialog> createState() => _WorkItemTabGroupDialogState();
}

class _WorkItemTabGroupDialogState extends State<WorkItemTabGroupDialog> {
  late final _nameController = TextEditingController(text: widget.group?.name ?? '');
  late Color _color = widget.group?.color ?? groupColorPalette.first;
  late WorkItemGroupIcon _icon = widget.group?.icon ?? WorkItemGroupIcon.label;

  bool get _isEditing => widget.group != null;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _save() {
    final name = _nameController.text.trim();
    if (name.isEmpty) return;
    final model = WorkItemTabsModel();
    if (_isEditing) {
      model.editGroup(widget.group!, name: name, color: _color, icon: _icon);
    } else {
      final group = model.createGroup(name: name, color: _color, icon: _icon);
      if (widget.assignTab != null) model.addTabToGroup(widget.assignTab!, group.id);
      model.selectGroup(group.id);
    }
    Navigator.of(context).pop();
  }

  void _delete() {
    WorkItemTabsModel().deleteGroup(widget.group!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text(_isEditing ? 'Edit group' : 'New group'),
    content: SizedBox(
      width: 360,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          TextField(
            controller: _nameController,
            autofocus: true,
            decoration: const InputDecoration(isDense: true, border: OutlineInputBorder(), labelText: 'Name'),
            onSubmitted: (_) => _save(),
          ),
          const SizedBox(height: 4),
          Text('Color', style: Theme.of(context).textTheme.labelMedium),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final color in groupColorPalette)
                InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () => setState(() => _color = color),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: _color.toARGB32() == color.toARGB32() ? Border.all(color: Theme.of(context).colorScheme.onSurface, width: 2) : null,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text('Icon', style: Theme.of(context).textTheme.labelMedium),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final icon in WorkItemGroupIcon.values)
                InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () => setState(() => _icon = icon),
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _icon == icon ? Theme.of(context).colorScheme.surfaceContainerHighest : null,
                      border: _icon == icon ? Border.all(color: Theme.of(context).colorScheme.primary, width: 2) : null,
                    ),
                    child: Icon(icon.icon),
                  ),
                ),
            ],
          ),
        ],
      ),
    ),
    actions: [
      if (_isEditing) ...[
        TextButton(
          onPressed: _delete,
          style: TextButton.styleFrom(foregroundColor: Theme.of(context).colorScheme.error),
          child: const Text('Delete'),
        ),
        const Spacer(),
      ],
      TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
      FilledButton.icon(
        onPressed: _save,
        icon: Icon(_isEditing ? Symbols.check : Symbols.add),
        label: Text(_isEditing ? 'Save' : 'Create'),
      ),
    ],
  );
}
