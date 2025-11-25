import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:loggy/loggy.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:observable_datasets/observable_list.dart';
import 'package:path/path.dart' as path;

class ToDoTasksModel with GlobalLoggy {
  static final ToDoTasksModel _instance = ToDoTasksModel._internal();

  factory ToDoTasksModel() => _instance;
  ToDoTasksModel._internal() {
    isReady = _getReady();
    _saveTimer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        if (_saveRequested) {
          _saveIsAllowed = true;
          saveToDoTasksCache();
        }
        _saveRequested = false;
      },
    );
  }

  bool _saveIsAllowed = true, _saveRequested = false;
  // ignore: unused_field
  Timer? _saveTimer;

  final Future<File> _toDoDataFile =SettingsModel().settingsFolder.then((value) =>  File(
    path
        .join(
          value.path,
          'to_do.json',
        )
        .replaceFirst(RegExp(r'^\\?/?'), ''),
  ));

  final List<int> _deletedTodoIds = [];
  // late final ObservableList<ToDoTask>? toDoTasksCache;
  late final ObservableList<ToDoTaskEditingController> toDoTasksControllers;

  late Future<bool> isReady;
  Future<bool> _getReady() async {
    loggy.info('Getting cache ready');var file = await _toDoDataFile;
    if (! await file.exists()) {
      loggy.warning('_toDoDataFile does not exist. Initializing cache to []');
      // toDoTasksCache = ObservableList();
      toDoTasksControllers = ObservableList();
    } else {
      var raw = await file.readAsString();

      List data = raw.trim().isEmpty ? [] : jsonDecode(raw)?['taskList'] ?? [];
      // toDoTasksCache = ObservableList.from(data.map((e) => ToDoTask.fromJson(e)));
      toDoTasksControllers = ObservableList.from(data.map((e) => ToDoTaskEditingController.fromToDoTask(ToDoTask.fromJson(e))));
      for (var ctrl in toDoTasksControllers.list) {
        ctrl.addListener(saveToDoTasksCache);
      }
    }
    return true;
  }

  /// Gives a new task with the correct unique ID and creation date.
  Future<ToDoTask> createNewTask({
    String? title,
    String? notes,
    List<String>? workItemKeys,
    int categoryID = -1,
  }) async {
    loggy.info('Creating a new task');
    var cacheIsReady = await isReady;
    if (!cacheIsReady) {
      loggy.error('Cache is not ready???');
      throw Exception('Cache is not ready???');
    }
    // int validId = toDoTasksCache!.list.fold(0, (v, t) => v = max(v, t.id)) + 1;
    int validId = toDoTasksControllers.list.fold(0, (v, t) => v = max(v, t.id)) + 1;
    var task = ToDoTask(
      id: validId,
      title: title,
      notes: notes,
      linkedWorkItems: workItemKeys ?? [],
      category: categoryID,
      dateAdded: DateTime.now(),
    );
    _deletedTodoIds.remove(validId);
    var toDoTaskEditingController = ToDoTaskEditingController.fromToDoTask(task);
    toDoTaskEditingController.addListener(saveToDoTasksCache);
    toDoTasksControllers.add(toDoTaskEditingController);
    await saveToDoTasksCache();
    loggy.info('Created task id ${task.id}');
    return task;
  }

  Future<void> editTask(ToDoTask edited) async {
    loggy.info('Editing task ${edited.id}');
    final cacheIsReady = await isReady;
    if (!cacheIsReady) {
      loggy.error('Cache is not ready???');
      throw Exception('Cache is not ready???');
    }

    final idx = toDoTasksControllers.list.indexWhere((t) => t.id == edited.id);

    if (_deletedTodoIds.contains(edited.id)) {
      loggy.warning('Because task #${edited.id} was already deleted, editing is aborted.');
      return;
    }
    if (idx >= 0) {
      toDoTasksControllers[idx].modify(edited);
    } else {
      loggy.warning('Task ${edited.id} not found. Adding it instead.');
      toDoTasksControllers.add(ToDoTaskEditingController.fromToDoTask(edited));
    }
    await saveToDoTasksCache();
  }

  void editTasks(Iterable<ToDoTask> editedList) async {
    loggy.info('Editing ${editedList.length} task(s)');
    final cacheIsReady = await isReady;
    if (!cacheIsReady) {
      loggy.error('Cache is not ready???');
      throw Exception('Cache is not ready???');
    }
    for (var edited in editedList) {
      if (_deletedTodoIds.contains(edited.id)) {
        loggy.warning('Because task #${edited.id} was already deleted, editing is aborted.');
        continue;
      }
      final idx = toDoTasksControllers.list.indexWhere((t) => t.id == edited.id);
      if (idx >= 0) {
        toDoTasksControllers[idx].modify(edited);
      } else {
        loggy.warning('Task ${edited.id} not found. Adding it instead.');
        toDoTasksControllers.add(ToDoTaskEditingController.fromToDoTask(edited));
      }
    }
    saveToDoTasksCache();
  }

  void deleteTask(ToDoTask deleted) => deleteTaskById(deleted.id);

  void deleteTaskById(int id) async {
    loggy.info('Deleting task with id: $id');

    final cacheIsReady = await isReady;
    if (!cacheIsReady) {
      loggy.error('Cache is not ready???');
      throw Exception('Cache is not ready???');
    }
    final idx = toDoTasksControllers.list.indexWhere((t) => t.id == id);
    if (idx >= 0) {
      var task = toDoTasksControllers.removeAt(idx);
      _deletedTodoIds.add(task.id);
    } else {
      loggy.warning('Task $id was not found.');
    }
    await saveToDoTasksCache();
  }

  Future saveToDoTasksCache() async {
    loggy.info('Saving the tasks cache');

    if (!_saveIsAllowed) {
      loggy.warning('The save timer is on cooldown; saving request');
      _saveRequested = true;
      return;
    }
    _saveIsAllowed = false;
    final cacheIsReady = await isReady;
    if (!cacheIsReady) {
      loggy.error('Cache is not ready???');
      throw Exception('Cache is not ready???');
    }var file = 
(await _toDoDataFile);
    if (!await file.exists()) {
      loggy.warning('_toDoDataFile does not exist. Creating the file at:\n${file.  path}');
      await file.create(recursive: true);
    }
    return file.writeAsString(
      JsonEncoder.withIndent(' ' * 4).convert({
        'taskList': toDoTasksControllers.list.map((e) => e.toToDoTask().toJson()).toList(),
      }),
    );
  }
}

