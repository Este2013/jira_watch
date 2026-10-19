/// The inside of a node: its notes, its links, its tasks, what is filed under
/// it, and what the map thinks should be there but is not yet.
///
/// The navigator answers "where am I and what is near me". This answers "what
/// is actually in here" — the two are deliberately on screen together, because
/// a map you have to leave in order to read anything is a map you stop using.
library;

import 'package:flutter/material.dart';
import 'package:jira_watcher/models/mind_map_model.dart';
import 'package:jira_watcher/models/mind_map_suggestions.dart';
import 'package:jira_watcher/models/to_do_tasks_models.dart';
import 'package:jira_watcher/models/work_item_tabs_model.dart';
import 'package:jira_watcher/ui/work_items_widgets/mind_map/mind_map_dialogs.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:url_launcher/url_launcher.dart';

class MindMapInspector extends StatefulWidget {
  const MindMapInspector({
    super.key,
    required this.model,
    required this.suggestions,
    required this.node,
    required this.onFocus,
    this.onClose,
  });

  final MindMapModel model;
  final MindMapSuggestions suggestions;
  final MindMapNode node;
  final void Function(String? nodeId) onFocus;

  /// Shown only where the panel is an overlay rather than a column of the
  /// layout — a narrow window.
  final VoidCallback? onClose;

  @override
  State<MindMapInspector> createState() => _MindMapInspectorState();
}

class _MindMapInspectorState extends State<MindMapInspector> {
  /// Seeded once from the node and then owned by the field. Re-seeding it on
  /// every rebuild would fight the cursor — the model is written to on each
  /// keystroke, and that rebuild comes straight back here.
  late final TextEditingController _notes = TextEditingController(text: widget.node.notes);

  /// Asked once per node, not per rebuild.
  late final Future<JiraRelations>? _relations = widget.node.workItemKey == null ? null : widget.suggestions.relationsFor(widget.node.workItemKey!);
  late Future<MindMapNodeSuggestions> _nodeSuggestions = widget.suggestions.forNode(widget.node);

  @override
  void dispose() {
    _notes.dispose();
    super.dispose();
  }

  void _refreshSuggestions() => setState(() => _nodeSuggestions = widget.suggestions.forNode(widget.node));

  MindMapModel get _model => widget.model;

