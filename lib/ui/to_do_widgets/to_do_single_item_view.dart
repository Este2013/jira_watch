import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/to_do_tasks_models.dart';
import 'package:jira_watcher/ui/to_do_widgets/to_do_main.dart';
import 'package:jira_watcher/ui/updates_widgets/updates_view_single_work_item/work_item_details_view.dart';
import 'package:jira_watcher/ui/utils/jira_ui_utils/jira_work_item_search.dart';
import 'package:jira_watcher/ui/utils/widgets/dialog_widgets.dart/action_buttons.dart';
import 'package:jira_watcher/ui/utils/widgets/morphing_buttons.dart';
import 'package:jira_watcher/utils/color_utils.dart';
import 'package:material_symbols_icons/get.dart';
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
                              showDialog(context: context, builder: (context) => _CreateTimeLineEventDialog()).then(
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
                                          Icons.close,
                                          size: 20,
                                        ),
                                      ),
                                    );
                                  }
                                  if (asyncSnapshot.hasError) {
                                    return ListTile(
                                      tileColor: Colors.red.withAlpha(100),
                                      leading: Icon(Icons.error),

                                      title: Text(tkt),
                                      subtitle: Text(asyncSnapshot.error.toString()),
                                      trailing: IconButton(
                                        onPressed: () => Clipboard.setData(ClipboardData(text: asyncSnapshot.error.toString())),
                                        icon: Icon(Icons.copy),
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
                              onPressed: () => showDialog(context: context, builder: (context) => _CreateTimeLineEventDialog()).then(
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
                                tileColor: ToDoEventColorPalette.reds.lighter,
                                key: Key('TodoTaskEvent $id linked to task ${widget.taskController.id}'),
                                leading: Transform.rotate(angle: pi / 2, child: Icon(Symbols.commit)), // TODO add custom icon from symbols library
                                title: Text(event.title),
                                trailing: DateDisplay(null, date: event.date),
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
                icon: Icon(Icons.delete_forever),
                label: Text('DELETE IT.'),
              ),
            ],
          ),
        ),
        style: TextButton.styleFrom(foregroundColor: Theme.of(context).colorScheme.error),
        icon: Icon(Icons.delete_forever),
        label: Text('Delete'),
      ),
    ],
  );
}

class _CreateTimeLineEventDialog extends StatefulWidget {
  const _CreateTimeLineEventDialog({super.key});

  @override
  State<_CreateTimeLineEventDialog> createState() => _CreateTimeLineEventDialogState();
}

class _CreateTimeLineEventDialogState extends State<_CreateTimeLineEventDialog> {
  String? iconName, color;
  late TextEditingController titleController;

  @override
  void initState() {
    titleController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text('Create event'),
    constraints: BoxConstraints(maxWidth: 650, minWidth: 650),

    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: titleController,
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
            color: color == null ? null : HexColor.fromHex(color!),
            icon: iconName,
          ),
        ),
        child: Text('Save'),
      ),
    ],
  );
}

enum ToDoEventColorPalette {
  reds(Color(0xFF8d2c35), Color.fromARGB(255, 255, 109, 109)),
  oranges(Color(0xFF9c3a2a), Color(0xFFff7844)),
  yellows(Color(0xFFa9802d), Color(0xFFffda44)),
  greens(Color(0xFF547431), Color(0xFFb8ff6b)),
  teals(Color(0xFF206f5b), Color(0xFF49ffd0)),
  blues(Color(0xFF30598f), Color.fromARGB(255, 113, 154, 250)),
  purples(Color(0xFF614f8f), Color(0xFFbb8cff)),
  pinks(Color(0xFF89486e), Color(0xFFff86cc)),
  ;

  final Color darker, lighter;

  const ToDoEventColorPalette(this.darker, this.lighter);
}
