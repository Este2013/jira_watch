/// The dialogs the map is edited through.
///
/// Each one does a single thing and closes. The map itself is the place to
/// think; a dialog that tried to be a second editor would just be a worse
/// version of the inspector.
library;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jira_watcher/dao/jira/jira_api.dart';
import 'package:jira_watcher/models/mind_map_model.dart';
import 'package:jira_watcher/models/mind_map_suggestions.dart';
import 'package:jira_watcher/models/to_do_tasks_models.dart';
import 'package:jira_watcher/models/work_item_tabs_model.dart';
import 'package:jira_watcher/ui/utils/widgets/app_snackbar.dart';
import 'package:material_symbols_icons/symbols.dart';

/// Creates a topic, or renames and re-colours one that already exists.
class MindMapTopicDialog extends StatefulWidget {
  const MindMapTopicDialog({super.key, required this.model, this.editing, this.parentId});

  final MindMapModel model;

  /// The node being edited, or null to create a new one.
  final MindMapNode? editing;

  /// Where a newly created topic lands. Ignored when [editing].
  final String? parentId;

  @override
  State<MindMapTopicDialog> createState() => _MindMapTopicDialogState();
}

class _MindMapTopicDialogState extends State<MindMapTopicDialog> {
  late final TextEditingController _title = TextEditingController(text: widget.editing?.title ?? '');
  late final TextEditingController _tag = TextEditingController();
  late List<String> _tags = [...?widget.editing?.tags];
  late int _accent = widget.editing?.accent ?? 0;

  @override
  void dispose() {
    _title.dispose();
    _tag.dispose();
    super.dispose();
  }

  void _addTag() {
    final clean = _tag.text.trim().toLowerCase();
    if (clean.isEmpty || _tags.contains(clean)) return;
    setState(() {
      _tags = [..._tags, clean];
      _tag.clear();
    });
  }

  void _save() {
    final model = widget.model;
    final editing = widget.editing;
    if (editing == null) {
      final created = model.createTopic(title: _title.text, parentId: widget.parentId, tags: _tags, accent: _accent);
      Navigator.of(context).pop(created);
      return;
    }

    model.rename(editing.id, _title.text);
    model.setAccent(editing.id, _accent);
    for (final tag in editing.tags.where((t) => !_tags.contains(t))) {
      model.removeTag(editing.id, tag);
    }
    for (final tag in _tags.where((t) => !editing.tags.contains(t))) {
      model.addTag(editing.id, tag);
    }
    Navigator.of(context).pop(model.nodeById(editing.id));
  }

  @override
  Widget build(BuildContext context) {
    final parent = widget.model.nodeById(widget.parentId);

    return AlertDialog(
      title: Text(widget.editing == null ? 'New topic' : 'Edit topic'),
      content: SizedBox(
        width: 420,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            if (widget.editing == null && parent != null) Text('Inside ${parent.title}', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).hintColor)),
            TextField(
              controller: _title,
              autofocus: true,
              decoration: const InputDecoration(labelText: 'Name', hintText: 'Audio, Release 6.4, Flaky tests…'),
              onSubmitted: (_) => _save(),
            ),
            Row(
              spacing: 8,
              children: [
                for (var i = 0; i < mindMapPalette.length; i++)
                  InkWell(
                    onTap: () => setState(() => _accent = i),
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 26,
                      height: 26,
                      decoration: BoxDecoration(
                        color: mindMapColor(i),
                        shape: BoxShape.circle,
                        border: Border.all(color: _accent == i ? Theme.of(context).colorScheme.onSurface : Colors.transparent, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            Row(
              spacing: 8,
              children: [
                Expanded(
                  child: TextField(
                    controller: _tag,
                    decoration: const InputDecoration(labelText: 'Tags', hintText: 'regression, windows…', isDense: true),
                    onSubmitted: (_) => _addTag(),
                  ),
                ),
                IconButton(onPressed: _addTag, icon: const Icon(Symbols.add), tooltip: 'Add tag'),
              ],
            ),
            if (_tags.isNotEmpty)
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  for (final tag in _tags)
                    Chip(
                      label: Text(tag),
                      visualDensity: VisualDensity.compact,
                      onDeleted: () => setState(() => _tags = _tags.where((t) => t != tag).toList()),
                    ),
                ],
              ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: Navigator.of(context).pop, child: const Text('Cancel')),
        FilledButton(onPressed: _save, child: Text(widget.editing == null ? 'Create' : 'Save')),
      ],
    );
  }
}

/// Adds a link to a node, or edits one already there.
class MindMapLinkDialog extends StatefulWidget {
  const MindMapLinkDialog({super.key, required this.model, required this.nodeId, this.editing});

