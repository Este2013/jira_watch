import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/models/work_item_tabs_model.dart';

WorkItemTab aTab({List<String> history = const [], int historyIndex = 0, String? groupId, bool isSearchTab = false}) =>
    WorkItemTab(id: 't1', history: history, historyIndex: historyIndex, groupId: groupId, isSearchTab: isSearchTab);

void main() {
  group('WorkItemTab.currentKey', () {
    test('null for a search tab', () {
      expect(aTab(isSearchTab: true).currentKey, isNull);
    });

    test('null for an empty history', () {
      expect(aTab().currentKey, isNull);
    });

    test('the entry at historyIndex', () {
      expect(aTab(history: ['A-1', 'A-2', 'A-3'], historyIndex: 1).currentKey, 'A-2');
    });
  });

  group('WorkItemTab.navigatedTo', () {
    test('appends to an empty history', () {
      final tab = aTab().navigatedTo('A-1');
      expect(tab.history, ['A-1']);
      expect(tab.historyIndex, 0);
    });

    test('appends after the current position when there is nothing ahead', () {
      final tab = aTab(history: ['A-1'], historyIndex: 0).navigatedTo('A-2');
      expect(tab.history, ['A-1', 'A-2']);
      expect(tab.historyIndex, 1);
    });

    test('is a no-op when navigating to the page already showing', () {
      final start = aTab(history: ['A-1', 'A-2'], historyIndex: 1);
      final tab = start.navigatedTo('A-2');
      expect(tab.history, start.history);
      expect(tab.historyIndex, start.historyIndex);
    });

    test('drops the forward history, like a browser, when navigating from a backed-up position', () {
      final start = aTab(history: ['A-1', 'A-2', 'A-3'], historyIndex: 0);
      final tab = start.navigatedTo('B-1');
      expect(tab.history, ['A-1', 'B-1']);
      expect(tab.historyIndex, 1);
    });
  });

  group('WorkItemTab.steppedBack / steppedForward', () {
    test('steps back one entry', () {
      final tab = aTab(history: ['A-1', 'A-2'], historyIndex: 1).steppedBack();
      expect(tab.historyIndex, 0);
    });

    test('does nothing at the start of history', () {
      final tab = aTab(history: ['A-1', 'A-2'], historyIndex: 0).steppedBack();
      expect(tab.historyIndex, 0);
    });

    test('steps forward one entry', () {
      final tab = aTab(history: ['A-1', 'A-2'], historyIndex: 0).steppedForward();
      expect(tab.historyIndex, 1);
    });

    test('does nothing at the end of history', () {
      final tab = aTab(history: ['A-1', 'A-2'], historyIndex: 1).steppedForward();
      expect(tab.historyIndex, 1);
    });

    test('canGoBack / canGoForward reflect position', () {
      final tab = aTab(history: ['A-1', 'A-2', 'A-3'], historyIndex: 1);
      expect(tab.canGoBack, isTrue);
      expect(tab.canGoForward, isTrue);
      expect(tab.steppedBack().canGoBack, isFalse);
      expect(tab.steppedForward().canGoForward, isFalse);
    });
  });

  group('WorkItemTab.resolvedTo', () {
    test('turns a search tab into a real one with a fresh, single-entry history', () {
      final tab = aTab(isSearchTab: true).resolvedTo('A-1');
      expect(tab.isSearchTab, isFalse);
      expect(tab.history, ['A-1']);
      expect(tab.historyIndex, 0);
      expect(tab.currentKey, 'A-1');
    });
  });

  group('WorkItemTab.copyWith', () {
    test('clearGroup wins over an unrelated groupId left at its default', () {
      final tab = aTab(groupId: 'g1').copyWith(clearGroup: true);
      expect(tab.groupId, isNull);
    });

    test('preserves identity and unrelated fields', () {
      final original = aTab(history: ['A-1'], groupId: 'g1');
      final moved = original.copyWith(groupId: 'g2');
      expect(moved.id, original.id);
      expect(moved.history, original.history);
      expect(moved.groupId, 'g2');
    });
  });

  group('WorkItemTab JSON', () {
    test('round-trips a real tab', () {
      final tab = aTab(history: ['A-1', 'A-2'], historyIndex: 1, groupId: 'g1');
      final restored = WorkItemTab.fromJson(tab.toJson());
      expect(restored.id, tab.id);
      expect(restored.history, tab.history);
      expect(restored.historyIndex, tab.historyIndex);
      expect(restored.groupId, tab.groupId);
      expect(restored.isSearchTab, isFalse);
    });

    test('round-trips a search tab', () {
      final tab = aTab(isSearchTab: true, groupId: 'g1');
      final restored = WorkItemTab.fromJson(tab.toJson());
      expect(restored.isSearchTab, isTrue);
      expect(restored.currentKey, isNull);
    });

    test('survives junk on disk', () {
      final restored = WorkItemTab.fromJson({'id': 't1'});
      expect(restored.history, isEmpty);
      expect(restored.historyIndex, 0);
      expect(restored.groupId, isNull);
      expect(restored.isSearchTab, isFalse);
    });
  });

  group('WorkItemTabGroup JSON', () {
    test('round-trips a group', () {
      final group = WorkItemTabGroup(id: 'g1', name: 'Bugs', color: Colors.red, icon: WorkItemGroupIcon.bug);
      final restored = WorkItemTabGroup.fromJson(group.toJson());
      expect(restored.id, 'g1');
      expect(restored.name, 'Bugs');
      expect(restored.color.toARGB32(), Colors.red.toARGB32());
      expect(restored.icon, WorkItemGroupIcon.bug);
    });

    test('falls back to a sensible icon for an unknown or missing name', () {
      final restored = WorkItemTabGroup.fromJson({'id': 'g1', 'name': 'X', 'color': 0xFF000000});
      expect(restored.icon, WorkItemGroupIcon.label);
    });
  });
}