class ToDoTaskEditingController extends ChangeNotifier {
  final int id;
  late final DateTime dateAdded;
  late final TextEditingController title, notes;
  late final ValueNotifier<int> category;
  late final ValueNotifier<bool> isComplete;
  late final ValueNotifier<DateTime?> toDoBefore;
  late final ObservableList<String> linkedWorkItems;

  ToDoTaskEditingController({
    required this.id,
    required this.title,
    required this.notes,
    required this.linkedWorkItems,
    required this.toDoBefore,
    required this.dateAdded,
    required this.isComplete,
    required this.category,
  }) {
    title.addListener(notifyListeners);
    notes.addListener(notifyListeners);
    category.addListener(notifyListeners);
    isComplete.addListener(notifyListeners);
    toDoBefore.addListener(notifyListeners);
    linkedWorkItems.addListener(notifyListeners);
  }

  factory ToDoTaskEditingController.fromToDoTask(ToDoTask task) {
    return ToDoTaskEditingController(
      id: task.id,
      dateAdded: task.dateAdded,
      title: TextEditingController(text: task.title),
      notes: TextEditingController(text: task.notes),
      linkedWorkItems: ObservableList.from(task.linkedWorkItems),
      toDoBefore: ValueNotifier(task.toDoBefore),
      isComplete: ValueNotifier(task.isComplete),
      category: ValueNotifier(task.category),
    );
  }
  ToDoTask toToDoTask() => ToDoTask(
    id: id,
    dateAdded: dateAdded,
    title: title.text.trim().isEmpty ? null : title.text.trim(),
    notes: notes.text.trim().isEmpty ? null : notes.text.trim(),
    linkedWorkItems: linkedWorkItems.list,
    toDoBefore: toDoBefore.value,
    isComplete: isComplete.value,
    category: category.value,
  );

  void modify(ToDoTask newTaskData) {
    title.text = newTaskData.title ?? '';
    notes.text = newTaskData.notes ?? '';
    category.value = newTaskData.category;
    isComplete.value = newTaskData.isComplete;
    toDoBefore.value = newTaskData.toDoBefore;
    linkedWorkItems.reset();
    linkedWorkItems.addAll(newTaskData.linkedWorkItems);
  }
}

class ToDoTask {
  int id;
  late final DateTime dateAdded;
  DateTime? toDoBefore;

  /// List of relevant workItems
  List<String> linkedWorkItems;
  String? title, notes;

  bool isComplete;

  /// Default categories will have negative indexes, custom ones go from 0 up
  /// If this list is empty, the category "For later" is used.
  int category;

  ToDoTask({
    required this.id,
    this.title,
    this.notes,
    required this.linkedWorkItems,
    this.toDoBefore,
    required this.dateAdded,
    this.isComplete = false,
    this.category = -1,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'notes': notes,
    'tickets': linkedWorkItems,
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

    final workItemsRaw = json['tickets'];
    final workItems = workItemsRaw is List ? workItemsRaw.map((e) => e.toString()).toList() : <String>[];

    return ToDoTask(
      id: json['id'],
      title: json['title']?.toString(),
      notes: json['notes']?.toString(),
      linkedWorkItems: workItems,
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
    throw UnimplementedError(); // TODO custom categories
  }
}

enum DefaultTaskCategory {
  forLater(-1, 'For later', Symbols.push_pin),
  forNextMeeting(-2, 'For next meeting', Symbols.groups),
  toDocument(-3, 'To document', Symbols.edit_document),
  toRetest(-4, 'To test', Symbols.experiment),
  toReview(-5, 'To review', Symbols.mystery),
  waitingForInput(-6, 'Waiting for input', Symbols.pending),
  missingScoping(-7, 'Missing scoping', Symbols.filter_center_focus),
  critical(-8, 'Critical', Symbols.dangerous, color: Colors.red)
  ;

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