  final MindMapModel model;
  final String nodeId;
  final MindMapLink? editing;

  @override
  State<MindMapLinkDialog> createState() => _MindMapLinkDialogState();
}

class _MindMapLinkDialogState extends State<MindMapLinkDialog> {
  late final TextEditingController _url = TextEditingController(text: widget.editing?.url ?? '');
  late final TextEditingController _title = TextEditingController(text: widget.editing?.title ?? '');
  late final TextEditingController _group = TextEditingController(text: widget.editing?.group ?? '');
  late final TextEditingController _note = TextEditingController(text: widget.editing?.note ?? '');

  @override
  void initState() {
    super.initState();
    if (widget.editing == null) _pasteFromClipboard();
  }

  /// A link is nearly always copied from somewhere a moment earlier, so the
  /// field offers what is on the clipboard rather than making the reader paste
  /// it themselves. Only a URL, and only into an empty field.
  Future<void> _pasteFromClipboard() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    final text = data?.text?.trim() ?? '';
    if (!mounted || _url.text.isNotEmpty) return;
    if (text.startsWith('http://') || text.startsWith('https://')) _url.text = text;
  }

  @override
  void dispose() {
    _url.dispose();
    _title.dispose();
    _group.dispose();
    _note.dispose();
    super.dispose();
  }

  void _save() {
    if (_url.text.trim().isEmpty) return;
    final model = widget.model;
    final editing = widget.editing;
    if (editing == null) {
      model.addLink(widget.nodeId, url: _url.text, title: _title.text, group: _group.text, note: _note.text);
    } else {
      model.updateLink(
        widget.nodeId,
        editing.copyWith(
          url: _url.text.trim(),
          title: _title.text.trim().isEmpty ? editing.title : _title.text.trim(),
          group: _group.text.trim(),
          clearGroup: _group.text.trim().isEmpty,
          note: _note.text.trim(),
          clearNote: _note.text.trim().isEmpty,
        ),
      );
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    // Whatever groups this node already uses, so a second link lands in the
    // same group by a click rather than by typing the name identically.
    final groups = (widget.model.nodeById(widget.nodeId)?.links ?? const <MindMapLink>[]).map((l) => l.group).whereType<String>().toSet().toList();

    return AlertDialog(
      title: Text(widget.editing == null ? 'Add a link' : 'Edit link'),
      content: SizedBox(
        width: 460,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            TextField(
              controller: _url,
              autofocus: true,
              decoration: const InputDecoration(labelText: 'URL', hintText: 'https://…'),
            ),
            TextField(
              controller: _title,
              decoration: const InputDecoration(labelText: 'Title', hintText: 'Left empty, the URL names itself'),
            ),
            TextField(
              controller: _group,
              decoration: const InputDecoration(labelText: 'Group', hintText: 'Test runs, Merge requests, Specs…'),
            ),
            if (groups.isNotEmpty)
              Wrap(
                spacing: 6,
                children: [
                  for (final group in groups)
                    ActionChip(
                      label: Text(group),
                      visualDensity: VisualDensity.compact,
                      onPressed: () => setState(() => _group.text = group),
                    ),
                ],
              ),
            TextField(
              controller: _note,
              decoration: const InputDecoration(labelText: 'Note', hintText: 'Why this is here'),
              maxLines: 2,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: Navigator.of(context).pop, child: const Text('Cancel')),
        FilledButton(onPressed: _save, child: Text(widget.editing == null ? 'Add' : 'Save')),
      ],
    );
  }
}

/// Picks a work item to put on the map, then asks [MindMapPlacementDialog]
/// where it should go.
///
/// Deliberately not a second Jira search: the work items worth mapping are the
/// ones already in front of the reader — pinned, or open in a tab — and
/// anything else is one pasted key away. A full search here would duplicate the
/// one the Work items strip already has.
class MindMapAttachWorkItemDialog extends StatefulWidget {
  const MindMapAttachWorkItemDialog({super.key, required this.model, required this.suggestions, this.parentId});

