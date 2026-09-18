import 'package:flutter/material.dart';
import 'package:jira_watcher/models/dashboards_model.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:jira_watcher/models/updates_filters.dart';
import 'package:material_symbols_icons/symbols.dart';

/// Creates a new JQL board, or renames an existing one.
///
/// Only one board type exists today, so there is nothing to choose here
/// beyond a name — a type picker belongs in this dialog once a second type
/// does, the way [WorkItemTabGroupDialog] picks a color and icon because a
/// group actually has some to offer.
class BoardEditDialog extends StatefulWidget {
  const BoardEditDialog({super.key, this.board});

  /// The board being renamed, or null to create a new one.
  final Board? board;

  @override
  State<BoardEditDialog> createState() => _BoardEditDialogState();
}

class _BoardEditDialogState extends State<BoardEditDialog> {
  late final _nameController = TextEditingController(text: widget.board?.name ?? '');

  bool get _isEditing => widget.board != null;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _save() {
    final name = _nameController.text.trim();
    if (name.isEmpty) return;
    if (_isEditing) {
      DashboardsModel().renameBoard(widget.board!, name);
    } else {
      // Bounded by the enabled projects out of the box — the same safe
      // default the work item search opens on — so a fresh board shows
      // something rather than the "unbounded query" error an empty one
      // would ask Jira for.
      final query = UpdatesQuery(filters: UpdatesFilters.forSearch(projects: {...?SettingsModel().starredProjects.value}));
      DashboardsModel().createJqlBoard(name: name, query: query);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text(_isEditing ? 'Rename board' : 'New board'),
    content: SizedBox(
      width: 360,
      child: TextField(
        controller: _nameController,
        autofocus: true,
        decoration: const InputDecoration(isDense: true, border: OutlineInputBorder(), labelText: 'Name'),
        onSubmitted: (_) => _save(),
      ),
    ),
    actions: [
      TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
      FilledButton.icon(onPressed: _save, icon: Icon(_isEditing ? Symbols.check : Symbols.add), label: Text(_isEditing ? 'Save' : 'Create')),
    ],
  );
}
