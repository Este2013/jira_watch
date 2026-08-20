import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_branch_icons.dart';
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

  final Future<File> _toDoDataFile = SettingsModel().settingsFolder.then(
    (value) => File(
      path
          .join(
            value.path,
            'to_do.json',
          )
          .replaceFirst(RegExp(r'^\\?/?'), ''),
    ),
  );

  final List<int> _deletedTodoIds = [];
  // late final ObservableList<ToDoTask>? toDoTasksCache;
  late final ObservableList<ToDoTaskEditingController> toDoTasksControllers;

  /// Custom categories (id >= 0) a task's [ToDoTask.category] can point at,
  /// on top of the built-in [DefaultTaskCategory] values (id < 0).
  late final ObservableList<CustomTaskCategory> customCategories;

  /// Tag -> icon name, for tags a reader has chosen an icon for. A tag with
  /// no entry here just shows without one — most tags are expected to stay
  /// that way, since picking an icon for every single tag would be tedious.
  late final ObservableList<TaskTagIcon> tagIconRegistry;

  late Future<bool> isReady;
  Future<bool> _getReady() async {
    loggy.info('Getting cache ready');
    var file = await _toDoDataFile;
    if (!await file.exists()) {
      loggy.warning('_toDoDataFile does not exist. Initializing cache to []');
      // toDoTasksCache = ObservableList();
      toDoTasksControllers = ObservableList();
      customCategories = ObservableList();
      tagIconRegistry = ObservableList();
    } else {
      var raw = await file.readAsString();

      final decoded = raw.trim().isEmpty ? null : jsonDecode(raw) as Map<String, dynamic>?;
      List data = decoded?['taskList'] ?? [];
      // toDoTasksCache = ObservableList.from(data.map((e) => ToDoTask.fromJson(e)));
      toDoTasksControllers = ObservableList.from(data.map((e) => ToDoTaskEditingController.fromToDoTask(ToDoTask.fromJson(e))));
      for (var ctrl in toDoTasksControllers.list) {
        ctrl.addListener(saveToDoTasksCache);
      }

      // Both absent from any file saved before this feature existed —
      // defaulting to empty is exactly what "no custom categories/tag icons
      // yet" should look like.
      final customCategoriesRaw = decoded?['customCategories'] as List? ?? [];
      customCategories = ObservableList.from(customCategoriesRaw.map((e) => CustomTaskCategory.fromJson((e as Map).cast<String, dynamic>())));

      final tagIconsRaw = decoded?['tagIcons'] as List? ?? [];
      tagIconRegistry = ObservableList.from(tagIconsRaw.map((e) => TaskTagIcon.fromJson((e as Map).cast<String, dynamic>())));
    }
    return true;
  }

  /// Gives a new task with the correct unique ID and creation date.
  Future<ToDoTask> createNewTask({
    String? title,
    String? notes,
    List<String>? workItemKeys,
    int categoryID = -1,
    List<ToDoTaskEvent>? events,
    List<String>? tags,
    int? parentId,
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
      events: events ?? [],
      tags: tags ?? [],
      parentId: (parentId != null && !wouldCreateCycle(validId, parentId)) ? parentId : null,
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
      // Orphan its children rather than deleting a whole subtree by
      // accident — losing one task the reader meant to delete is a
      // nuisance; silently losing its children too would be much worse.
      for (final child in toDoTasksControllers.list.where((t) => t.parentId.value == id)) {
        child.parentId.value = null;
      }
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
    }
    var file = (await _toDoDataFile);
    if (!await file.exists()) {
      loggy.warning('_toDoDataFile does not exist. Creating the file at:\n${file.path}');
      await file.create(recursive: true);
    }
    return file.writeAsString(
      JsonEncoder.withIndent(' ' * 4).convert({
        'taskList': toDoTasksControllers.list.map((e) => e.toToDoTask().toJson()).toList(),
        'customCategories': customCategories.list.map((e) => e.toJson()).toList(),
        'tagIcons': tagIconRegistry.list.map((e) => e.toJson()).toList(),
      }),
    );
  }

  // LOOKUPS AND HIERARCHY //////////////////////////////////////////////////

  ToDoTaskEditingController? byId(int id) {
    for (final t in toDoTasksControllers.list) {
      if (t.id == id) return t;
    }
    return null;
  }

  List<ToDoTaskEditingController> childrenOf(int? parentId) => toDoTasksControllers.list.where((t) => t.parentId.value == parentId).toList();

  /// Whether giving [taskId] a parent of [newParentId] would create a cycle
  /// — including making a task its own parent. Checked by walking
  /// [newParentId]'s own ancestor chain: if it ever reaches [taskId], then
  /// [newParentId] is currently a descendant of [taskId], and the new edge
  /// would close a loop back to it.
  bool wouldCreateCycle(int taskId, int? newParentId) {
    if (newParentId == null) return false;
    if (newParentId == taskId) return true;

    var current = byId(newParentId);
    final visited = <int>{};
    while (current != null) {
      if (!visited.add(current.id)) return false; // a loop elsewhere already; not this call's problem to fix
      final parentId = current.parentId.value;
      if (parentId == null) return false;
      if (parentId == taskId) return true;
      current = byId(parentId);
    }
    return false;
  }

  /// Sets [taskId]'s parent to [newParentId], refusing anything that would
  /// create a cycle. Returns whether the change went through.
  bool setParent(int taskId, int? newParentId) {
    if (wouldCreateCycle(taskId, newParentId)) return false;
    final task = byId(taskId);
    if (task == null) return false;
    task.parentId.value = newParentId;
    saveToDoTasksCache();
    return true;
  }

  // TAGS //////////////////////////////////////////////////////////////////

  /// Every distinct tag at least one task currently carries, for the
  /// "already used" half of tag autosuggest.
  List<String> get allUsedTags {
    final tags = <String>{};
    for (final t in toDoTasksControllers.list) {
      tags.addAll(t.tags.list);
    }
    return tags.toList()..sort();
  }

  IconData? iconForTag(String tag) {
    final name = iconNameForTag(tag);
    return name == null ? null : gitLabBranchIcon(name);
  }

  /// The raw icon name a tag was given, if any — what a picker dialog needs
  /// to preselect the current choice, as opposed to [iconForTag]'s resolved
  /// [IconData].
  String? iconNameForTag(String tag) {
    for (final entry in tagIconRegistry.list) {
      if (entry.tag == tag) return entry.iconName;
    }
    return null;
  }

  void setTagIcon(String tag, String iconName) {
    final idx = tagIconRegistry.list.indexWhere((t) => t.tag == tag);
    if (idx >= 0) {
      tagIconRegistry[idx] = TaskTagIcon(tag: tag, iconName: iconName);
    } else {
      tagIconRegistry.add(TaskTagIcon(tag: tag, iconName: iconName));
    }
    saveToDoTasksCache();
  }

  void removeTagIcon(String tag) {
    tagIconRegistry.removeWhere((t, _) => t.tag == tag);
    saveToDoTasksCache();
  }

  // CUSTOM CATEGORIES /////////////////////////////////////////////////////

  CustomTaskCategory? customCategoryById(int id) {
    for (final c in customCategories.list) {
      if (c.id == id) return c;
    }
    return null;
  }

  /// The next free custom category id — custom ones start at 0 and count up,
  /// leaving every negative id to the built-in [DefaultTaskCategory] values.
  int nextCustomCategoryId() => customCategories.list.fold(-1, (v, c) => max(v, c.id)) + 1;

  void addOrUpdateCustomCategory(CustomTaskCategory category) {
    final idx = customCategories.list.indexWhere((c) => c.id == category.id);
    if (idx >= 0) {
      customCategories[idx] = category;
    } else {
      customCategories.add(category);
    }
    saveToDoTasksCache();
  }

  /// Deletes a custom category. Tasks still pointing at it fall back to "For
  /// later" — see [ToDoTask.categoryDataFrom] — rather than being left
  /// referencing nothing.
  void deleteCustomCategory(int id) {
    customCategories.removeWhere((c, _) => c.id == id);
    saveToDoTasksCache();
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
  late final ObservableList<ToDoTaskEvent> events;
  late final ObservableList<String> tags;
  late final ValueNotifier<int?> parentId;

  ToDoTaskEditingController({
    required this.id,
    required this.title,
    required this.notes,
    required this.linkedWorkItems,
    required this.toDoBefore,
    required this.dateAdded,
    required this.isComplete,
    required this.category,
    required this.events,
    required this.tags,
    required this.parentId,
  }) {
    title.addListener(notifyListeners);
    notes.addListener(notifyListeners);
    category.addListener(notifyListeners);
    isComplete.addListener(notifyListeners);
    toDoBefore.addListener(notifyListeners);
    linkedWorkItems.addListener(notifyListeners);
    events.addListener(notifyListeners);
    tags.addListener(notifyListeners);
    parentId.addListener(notifyListeners);
  }

  factory ToDoTaskEditingController.fromToDoTask(ToDoTask task) => ToDoTaskEditingController(
    id: task.id,
    dateAdded: task.dateAdded,
    title: TextEditingController(text: task.title),
    notes: TextEditingController(text: task.notes),
    linkedWorkItems: ObservableList.from(task.linkedWorkItems),
    toDoBefore: ValueNotifier(task.toDoBefore),
    isComplete: ValueNotifier(task.isComplete),
    category: ValueNotifier(task.category),
    events: ObservableList.from(task.events),
    tags: ObservableList.from(task.tags),
    parentId: ValueNotifier(task.parentId),
  );
  ToDoTask toToDoTask() => ToDoTask(
    id: id,
    dateAdded: dateAdded,
    title: title.text.trim().isEmpty ? null : title.text.trim(),
    notes: notes.text.trim().isEmpty ? null : notes.text.trim(),
    linkedWorkItems: List.from(linkedWorkItems.list),
    toDoBefore: toDoBefore.value,
    isComplete: isComplete.value,
    category: category.value,
    events: List.from(events.list),
    tags: List.from(tags.list),
    parentId: parentId.value,
  );

  void modify(ToDoTask newTaskData) {
    title.text = newTaskData.title ?? '';
    notes.text = newTaskData.notes ?? '';
    category.value = newTaskData.category;
    isComplete.value = newTaskData.isComplete;
    toDoBefore.value = newTaskData.toDoBefore;
    linkedWorkItems.reset();
    linkedWorkItems.addAll(newTaskData.linkedWorkItems);
    events.reset();
    events.addAll(newTaskData.events);
    tags.reset();
    tags.addAll(newTaskData.tags);
    parentId.value = newTaskData.parentId;
  }
}

