import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jira_watcher/dao/api_dao.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/to_do_tasks_models.dart';
import 'package:jira_watcher/ui/updates_widgets/updates_view_single_work_item/work_item_details_view.dart';
import 'package:loggy/loggy.dart';
import 'package:material_symbols_icons/symbols.dart';

class TodoPagePreLoadView extends StatelessWidget {
  const TodoPagePreLoadView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ToDoTasksModel().isReady,
      builder: (context, asyncSnapshot) {
        if (!asyncSnapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        return TodoPage();
      },
    );
  }
}

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  int? selectedTaskID;

  bool filterOutCompletedTasks = true;
  int? showCategory;

  late Iterable<ToDoTask> nonFilteredTaskList;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: DataModel().todoTasks.toDoTasksControllers,
      builder: (context, _) {
        bool isAnyTaskSelected = selectedTaskID != null && DataModel().todoTasks.toDoTasksControllers.list.any((t) => selectedTaskID == t.id);
        return Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Builder(
            builder: (context) {
              if (DataModel().todoTasks.toDoTasksControllers.isEmpty) {
                ServicesBinding.instance.addPostFrameCallback(
                  (timeStamp) {
                    setState(() {
                      selectedTaskID = null;
                    });
                  },
                );
              }
              return Row(
                children: [
                  SizedBox(
                    width: 500,
                    child: Column(
                      children: [
                        // List settings
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            spacing: 8,
                            children: [
                              TextButton.icon(
                                onPressed: createNewTask,
                                label: Text('New task'),
                                icon: Icon(Icons.add),
                              ),
                              Spacer(),
                              PopupMenuButton<String>(
                                icon: Badge(
                                  label: Text('1'),
                                  isLabelVisible: showCategory != null,
                                  child: Icon(Icons.filter_alt),
                                ),
                                tooltip: 'Filter by category',
                                itemBuilder: (context) => <PopupMenuEntry<String>>[
                                  PopupMenuItem<String>(
                                    value: '',
                                    child: Row(
                                      spacing: 16,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.hide_source),
                                        Text('All categories'),
                                      ],
                                    ),
                                  ),
                                  for (var c in DefaultTaskCategory.values.where(
                                    (cat) => nonFilteredTaskList.any(
                                      (e) => e.category == cat.id,
                                    ),
                                  ))
                                    PopupMenuItem<String>(
                                      value: c.id.toString(),

                                      child: Row(
                                        spacing: 16,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(c.icon, color: c.color, fill: 1),
                                          Text(c.displayName),
                                        ],
                                      ),
                                    ),
                                ],

                                onSelected: (value) => setState(() {
                                  if (value.isEmpty) {
                                    showCategory = null;
                                  } else {
                                    showCategory = int.parse(value);
                                  }
                                }),
                              ),
                              IconButton(
                                tooltip: 'Show${filterOutCompletedTasks ? '' : 'ing'} completed tasks',
                                onPressed: () => setState(() {
                                  filterOutCompletedTasks = !filterOutCompletedTasks;
                                }),
                                isSelected: !filterOutCompletedTasks,
                                selectedIcon: Icon(Icons.verified, fill: 1),
                                icon: Icon(Symbols.verified_off, fill: 1),
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        // Task list
                        Expanded(
                          child: Center(
                            child: DataModel().todoTasks.toDoTasksControllers.isEmpty
                                ? Column(
                                    mainAxisSize: MainAxisSize.min,
                                    spacing: 16,
                                    children: [
                                      filterOutCompletedTasks ? Text('🫡 You have no open tasks') : Text('😁 All clear!'),
                                      Row(
                                        spacing: 8,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          if (showCategory != null)
                                            TextButton(
                                              onPressed: () => setState(() {
                                                showCategory = null;
                                              }),
                                              child: Text('Clear filters'),
                                            ),
                                          FilledButton.icon(
                                            onPressed: createNewTask,
                                            label: Text('New task'),
                                            icon: Icon(Icons.add),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                : Builder(
                                    key: Key('list filters: {cat:$showCategory, filtercompleted:$filterOutCompletedTasks}'),
                                    builder: (context) {
                                      var list = DataModel().todoTasks.toDoTasksControllers.list
                                          .where(
                                            (t) => !filterOutCompletedTasks || !t.isComplete.value,
                                          )
                                          .where(
                                            (t) => showCategory == null || t.category.value == showCategory,
                                          )
                                          .toList();
                                      return ListView.builder(
                                        itemCount: list.length,
                                        itemBuilder: (context, index) {
                                          var taskController = list[index];
                                          return AnimatedBuilder(
                                            animation: taskController,
                                            builder: (context, child) {
                                              var categoryData = ToDoTask.categoryDataFrom(taskController.category.value);
                                              return ListTile(
                                                key: Key('ListTile of task #${taskController.id}'),
                                                title: Text(
                                                  taskController.title.text.isEmpty ? 'no title' : taskController.title.text,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: taskController.isComplete.value ? TextStyle(decoration: TextDecoration.lineThrough) : null,
                                                ),
                                                subtitle: SingleChildScrollView(
                                                  child: Text(taskController.linkedWorkItems.isEmpty ? 'No linked work items' : taskController.linkedWorkItems.list.join(', ')),
                                                ),
                                                leading: IconButton(
                                                  icon: Icon(categoryData.$2, fill: 1),
                                                  color: categoryData.$3,
                                                  tooltip: categoryData.$1,
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return EditToDoTaskCategoryDialog();
                                                      },
                                                    ).then(
                                                      (catId) {
                                                        if (catId == null) {
                                                          return;
                                                        }
                                                        setState(() {
                                                          taskController.category.value = catId;
                                                          ToDoTasksModel().editTask(taskController.toToDoTask());
                                                        });
                                                      },
                                                    );
                                                  },
                                                ),
                                                trailing: PopupMenuButton(
                                                  icon: Icon(Icons.more_vert),
                                                  itemBuilder: (_) => [
                                                    PopupMenuItem(
                                                      child: Row(
                                                        spacing: 8,
                                                        children: [
                                                          Icon(taskController.isComplete.value ? Symbols.verified_off : Symbols.verified, fill: 1),
                                                          Text(taskController.isComplete.value ? 'Reopen this issue' : 'Mark as complete'),
                                                        ],
                                                      ),
                                                      onTap: () => taskController.isComplete.value = !taskController.isComplete.value,
                                                    ),
                                                    PopupMenuItem(
                                                      child: Row(
                                                        spacing: 8,
                                                        children: [
                                                          Icon(
                                                            Symbols.delete_forever,
                                                            fill: 1,
                                                            color: Theme.of(context).colorScheme.error,
                                                          ),
                                                          Text('Delete', style: TextStyle(color: Theme.of(context).colorScheme.error)),
                                                        ],
                                                      ),
                                                      onTap: () => ToDoTasksModel().deleteTask(taskController.toToDoTask()),
                                                    ),
                                                  ],
                                                ),
                                                selected: taskController.id == selectedTaskID,
                                                onTap: () => setState(() {
                                                  selectedTaskID = taskController.id;
                                                }),
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  VerticalDivider(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Center(
                        child: isAnyTaskSelected
                            ? SingleTaskView(
                                DataModel().todoTasks.toDoTasksControllers.list.firstWhere((t) => t.id == selectedTaskID),
                                key: ValueKey(selectedTaskID),
                              )
                            : Text('← Select a task in the list to your left to start working on it'),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  void createNewTask() => ToDoTasksModel().createNewTask().then(
    (newTask) => setState(() {
      // prepareControllers();
      selectedTaskID = newTask.id;
    }),
  );
}

class SingleTaskView extends StatelessWidget {
  const SingleTaskView(
    this.taskController, {
    super.key,
  });

  final ToDoTaskEditingController taskController;

  void save() => ToDoTasksModel().editTask(taskController.toToDoTask());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              controller: taskController.title,
                              // onChanged: (value) => save(),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text('Title'),
                              ),
                            ),
                          ),
                          AnimatedBuilder(
                            animation: taskController.category,
                            builder: (context, _) {
                              int category = taskController.category.value;
                              if (category < 0) {
                                // default icons
                                DefaultTaskCategory cat = DefaultTaskCategory.values.firstWhere((c) => c.id == taskController.category.value, orElse: () => DefaultTaskCategory.forLater);
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
                                          taskController.category.value = value;
                                          ToDoTasksModel().editTask(taskController.toToDoTask());
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
                      TextField(
                        controller: taskController.notes,
                        // onChanged: (value) => save(),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Notes'),
                        ),
                        minLines: 10,
                        maxLines: null,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text('Linked work items', style: Theme.of(context).textTheme.titleMedium),
                      ),
                      AnimatedBuilder(
                        animation: taskController.linkedWorkItems,
                        builder: (context, child) => Column(
                          children: [
                            if (taskController.linkedWorkItems.list.isEmpty) Text('No linked work items'),
                            for (var tkt in taskController.linkedWorkItems.list)
                              FutureBuilder(
                                key: Key('Work item $tkt linked to task ${taskController.id}'),
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
          animation: taskController.isComplete,
          builder: (context, child) {
            bool isComplete = taskController.isComplete.value;
            return MorphingFilledTonalButton(
              icon: Icon(isComplete ? Symbols.verified_off : Symbols.verified, fill: 1),
              showAsFilled: !isComplete,
              duration: Durations.short2,
              onPressed: () {
                taskController.isComplete.value = !isComplete;
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
                    ToDoTasksModel().deleteTaskById(taskController.id);

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
}

class AddIssueToDoDialog extends StatefulWidget {
  const AddIssueToDoDialog(this.workItem, {super.key});

  final JiraWorkItemData workItem;

  @override
  State<AddIssueToDoDialog> createState() => _AddIssueToDoDialogState();
}

class _AddIssueToDoDialogState extends State<AddIssueToDoDialog> with TickerProviderStateMixin, UiLoggy {
  late TabController tabCtrl;

  // Values for the "New task" page
  late TextEditingController titleController, notesController;
  DateTime? toDoBefore;
  int categoryID = -1;

  // Value for the "Existing tasks" section
  ToDoTask? editing;
  List<int> addLinkTo = [], removeLinkFrom = [];

  @override
  void initState() {
    tabCtrl = TabController(length: 2, vsync: this);
    titleController = TextEditingController(text: '${widget.workItem.key} — ${widget.workItem.fields?['summary']}');
    notesController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text('Add ${widget.workItem.key} to task'),
    content: SizedBox(
      width: 600,
      height: 700,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            controller: tabCtrl,
            tabs: [
              Tab(icon: Icon(Icons.add_circle), child: Text('New task')),
              Tab(icon: Icon(Icons.assignment_add), child: Text('Existing tasks')),
            ],
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TabBarView(
                controller: tabCtrl,
                children: [
                  // New task
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 16,
                    children: [
                      SizedBox.shrink(),
                      Row(
                        spacing: 8,
                        children: [
                          Expanded(
                            child: TextField(
                              controller: titleController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text('Title'),
                                hintText: '${widget.workItem.key} — ${widget.workItem.fields?['summary']}',
                              ),
                            ),
                          ),
                          Builder(
                            builder: (context) {
                              if (categoryID < 0) {
                                // default icons
                                DefaultTaskCategory cat = DefaultTaskCategory.values.firstWhere((c) => c.id == categoryID, orElse: () => DefaultTaskCategory.forLater);
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
                                          setState(() {
                                            categoryID = value;
                                          });
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
                      Flexible(
                        child: TextField(
                          textCapitalization: TextCapitalization.sentences,
                          controller: notesController,
                          decoration: InputDecoration(border: OutlineInputBorder(), label: Text('Notes')),
                          maxLines: null,
                          minLines: 6,
                          keyboardType: TextInputType.multiline,
                        ),
                      ),
                    ],
                  ),
                  // Existing tasks
                  FutureBuilder(
                    future: ToDoTasksModel().isReady,
                    builder: (context, asyncSnapshot) {
                      if (asyncSnapshot.hasData) {
                        var list = DataModel().todoTasks.toDoTasksControllers.list.where((t) => !t.isComplete.value).toList()
                          ..sort(
                            (a, b) => a.dateAdded.compareTo(b.dateAdded),
                          );
                        return ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            var taskItem = list[index].toToDoTask();
                            var categoryData = taskItem.categoryData;
                            return ListTile(
                              leading: Tooltip(
                                message: categoryData.$1,
                                child: Icon(categoryData.$2, color: categoryData.$3, fill: 1),
                              ),
                              title: Text(taskItem.title ?? 'No title found'),
                              subtitle: taskItem.notes == null ? null : Text(taskItem.notes!, maxLines: 1, overflow: TextOverflow.ellipsis),
                              onTap: () => setState(() => toggleSelection(taskItem)),
                              trailing: Checkbox(
                                value: isItemSelected(taskItem),
                                onChanged: (value) => setState(() => toggleSelection(taskItem)),
                              ),
                            );
                          },
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    actions: [
      TextButton(onPressed: Navigator.of(context).pop, child: Text('Cancel')),
      FilledButton(
        onPressed: () {
          if (tabCtrl.index == 0) {
            // new task
            String title = titleController.text.trim();
            if (title.isEmpty) {
              title = '${widget.workItem.key} — ${widget.workItem.fields?['summary']}';
            }
            String notes = notesController.text.trim();
            ToDoTasksModel()
                .createNewTask(
                  title: title,
                  notes: notes.isEmpty ? null : notes,
                  workItemKeys: [widget.workItem.key!],
                  categoryID: categoryID,
                )
                .whenComplete(Navigator.of(context).pop);
            return;
          } else if (tabCtrl.index == 1) {
            ToDoTasksModel().isReady.then((value) {
              var list = DataModel().todoTasks.toDoTasksControllers.list;
              List<int> editedIds = [...addLinkTo, ...removeLinkFrom];

              Iterable<ToDoTaskEditingController> edits = list.where((t) => editedIds.contains(t.id));

              for (var t in edits) {
                if (isItemSelected(t.toToDoTask())) {
                  t.linkedWorkItems.add(widget.workItem.key!);
                } else {
                  t.linkedWorkItems.remove(widget.workItem.key!);
                }
              }
              // ignore: use_build_context_synchronously
              Navigator.of(context).pop();
            });
            return;
          }
          loggy.error('Unimplemented: save mechanism for selected tab #${tabCtrl.index}');
          throw UnimplementedError();
        },
        child: Text('Save'),
      ),
    ],
  );

  bool isItemSelected(ToDoTask task) {
    bool ogTaskHasWorkItem = task.linkedWorkItems.contains(widget.workItem.key);
    return (ogTaskHasWorkItem || addLinkTo.contains(task.id)) && !removeLinkFrom.contains(task.id);
  }

  void toggleSelection(ToDoTask task) {
    String? tktKey = widget.workItem.key;
    if (task.linkedWorkItems.contains(tktKey)) {
      if (removeLinkFrom.contains(task.id)) {
        removeLinkFrom.remove(task.id);
      } else {
        removeLinkFrom.add(task.id);
      }
    } else {
      if (addLinkTo.contains(task.id)) {
        addLinkTo.remove(task.id);
      } else {
        addLinkTo.add(task.id);
      }
    }
  }
}

class MorphingFilledTonalButton extends StatelessWidget {
  const MorphingFilledTonalButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
    required this.showAsFilled,
    this.duration = const Duration(milliseconds: 250),
    this.curve = Curves.easeInOut,
    this.padding,
    this.borderRadius,
  });

  final VoidCallback? onPressed;
  final Widget label;
  final Widget? icon;
  final bool showAsFilled;

  /// Animation tuning
  final Duration duration;
  final Curve curve;

  /// Optional tweaks
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    // Define the two endpoint styles (Filled vs Tonal).
    final filled = FilledButton.styleFrom(
      backgroundColor: scheme.primary,
      foregroundColor: scheme.onPrimary,
      padding: padding,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(12),
      ),
    );

    final tonal = FilledButton.styleFrom(
      backgroundColor: scheme.secondaryContainer,
      foregroundColor: scheme.onSecondaryContainer,
      padding: padding,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(12),
      ),
    );

    // t=0 => filled, t=1 => tonal
    final targetT = showAsFilled ? 0.0 : 1.0;

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(end: targetT),
      duration: duration,
      curve: curve,
      builder: (context, t, _) {
        final style = ButtonStyle.lerp(filled, tonal, t);

        // Keep icon layout consistent with Material defaults.
        if (icon != null) {
          return FilledButton.icon(
            onPressed: onPressed,
            style: style,
            icon: icon!,
            label: label,
          );
        }

        return FilledButton(
          onPressed: onPressed,
          style: style,
          child: label,
        );
      },
    );
  }
}

class EditToDoTaskCategoryDialog extends StatelessWidget {
  const EditToDoTaskCategoryDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text('Choose a task category'),
    content: SizedBox(
      width: 300,
      height: 300,
      child: GridView.count(
        crossAxisCount: 3,
        children: [
          for (var cat in DefaultTaskCategory.values)
            GridTile(
              footer: Text(
                cat.displayName,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              child: InkWell(
                onTap: () => Navigator.of(context).pop(cat.id),
                child: Icon(
                  cat.icon,
                  color: cat.color,
                  size: 48,
                  fill: 1,
                ),
              ),
            ),
          // TODO custom categories
        ],
      ),
    ),
  );
}