  final MindMapModel model;
  final MindMapSuggestions suggestions;

  /// Where it lands if the reader skips the placement step.
  final String? parentId;

  @override
  State<MindMapAttachWorkItemDialog> createState() => _MindMapAttachWorkItemDialogState();
}

class _MindMapAttachWorkItemDialogState extends State<MindMapAttachWorkItemDialog> {
  final _key = TextEditingController();

  /// The key pattern Jira uses. Matched rather than merely trimmed so a pasted
  /// browse URL still yields the key inside it.
  static final _keyPattern = RegExp(r'[A-Za-z][A-Za-z0-9_]*-[0-9]+');

  @override
  void dispose() {
    _key.dispose();
    super.dispose();
  }

  String? get _typedKey => _keyPattern.firstMatch(_key.text)?.group(0)?.toUpperCase();

  /// Everything to hand that is not on the map yet: the pins first, then
  /// whatever is open in a tab.
  List<String> get _candidates {
    final tabs = WorkItemTabsModel();
    final onMap = widget.model.workItemKeys;
    final keys = <String>{...tabs.pinnedKeys.list, ...tabs.tabs.list.map((t) => t.currentKey).whereType<String>()};
    return keys.where((k) => !onMap.contains(k.toUpperCase())).toList();
  }

  @override
  Widget build(BuildContext context) {
    final candidates = _candidates;
    final typed = _typedKey;

    return AlertDialog(
      title: const Text('Put a work item on the map'),
      content: SizedBox(
        width: 460,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            TextField(
              controller: _key,
              autofocus: true,
              decoration: const InputDecoration(labelText: 'Work item key', hintText: 'STUDIO-1234, or a link to one'),
              onChanged: (_) => setState(() {}),
              onSubmitted: (_) => typed == null ? null : _pick(typed),
            ),
            if (candidates.isNotEmpty) ...[
              Text('Pinned and open', style: Theme.of(context).textTheme.labelLarge),
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 220),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (final key in candidates)
                        ListTile(
                          dense: true,
                          leading: const Icon(Symbols.description),
                          title: Text(key),
                          onTap: () => _pick(key),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: Navigator.of(context).pop, child: const Text('Cancel')),
        FilledButton(
          onPressed: typed == null ? null : () => _pick(typed),
          child: const Text('Next'),
        ),
      ],
    );
  }

  Future<void> _pick(String key) async {
    final navigator = Navigator.of(context);
    final placed = await showDialog<MindMapNode>(
      context: context,
      builder: (_) => MindMapPlacementDialog(model: widget.model, suggestions: widget.suggestions, workItemKey: key, fallbackParentId: widget.parentId),
    );
    if (placed != null) navigator.pop(placed);
  }
}

/// Asks where a work item should go, having already worked out an answer.
///
/// This is the moment the whole feature is for: the reader sees their own
/// topics ranked by how much Jira's links argue for each, with the reason
/// written out, and usually just presses the button that is already selected.
class MindMapPlacementDialog extends StatefulWidget {
  const MindMapPlacementDialog({
    super.key,
    required this.model,
    required this.suggestions,
    required this.workItemKey,
    this.fallbackParentId,
  });

  final MindMapModel model;
  final MindMapSuggestions suggestions;
  final String workItemKey;
  final String? fallbackParentId;

  @override
  State<MindMapPlacementDialog> createState() => _MindMapPlacementDialogState();
}

class _MindMapPlacementDialogState extends State<MindMapPlacementDialog> {
  late final Future<_PlacementOptions> _options = _load();

  /// Which topic is picked, by id; the empty string is the top level.
  String? _chosen;

  /// Whether to draw edges to the work items this one links, once it is placed.
  bool _connect = true;

  Future<_PlacementOptions> _load() async {
    final placements = await widget.suggestions.placementsFor(widget.workItemKey);
    final relations = await widget.suggestions.relationsFor(widget.workItemKey);
    if (mounted) {
      setState(() {
        // The best answer, preselected — the reader confirms rather than
        // decides, which is the difference between help and homework.
        _chosen ??= placements.first.topic?.id ?? '';
      });
    }
    return _PlacementOptions(placements, relations);
  }