class ToDoTask {
  int id;
  late final DateTime dateAdded;
  DateTime? toDoBefore;

  /// List of relevant workItems
  List<String> linkedWorkItems;
  List<ToDoTaskEvent> events;
  String? title, notes;

  bool isComplete;

  /// Default categories will have negative indexes, custom ones go from 0 up
  /// If this list is empty, the category "For later" is used.
  int category;

  /// Free-form labels, searchable via `#tag` in the task list's search field.
  /// Absent from a task saved before this existed, which reads back as [].
  List<String> tags;

  /// The id of this task's parent, or null for a top-level task. A task can
  /// have at most one parent; see [ToDoTasksModel.wouldCreateCycle] for what
  /// stops a parent/child edge from closing a loop.
  int? parentId;

  ToDoTask({
    required this.id,
    this.title,
    this.notes,
    required this.linkedWorkItems,
    this.toDoBefore,
    required this.dateAdded,
    this.isComplete = false,
    this.category = -1,
    required this.events,
    this.tags = const [],
    this.parentId,
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
    'events': events.map((e) => e.toJson()).toList(),
    'tags': tags,
    'parentId': parentId,
  };

  factory ToDoTask.fromJson(Map<String, dynamic> json) {
    final creationDateValue = json['creationDate'] ?? json['added'];
    final added = creationDateValue != null ? DateTime.parse(creationDateValue.toString()) : DateTime.now();

    final toDoBeforeValue = json['toDoBefore'];
    final toDoBefore = toDoBeforeValue != null ? DateTime.parse(toDoBeforeValue.toString()) : null;

    final workItemsRaw = json['tickets'];
    final workItems = workItemsRaw is List ? workItemsRaw.map((e) => e.toString()).toList() : <String>[];

    final tagsRaw = json['tags'];
    final tags = tagsRaw is List ? tagsRaw.map((e) => e.toString()).toList() : <String>[];

    return ToDoTask(
      id: json['id'],
      title: json['title']?.toString(),
      notes: json['notes']?.toString(),
      linkedWorkItems: workItems,
      toDoBefore: toDoBefore,
      dateAdded: added,
      isComplete: json['isComplete'] ?? false,
      category: json['category'] ?? -1,
      events: (json['events'] as List?)?.map((e) => ToDoTaskEvent.fromJson(e)).toList() ?? [],
      tags: tags,
      parentId: json['parentId'] as int?,
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
    // A custom category deleted out from under a task it is still assigned
    // to (or, before this existed, any id >= 0 at all) falls back to "For
    // later" rather than throwing — the same graceful-degradation rule the
    // rest of this app's custom-icon lookups already follow.
    CustomTaskCategory? custom;
    for (final c in ToDoTasksModel().customCategories.list) {
      if (c.id == categoryID) {
        custom = c;
        break;
      }
    }
    if (custom == null) return categoryDataFrom(DefaultTaskCategory.forLater.id);
    return (custom.label, gitLabBranchIcon(custom.iconName), null);
  }
}

/// A user-defined task category/status: a label and an icon, id >= 0.
class CustomTaskCategory {
  final int id;
  String label;

  /// A key into [gitLabBranchIconChoices], resolved with [gitLabBranchIcon].
  String iconName;

  CustomTaskCategory({required this.id, required this.label, required this.iconName});

  Map<String, dynamic> toJson() => {'id': id, 'label': label, 'iconName': iconName};

  factory CustomTaskCategory.fromJson(Map<String, dynamic> json) => CustomTaskCategory(
    id: json['id'] as int,
    label: json['label'] as String? ?? 'Untitled status',
    iconName: (json['iconName'] as String?)?.trim().isNotEmpty == true ? json['iconName'] as String : 'label',
  );
}

/// A tag's chosen icon — see [ToDoTasksModel.tagIconRegistry].
class TaskTagIcon {
  String tag;
  String iconName;

  TaskTagIcon({required this.tag, required this.iconName});

  Map<String, dynamic> toJson() => {'tag': tag, 'iconName': iconName};

  factory TaskTagIcon.fromJson(Map<String, dynamic> json) => TaskTagIcon(
    tag: json['tag'] as String,
    iconName: (json['iconName'] as String?)?.trim().isNotEmpty == true ? json['iconName'] as String : 'label',
  );
}

class ToDoTaskEvent {
  String? icon;
  String title;
  DateTime date;
  ToDoEventColorPalette? colorPalette;

  ToDoTaskEvent(this.title, {this.icon, required this.date, this.colorPalette});

  Map<String, dynamic> toJson() => {
    'title': title,
    'iconName': icon,
    'date': date.toIso8601String(),
    'color': colorPalette?.name,
  };

  factory ToDoTaskEvent.fromJson(Map<String, dynamic> json) {
    final dateValue = json['date'];
    assert(dateValue != null);
    final toDoBefore = DateTime.parse(dateValue.toString());

    ToDoEventColorPalette? color;
    try {
      color = json['color'] != null
          ? ToDoEventColorPalette.values.firstWhere(
              (element) => element.name == json['color'],
            )
          : null;
    } on Exception {
      color = null;
    }

    return ToDoTaskEvent(
      json['title'],
      date: toDoBefore,
      icon: json['iconName'],
      colorPalette: color,
    );
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

enum ToDoEventColorPalette {
  reds(base: Colors.red, darker: Color(0xFF8d2c35), lighter: Color.fromARGB(255, 255, 109, 109)),
  oranges(base: Colors.orange, darker: Color(0xFF9c3a2a), lighter: Color(0xFFff7844)),
  yellows(base: Colors.yellow, darker: Color(0xFFa9802d), lighter: Color(0xFFffda44)),
  greens(base: Colors.green, darker: Color(0xFF547431), lighter: Color.fromARGB(255, 162, 240, 145)),
  teals(base: Colors.teal, darker: Color(0xFF206f5b), lighter: Color(0xFF49ffd0)),
  blues(base: Colors.blue, darker: Color(0xFF30598f), lighter: Color.fromARGB(255, 113, 154, 250)),
  purples(base: Colors.purple, darker: Color(0xFF614f8f), lighter: Color(0xFFbb8cff)),
  pinks(base: Colors.pink, darker: Color(0xFF89486e), lighter: Color(0xFFff86cc)),
  ;

  final Color base, darker, lighter;

  const ToDoEventColorPalette({required this.base, required this.darker, required this.lighter});
}
