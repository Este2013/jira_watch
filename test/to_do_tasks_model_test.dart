import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/models/to_do_tasks_models.dart';

void main() {
  // ToDoTasksModel reaches for its settings folder in a field initializer,
  // which goes through platform plugins that do not exist in a test —
  // unstubbed, those calls resolve after the test that triggered them has
  // finished, reported as that later test failing with assertions that all
  // passed. Same fix as the GitLab quick-branches model tests.
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    for (final channel in const [
      MethodChannel('dev.fluttercommunity.plus/package_info'),
      MethodChannel('plugins.flutter.io/path_provider'),
      MethodChannel('plugins.flutter.io/path_provider_windows'),
    ]) {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, (call) async {
        if (call.method == 'getAll') {
          return <String, Object?>{'appName': 'test', 'packageName': 'test', 'version': '0.0.0', 'buildNumber': '0'};
        }
        return Directory.systemTemp.createTempSync('to_do_tasks_test').path;
      });
    }
  });

  group('ToDoTask JSON', () {
    test('round-trips tags and parentId', () {
      final task = ToDoTask(
        id: 1,
        linkedWorkItems: [],
        dateAdded: DateTime.now(),
        events: [],
        tags: ['bug', 'urgent'],
        parentId: 7,
      );
      final restored = ToDoTask.fromJson(task.toJson());
      expect(restored.tags, ['bug', 'urgent']);
      expect(restored.parentId, 7);
    });

    test('a task saved before tags/parentId existed reads back with defaults', () {
      final restored = ToDoTask.fromJson({
        'id': 1,
        'tickets': <String>[],
        'creationDate': DateTime.now().toIso8601String(),
        'events': <dynamic>[],
      });
      expect(restored.tags, isEmpty);
      expect(restored.parentId, isNull);
    });
  });

  group('CustomTaskCategory / TaskTagIcon JSON', () {
    test('CustomTaskCategory round-trips', () {
      final category = CustomTaskCategory(id: 0, label: 'Blocked', iconName: 'block');
      final restored = CustomTaskCategory.fromJson(category.toJson());
      expect(restored.id, 0);
      expect(restored.label, 'Blocked');
      expect(restored.iconName, 'block');
    });

    test('TaskTagIcon round-trips, and a blank iconName defaults', () {
      final restored = TaskTagIcon.fromJson({'tag': 'bug', 'iconName': ''});
      expect(restored.tag, 'bug');
      expect(restored.iconName, 'label');
    });
  });

  group('ToDoTasksModel', () {
    var nextId = 900000;
    int newProjectishId() => nextId++;

    test('createNewTask persists tags and can be looked up by id', () async {
      await ToDoTasksModel().isReady;
      final id = newProjectishId();
      final task = await ToDoTasksModel().createNewTask(title: 'test-$id', tags: ['a', 'b']);

      final controller = ToDoTasksModel().byId(task.id);
      expect(controller, isNotNull);
      expect(controller!.tags.list, ['a', 'b']);
    });

    test('allTasksListenable notifies on a field changing, not just add/remove', () async {
      // Regression: toDoTasksControllers alone only notifies on its own
      // structural changes, since an individual controller's field mutating
      // is a different ChangeNotifier entirely — a filtered view (the main
      // list's top-level-only filter, a task's own subtasks list) that only
      // listened to toDoTasksControllers would not refresh when, say, a
      // child's parentId was cleared.
      await ToDoTasksModel().isReady;
      final task = await ToDoTasksModel().createNewTask(title: 'listenable-test');
      final controller = ToDoTasksModel().byId(task.id)!;

      var notified = false;
      ToDoTasksModel().allTasksListenable.addListener(() => notified = true);

      controller.isComplete.value = true;
      expect(notified, isTrue);

      ToDoTasksModel().deleteTaskById(task.id);
    });

    test('allUsedTags reflects every task, deduplicated and sorted', () async {
      await ToDoTasksModel().isReady;
      final a = await ToDoTasksModel().createNewTask(title: 'a', tags: ['zebra', 'bug']);
      final b = await ToDoTasksModel().createNewTask(title: 'b', tags: ['bug', 'apple']);

      final tags = ToDoTasksModel().allUsedTags;
      expect(tags.contains('zebra'), isTrue);
      expect(tags.contains('bug'), isTrue);
      expect(tags.contains('apple'), isTrue);
      expect(tags.indexOf('apple') < tags.indexOf('bug'), isTrue, reason: 'expected sorted order');

      ToDoTasksModel().deleteTaskById(a.id);
      ToDoTasksModel().deleteTaskById(b.id);
    });

    test('setTagIcon / iconForTag round-trip, removeTagIcon clears it', () async {
      await ToDoTasksModel().isReady;
      expect(ToDoTasksModel().iconForTag('nonexistent-tag'), isNull);

      ToDoTasksModel().setTagIcon('bug', 'bug_report');
      expect(ToDoTasksModel().iconForTag('bug'), isNotNull);

      ToDoTasksModel().removeTagIcon('bug');
      expect(ToDoTasksModel().iconForTag('bug'), isNull);
    });

    test('a custom category resolves through categoryDataFrom', () async {
      await ToDoTasksModel().isReady;
      final id = ToDoTasksModel().nextCustomCategoryId();
      ToDoTasksModel().addOrUpdateCustomCategory(CustomTaskCategory(id: id, label: 'Blocked', iconName: 'block'));

      final (label, _, _) = ToDoTask.categoryDataFrom(id);
      expect(label, 'Blocked');

      ToDoTasksModel().deleteCustomCategory(id);
    });

    test('deleting a custom category falls back to "For later" rather than throwing', () async {
      await ToDoTasksModel().isReady;
      final id = ToDoTasksModel().nextCustomCategoryId();
      ToDoTasksModel().addOrUpdateCustomCategory(CustomTaskCategory(id: id, label: 'Temporary', iconName: 'label'));
      ToDoTasksModel().deleteCustomCategory(id);

      final (label, icon, _) = ToDoTask.categoryDataFrom(id);
      expect(label, DefaultTaskCategory.forLater.displayName);
      expect(icon, DefaultTaskCategory.forLater.icon);
    });

    test('wouldCreateCycle catches self-parenting and a genuine loop', () async {
      await ToDoTasksModel().isReady;
      final a = await ToDoTasksModel().createNewTask(title: 'a');
      final b = await ToDoTasksModel().createNewTask(title: 'b');

      expect(ToDoTasksModel().wouldCreateCycle(a.id, a.id), isTrue, reason: 'a task cannot be its own parent');

      expect(ToDoTasksModel().setParent(b.id, a.id), isTrue, reason: 'b becoming a child of a is fine');
      expect(ToDoTasksModel().wouldCreateCycle(a.id, b.id), isTrue, reason: 'a becoming a child of its own child b would loop');

      ToDoTasksModel().deleteTaskById(a.id);
      ToDoTasksModel().deleteTaskById(b.id);
    });

    test('setParent refuses a cycle and leaves the parent unchanged', () async {
      await ToDoTasksModel().isReady;
      final a = await ToDoTasksModel().createNewTask(title: 'a');
      final b = await ToDoTasksModel().createNewTask(title: 'b');
      ToDoTasksModel().setParent(b.id, a.id); // b -> a

      final accepted = ToDoTasksModel().setParent(a.id, b.id); // would loop
      expect(accepted, isFalse);
      expect(ToDoTasksModel().byId(a.id)!.parentId.value, isNull);

      ToDoTasksModel().deleteTaskById(a.id);
      ToDoTasksModel().deleteTaskById(b.id);
    });

    test('deleting a task orphans its children instead of deleting them too', () async {
      await ToDoTasksModel().isReady;
      final parent = await ToDoTasksModel().createNewTask(title: 'parent');
      final child = await ToDoTasksModel().createNewTask(title: 'child');
      ToDoTasksModel().setParent(child.id, parent.id);

      ToDoTasksModel().deleteTaskById(parent.id);
      // deleteTaskById is void-async (fire-and-forget, matching the rest of
      // this model's mutators), so its body — including the orphaning —
      // runs on a later microtask than this line. Let it flush before
      // asserting.
      await Future.delayed(Duration.zero);

      expect(ToDoTasksModel().byId(child.id), isNotNull, reason: 'the child itself should survive');
      expect(ToDoTasksModel().byId(child.id)!.parentId.value, isNull);

      ToDoTasksModel().deleteTaskById(child.id);
    });

    test('childrenOf returns only direct children of the given parent', () async {
      await ToDoTasksModel().isReady;
      final parent = await ToDoTasksModel().createNewTask(title: 'parent');
      final child1 = await ToDoTasksModel().createNewTask(title: 'child1');
      final child2 = await ToDoTasksModel().createNewTask(title: 'child2');
      final unrelated = await ToDoTasksModel().createNewTask(title: 'unrelated');
      ToDoTasksModel().setParent(child1.id, parent.id);
      ToDoTasksModel().setParent(child2.id, parent.id);

      final children = ToDoTasksModel().childrenOf(parent.id).map((c) => c.id).toSet();
      expect(children, {child1.id, child2.id});

      for (final t in [parent, child1, child2, unrelated]) {
        ToDoTasksModel().deleteTaskById(t.id);
      }
    });
  });
}