  void _place(_PlacementOptions options) {
    final model = widget.model;
    final parentId = (_chosen ?? '').isEmpty ? widget.fallbackParentId : _chosen;
    final node = model.attachWorkItem(
      key: widget.workItemKey,
      title: options.relations.summary ?? widget.workItemKey,
      parentId: parentId,
    );

    if (_connect) {
      for (final relation in options.relations.related) {
        final other = model.nodeForWorkItem(relation.key);
        // Containment already says these two belong together; an edge on top
        // of it would only add a line to the drawing.
        if (other == null || other.id == node.id) continue;
        if (other.parentId == node.id || node.parentId == other.id) continue;
        model.connect(node.id, other.id, label: relation.relation, fromJiraLinkType: relation.relation);
      }
    }

    Navigator.of(context).pop(model.nodeById(node.id));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Where does ${widget.workItemKey} go?'),
      content: SizedBox(
        width: 520,
        child: FutureBuilder<_PlacementOptions>(
          future: _options,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox(
                height: 120,
                child: Center(
                  child: Column(mainAxisSize: MainAxisSize.min, spacing: 12, children: [CircularProgressIndicator(), Text('Asking Jira what this relates to…')]),
                ),
              );
            }
            final options = snapshot.data!;
            final linkable = options.relations.related.where((r) => widget.model.nodeForWorkItem(r.key) != null).length;

            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (options.relations.summary != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(options.relations.summary!, style: Theme.of(context).textTheme.titleSmall),
                  ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 300),
                  child: SingleChildScrollView(
                    child: RadioGroup<String>(
                      groupValue: _chosen,
                      onChanged: (value) => setState(() => _chosen = value),
                      child: Column(
                        children: [
                          for (final placement in options.placements)
                            RadioListTile<String>(
                              value: placement.topic?.id ?? '',
                              dense: true,
                              title: Row(
                                spacing: 8,
                                children: [
                                  Icon(placement.topic == null ? Symbols.workspaces : Symbols.hub, size: 16, color: placement.topic?.color),
                                  Flexible(child: Text(placement.label, overflow: TextOverflow.ellipsis)),
                                ],
                              ),
                              subtitle: Text(
                                placement.evidence.isEmpty ? placement.reason : '${placement.reason} · ${placement.evidence.take(3).join(', ')}',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).hintColor),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (linkable > 0)
                  CheckboxListTile(
                    value: _connect,
                    onChanged: (value) => setState(() => _connect = value ?? true),
                    dense: true,
                    controlAffinity: ListTileControlAffinity.leading,
                    title: Text('Connect it to the $linkable work ${linkable == 1 ? 'item' : 'items'} it links to'),
                  ),
              ],
            );
          },
        ),
      ),
      actions: [
        TextButton(onPressed: Navigator.of(context).pop, child: const Text('Cancel')),
        FutureBuilder<_PlacementOptions>(
          future: _options,
          builder: (context, snapshot) => FilledButton(
            onPressed: snapshot.hasData ? () => _place(snapshot.data!) : null,
            child: const Text('Put it there'),
          ),
        ),
      ],
    );
  }
}

/// What the placement dialog needs, fetched once.
class _PlacementOptions {
  const _PlacementOptions(this.placements, this.relations);

  final List<MindMapPlacement> placements;
  final JiraRelations relations;
}

/// Picks another node on the map to connect the current one to.
class MindMapConnectDialog extends StatefulWidget {
  const MindMapConnectDialog({super.key, required this.model, required this.from});

  final MindMapModel model;
  final MindMapNode from;

  @override
  State<MindMapConnectDialog> createState() => _MindMapConnectDialogState();
}

class _MindMapConnectDialogState extends State<MindMapConnectDialog> {
  final _search = TextEditingController();
  final _label = TextEditingController();

