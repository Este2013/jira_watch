import 'package:flutter/material.dart';
import 'package:jira_watcher/dao/api_dao.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:loggy/loggy.dart';
import 'package:material_symbols_icons/symbols.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('data');
  }
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
                                        builder: (context) => AlertDialog(
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
                                        ),
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
                        asyncSnapshot.data!.sort(
                          (a, b) => a.dateAdded.compareTo(b.dateAdded),
                        );
                        return ListView.builder(
                          itemCount: asyncSnapshot.data!.length,
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
