import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/to_do_tasks_models.dart';
import 'package:jira_watcher/ui/to_do_widgets/to_do_main.dart';
import 'package:jira_watcher/ui/updates_widgets/updates_view_single_work_item/work_item_details_view.dart';
import 'package:jira_watcher/ui/utils/jira_ui_utils/jira_work_item_search.dart';
import 'package:jira_watcher/ui/utils/labelled_text_presenter.dart';
import 'package:jira_watcher/ui/utils/widgets/dialog_widgets.dart/action_buttons.dart';
import 'package:jira_watcher/ui/utils/widgets/morphing_buttons.dart';
import 'package:material_symbols_icons/symbols.dart';

class SingleTaskView extends StatefulWidget {
  const SingleTaskView(
    this.taskController, {
    super.key,
  });

  final ToDoTaskEditingController taskController;

  @override
  State<SingleTaskView> createState() => _SingleTaskViewState();
}

class _SingleTaskViewState extends State<SingleTaskView> {
  late bool takingNotes, linkingItems, usingTimeline;

  @override
  void initState() {
    takingNotes = widget.taskController.notes.text.trim().isNotEmpty;
    linkingItems = widget.taskController.linkedWorkItems.isNotEmpty;
    usingTimeline = widget.taskController.events.isNotEmpty;
    super.initState();
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
                            int category = widget.taskController.category.value;
                            if (category < 0) {
                              // default icons
                              DefaultTaskCategory cat = DefaultTaskCategory.values.firstWhere((c) => c.id == widget.taskController.category.value, orElse: () => DefaultTaskCategory.forLater);
                              return IconButton(
                                icon: Row(
                                  spacing: 8,
                                  children: [
                                    Icon(cat.icon, color: cat.color, fill: 1),
                                    Text(cat.displayName, style: Theme.of(context).textTheme.titleMedium),
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
                            }
                            // TODO custom categories
                            throw UnimplementedError();
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
                                future: DataModel().jiraApi.getWorkItem(tkt, expand: ['changelog']),
                                builder: (context, asyncSnapshot) {
                                  if (asyncSnapshot.hasData) {
                                    var issueData = jsonDecode(asyncSnapshot.data!.body);
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
