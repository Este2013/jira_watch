import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jira_watcher/models/jira_work_item_data.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/to_do_tasks_models.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_branch_icons.dart';
import 'package:jira_watcher/ui/utils/collapsible_pane.dart';
import 'package:jira_watcher/ui/utils/widgets/dialog_widgets.dart/action_buttons.dart';
import 'package:loggy/loggy.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'to_do_single_item_view.dart';

/// Splits [rawSearch] into the `#tag` tokens it names and whatever ordinary
/// text is left over, for the task list's combined tag + free-text search —
/// `#bug fix the thing #urgent` means "tagged bug AND urgent, containing
/// 'fix the thing'".
(List<String> tags, String freeText) parseTaskSearch(String rawSearch) {
  final tags = RegExp(r'#(\S+)').allMatches(rawSearch).map((m) => m.group(1)!.toLowerCase()).toList();
  final freeText = rawSearch.replaceAll(RegExp(r'#\S+'), '').trim().toLowerCase();
  return (tags, freeText);
}

/// The task list's search field. A plain [TextField] except for one thing:
/// typing `#` opens a dropdown of every tag currently in use, matching
/// whatever has been typed of the current `#token` so far — accepting a
/// suggestion completes just that token, leaving the rest of the query (a
/// previous `#tag`, or ordinary search text) alone.
class _TodoSearchField extends StatefulWidget {
  const _TodoSearchField({required this.controller});

  final TextEditingController controller;

  @override
  State<_TodoSearchField> createState() => _TodoSearchFieldState();
}

class _TodoSearchFieldState extends State<_TodoSearchField> {
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  /// The `#tag` token touching the caret in [value], if any: where it starts
  /// in the full text, and what has been typed of it so far. Null once the
  /// token is "closed" (a space typed after it), so finishing one tag and
  /// typing ordinary text afterwards does not keep completing the old one.
  (int start, String query)? _activeTagToken(TextEditingValue value) {
    final caret = value.selection.baseOffset;
    if (caret < 0 || caret > value.text.length) return null;
    final upToCaret = value.text.substring(0, caret);
    final hashAt = upToCaret.lastIndexOf('#');
    if (hashAt < 0) return null;
    final token = upToCaret.substring(hashAt + 1);
    if (token.contains(' ')) return null;
    return (hashAt, token);
  }