  @override
  Widget build(BuildContext context) {
    final node = widget.node;
    final theme = Theme.of(context);

    return Material(
      color: theme.colorScheme.surfaceContainerLow,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
        children: [
          _header(node, theme),
          if (node.workItemKey != null) ...[const SizedBox(height: 12), _workItemRow(node)],
          if (node.tags.isNotEmpty) ...[const SizedBox(height: 12), _tags(node)],
          const SizedBox(height: 20),
          _notesField(theme),
          const SizedBox(height: 24),
          _inside(node, theme),
          const SizedBox(height: 24),
          _links(node, theme),
          const SizedBox(height: 24),
          _tasks(node, theme),
          const SizedBox(height: 24),
          _connections(node, theme),
          const SizedBox(height: 24),
          _suggestionsSection(node, theme),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title, ThemeData theme, {Widget? action}) => Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: Row(
      children: [
        Expanded(child: Text(title, style: theme.textTheme.labelLarge?.copyWith(color: theme.hintColor))),
        ?action,
      ],
    ),
  );

  Widget _header(MindMapNode node, ThemeData theme) {
    final path = _model.pathTo(node.id);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (path.length > 1)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                for (final ancestor in path.take(path.length - 1)) ...[
                  InkWell(
                    onTap: () => widget.onFocus(ancestor.id),
                    child: Text(ancestor.title, style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.primary)),
                  ),
                  Text(' › ', style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor)),
                ],
              ],
            ),
          ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Icon(node.kind.icon, color: node.color),
            Expanded(child: Text(node.title, style: theme.textTheme.titleLarge)),
            IconButton(
              tooltip: 'Edit',
              icon: const Icon(Symbols.edit),
              onPressed: () => showDialog(context: context, builder: (_) => MindMapTopicDialog(model: _model, editing: node)),
            ),
            IconButton(
              tooltip: 'Remove from the map',
              icon: const Icon(Symbols.delete),
              onPressed: () async {
                if (await confirmMindMapDelete(context, _model, node)) _model.deleteNode(node.id);
              },
            ),
            if (widget.onClose != null) IconButton(tooltip: 'Close', icon: const Icon(Symbols.close), onPressed: widget.onClose),
          ],
        ),
      ],
    );
  }

  Widget _workItemRow(MindMapNode node) {
    final key = node.workItemKey!;

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Chip(
          avatar: const Icon(Symbols.tag, size: 16),
          label: Text(key),
          visualDensity: VisualDensity.compact,
        ),
        if (_relations != null)
          FutureBuilder<JiraRelations>(
            future: _relations,
            builder: (context, snapshot) {
              final status = snapshot.data?.status;
              if (status == null) return const SizedBox.shrink();
              return Chip(
                label: Text(status),
                visualDensity: VisualDensity.compact,
                backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
              );
            },
          ),
        TextButton.icon(
          icon: const Icon(Symbols.tab, size: 18),
          label: const Text('Open as tab'),
          onPressed: () => WorkItemTabsModel().openWorkItem(key),
        ),
      ],
    );
  }

  Widget _tags(MindMapNode node) => Wrap(
    spacing: 6,
    runSpacing: 6,
    children: [
      for (final tag in node.tags)
        Chip(
          label: Text('#$tag'),
          visualDensity: VisualDensity.compact,
          onDeleted: () => _model.removeTag(node.id, tag),
        ),
    ],
  );

  Widget _notesField(ThemeData theme) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _sectionTitle('Notes', theme),
      TextField(
        controller: _notes,
        minLines: 3,
        maxLines: 12,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'What you would want to be told about this in six months.',
        ),
        onChanged: (value) => _model.setNotes(widget.node.id, value),
      ),
    ],
  );

  Widget _inside(MindMapNode node, ThemeData theme) {
    final children = _model.childrenOf(node.id);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(
          'Inside',
          theme,
          action: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                tooltip: 'New topic in here',
                icon: const Icon(Symbols.create_new_folder, size: 20),
                onPressed: () => showDialog(context: context, builder: (_) => MindMapTopicDialog(model: _model, parentId: node.id)),
              ),
              IconButton(
                tooltip: 'Put a work item in here',
                icon: const Icon(Symbols.add_task, size: 20),
                onPressed: () async {
                  await showDialog(context: context, builder: (_) => MindMapAttachWorkItemDialog(model: _model, suggestions: widget.suggestions, parentId: node.id));
                  if (mounted) _refreshSuggestions();
                },
              ),
            ],
          ),
        ),
        if (children.isEmpty)
          Text('Nothing filed in here yet.', style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor))
        else
          for (final child in children)
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: Icon(child.kind.icon, color: child.color, size: 20),
              title: Text(child.title, maxLines: 1, overflow: TextOverflow.ellipsis),
              subtitle: child.workItemKey == null ? null : Text(child.workItemKey!),
              onTap: () => widget.onFocus(child.id),
            ),
      ],
    );
  }

  Widget _links(MindMapNode node, ThemeData theme) {
    // Grouped links first, under their own heading, then the loose ones — the
    // "web of links" a node holds rather than one undifferentiated list.
    final groups = <String?, List<MindMapLink>>{};
    for (final link in node.links) {
      (groups[link.group] ??= []).add(link);
    }
    final named = groups.keys.whereType<String>().toList()..sort();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(
          'Links',
          theme,
          action: IconButton(
            tooltip: 'Add a link',
            icon: const Icon(Symbols.add_link, size: 20),
            onPressed: () => showDialog(context: context, builder: (_) => MindMapLinkDialog(model: _model, nodeId: node.id)),
          ),
        ),
        if (node.links.isEmpty)
          Text('No links yet. Test runs, merge requests, specs — anything you would otherwise have to go hunting for.', style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor)),
        for (final group in named) ...[
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 2),
            child: Text(group, style: theme.textTheme.labelMedium),
          ),
          for (final link in groups[group]!) _linkTile(node, link, theme),
        ],
        if (groups[null] != null) ...[
          if (named.isNotEmpty) const SizedBox(height: 8),
          for (final link in groups[null]!) _linkTile(node, link, theme),
        ],
      ],
    );
  }

  Widget _linkTile(MindMapNode node, MindMapLink link, ThemeData theme) => ListTile(
    dense: true,
    contentPadding: EdgeInsets.zero,
    leading: Icon(link.icon, size: 20),
    title: Text(link.title, maxLines: 1, overflow: TextOverflow.ellipsis),
    subtitle: Text(link.note ?? link.url, maxLines: 1, overflow: TextOverflow.ellipsis, style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor)),
    onTap: () => launchUrl(Uri.parse(link.url)),
    trailing: MenuAnchor(
      menuChildren: [
        MenuItemButton(
          leadingIcon: const Icon(Symbols.edit, size: 18),
          onPressed: () => showDialog(context: context, builder: (_) => MindMapLinkDialog(model: _model, nodeId: node.id, editing: link)),
          child: const Text('Edit'),
        ),
        MenuItemButton(
          leadingIcon: const Icon(Symbols.delete, size: 18),
          onPressed: () => _model.removeLink(node.id, link.id),
          child: const Text('Remove'),
        ),
      ],
      builder: (context, controller, _) => IconButton(
        icon: const Icon(Symbols.more_vert, size: 18),
        onPressed: () => controller.isOpen ? controller.close() : controller.open(),
      ),
    ),
  );

  Widget _tasks(MindMapNode node, ThemeData theme) {
    // Reached for only once there is actually a task to render. Touching the
    // To Do model is not free — it is a singleton that reads its own file and
    // starts its own save timer — and a node with no tasks has no business
    // waking all that up to print "No tasks here".
    final tasks = node.taskIds.isEmpty ? null : ToDoTasksModel();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(
          'Tasks',
          theme,
          action: IconButton(
            tooltip: 'Add a task',
            icon: const Icon(Symbols.add_task, size: 20),
            onPressed: () => showDialog(context: context, builder: (_) => MindMapTaskDialog(model: _model, node: node)),
          ),
        ),
        if (tasks == null)
          Text('No tasks here.', style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor))
        else
          AnimatedBuilder(
            animation: tasks.allTasksListenable,
            builder: (context, _) => Column(
              children: [
                for (final id in node.taskIds)
                  if (tasks.byId(id) case final controller?)
                    CheckboxListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity.leading,
                      value: controller.isComplete.value,
                      // The same task the To Do page owns, not a copy of it —
                      // so this tick is that tick.
                      onChanged: (value) => controller.isComplete.value = value ?? false,
                      title: Text(
                        controller.title.text.isEmpty ? 'Untitled task' : controller.title.text,
                        maxLines: 2,
                        style: controller.isComplete.value ? TextStyle(decoration: TextDecoration.lineThrough, color: theme.hintColor) : null,
                      ),
                      secondary: IconButton(
                        tooltip: 'Detach from this node',
                        icon: const Icon(Symbols.link_off, size: 18),
                        onPressed: () => _model.detachTask(node.id, id),
                      ),
                    )
                  else
                    // The task was deleted from the To Do page. Said plainly,
                    // with the way to tidy it up, rather than silently skipped.
                    ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Symbols.help, size: 20),
                      title: Text('A task that no longer exists', style: theme.textTheme.bodySmall),
                      trailing: IconButton(icon: const Icon(Symbols.link_off, size: 18), onPressed: () => _model.detachTask(node.id, id)),
                    ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _connections(MindMapNode node, ThemeData theme) {
    final edges = _model.edgesOf(node.id);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle(
          'Connected to',
          theme,
          action: IconButton(
            tooltip: 'Connect to another node',
            icon: const Icon(Symbols.polyline, size: 20),
            onPressed: () => showDialog(context: context, builder: (_) => MindMapConnectDialog(model: _model, from: node)),
          ),
        ),
        if (edges.isEmpty)
          Text('Not connected to anything yet.', style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor))
        else
          for (final edge in edges)
            if (_model.nodeById(edge.otherEnd(node.id)) case final other?)
              ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                leading: Icon(other.kind.icon, color: other.color, size: 20),
                title: Text(other.title, maxLines: 1, overflow: TextOverflow.ellipsis),
                subtitle: edge.label == null ? null : Text(edge.label!),
                onTap: () => widget.onFocus(other.id),
                trailing: IconButton(
                  tooltip: 'Disconnect',
                  icon: const Icon(Symbols.link_off, size: 18),
                  onPressed: () => _model.disconnect(edge.id),
                ),
              ),
      ],
    );
  }

  /// What Jira knows that the map does not. Quiet when there is nothing to
  /// say: a section permanently announcing "no suggestions" is just clutter.
  Widget _suggestionsSection(MindMapNode node, ThemeData theme) => FutureBuilder<MindMapNodeSuggestions>(
    future: _nodeSuggestions,
    builder: (context, snapshot) {
      final suggestions = snapshot.data;
      if (suggestions == null || suggestions.isEmpty) return const SizedBox.shrink();

      return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 6,
              children: [
                Icon(Symbols.auto_awesome, size: 18, color: theme.colorScheme.primary),
                Text('From Jira', style: theme.textTheme.labelLarge),
              ],
            ),
            const SizedBox(height: 4),
            for (final ghost in suggestions.ghosts)
              ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Symbols.add_circle, size: 20),
                title: Text(ghost.title, maxLines: 1, overflow: TextOverflow.ellipsis),
                subtitle: Text('${ghost.relation} · ${ghost.workItemKey}'),
                onTap: () => _acceptGhost(ghost, node),
              ),
            for (final connection in suggestions.connections)
              ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Symbols.polyline, size: 20),
                title: Text('Connect to ${connection.to.title}', maxLines: 1, overflow: TextOverflow.ellipsis),
                subtitle: Text('Jira says it ${connection.relation}'),
                onTap: () {
                  _model.connect(connection.from.id, connection.to.id, label: connection.relation, fromJiraLinkType: connection.relation);
                  _refreshSuggestions();
                },
              ),
          ],
        ),
      );
    },
  );

  /// Clicking a ghost is already the reader saying it belongs here, so it is
  /// filed without a second confirmation.
  void _acceptGhost(MindMapGhost ghost, MindMapNode node) {
    acceptMindMapGhost(_model, near: node, ghost: ghost);
    _refreshSuggestions();
  }
}
