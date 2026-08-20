import 'package:flutter/material.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/to_do_tasks_models.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_branch_icons.dart';
import 'package:material_symbols_icons/symbols.dart';

/// Fetches the Jira labels and component names of [workItemKeys], for the
/// "From linked work items" autosuggest section — best effort, since a
/// single failed lookup should not stop the rest from suggesting anything.
Future<Set<String>> tagsFromLinkedWorkItems(Iterable<String> workItemKeys) async {
  final tags = <String>{};
  for (final key in workItemKeys) {
    try {
      final data = await DataModel().jiraApi.workItem(key);
      final fields = data?['fields'] as Map?;

      for (final label in (fields?['labels'] as List? ?? const [])) {
        tags.add(label.toString());
      }
      for (final component in (fields?['components'] as List? ?? const [])) {
        final name = (component as Map?)?['name'];
        if (name != null) tags.add(name.toString());
      }
    } on Object {
      // Best effort — see the doc comment above.
    }
  }
  return tags;
}

/// Adds one or more tags to [taskController], suggested in two sections:
///
/// - Tags already used on some other task that seem relevant here — they
///   appear in this task's own title/notes, or match one of its linked work
///   items' own labels/components.
/// - The linked work items' labels/components themselves that are not
///   already covered by the section above — new tags nobody has used yet,
///   sourced straight from Jira.
///
/// Typing something that matches neither still works: whatever is in the
/// field can be added directly.
class AddTagDialog extends StatefulWidget {
  const AddTagDialog({super.key, required this.taskController});

  final ToDoTaskEditingController taskController;

  @override
  State<AddTagDialog> createState() => _AddTagDialogState();
}

class _AddTagDialogState extends State<AddTagDialog> {
  late final TextEditingController _search;
  Set<String> _ticketTags = {};
  bool _loadingTicketTags = true;

  /// An icon staged via the leading button, applied to whatever tag ends up
  /// being added next — whether that is the typed text or a suggestion chip,
  /// which is what lets this also re-icon a recommended tag rather than only
  /// ever apply to a freshly-typed one. Reset after each add so it does not
  /// leak onto an unrelated tag added afterwards.
  String? _pendingIconName;

  @override
  void initState() {
    super.initState();
    _search = TextEditingController();
    _search.addListener(() => setState(() {}));
    _loadTicketTags();
  }

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  Future<void> _loadTicketTags() async {
    final tags = await tagsFromLinkedWorkItems(widget.taskController.linkedWorkItems.list);
    if (!mounted) return;
    setState(() {
      _ticketTags = tags;
      _loadingTicketTags = false;
    });
  }

  void _add(String tag) {
    final trimmed = tag.trim();
    // ObservableList.contains is typed to int regardless of the list's own
    // element type — a quirk of that package, not something to work around
    // by casting; .list is a plain List<String> and does not have it.
    if (trimmed.isEmpty) return;
    if (!widget.taskController.tags.list.contains(trimmed)) widget.taskController.tags.add(trimmed);
    final stagedIcon = _pendingIconName;
    if (stagedIcon != null) ToDoTasksModel().setTagIcon(trimmed, stagedIcon);
    setState(() {
      _search.clear();
      _pendingIconName = null;
    });
  }

  Future<void> _pickPendingIcon() async {
    final picked = await showDialog<String>(
      context: context,
      builder: (context) => GitLabBranchIconPickerDialog(selected: _pendingIconName ?? 'label'),
    );
    if (picked != null) setState(() => _pendingIconName = picked);
  }

  @override
  Widget build(BuildContext context) {
    final already = widget.taskController.tags.list.toSet();
    final query = _search.text.trim().toLowerCase();
    final title = widget.taskController.title.text.toLowerCase();
    final notes = widget.taskController.notes.text.toLowerCase();
    final ticketTagsLower = _ticketTags.map((t) => t.toLowerCase()).toSet();

    final reused = ToDoTasksModel().allUsedTags.where((tag) {
      if (already.contains(tag)) return false;
      final lower = tag.toLowerCase();
      if (query.isNotEmpty && !lower.contains(query)) return false;
      return title.contains(lower) || notes.contains(lower) || ticketTagsLower.contains(lower);
    }).toList();
    final reusedLower = reused.map((t) => t.toLowerCase()).toSet();

    final fromTickets = _ticketTags.where((tag) {
      if (already.contains(tag) || reusedLower.contains(tag.toLowerCase())) return false;
      return query.isEmpty || tag.toLowerCase().contains(query);
    }).toList()..sort();

    return AlertDialog(
      title: const Text('Add a tag'),
      constraints: const BoxConstraints(maxWidth: 420),
      content: SizedBox(
        width: 380,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            TextField(
              autofocus: true,
              controller: _search,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Tag name',
                prefixIcon: IconButton(
                  tooltip: 'Choose an icon for this tag',
                  icon: Icon(gitLabBranchIcon(_pendingIconName ?? 'label')),
                  onPressed: _pickPendingIcon,
                ),
              ),
              onSubmitted: (v) {
                _add(v);
                Navigator.of(context).pop();
              },
            ),
            if (_loadingTicketTags) const LinearProgressIndicator(),
            if (reused.isNotEmpty) ...[
              Text('Already used', style: Theme.of(context).textTheme.labelMedium),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [for (final tag in reused) ActionChip(label: Text(tag), onPressed: () => _add(tag))],
              ),
            ],
            if (fromTickets.isNotEmpty) ...[
              Text('From linked work items', style: Theme.of(context).textTheme.labelMedium),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  for (final tag in fromTickets) ActionChip(avatar: const Icon(Symbols.link, size: 16), label: Text(tag), onPressed: () => _add(tag)),
                ],
              ),
            ],
            if (!_loadingTicketTags && reused.isEmpty && fromTickets.isEmpty)
              Text(
                query.isEmpty ? 'No suggestions yet — type a tag name above.' : 'No suggestions match "$query" — press Enter to add it anyway.',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).hintColor),
              ),
          ],
        ),
      ),
      actions: [
        FilledButton(
          // Whatever is still typed but never got submitted (no Enter, no
          // suggestion tapped) would otherwise be silently dropped — Done
          // means "I'm finished", not "throw away what I just typed".
          onPressed: () {
            _add(_search.text);
            Navigator.of(context).pop();
          },
          child: const Text('Done'),
        ),
      ],
    );
  }
}
