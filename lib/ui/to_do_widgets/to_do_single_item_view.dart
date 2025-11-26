import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/to_do_tasks_models.dart';
import 'package:jira_watcher/ui/to_do_widgets/to_do_main.dart';
import 'package:jira_watcher/ui/updates_widgets/updates_view_single_work_item/work_item_details_view.dart';
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
  late bool takingNotes;

  @override
  void initState() {
    takingNotes = widget.taskController.notes.text.trim().isNotEmpty;
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
                                tooltip: cat.displayName,
                                icon: Icon(cat.icon, color: cat.color, fill: 1),
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
                    if (takingNotes)
                      TextField(
                        controller: widget.taskController.notes,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Notes'),
                        ),
                        minLines: 6,
                        maxLines: null,
                      )
                    else
                      Align(
                        alignment: AlignmentGeometry.centerLeft,
                        child: ActionChip(
                          avatar: Icon(Symbols.contract_edit),
                          label: Text('Start taking notes'),
                          onPressed: () => setState(() {
                            takingNotes = true;
                          }),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text('Linked work items', style: Theme.of(context).textTheme.titleMedium),
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
                                  return IssueLinkTile(jsonDecode(asyncSnapshot.data!.body));
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