  @override
  Widget build(BuildContext context) => RawAutocomplete<String>(
    textEditingController: widget.controller,
    focusNode: _focusNode,
    optionsBuilder: (value) {
      final active = _activeTagToken(value);
      if (active == null) return const Iterable<String>.empty();
      final query = active.$2.toLowerCase();
      return DataModel().todoTasks.allUsedTags.where((tag) => tag.toLowerCase().contains(query));
    },
    displayStringForOption: (tag) => tag,
    onSelected: (tag) {
      final active = _activeTagToken(widget.controller.value);
      if (active == null) return;
      final (start, query) = active;
      final text = widget.controller.text;
      final before = text.substring(0, start);
      final after = text.substring(start + 1 + query.length);
      final completed = '$before#$tag ';
      widget.controller.value = TextEditingValue(text: '$completed$after', selection: TextSelection.collapsed(offset: completed.length));
    },
    fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) => TextField(
      autofocus: true,
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(border: OutlineInputBorder(), icon: Icon(Symbols.search), hint: Text('Search by title, notes, linked work items, or #tag')),
    ),
    optionsViewBuilder: (context, onSelected, options) => Align(
      alignment: Alignment.topLeft,
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(8),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 220, maxWidth: 320),
          child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: options.length,
            itemBuilder: (context, index) {
              final tag = options.elementAt(index);
              final icon = DataModel().todoTasks.iconForTag(tag);
              return ListTile(
                dense: true,
                leading: Icon(icon ?? Symbols.sell, size: 18),
                title: Text(tag),
                onTap: () => onSelected(tag),
              );
            },
          ),
        ),
      ),
    ),
  );
}

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
                    for (var categoryId in {
                      ...DefaultTaskCategory.values.map((c) => c.id),
                      ...DataModel().todoTasks.customCategories.list.map((c) => c.id),
                    }.where((id) => DataModel().todoTasks.toDoTasksControllers.list.any((e) => e.category.value == id)))
                      PopupMenuItem<String>(
                        value: categoryId.toString(),
                        child: Builder(
                          builder: (context) {
                            final categoryData = ToDoTask.categoryDataFrom(categoryId);
                            return Row(
                              spacing: 16,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(categoryData.$2, color: categoryData.$3),
                                Text(categoryData.$1),
                              ],
                            );
                          },
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
            child: _TodoSearchField(controller: searchController),
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
                                final (tags, freeText) = parseTaskSearch(searchController.text);
                                if (tags.isNotEmpty) {
                                  final taskTags = e.tags.list.map((t) => t.toLowerCase()).toSet();
                                  if (!tags.every(taskTags.contains)) return false;
                                }
                                return freeText.isEmpty ||
                                    e.title.text.toLowerCase().contains(freeText) ||
                                    e.notes.text.toLowerCase().contains(freeText) ||
                                    e.linkedWorkItems.list
                                        .map((e) => e.toLowerCase())
                                        .any(
                                          (e2) => e2.contains(freeText),
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
                              final categoryData = ToDoTask.categoryDataFrom(categoryID);
                              return IconButton(
                                tooltip: categoryData.$1,
                                icon: Icon(categoryData.$2, color: categoryData.$3),
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

class EditToDoTaskCategoryDialog extends StatefulWidget {
  const EditToDoTaskCategoryDialog({super.key});

  @override
  State<EditToDoTaskCategoryDialog> createState() => _EditToDoTaskCategoryDialogState();
}

class _EditToDoTaskCategoryDialogState extends State<EditToDoTaskCategoryDialog> {
  Future<void> _createOrEditCustom({CustomTaskCategory? edited}) async {
    final result = await showDialog<CustomTaskCategory>(
      context: context,
      builder: (context) => _CustomCategoryEditorDialog(edited: edited),
    );
    if (result == null || !mounted) return;
    ToDoTasksModel().addOrUpdateCustomCategory(result);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text('Choose a task category'),
    content: SizedBox(
      width: 340,
      height: 340,
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
          for (var cat in ToDoTasksModel().customCategories.list)
            GridTile(
              footer: Text(
                cat.label,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).pop(cat.id),
                    child: Icon(gitLabBranchIcon(cat.iconName), size: 48, fill: 1),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      tooltip: 'Edit this status',
                      iconSize: 16,
                      visualDensity: VisualDensity.compact,
                      icon: const Icon(Symbols.edit),
                      onPressed: () => _createOrEditCustom(edited: cat),
                    ),
                  ),
                ],
              ),
            ),
          GridTile(
            footer: Text(
              'New status',
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
            child: InkWell(
              onTap: () => _createOrEditCustom(),
              child: const Icon(Symbols.add, size: 48),
            ),
          ),
        ],
      ),
    ),
  );
}

/// Creates or edits a [CustomTaskCategory] — a label and an icon from
/// [IconChoiceRow]. Pops the finished category, or null if cancelled.
class _CustomCategoryEditorDialog extends StatefulWidget {
  const _CustomCategoryEditorDialog({this.edited});

  final CustomTaskCategory? edited;

  @override
  State<_CustomCategoryEditorDialog> createState() => _CustomCategoryEditorDialogState();
}

class _CustomCategoryEditorDialogState extends State<_CustomCategoryEditorDialog> {
  late TextEditingController _label;
  late String _iconName;

  @override
  void initState() {
    super.initState();
    _label = TextEditingController(text: widget.edited?.label ?? '');
    _iconName = widget.edited?.iconName ?? 'label';
  }

  @override
  void dispose() {
    _label.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text(widget.edited == null ? 'New status' : 'Edit status'),
    constraints: const BoxConstraints(maxWidth: 420),
    content: SizedBox(
      width: 380,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          TextField(
            controller: _label,
            autofocus: true,
            decoration: const InputDecoration(labelText: 'Label'),
            onChanged: (_) => setState(() {}),
          ),
          IconChoiceRow(selected: _iconName, onChanged: (name) => setState(() => _iconName = name)),
        ],
      ),
    ),
    actions: [
      if (widget.edited != null)
        TextButton(
          style: TextButton.styleFrom(foregroundColor: Theme.of(context).colorScheme.error),
          onPressed: () {
            ToDoTasksModel().deleteCustomCategory(widget.edited!.id);
            Navigator.of(context).pop();
          },
          child: const Text('Delete'),
        ),
      CancelButton(),
      FilledButton(
        onPressed: _label.text.trim().isEmpty
            ? null
            : () => Navigator.of(context).pop(
                CustomTaskCategory(
                  id: widget.edited?.id ?? ToDoTasksModel().nextCustomCategoryId(),
                  label: _label.text.trim(),
                  iconName: _iconName,
                ),
              ),
        child: const Text('Save'),
      ),
    ],
  );
}
