import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/to_do_tasks_models.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_branch_icons.dart';
import 'package:jira_watcher/ui/to_do_widgets/to_do_main.dart';
import 'package:jira_watcher/ui/to_do_widgets/to_do_tag_dialog.dart';
import 'package:jira_watcher/ui/updates_widgets/updates_view_single_work_item/work_item_details_view.dart';
import 'package:jira_watcher/ui/utils/jira_ui_utils/jira_work_item_search.dart';
import 'package:jira_watcher/ui/utils/labelled_text_presenter.dart';
import 'package:jira_watcher/ui/utils/widgets/dialog_widgets.dart/action_buttons.dart';
import 'package:jira_watcher/ui/utils/widgets/morphing_buttons.dart';
import 'package:material_symbols_icons/symbols.dart';

/// Wraps [SingleTaskView] with a breadcrumb bar tracking every ancestor along
/// the current drill-down path, not just the immediate parent — so jumping
/// back to any earlier task is one click regardless of how deep [onOpenChild]
/// has gone.
class TaskDetailNavigator extends StatefulWidget {
  const TaskDetailNavigator({super.key, required this.rootTaskId, this.initialPath});

  final int rootTaskId;

  /// The full chain from [rootTaskId] down to whatever task should already
  /// be open — e.g. a search result several levels deep. Falls back to
  /// just `[rootTaskId]` when absent or malformed.
  final List<int>? initialPath;

  @override
  State<TaskDetailNavigator> createState() => _TaskDetailNavigatorState();
}

class _TaskDetailNavigatorState extends State<TaskDetailNavigator> {
  late List<int> _path;

  /// The deepest path reached along the current branch — always agrees with
  /// [_path] wherever both have an entry, and always at least as long.
  /// Stepping back up via the breadcrumbs only shortens [_path]; this keeps
  /// remembering what was open past that point, so the trailing chevron can
  /// offer it again as a one-click way back down. Only replaced outright —
  /// starting over from wherever [_path] is at that point — once a
  /// genuinely different child is chosen instead.
  late List<int> _history;

  @override
  void initState() {
    super.initState();
    final initial = widget.initialPath;
    _path = (initial != null && initial.isNotEmpty && initial.first == widget.rootTaskId) ? initial : [widget.rootTaskId];
    _history = List.of(_path);
  }

  bool _agreesWithHistory(List<int> path) {
    if (_history.length < path.length) return false;
    for (var i = 0; i < path.length; i++) {
      if (_history[i] != path[i]) return false;
    }
    return true;
  }

