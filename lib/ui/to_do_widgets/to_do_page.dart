import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:jira_watcher/dao/api_dao.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/ui/updates_widgets/updates_view_single_ticket/issue_details_view.dart';
import 'package:loggy/loggy.dart';
import 'package:material_symbols_icons/symbols.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  ToDoTask? selected;

  bool filterOutCompletedTasks = true;
  int? showCategory;

  @override
  Widget build(BuildContext context) => FutureBuilder(
    future: DataModel().toDoTasksCache,
    builder: (context, asyncSnapshot) {
      if (!asyncSnapshot.hasData) {
        return Center(child: CircularProgressIndicator());
      }

      return Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: AnimatedBuilder(
          animation: asyncSnapshot.data!,
          builder: (context, _) {
            Iterable<ToDoTask> nonFilteredTaskList = asyncSnapshot.data!.list.where(
              (t) => !filterOutCompletedTasks || !t.isComplete,
            );
            List<ToDoTask> taskList =
                nonFilteredTaskList
                    .where(
                      (t) => showCategory == null || t.category == showCategory,
                    )
                    .toList()
                  ..sort(
                    (a, b) {
                      if (a.isComplete && !b.isComplete) {
                        return 1; // completed tasks should appear below others
                      } else if (a.category == -8 && b.category != -8) {
                        return -1; // critical tasks should be shown above all else
                      }
                      return b.dateAdded.compareTo(a.dateAdded);
                    },
                  );
            if (selected == null || !taskList.any((t) => selected!.id == t.id)) {
              if (taskList.isNotEmpty) {
                ServicesBinding.instance.addPostFrameCallback(
                  (timeStamp) {
                    setState(() {
                      selected = taskList.first;
                    });
                  },
                );
              }
            }
            if (taskList.isEmpty) {
              ServicesBinding.instance.addPostFrameCallback(
                (timeStamp) {
                  setState(() {
                    selected = null;
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
                              onPressed: () {
                                DataModel().createNewTask().then(
                                  (newTask) => setState(() {
                                    selected = newTask;
                                  }),
                                );
                              },
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
                          child: taskList.isEmpty
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
                                          onPressed: () {
                                            DataModel().createNewTask().then(
                                              (newTask) => setState(() {
                                                selected = newTask;
                                              }),
                                            );
                                          },
                                          label: Text('New task'),
                                          icon: Icon(Icons.add),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : ListView.builder(
                                  itemCount: taskList.length,
                                  itemBuilder: (context, index) {
                                    var task = taskList[index];
                                    var categoryData = task.categoryData;
                                    return ListTile(
                                      title: Text(
                                        task.title ?? 'no title',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: task.isComplete ? TextStyle(decoration: TextDecoration.lineThrough) : null,
                                      ),
                                      subtitle: SingleChildScrollView(
                                        child: Text(task.tickets.isEmpty ? 'No linked tickets' : task.tickets.join(', ')),
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
                                                task.category = catId;
                                                DataModel().editTask(task);
                                              });
                                            },
                                          );
                                        },
                                      ),
                                      trailing: PopupMenuButton(
                                        icon: Icon(Icons.more_vert),
                                        itemBuilder: (_) {
                                          return [
                                            PopupMenuItem(
                                              child: Row(
                                                spacing: 8,
                                                children: [
                                                  Icon(task.isComplete ? Symbols.verified_off : Symbols.verified, fill: 1),
                                                  Text(task.isComplete ? 'Reopen this issue' : 'Mark as complete'),
                                                ],
                                              ),
                                              onTap: () => DataModel().editTask(
                                                task..isComplete = !task.isComplete,
                                              ),
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
                                              onTap: () {
                                                setState(() {
                                                  selected = null;
                                                });
                                                DataModel().deleteTask(task);
                                              },
                                            ),
                                          ];
                                        },
                                      ),
                                      selected: task.id == selected?.id,
                                      onTap: () => setState(() {
                                        selected = task;
                                      }),
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
                      child: selected != null
                          ? SingleTaskView(
                              selected!,
                              key: ValueKey(selected!.id),
                            )
                          : Text('🡠 Select a task in the list to your left to start working on it'),
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

class SingleTaskView extends StatefulWidget {
  const SingleTaskView(
    this.task, {
    super.key,
  });

  final ToDoTask task;

  @override
  State<SingleTaskView> createState() => _SingleTaskViewState();
}

class _SingleTaskViewState extends State<SingleTaskView> {
  late TextEditingController titleController, notesController;
  late List<String> linkedIssues;
  late bool isComplete;
  late int category;

  Timer? _autosaveTimer;
  bool issueWasDeleted = false;

  @override
  void initState() {
    titleController = TextEditingController(text: widget.task.title);
    notesController = TextEditingController(text: widget.task.notes);
    linkedIssues = widget.task.tickets;
    category = widget.task.category;
    isComplete = widget.task.isComplete;

    // Reset the 1s countdown on every text change
    titleController.addListener(_scheduleAutosave); // <-- NEW
    notesController.addListener(_scheduleAutosave); // <-- NEW
    super.initState();
  }

  @override
  void dispose() {
    _autosaveTimer?.cancel();
    titleController.dispose();
    notesController.dispose();
    if (!issueWasDeleted) {
      save();
    }
    super.dispose();
  }

  void _scheduleAutosave() {
    _autosaveTimer?.cancel();
    _autosaveTimer = Timer(const Duration(seconds: 1), () {
      save();
    });
  }

  void save() {
    String notes = notesController.text.trim();
    DataModel().editTask(
      widget.task
        ..category = category
        ..tickets = linkedIssues
        ..title = titleController.text.trim()
        ..notes = notes.isEmpty ? null : notes
        ..isComplete = isComplete,
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    persistentFooterAlignment: AlignmentDirectional.center,
    persistentFooterButtons: [
      MorphingFilledTonalButton(
        icon: Icon(isComplete ? Symbols.verified_off : Symbols.verified, fill: 1),
        showAsFilled: !isComplete,
        duration: Durations.short2,
        onPressed: () {
          setState(() {
            isComplete = !isComplete;
          });
          save();
        },
        label: AnimatedSize(duration: Durations.medium1, child: Text(isComplete ? 'Reopen' : 'Mark as complete')),
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
                  _autosaveTimer?.cancel();
                  DataModel().deleteTask(widget.task);
                  setState(() {
                    issueWasDeleted = true;
                  });
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
                            controller: titleController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('Title'),
                            ),
                          ),
                        ),
                        Builder(
                          builder: (context) {
                            if (category < 0) {
                              // default icons
                              DefaultTaskCategory cat = DefaultTaskCategory.values.firstWhere((c) => c.id == widget.task.category, orElse: () => DefaultTaskCategory.forLater);
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
                                          category = value;
                                        });
                                        DataModel().editTask(widget.task..category = category);
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
                      controller: notesController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Notes'),
                      ),
                      minLines: 10,
                      maxLines: null,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text('Linked tickets', style: Theme.of(context).textTheme.titleMedium),
                    ),
                    Column(
                      children: [
                        for (var tkt in linkedIssues)
                          FutureBuilder(
                            future: APIModel().getIssue(tkt),
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
  );
}

class AddIssueToDoDialog extends StatefulWidget {
  const AddIssueToDoDialog(this.ticket, {super.key});

  final IssueData ticket;

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
    titleController = TextEditingController(text: '${widget.ticket.key} — ${widget.ticket.fields?['summary']}');
    notesController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text('Add ${widget.ticket.key} to task'),
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
                                hintText: '${widget.ticket.key} — ${widget.ticket.fields?['summary']}',
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
                    future: DataModel().toDoTasksCache,
                    builder: (context, asyncSnapshot) {
                      if (asyncSnapshot.hasData) {
                        var list = asyncSnapshot.data!.list.where((t) => !t.isComplete).toList()
                          ..sort(
                            (a, b) => a.dateAdded.compareTo(b.dateAdded),
                          );
                        return ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            var taskItem = asyncSnapshot.data![index];
                            var categoryData = taskItem.categoryData;
                            return ListTile(
                              leading: Tooltip(
                                message: categoryData.$1,
                                child: Icon(categoryData.$2, color: categoryData.$3),
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
              title = '${widget.ticket.key} — ${widget.ticket.fields?['summary']}';
            }
            String notes = notesController.text.trim();
            DataModel()
                .createNewTask(
                  title: title,
                  notes: notes.isEmpty ? null : notes,
                  ticketKeys: [widget.ticket.key!],
                )
                .whenComplete(Navigator.of(context).pop);
            return;
          } else if (tabCtrl.index == 1) {
            DataModel().toDoTasksCache.then((value) {
              var list = value.list;
              List<int> editedIds = [...addLinkTo, ...removeLinkFrom];
              Iterable<ToDoTask> edits = list.where((t) => editedIds.contains(t.id));
              for (var t in edits) {
                if (isItemSelected(t)) {
                  t.tickets.add(widget.ticket.key!);
                  t.tickets = t.tickets.toSet().toList();
                } else {
                  t.tickets.remove(widget.ticket.key!);
                }
              }
              // ignore: use_build_context_synchronously
              DataModel().editTasks(edits).whenComplete(Navigator.of(context).pop);
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
    bool ogTaskHasTicket = task.tickets.contains(widget.ticket.key);
    return (ogTaskHasTicket || addLinkTo.contains(task.id)) && !removeLinkFrom.contains(task.id);
  }

  void toggleSelection(ToDoTask task) {
    String? tktKey = widget.ticket.key;
    if (task.tickets.contains(tktKey)) {
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

class ToDoTask {
  int id;
  late final DateTime dateAdded;
  DateTime? toDoBefore;

  /// List of relevant tickets
  List<String> tickets;
  String? title, notes;

  bool isComplete;

  /// Default categories will have negative indexes, custom ones go from 0 up
  /// If this list is empty, the category "For later" is used.
  int category;

  ToDoTask({
    required this.id,
    this.title,
    this.notes,
    required this.tickets,
    this.toDoBefore,
    required this.dateAdded,
    this.isComplete = false,
    this.category = -1,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'notes': notes,
    'tickets': tickets,
    'toDoBefore': toDoBefore?.toIso8601String(),
    'creationDate': dateAdded.toIso8601String(),
    'isComplete': isComplete,
    'category': category,
  };
  factory ToDoTask.fromJson(Map<String, dynamic> json) {
    final creationDateValue = json['creationDate'] ?? json['added'];
    final added = creationDateValue != null ? DateTime.parse(creationDateValue.toString()) : DateTime.now();

    final toDoBeforeValue = json['toDoBefore'];
    final toDoBefore = toDoBeforeValue != null ? DateTime.parse(toDoBeforeValue.toString()) : null;

    final ticketsRaw = json['tickets'];
    final tickets = ticketsRaw is List ? ticketsRaw.map((e) => e.toString()).toList() : <String>[];

    return ToDoTask(
      id: json['id'],
      title: json['title']?.toString(),
      notes: json['notes']?.toString(),
      tickets: tickets,
      toDoBefore: toDoBefore,
      dateAdded: added,
      isComplete: json['isComplete'] ?? false,
      category: json['category'] ?? -1,
    );
  }

  (String, IconData, Color?) get categoryData => categoryDataFrom(category);

  static (String, IconData, Color?) categoryDataFrom(int categoryID) {
    if (categoryID < 0) {
      // default icons
      DefaultTaskCategory cat = DefaultTaskCategory.values.firstWhere((c) => c.id == categoryID, orElse: () => DefaultTaskCategory.forLater);
      return (
        cat.displayName,
        cat.icon,
        cat.color,
      );
    }
    throw UnimplementedError(); //TODO
  }
}

enum DefaultTaskCategory {
  forLater(-1, 'For later', Icons.push_pin),
  forNextMeeting(-2, 'For next meeting', Symbols.groups),
  toDocument(-3, 'To document', Icons.edit_document),
  toRetest(-4, 'To test', Symbols.experiment),
  toReview(-5, 'To review', Symbols.mystery),
  waitingForInput(-6, 'Waiting for input', Symbols.pending),
  missingScoping(-7, 'Missing scoping', Symbols.filter_center_focus),
  critical(-8, 'Critical', Symbols.dangerous, color: Colors.red);

  final int id;
  final String displayName;
  final IconData icon;
  final Color? color;

  const DefaultTaskCategory(
    this.id,
    this.displayName,
    this.icon, {
    this.color,
  });
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