  @override
  void dispose() {
    _search.dispose();
    _label.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = widget.model;
    final hits = model.search(_search.text).where((hit) => hit.node.id != widget.from.id && !model.areConnected(widget.from.id, hit.node.id)).take(40).toList();

    return AlertDialog(
      title: Text('Connect ${widget.from.title} to…'),
      content: SizedBox(
        width: 460,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            TextField(
              controller: _search,
              autofocus: true,
              decoration: const InputDecoration(labelText: 'Find a node', prefixIcon: Icon(Symbols.search)),
              onChanged: (_) => setState(() {}),
            ),
            TextField(
              controller: _label,
              decoration: const InputDecoration(labelText: 'What the connection is', hintText: 'blocks, supersedes, same root cause…'),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 280),
              child: hits.isEmpty
                  ? const Padding(padding: EdgeInsets.all(16), child: Text('Nothing else to connect to.'))
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          for (final hit in hits)
                            ListTile(
                              dense: true,
                              leading: Icon(hit.node.kind.icon, color: hit.node.color),
                              title: Text(hit.node.title, maxLines: 1, overflow: TextOverflow.ellipsis),
                              subtitle: Text(model.pathTo(hit.node.id).map((n) => n.title).join(' › '), maxLines: 1, overflow: TextOverflow.ellipsis),
                              onTap: () {
                                model.connect(widget.from.id, hit.node.id, label: _label.text.trim().isEmpty ? null : _label.text.trim());
                                Navigator.of(context).pop();
                              },
                            ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
      actions: [TextButton(onPressed: Navigator.of(context).pop, child: const Text('Done'))],
    );
  }
}

/// Re-files a node under a different one.
///
/// The node's own subtree is left out of the list: filing something inside
/// itself would cut the whole branch loose from every root, and a picker that
/// offers an option it then refuses is worse than one that never offered it.
class MindMapMoveDialog extends StatefulWidget {
  const MindMapMoveDialog({super.key, required this.model, required this.node});

  final MindMapModel model;
  final MindMapNode node;

  @override
  State<MindMapMoveDialog> createState() => _MindMapMoveDialogState();
}

class _MindMapMoveDialogState extends State<MindMapMoveDialog> {
  final _search = TextEditingController();

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = widget.model;
    final candidates = model
        .search(_search.text)
        .where((hit) => !model.isSelfOrDescendant(hit.node.id, widget.node.id))
        .where((hit) => hit.node.id != widget.node.parentId)
        .take(40)
        .toList();

    return AlertDialog(
      title: Text('Move ${widget.node.title} into…'),
      content: SizedBox(
        width: 460,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            TextField(
              controller: _search,
              autofocus: true,
              decoration: const InputDecoration(labelText: 'Find a node', prefixIcon: Icon(Symbols.search)),
              onChanged: (_) => setState(() {}),
            ),
            if (widget.node.parentId != null)
              ListTile(
                dense: true,
                leading: const Icon(Symbols.workspaces),
                title: const Text('The top level'),
                onTap: () {
                  model.moveNode(widget.node.id, null);
                  Navigator.of(context).pop();
                },
              ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 280),
              child: candidates.isEmpty
                  ? const Padding(padding: EdgeInsets.all(16), child: Text('Nowhere else to put it.'))
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          for (final hit in candidates)
                            ListTile(
                              dense: true,
                              leading: Icon(hit.node.kind.icon, color: hit.node.color),
                              title: Text(hit.node.title, maxLines: 1, overflow: TextOverflow.ellipsis),
                              subtitle: Text(model.pathTo(hit.node.id).map((n) => n.title).join(' › '), maxLines: 1, overflow: TextOverflow.ellipsis),
                              onTap: () {
                                model.moveNode(widget.node.id, hit.node.id);
                                Navigator.of(context).pop();
                              },
                            ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
      actions: [TextButton(onPressed: Navigator.of(context).pop, child: const Text('Cancel'))],
    );
  }
}

/// Attaches a To Do task to a node, or makes a new one already attached.
///
/// The tasks are the app's own — the same ones the To Do page shows — so a task
/// adopted here is not a copy, and ticking it off in either place is the same
/// act.
class MindMapTaskDialog extends StatefulWidget {
  const MindMapTaskDialog({super.key, required this.model, required this.node});

  final MindMapModel model;
  final MindMapNode node;

  @override
  State<MindMapTaskDialog> createState() => _MindMapTaskDialogState();
}

class _MindMapTaskDialogState extends State<MindMapTaskDialog> {
  final _title = TextEditingController();
  final _search = TextEditingController();

  @override
  void dispose() {
    _title.dispose();
    _search.dispose();
    super.dispose();
  }

  Future<void> _create() async {
    final title = _title.text.trim();
    if (title.isEmpty) return;
    final navigator = Navigator.of(context);
    final task = await ToDoTasksModel().createNewTask(
      title: title,
      // The work item key goes along, so the task is reachable from the ticket
      // as well as from the map.
      workItemKeys: [?widget.node.workItemKey],
    );
    widget.model.attachTask(widget.node.id, task.id);
    navigator.pop();
  }

  @override
  Widget build(BuildContext context) {
    final already = widget.node.taskIds.toSet();
    final needle = _search.text.trim().toLowerCase();
    final available = ToDoTasksModel().toDoTasksControllers.list.where((c) => !already.contains(c.id) && !c.isComplete.value).where((c) => needle.isEmpty || c.title.text.toLowerCase().contains(needle)).take(40).toList();

    return AlertDialog(
      title: const Text('Add a task'),
      content: SizedBox(
        width: 460,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            Row(
              spacing: 8,
              children: [
                Expanded(
                  child: TextField(
                    controller: _title,
                    autofocus: true,
                    decoration: const InputDecoration(labelText: 'New task', hintText: 'What needs doing'),
                    onSubmitted: (_) => _create(),
                  ),
                ),
                FilledButton(onPressed: _create, child: const Text('Create')),
              ],
            ),
            const Divider(),
            TextField(
              controller: _search,
              decoration: const InputDecoration(labelText: 'Or adopt one you already have', prefixIcon: Icon(Symbols.search), isDense: true),
              onChanged: (_) => setState(() {}),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 240),
              child: available.isEmpty
                  ? const Padding(padding: EdgeInsets.all(16), child: Text('No open tasks to adopt.'))
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          for (final controller in available)
                            ListTile(
                              dense: true,
                              leading: const Icon(Symbols.check_box_outline_blank),
                              title: Text(controller.title.text.isEmpty ? 'Untitled task' : controller.title.text, maxLines: 1, overflow: TextOverflow.ellipsis),
                              onTap: () {
                                widget.model.attachTask(widget.node.id, controller.id);
                                Navigator.of(context).pop();
                              },
                            ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
      actions: [TextButton(onPressed: Navigator.of(context).pop, child: const Text('Done'))],
    );
  }
}

/// Confirms deleting a node, saying plainly what happens to what is inside it.
Future<bool> confirmMindMapDelete(BuildContext context, MindMapModel model, MindMapNode node) async {
  final children = model.childrenOf(node.id).length;
  final parent = model.nodeById(node.parentId);

  final confirmed = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Remove ${node.title}?'),
      content: Text(
        children == 0 ? 'It goes off the map. The work item itself is untouched in Jira.' : 'Its $children ${children == 1 ? 'node' : 'nodes'} move up to ${parent?.title ?? 'the top level'} rather than going with it.',
      ),
      actions: [
        TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancel')),
        FilledButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Remove')),
      ],
    ),
  );
  return confirmed ?? false;
}

/// Looks up a work item's summary, so a node put on the map by key is not
/// called "STUDIO-1234" forever.
Future<String> mindMapWorkItemTitle(String key) async {
  try {
    final issue = await JiraApi().workItem(key);
    final summary = ((issue?['fields'] as Map?)?['summary'])?.toString();
    return summary?.trim().isNotEmpty == true ? summary!.trim() : key;
  } on Object {
    return key;
  }
}

/// Puts a work item on the map from anywhere else in the app, and goes there.
///
/// The entry point the whole feature hangs off: the moment a ticket is worth
/// remembering is while you are reading it, not later when you have gone
/// looking for the map.
Future<void> addToMindMap(BuildContext context, String key) async {
  final model = MindMapModel();
  // The map may never have been opened this session, in which case its lists
  // have not been read off disk yet — waiting here is what keeps that from
  // being a LateInitializationError the first time someone uses this menu.
  await model.isReady;
  if (!context.mounted) return;

  void goToTheMap(String nodeId) {
    model.focus(nodeId);
    WorkItemTabsModel().setActiveLeadingView(WorkItemsLeadingView.mindMap);
  }

  if (model.nodeForWorkItem(key) case final existing?) {
    goToTheMap(existing.id);
    showAppSnackBar(
      context,
      SnackBar(content: Text('$key is already on the map.')),
      duration: const Duration(seconds: 2),
    );
    return;
  }

  final placed = await showDialog<MindMapNode>(
    context: context,
    builder: (_) => MindMapPlacementDialog(model: model, suggestions: MindMapSuggestions.shared, workItemKey: key),
  );
  if (placed != null) goToTheMap(placed.id);
}