  /// Navigates to [newPath]. When it still follows [_history], whatever it
  /// remembers past [newPath] is left alone; otherwise [newPath] becomes the
  /// new remembered branch, discarding what used to be remembered past it.
  void _goTo(List<int> newPath) => setState(() {
    _path = newPath;
    if (!_agreesWithHistory(newPath)) _history = List.of(newPath);
  });

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: DataModel().todoTasks.allTasksListenable,
    builder: (context, _) {
      // A task along the path can vanish out from under this view — deleted,
      // or unparented by a drag elsewhere — in which case the path is
      // truncated right before the first gap rather than showing a jumbled
      // remainder or crashing on a missing controller.
      final controllers = <ToDoTaskEditingController>[];
      for (final id in _path) {
        final controller = ToDoTasksModel().byId(id);
        if (controller == null) break;
        controllers.add(controller);
      }
      if (controllers.isEmpty) {
        return const Center(child: Text('This task no longer exists.'));
      }
      if (controllers.length != _path.length) {
        final truncated = controllers.map((c) => c.id).toList();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          setState(() {
            _path = truncated;
            // A vanished task shouldn't linger as a rememberable next step.
            if (!_agreesWithHistory(truncated)) _history = List.of(truncated);
          });
        });
      }

      // The remembered continuation past what's currently shown, resolved to
      // real controllers same as [controllers] itself — rendered as its own
      // clickable breadcrumb segments (see [ghostCount] below) rather than
      // only reachable through the trailing chevron's dropdown, so hopping
      // straight back down to it is one click on its name, not two.
      final ghostControllers = <ToDoTaskEditingController>[];
      for (var i = controllers.length; i < _history.length; i++) {
        final controller = ToDoTasksModel().byId(_history[i]);
        if (controller == null) break;
        ghostControllers.add(controller);
      }
      final segments = [...controllers, ...ghostControllers];
      final trailingChildren = ToDoTasksModel().childrenOf(segments.last.id);

      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                for (final (index, segment) in segments.indexed) ...[
                  // Windows Explorer-style: the chevron between two
                  // breadcrumb segments is itself clickable, opening every
                  // other subtask at that same layer (i.e. every other
                  // child of the segment before it) so jumping sideways to
                  // a sibling doesn't require walking back up first. Works
                  // the same whether either side is a currently-open segment
                  // or one of the remembered [ghostControllers].
                  if (index > 0)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: PopupMenuButton<int>(
                        tooltip: 'Other subtasks of ${segments[index - 1].title.text.isEmpty ? 'no title' : segments[index - 1].title.text}',
                        padding: EdgeInsets.zero,
                        icon: const Icon(Symbols.chevron_right, size: 16),
                        itemBuilder: (context) => [
                          for (final sibling in ToDoTasksModel().childrenOf(segments[index - 1].id))
                            PopupMenuItem(
                              value: sibling.id,
                              child: Row(
                                spacing: 8,
                                children: [
                                  Icon(sibling.id == segment.id ? Symbols.check : null, size: 16),
                                  Expanded(
                                    child: Text(
                                      sibling.title.text.isEmpty ? 'no title' : sibling.title.text,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                        onSelected: (siblingId) => _goTo([...segments.sublist(0, index).map((c) => c.id), siblingId]),
                      ),
                    ),
                  if (index == controllers.length - 1)
                    // Where we already are — outlined rather than flat so it
                    // reads as the current position at a glance, even though
                    // (like the others) it's disabled either way.
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(visualDensity: VisualDensity.compact),
                      onPressed: null,
                      child: Text(
                        segment.title.text.isEmpty ? 'no title' : segment.title.text,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  else
                    TextButton(
                      style: TextButton.styleFrom(
                        visualDensity: VisualDensity.compact,
                        // A remembered-but-not-yet-reopened segment reads as
                        // a step forward waiting to be taken, not a place
                        // already visited — same idea as a browser's grayed-
                        // out forward button, just inline in the breadcrumbs.
                        foregroundColor: index >= controllers.length ? Theme.of(context).colorScheme.outline : null,
                      ),
                      // An ancestor behind the current position or a
                      // remembered descendant ahead of it — either way, a
                      // click away.
                      onPressed: () => _goTo(segments.sublist(0, index + 1).map((c) => c.id).toList()),
                      child: Text(
                        segment.title.text.isEmpty ? 'no title' : segment.title.text,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                ],
                // A trailing chevron for the deepest segment's own children —
                // present even at the root with nothing opened yet, so
                // drilling in doesn't require first finding the Subtasks
                // section below.
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: PopupMenuButton<int>(
                    tooltip: trailingChildren.isEmpty
                        ? 'No subtasks yet'
                        : 'Subtasks of ${segments.last.title.text.isEmpty ? 'no title' : segments.last.title.text}',
                    enabled: trailingChildren.isNotEmpty,
                    padding: EdgeInsets.zero,
                    icon: Icon(Symbols.chevron_right, size: 16, color: trailingChildren.isEmpty ? Theme.of(context).disabledColor : null),
                    itemBuilder: (context) => [
                      for (final child in trailingChildren)
                        PopupMenuItem(
                          value: child.id,
                          child: Text(
                            child.title.text.isEmpty ? 'no title' : child.title.text,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                    ],
                    onSelected: (childId) => _goTo([...segments.map((c) => c.id), childId]),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleTaskView(
              controllers.last,
              key: ValueKey(controllers.last.id),
              onOpenChild: (childId) => _goTo([..._path, childId]),
            ),
          ),
        ],
      );
    },
  );
}

class SingleTaskView extends StatefulWidget {
  const SingleTaskView(
    this.taskController, {
    super.key,
    this.onOpenChild,
  });

  final ToDoTaskEditingController taskController;

  /// Called when the reader taps a subtask to drill into it — see
  /// [TaskDetailNavigator], which is what actually owns the drill-down path
  /// this just reports into.
  final ValueChanged<int>? onOpenChild;

  @override
  State<SingleTaskView> createState() => _SingleTaskViewState();
}

class _SingleTaskViewState extends State<SingleTaskView> {
  late bool takingNotes, linkingItems, usingTimeline, usingTags, usingSubtasks;

  @override
  void initState() {
    takingNotes = widget.taskController.notes.text.trim().isNotEmpty;
    linkingItems = widget.taskController.linkedWorkItems.isNotEmpty;
    usingTimeline = widget.taskController.events.isNotEmpty;
    usingTags = widget.taskController.tags.isNotEmpty;
    usingSubtasks = ToDoTasksModel().childrenOf(widget.taskController.id).isNotEmpty;
    super.initState();
  }

  Future<void> _pickTagIcon(String tag) async {
    final currentName = ToDoTasksModel().iconNameForTag(tag) ?? 'label';
    final picked = await showDialog<String>(context: context, builder: (context) => GitLabBranchIconPickerDialog(selected: currentName));
    if (picked != null) ToDoTasksModel().setTagIcon(tag, picked);
  }

  void save() => ToDoTasksModel().editTask(widget.taskController.toToDoTask());

  @override
  Widget build(BuildContext context) => Scaffold(
    persistentFooterAlignment: AlignmentDirectional.center,

    body: Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 800),
        child: ListView(
          shrinkWrap: true,
          children:
              [
                    SizedBox.shrink(),
                    // title and category
                    Row(
                      spacing: 8,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: widget.taskController.title,
                            // onChanged: (value) => save(),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('Title'),
                            ),
                          ),
                        ),
                        AnimatedBuilder(
                          animation: widget.taskController.category,
                          builder: (context, _) {
                            final categoryData = ToDoTask.categoryDataFrom(widget.taskController.category.value);
                            return IconButton(
                              icon: Row(
                                spacing: 8,
                                children: [
                                  Icon(categoryData.$2, color: categoryData.$3, fill: 1),
                                  Text(categoryData.$1, style: Theme.of(context).textTheme.titleMedium),
                                ],
                              ),
                              onPressed: () =>
                                  showDialog<int>(
                                    context: context,
                                    builder: (context) => EditToDoTaskCategoryDialog(),
                                  ).then(
                                    (value) {
                                      if (value == null) return;
                                      widget.taskController.category.value = value;
                                      ToDoTasksModel().editTask(widget.taskController.toToDoTask());
                                    },
                                  ),
                            );
                          },
                        ),
                      ],
                    ),
                    // starter kit
                    Row(
                      spacing: 8,
                      children: [
                        if (!takingNotes)
                          ActionChip(
                            avatar: Icon(Symbols.contract_edit),
                            label: Text('Start taking notes'),
                            onPressed: () => setState(() {
                              takingNotes = true;
                            }),
                          ),
                        if (!linkingItems)
                          ActionChip(
                            avatar: Icon(Symbols.add_link),
                            label: Text('Link work items'),
                            onPressed: () {
                              showDialog(context: context, builder: (context) => WorkItemSearchDialog(selectionMode: true)).then(
                                (value) {
                                  if (value == null) return;
                                  widget.taskController.linkedWorkItems.add(value);
                                  setState(() {
                                    linkingItems = true;
                                  });
                                },
                              );
                            },
                          ),
                        if (!usingTimeline)
                          ActionChip(
                            avatar: Icon(Symbols.commit),
                            label: Text('Add an event'),
                            onPressed: () {
                              showDialog(context: context, builder: (context) => _EditTimeLineEventDialog()).then(
                                (value) {
                                  if (value == null) return;
                                  widget.taskController.events.add(value);
                                  setState(() {
                                    usingTimeline = true;
                                  });
                                },
                              );
                            },
                          ),
                        if (!usingTags)
                          ActionChip(
                            avatar: Icon(Symbols.sell),
                            label: Text('Add tags'),
                            onPressed: () {
                              showDialog(context: context, builder: (context) => AddTagDialog(taskController: widget.taskController)).then(
                                (_) => setState(() {
                                  usingTags = widget.taskController.tags.isNotEmpty;
                                }),
                              );
                            },
                          ),
                        if (!usingSubtasks)
                          ActionChip(
                            avatar: Icon(Symbols.subdirectory_arrow_right),
                            label: Text('Add a subtask'),
                            onPressed: () {
                              showDialog(context: context, builder: (context) => _AddSubtaskDialog(parentId: widget.taskController.id)).then(
                                (_) => setState(() {
                                  usingSubtasks = ToDoTasksModel().childrenOf(widget.taskController.id).isNotEmpty;
                                }),
                              );
                            },
                          ),
                      ],
                    ),
                    if (takingNotes)
                      TextField(
                        controller: widget.taskController.notes,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Notes'),
                        ),
                        minLines: 6,
                        maxLines: null,
                      ),
                    if (linkingItems) ...[
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Row(
                          spacing: 8,
                          children: [
                            Text('Linked work items', style: Theme.of(context).textTheme.titleMedium),
                            Spacer(),
                            TextButton.icon(
                              icon: Icon(Symbols.add_link),
                              label: Text('Add a link'),
                              onPressed: () => showDialog(context: context, builder: (context) => WorkItemSearchDialog(selectionMode: true)).then(
                                (value) {
                                  if (value == null) return;

                                  widget.taskController.linkedWorkItems.add(value);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      AnimatedBuilder(
                        animation: widget.taskController.linkedWorkItems,
                        builder: (context, child) => Column(
                          children: [
                            if (widget.taskController.linkedWorkItems.list.isEmpty) Text('No linked work items'),
                            for (var tkt in widget.taskController.linkedWorkItems.list)
                              FutureBuilder(
                                key: Key('Work item $tkt linked to task ${widget.taskController.id}'),
                                future: DataModel().jiraApi.workItem(tkt, expand: ['changelog']),
                                builder: (context, asyncSnapshot) {
                                  if (asyncSnapshot.data != null) {
                                    var issueData = asyncSnapshot.data!;
                                    return IssueLinkTile(
                                      issueData,
                                      trailing: IconButton(
                                        onPressed: () => widget.taskController.linkedWorkItems.remove(issueData['key']),
                                        icon: Icon(
                                          Symbols.close,
                                          size: 20,
                                        ),
                                      ),
                                    );
                                  }
                                  if (asyncSnapshot.hasError) {
                                    return ListTile(
                                      tileColor: Colors.red.withAlpha(100),
                                      leading: Icon(Symbols.error),

                                      title: Text(tkt),
                                      subtitle: Text(asyncSnapshot.error.toString()),
                                      trailing: IconButton(
                                        onPressed: () => Clipboard.setData(ClipboardData(text: asyncSnapshot.error.toString())),
                                        icon: Icon(Symbols.content_copy),
                                      ),
                                    );
                                  }
                                  return ListTile(
                                    leading: CircularProgressIndicator(),
                                    title: Text(tkt),
                                  );
                                },
                              ),
                          ],
                        ),
                      ),
                    ],
                    if (usingTimeline) ...[
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Row(
                          spacing: 8,
                          children: [
                            Text('Timeline', style: Theme.of(context).textTheme.titleMedium),
                            Spacer(),
                            TextButton.icon(
                              icon: Icon(Symbols.commit),
                              label: Text('Add an event'),
                              onPressed: () => showDialog(context: context, builder: (context) => _EditTimeLineEventDialog()).then(
                                (value) {
                                  if (value == null) return;
                                  widget.taskController.events.add(value);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      AnimatedBuilder(
                        animation: widget.taskController.events,
                        builder: (context, child) => Column(
                          children: [
                            if (widget.taskController.events.list.isEmpty) Text('No events were recorded'),
                            for (var (id, event) in widget.taskController.events.list.indexed.toList()..sort((a, b) => b.$2.date.compareTo(a.$2.date)))
                              ListTile(
                                tileColor: event.colorPalette.resolve(context),
                                key: Key('TodoTaskEvent $id linked to task ${widget.taskController.id}'),
                                leading: Transform.rotate(angle: pi / 2, child: Icon(Symbols.commit)), // TODO add custom icon from symbols library
                                title: Text(event.title),
                                trailing: Row(
                                  mainAxisSize: .min,
                                  spacing: 8,
                                  children: [
                                    DateDisplay(null, date: event.date),
                                    IconButton(onPressed: () => widget.taskController.events.removeAt(id), iconSize: 20, icon: Icon(Symbols.close)),
                                  ],
                                ),
                                onTap: () =>
                                    showDialog(
                                      context: context,
                                      builder: (context) => _EditTimeLineEventDialog(edited: event),
                                    ).then(
                                      (value) {
                                        if (value == null) return;
                                        widget.taskController.events[id] = value;
                                      },
                                    ),
                              ),
                          ],
                        ),
                      ),
                    ],
                    if (usingTags) ...[
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Row(
                          spacing: 8,
                          children: [
                            Text('Tags', style: Theme.of(context).textTheme.titleMedium),
                            Spacer(),
                            TextButton.icon(
                              icon: Icon(Symbols.sell),
                              label: Text('Add a tag'),
                              onPressed: () => showDialog(context: context, builder: (context) => AddTagDialog(taskController: widget.taskController)),
                            ),
                          ],
                        ),
                      ),
                      AnimatedBuilder(
                        animation: widget.taskController.tags,
                        builder: (context, child) => Wrap(
                          spacing: 6,
                          runSpacing: 6,
                          children: [
                            if (widget.taskController.tags.list.isEmpty) Text('No tags yet'),
                            for (final tag in widget.taskController.tags.list)
                              InputChip(
                                avatar: Icon(ToDoTasksModel().iconForTag(tag) ?? Symbols.sell, size: 16),
                                label: Text(tag),
                                tooltip: 'Change this tag\'s icon',
                                onPressed: () => _pickTagIcon(tag),
                                onDeleted: () => widget.taskController.tags.remove(tag),
                              ),
                          ],
                        ),
                      ),
                    ],
                    if (usingSubtasks) ...[
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Row(
                          spacing: 8,
                          children: [
                            Text('Subtasks', style: Theme.of(context).textTheme.titleMedium),
                            Spacer(),
                            TextButton.icon(
                              icon: Icon(Symbols.subdirectory_arrow_right),
                              label: Text('Add a subtask'),
                              onPressed: () => showDialog(context: context, builder: (context) => _AddSubtaskDialog(parentId: widget.taskController.id)),
                            ),
                          ],
                        ),
                      ),
                      AnimatedBuilder(
                        // Not just structural add/remove: a child's own
                        // parentId clearing (the "Remove from this task"
                        // button below) is a field changing on an already-
                        // known controller, invisible to toDoTasksControllers
                        // alone — this used to only actually disappear once
                        // something else forced a rebuild, e.g. reopening
                        // the task.
                        animation: DataModel().todoTasks.allTasksListenable,
                        builder: (context, child) {
                          final children = ToDoTasksModel().childrenOf(widget.taskController.id);
                          return Column(
                            children: [
                              if (children.isEmpty) Text('No subtasks yet'),
                              for (final childController in children)
                                AnimatedBuilder(
                                  animation: childController,
                                  builder: (context, _) {
                                    final childCategoryData = ToDoTask.categoryDataFrom(childController.category.value);
                                    return ListTile(
                                      key: Key('Subtask ${childController.id} of task ${widget.taskController.id}'),
                                      leading: Icon(childCategoryData.$2, color: childCategoryData.$3),
                                      title: Text(
                                        childController.title.text.isEmpty ? 'no title' : childController.title.text,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: childController.isComplete.value ? TextStyle(decoration: TextDecoration.lineThrough) : null,
                                      ),
                                      trailing: IconButton(
                                        tooltip: 'Remove from this task',
                                        icon: Icon(Symbols.link_off, size: 20),
                                        onPressed: () => ToDoTasksModel().setParent(childController.id, null),
                                      ),
                                      onTap: () => widget.onOpenChild?.call(childController.id),
                                    );
                                  },
                                ),
                            ],
                          );
                        },
                      ),
                    ],
                    DateDisplay('Created', date: widget.taskController.dateAdded),
                  ]
                  .expand(
                    (w) => [
                      Padding(padding: const EdgeInsets.only(right: 16.0), child: w),
                      SizedBox(height: 16),
                    ],
                  )
                  .toList()
                ..removeLast(),
        ),
      ),
    ),
    persistentFooterButtons: [
      AnimatedBuilder(
        animation: widget.taskController.isComplete,
        builder: (context, child) {
          bool isComplete = widget.taskController.isComplete.value;
          return MorphingFilledTonalButton(
            icon: Icon(isComplete ? Symbols.verified_off : Symbols.verified, fill: 1),
            showAsFilled: !isComplete,
            duration: Durations.short2,
            onPressed: () {
              widget.taskController.isComplete.value = !isComplete;
              save();
            },
            label: AnimatedSize(duration: Durations.medium1, child: Text(isComplete ? 'Reopen' : 'Mark as complete')),
          );
        },
      ),
      TextButton.icon(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Delete this task?'),
            content: Text('It\'ll be gone forever! And that\'s a long time ☹️'),
            actions: [
              TextButton(onPressed: Navigator.of(context).pop, child: Text('No! Go back!')),
              FilledButton.icon(
                style: FilledButton.styleFrom(backgroundColor: Theme.of(context).colorScheme.error, foregroundColor: Theme.of(context).colorScheme.onError),
                onPressed: () {
                  ToDoTasksModel().deleteTaskById(widget.taskController.id);

                  Navigator.of(context).pop();
                },
                icon: Icon(Symbols.delete_forever),
                label: Text('DELETE IT.'),
              ),
            ],
          ),
        ),
        style: TextButton.styleFrom(foregroundColor: Theme.of(context).colorScheme.error),
        icon: Icon(Symbols.delete_forever),
        label: Text('Delete'),
      ),
    ],
  );
}

extension on ToDoEventColorPalette? {
  Color? resolve(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.light) {
      return this?.lighter;
    }
    return this?.darker;
  }
}

class _EditTimeLineEventDialog extends StatefulWidget {
  const _EditTimeLineEventDialog({this.edited});

  final ToDoTaskEvent? edited;

  @override
  State<_EditTimeLineEventDialog> createState() => _EditTimeLineEventDialogState();
}

class _EditTimeLineEventDialogState extends State<_EditTimeLineEventDialog> {
  String? iconName;
  ToDoEventColorPalette? color;
  late TextEditingController titleController;

  @override
  void initState() {
    titleController = TextEditingController(text: widget.edited?.title);
    color = widget.edited?.colorPalette;
    iconName = widget.edited?.icon;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text('${widget.edited == null ? "Create" : "Edit"} event'),
    constraints: BoxConstraints(maxWidth: 650, minWidth: 650),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          spacing: 8,
          children: [
            Expanded(
              child: TextField(controller: titleController),
            ),
            PopupIconButton(
              popupBuilder: (context, dismiss) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  spacing: 8,
                  mainAxisSize: .min,
                  children: [
                    for (var groupOfFour in groupBy(
                      ToDoEventColorPalette.values.indexed,
                      (p0) => p0.$1 % 2,
                    ).entries)
                      Row(
                        spacing: 4,
                        mainAxisSize: .min,
                        children: [
                          for (var c in groupOfFour.value.map((e) => e.$2))
                            InkWell(
                              onTap: () => setState(() {
                                color = c;
                              }),
                              child: Container(
                                height: 32,
                                width: 32,
                                decoration: BoxDecoration(
                                  color: c.base,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                        ],
                      ),
                    OutlinedButton(
                      onPressed: () => setState(() {
                        color = null;
                      }),
                      child: Text('No color'),
                    ),
                  ],
                ),
              ),
              icon: Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  color: color?.base,
                  borderRadius: color != color ? BorderRadius.circular(16) : BorderRadius.circular(8),
                  border: Border.all(color: Theme.of(context).hintColor, width: 1.5),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
    actions: [
      CancelButton(),
      FilledButton(
        onPressed: () => Navigator.of(context).pop(
          ToDoTaskEvent(
            titleController.text,
            date: DateTime.now(),
            colorPalette: color,
            icon: iconName,
          ),
        ),
        child: Text('Save'),
      ),
    ],
  );
}

Map<T, List<S>> groupBy<S, T>(Iterable<S> values, T Function(S) key) {
  var map = <T, List<S>>{};
  for (var element in values) {
    (map[key(element)] ??= []).add(element);
  }
  return map;
}

/// Creates a brand new subtask, or links an existing task as one — both
/// giving the task [parentId].
///
/// The "existing task" list only ever shows tasks that are actually valid to
/// pick: not the parent itself, not something already a child of it, and
/// not something picking it would turn into a cycle (see
/// [ToDoTasksModel.wouldCreateCycle]) — filtered out rather than shown
/// disabled, so every visible entry is simply safe to tap.
class _AddSubtaskDialog extends StatefulWidget {
  const _AddSubtaskDialog({required this.parentId});

  final int parentId;

  @override
  State<_AddSubtaskDialog> createState() => _AddSubtaskDialogState();
}

class _AddSubtaskDialogState extends State<_AddSubtaskDialog> {
  late TextEditingController _title;
  late TextEditingController _search;

  @override
  void initState() {
    super.initState();
    _title = TextEditingController();
    _search = TextEditingController();
    _search.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _title.dispose();
    _search.dispose();
    super.dispose();
  }

  Future<void> _createNew() async {
    final title = _title.text.trim();
    if (title.isEmpty) return;
    await ToDoTasksModel().createNewTask(title: title, parentId: widget.parentId);
    if (!mounted) return;
    Navigator.of(context).pop();
  }

  void _linkExisting(int existingId) {
    ToDoTasksModel().setParent(existingId, widget.parentId);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final query = _search.text.trim().toLowerCase();
    final candidates = DataModel().todoTasks.toDoTasksControllers.list.where((t) {
      if (t.id == widget.parentId) return false;
      if (t.parentId.value == widget.parentId) return false;
      if (ToDoTasksModel().wouldCreateCycle(t.id, widget.parentId)) return false;
      return query.isEmpty || t.title.text.toLowerCase().contains(query);
    }).toList();

    return AlertDialog(
      title: const Text('Add a subtask'),
      constraints: const BoxConstraints(maxWidth: 460, maxHeight: 560),
      content: SizedBox(
        width: 420,
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
                    autofocus: true,
                    controller: _title,
                    decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'New subtask title'),
                    onSubmitted: (_) => _createNew(),
                  ),
                ),
                FilledButton(onPressed: _createNew, child: const Text('Create')),
              ],
            ),
            const Divider(),
            Text('Or link an existing task', style: Theme.of(context).textTheme.labelMedium),
            TextField(
              controller: _search,
              decoration: const InputDecoration(border: OutlineInputBorder(), prefixIcon: Icon(Symbols.search)),
            ),
            Flexible(
              child: SizedBox(
                height: 260,
                child: candidates.isEmpty
                    ? const Center(child: Text('No matching tasks'))
                    : ListView.builder(
                        itemCount: candidates.length,
                        itemBuilder: (context, index) {
                          final t = candidates[index];
                          final categoryData = ToDoTask.categoryDataFrom(t.category.value);
                          return ListTile(
                            dense: true,
                            leading: Icon(categoryData.$2, color: categoryData.$3),
                            title: Text(t.title.text.isEmpty ? 'no title' : t.title.text, maxLines: 1, overflow: TextOverflow.ellipsis),
                            onTap: () => _linkExisting(t.id),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
      actions: [CancelButton()],
    );
  }
}
