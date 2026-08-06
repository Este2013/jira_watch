import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jira_watcher/models/jira_work_item_data.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/to_do_tasks_models.dart';
import 'package:jira_watcher/ui/utils/collapsible_pane.dart';
import 'package:jira_watcher/ui/utils/widgets/dialog_widgets.dart/action_buttons.dart';
import 'package:loggy/loggy.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'to_do_single_item_view.dart';

enum _TodoPageSortMode {
  creationNewer(Symbols.clock_arrow_down, 'Newer first'),
  creationOlder(Symbols.clock_arrow_up, 'Older first'),
  linkedWorkItemsMore(Symbols.edit_arrow_down, 'More work items first'),
  linkedWorkItemsLess(Symbols.edit_arrow_up, 'Less work items first');

  final IconData icondata;
  final String displayName;
  const _TodoPageSortMode(this.icondata, this.displayName);
}

class TodoPagePreLoadView extends StatelessWidget {
  const TodoPagePreLoadView({super.key});

  @override
  Widget build(BuildContext context) => FutureBuilder(
    future: ToDoTasksModel().isReady,
    builder: (context, asyncSnapshot) {
      if (!asyncSnapshot.hasData) {
        return Center(child: CircularProgressIndicator());
      }
      return TodoPage();
    },
  );
}

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> with SingleTickerProviderStateMixin {
  int? selectedTaskID;

  bool filterOutCompletedTasks = true;
  int? showCategory;
  late CollapsibleSidePaneController collapsibleSidePaneController;
  late AnimationController _menuController;

  late TextEditingController searchController;

  _TodoPageSortMode sortMode = .creationNewer;
  bool reverseSortMode = false;

  @override
  void initState() {
    super.initState();
    selectedTaskID = DataModel().todoTasks.toDoTasksControllers.list.firstOrNull?.id;
    collapsibleSidePaneController = CollapsibleSidePaneController();
    _menuController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      value: collapsibleSidePaneController.state ? 1 : 0,
    );
    collapsibleSidePaneController.addListener(() {
      if (collapsibleSidePaneController.state) {
        _menuController.reverse(); // menu -> arrow
      } else {
        _menuController.forward(); // arrow -> menu
      }
    });
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    _menuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: DataModel().todoTasks.toDoTasksControllers,
    builder: (context, _) {
      bool isAnyTaskSelected = selectedTaskID != null && DataModel().todoTasks.toDoTasksControllers.list.any((t) => selectedTaskID == t.id);

      var leftPane = Column(
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
                  icon: Icon(Symbols.add),
                ),
                Spacer(),
                PopupMenuButton<String>(
                  icon: Badge(
                    label: Text('1'),
                    isLabelVisible: showCategory != null,
                    child: Icon(Symbols.filter_alt),
                  ),
                  tooltip: 'Filter by category',
                  itemBuilder: (context) => <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: '',
                      child: Row(
                        spacing: 16,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Symbols.hide_source),
                          Text('All categories'),
                        ],
                      ),
                    ),
                    for (var c in DefaultTaskCategory.values.where(
                      (cat) => DataModel().todoTasks.toDoTasksControllers.list.any(
                        (e) => e.category.value == cat.id,
                      ),
                    ))
                      PopupMenuItem<String>(
                        value: c.id.toString(),

                        child: Row(
                          spacing: 16,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(c.icon, color: c.color),
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
                PopupMenuButton<_TodoPageSortMode>(
                  icon: Icon(sortMode.icondata),
                  tooltip: 'Sort (${sortMode.displayName})',
                  initialValue: sortMode,
                  itemBuilder: (context) => <PopupMenuEntry<_TodoPageSortMode>>[
                    for (var v in _TodoPageSortMode.values)
                      PopupMenuItem(
                        value: v,
                        child: Row(
                          spacing: 16,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(v.icondata),
                            Text(v.displayName),
                          ],
                        ),
                      ),
                  ],

                  onSelected: (value) => setState(() {
                    sortMode = value;
                  }),
                ),
                IconButton(
                  tooltip: 'Show${filterOutCompletedTasks ? '' : 'ing'} completed tasks',
                  onPressed: () => setState(() {
                    filterOutCompletedTasks = !filterOutCompletedTasks;
                  }),
                  isSelected: !filterOutCompletedTasks,
                  selectedIcon: Icon(Symbols.verified),
                  icon: Icon(Symbols.verified_off),
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              autofocus: true,
              controller: searchController,
              decoration: InputDecoration(border: OutlineInputBorder(), icon: Icon(Symbols.search), hint: Text('Search by title, notes, or linked work items')),
            ),
          ),
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
                              icon: Icon(Symbols.add),
                            ),
                          ],
                        ),
                      ],
                    )
                  : AnimatedBuilder(
                      key: Key('list filters: {cat:$showCategory, filtercompleted:$filterOutCompletedTasks, sort:$sortMode}'),
                      animation: searchController,
                      builder: (context, _) {
                        var list = DataModel().todoTasks.toDoTasksControllers.list
                            .where(
                              (t) => !filterOutCompletedTasks || !t.isComplete.value,
                            )
                            .where(
                              (e) {
                                String search = searchController.text.toLowerCase();
                                return search.isEmpty ||
                                    e.title.text.toLowerCase().contains(search) ||
                                    e.notes.text.toLowerCase().contains(search) ||
                                    e.linkedWorkItems.list
                                        .map((e) => e.toLowerCase())
                                        .any(
                                          (e2) => e2.contains(search),
                                        );
                              },
                            )
                            .where(
                              (t) => showCategory == null || t.category.value == showCategory,
                            )
                            .toList();
                        list.sort(
                          (a, b) {
                            if (sortMode == .creationNewer) {
                              return b.dateAdded.compareTo(a.dateAdded);
                            }
                            if (sortMode == .creationOlder) {
                              return a.dateAdded.compareTo(b.dateAdded);
                            }
                            if (sortMode == .linkedWorkItemsLess) {
                              return a.linkedWorkItems.length.compareTo(b.linkedWorkItems.length);
                            }
                            if (sortMode == .linkedWorkItemsMore) {
                              return b.linkedWorkItems.length.compareTo(a.linkedWorkItems.length);
                            }
                            return 0;
                          },
                        );
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
                                  // subtitle: SingleChildScrollView(
                                  //   child: Text(
                                  //     taskController.linkedWorkItems.isEmpty ? 'No linked work items' : taskController.linkedWorkItems.list.join(', '),
                                  //     overflow: .ellipsis,
                                  //   ),
                                  // ),
                                  leading: IconButton(
                                    icon: Icon(categoryData.$2),
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
                                    icon: Icon(Symbols.more_vert),
                                    itemBuilder: (_) => [
                                      PopupMenuItem(
                                        child: Row(
                                          spacing: 8,
                                          children: [
                                            Icon(taskController.isComplete.value ? Symbols.verified_off : Symbols.verified),
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
      );

      return LayoutBuilder(
        builder: (context, constraints) {
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
                return ClipRect(
                  child: Scaffold(
                    appBar: AppBar(
                      leading: IconButton(
                        onPressed: collapsibleSidePaneController.toggle,
                        icon: AnimatedIcon(
                          icon: AnimatedIcons.arrow_menu,
                          progress: _menuController,
                        ),
                      ),
                      title: Row(
                        children: [
                          Expanded(child: Text('To do')),
                          Expanded(
                            child: Center(
                              child: Text(
                                'Locally keep track of your own tasks.',
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).hintColor),
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),

                      actions: [],
                    ),
                    body: ClipRect(
                      child: CollapsibleSidePane(
                        leftWidth: 500,
                        breakpoint: 1200,
                        controller: collapsibleSidePaneController,
                        left: leftPane,
                        right: Padding(
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
                    ),
                  ),
                );
              },
            ),
          );
        },
      );
    },
  );

  void createNewTask() => ToDoTasksModel().createNewTask().then(
    (newTask) => setState(() {
      selectedTaskID = newTask.id;
    }),
  );
}

/// Dialog to link one or more Jira work items to a (new or existing) to-do task.
///
/// Use the default constructor for a single work item, or [AddIssueToDoDialog.multiple]
/// to link several work items to the same task at once.
class AddIssueToDoDialog extends StatefulWidget {
  /// Operates on a single work item.
  AddIssueToDoDialog(JiraWorkItemData workItem, {super.key}) : workItems = [workItem], isSingle = true;

  /// Operates on several work items at once, linking them all to one task.
  const AddIssueToDoDialog.multiple(this.workItems, {super.key}) : isSingle = false;

  final List<JiraWorkItemData> workItems;

  /// Whether the dialog was opened for a single work item (affects wording and
  /// the few cosmetic differences between the single- and multi-item layouts).
  final bool isSingle;

  @override
  State<AddIssueToDoDialog> createState() => _AddIssueToDoDialogState();
}

class _AddIssueToDoDialogState extends State<AddIssueToDoDialog> with TickerProviderStateMixin, UiLoggy {
  late TabController tabCtrl;

  // Values for the "New task" page
  late TextEditingController titleController, notesController, searchController;
  int categoryID = -1;

  // Value for the "Existing tasks" section
  List<int> addLinkTo = [], removeLinkFrom = [];

  bool get _isSingle => widget.isSingle;

  List<String> get _keys => widget.workItems.map((w) => w.key).whereType<String>().toList();

  /// The work item used to build the single-item wording.
  JiraWorkItemData get _firstItem => widget.workItems.first;

  String get _defaultTitle => _isSingle ? '${_firstItem.key} — ${_firstItem.fields?['summary']}' : '${_keys.length} work items';

  String get _dialogTitle => _isSingle ? 'Add ${_firstItem.key} to task' : 'Add ${_keys.length} work items to a task';

  @override
  void initState() {
    tabCtrl = TabController(length: 2, vsync: this, initialIndex: 1);
    titleController = TextEditingController(text: _defaultTitle);
    notesController = TextEditingController();
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    tabCtrl.dispose();
    titleController.dispose();
    notesController.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text(_dialogTitle),
    content: SizedBox(
      width: 600,
      height: 700,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            controller: tabCtrl,
            tabs: [
              Tab(icon: Icon(Symbols.add_circle), child: Text('New task')),
              Tab(icon: Icon(Symbols.assignment_add), child: Text('Existing tasks')),
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
                      const SizedBox.shrink(),
                      Row(
                        spacing: 8,
                        children: [
                          Expanded(
                            child: TextField(
                              controller: titleController,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                label: const Text('Title'),
                                hintText: _defaultTitle,
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
                                  icon: Icon(cat.icon, color: cat.color),
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
                          decoration: const InputDecoration(border: OutlineInputBorder(), label: Text('Notes')),
                          maxLines: null,
                          minLines: 6,
                          keyboardType: TextInputType.multiline,
                        ),
                      ),
                      // When linking several items, show which ones will be linked.
                      if (!_isSingle)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Will link: ${_keys.join(', ')}',
                            style: Theme.of(context).textTheme.bodySmall,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                    ],
                  ),
                  // Existing tasks
                  FutureBuilder(
                    future: ToDoTasksModel().isReady,
                    builder: (context, asyncSnapshot) {
                      if (asyncSnapshot.hasData) {
                        return Column(
                          spacing: 8,
                          children: [
                            TextField(
                              autofocus: true,
                              controller: searchController,
                              decoration: InputDecoration(border: OutlineInputBorder(), icon: Icon(Symbols.search), hint: Text('Search by title, notes, or linked work items')),
                            ),
                            Expanded(
                              child: Material(
                                color: Colors.transparent,
                                child: AnimatedBuilder(
                                  animation: searchController,
                                  builder: (context, _) {
                                    var list =
                                        DataModel().todoTasks.toDoTasksControllers.list.where((t) => !t.isComplete.value).where(
                                          (e) {
                                            String search = searchController.text.toLowerCase();
                                            return search.isEmpty ||
                                                e.title.text.toLowerCase().contains(search) ||
                                                e.notes.text.toLowerCase().contains(search) ||
                                                e.linkedWorkItems.list
                                                    .map((e) => e.toLowerCase())
                                                    .any(
                                                      (e2) => e2.contains(search),
                                                    );
                                          },
                                        ).toList()..sort(
                                          // reversed to show most recent (thus relevant) tasks first
                                          (a, b) => b.dateAdded.compareTo(a.dateAdded),
                                        );
                                    return ListView.builder(
                                      itemCount: list.length,
                                      itemBuilder: (context, index) {
                                        var taskItem = list[index].toToDoTask();
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
                                          selected: isItemSelected(taskItem),
                                          selectedTileColor: Theme.of(context).colorScheme.primary.withAlpha(50),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
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
      CancelButton(),
      FilledButton(
        onPressed: () {
          if (tabCtrl.index == 0) {
            // new task
            String title = titleController.text.trim();
            if (title.isEmpty) title = _defaultTitle;
            String notes = notesController.text.trim();
            ToDoTasksModel()
                .createNewTask(
                  title: title,
                  notes: notes.isEmpty ? null : notes,
                  workItemKeys: _keys,
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
                  for (final k in _keys) {
                    t.linkedWorkItems.add(k);
                  }
                } else {
                  for (final k in _keys) {
                    t.linkedWorkItems.remove(k);
                  }
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

  /// A task counts as selected when it already links every selected work item
  /// (or has been ticked), and hasn't been unticked.
  bool isItemSelected(ToDoTask task) {
    bool ogTaskHasAll = _keys.isNotEmpty && _keys.every((k) => task.linkedWorkItems.contains(k));
    return (ogTaskHasAll || addLinkTo.contains(task.id)) && !removeLinkFrom.contains(task.id);
  }

  void toggleSelection(ToDoTask task) {
    bool ogTaskHasAll = _keys.isNotEmpty && _keys.every((k) => task.linkedWorkItems.contains(k));
    if (ogTaskHasAll) {
      if (!removeLinkFrom.remove(task.id)) removeLinkFrom.add(task.id);
    } else {
      if (!addLinkTo.remove(task.id)) addLinkTo.add(task.id);
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
