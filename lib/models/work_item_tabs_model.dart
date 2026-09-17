/// Work item tabs: one browser-like tab per work item, organized into
/// optional named, colored, iconed groups (Chrome's tab groups), plus the
/// "leading" special views (Dashboards, Pinned work items, Mind map) that sit
/// ahead of the tabs themselves in the strip and are never tabs of their own.
library;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:loggy/loggy.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:observable_datasets/observable_list.dart';
import 'package:path/path.dart' as path;

/// The special views that sit ahead of the work item tabs in the strip — not
/// work item tabs themselves, so they never close, reorder, or belong to a
/// group.
enum WorkItemsLeadingView {
  dashboards('Dashboards', Symbols.space_dashboard),
  pinnedWorkItems('Pinned work items', Symbols.push_pin),
  mindMap('Mind map', Symbols.hub);

  const WorkItemsLeadingView(this.label, this.icon);

  final String label;
  final IconData icon;
}

/// A curated set of icons a group can be given — persisted by name, the way
/// [GitLabSubView] persists a sub-view by name, so the palette can grow later
/// without scrambling what an already-saved group looks like.
enum WorkItemGroupIcon {
  label(Symbols.label),
  star(Symbols.star),
  flag(Symbols.flag),
  bug(Symbols.bug_report),
  rocket(Symbols.rocket_launch),
  priority(Symbols.priority_high),
  folder(Symbols.folder),
  fire(Symbols.local_fire_department),
  build(Symbols.build),
  timer(Symbols.timer);

  const WorkItemGroupIcon(this.icon);

  final IconData icon;

  static WorkItemGroupIcon byName(String? name) => values.firstWhere((v) => v.name == name, orElse: () => WorkItemGroupIcon.label);
}

/// The swatches offered when picking a group's color — named hues rather than
/// a full color wheel, so two groups never end up in barely-different shades
/// of the same color.
const groupColorPalette = <Color>[
  Colors.blueGrey,
  Colors.red,
  Colors.orange,
  Colors.amber,
  Colors.green,
  Colors.teal,
  Colors.blue,
  Colors.indigo,
  Colors.purple,
  Colors.pink,
];

/// A named, colored, iconed group of tabs. Selecting one (see
/// [WorkItemTabsModel.selectedGroupId]) narrows the strip to just its tabs;
/// nothing selected shows the "neutral" (ungrouped) ones instead.
class WorkItemTabGroup {
  WorkItemTabGroup({required this.id, required this.name, required this.color, required this.icon});

  final String id;
  String name;
  Color color;
  WorkItemGroupIcon icon;

  factory WorkItemTabGroup.fromJson(Map json) => WorkItemTabGroup(
    id: json['id'] as String,
    name: json['name'] as String? ?? 'Group',
    color: Color(json['color'] as int? ?? groupColorPalette.first.toARGB32()),
    icon: WorkItemGroupIcon.byName(json['icon'] as String?),
  );

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'color': color.toARGB32(), 'icon': icon.name};
}

/// One open work item tab: either a real one, navigating through [history]
/// the way a browser tab does, or a temporary search tab still waiting for a
/// work item to be picked (see [isSearchTab]) — the "+" button's result until
/// something is chosen in it.
class WorkItemTab {
  WorkItemTab({required this.id, List<String> history = const [], this.historyIndex = 0, this.groupId, this.isSearchTab = false}) : history = List.of(history);

  final String id;

  /// The keys visited in this tab, oldest first — [historyIndex] says which
  /// one is showing. Empty while [isSearchTab] is true.
  final List<String> history;
  final int historyIndex;

  /// The group this tab belongs to, or null for "neutral".
  final String? groupId;

  /// True for a freshly opened "+" tab that has not picked a work item yet.
  final bool isSearchTab;

  String? get currentKey => (isSearchTab || history.isEmpty) ? null : history[historyIndex];
  bool get canGoBack => historyIndex > 0;
  bool get canGoForward => historyIndex < history.length - 1;

  /// This tab after navigating to [key] — like clicking a link in a browser:
  /// anything ahead of the current position is dropped, and [key] becomes the
  /// new, current, last entry. Navigating to the page already showing is a
  /// no-op rather than a duplicate history entry.
  WorkItemTab navigatedTo(String key) {
    if (currentKey == key) return this;
    final kept = history.isEmpty ? const <String>[] : history.sublist(0, historyIndex + 1);
    return copyWith(history: [...kept, key], historyIndex: kept.length);
  }

  WorkItemTab steppedBack() => canGoBack ? copyWith(historyIndex: historyIndex - 1) : this;

  WorkItemTab steppedForward() => canGoForward ? copyWith(historyIndex: historyIndex + 1) : this;

  /// This search tab, resolved into a real one showing [key] — its own,
  /// fresh, one-entry history.
  WorkItemTab resolvedTo(String key) => copyWith(history: [key], historyIndex: 0, isSearchTab: false);

  WorkItemTab copyWith({List<String>? history, int? historyIndex, String? groupId, bool clearGroup = false, bool? isSearchTab}) => WorkItemTab(
    id: id,
    history: history ?? this.history,
    historyIndex: historyIndex ?? this.historyIndex,
    groupId: clearGroup ? null : (groupId ?? this.groupId),
    isSearchTab: isSearchTab ?? this.isSearchTab,
  );

  factory WorkItemTab.fromJson(Map json) => WorkItemTab(
    id: json['id'] as String,
    history: ((json['history'] as List?) ?? const []).whereType<String>().toList(),
    historyIndex: json['historyIndex'] as int? ?? 0,
    groupId: json['groupId'] as String?,
    isSearchTab: json['isSearchTab'] as bool? ?? false,
  );

  Map<String, dynamic> toJson() => {'id': id, 'history': history, 'historyIndex': historyIndex, 'groupId': groupId, 'isSearchTab': isSearchTab};
}

/// Owns the open work item tabs, their groups, and persistence.
class WorkItemTabsModel with GlobalLoggy {
  static final WorkItemTabsModel _instance = WorkItemTabsModel._internal();

  factory WorkItemTabsModel() => _instance;

  WorkItemTabsModel._internal() {
    isReady = _getReady();
    _saveTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_saveRequested) {
        _saveRequested = false;
        _save();
      }
    });
  }

  static const int _schemaVersion = 1;

  final Future<File> _dataFile = SettingsModel().settingsFolder.then(
    (dir) => File(path.join(dir.path, 'work_item_tabs.json').replaceFirst(RegExp(r'^\\?/?'), '')),
  );

  late final ObservableList<WorkItemTab> tabs;
  late final ObservableList<WorkItemTabGroup> groups;

  /// The active tab, or null while a leading view is showing instead. Exactly
  /// one of this and [activeLeadingView] is non-null at a time.
  final ValueNotifier<String?> activeTabId = ValueNotifier(null);

  /// The leading view showing, or null while a work item tab is active.
  final ValueNotifier<WorkItemsLeadingView?> activeLeadingView = ValueNotifier(WorkItemsLeadingView.pinnedWorkItems);

  /// The strip's own filter: null shows the "neutral" (ungrouped) tabs, a
  /// group's id narrows the strip to just that group's tabs.
  final ValueNotifier<String?> selectedGroupId = ValueNotifier(null);

  late Future<bool> isReady;
  bool _saveRequested = false;
  // ignore: unused_field
  Timer? _saveTimer;

  Future<bool> _getReady() async {
    final file = await _dataFile;
    if (!await file.exists()) {
      tabs = ObservableList();
      groups = ObservableList();
      return true;
    }
    // A hand-edited or truncated file must degrade to no tabs, not take the page down.
    try {
      final raw = await file.readAsString();
      if (raw.trim().isEmpty) {
        tabs = ObservableList();
        groups = ObservableList();
        return true;
      }
      final data = jsonDecode(raw) as Map<String, dynamic>;
      groups = ObservableList(
        initialData: (data['groups'] as List? ?? []).map((e) => WorkItemTabGroup.fromJson((e as Map).cast<String, dynamic>())).toList(),
      );
      final list = (data['tabs'] as List? ?? []).map((e) => WorkItemTab.fromJson((e as Map).cast<String, dynamic>())).toList();
      tabs = ObservableList(initialData: list);

      final savedGroupId = data['selectedGroupId'] as String?;
      selectedGroupId.value = groups.list.any((g) => g.id == savedGroupId) ? savedGroupId : null;

      final savedActiveTab = data['activeTabId'] as String?;
      if (savedActiveTab != null && list.any((t) => t.id == savedActiveTab)) {
        activeTabId.value = savedActiveTab;
        activeLeadingView.value = null;
      } else {
        final savedLeadingView = WorkItemsLeadingView.values.where((v) => v.name == data['activeLeadingView']).firstOrNull;
        activeLeadingView.value = savedLeadingView ?? WorkItemsLeadingView.pinnedWorkItems;
      }
    } on Object catch (e) {
      loggy.error('work_item_tabs.json could not be read ($e). Starting with no open tabs.');
      tabs = ObservableList();
      groups = ObservableList();
    }
    return true;
  }

  WorkItemTab? get activeTab {
    final id = activeTabId.value;
    if (id == null) return null;
    return tabs.list.where((t) => t.id == id).firstOrNull;
  }

  WorkItemTabGroup? groupById(String? id) => id == null ? null : groups.list.where((g) => g.id == id).firstOrNull;

  /// The tabs the strip actually shows right now — filtered to
  /// [selectedGroupId], or the ungrouped ones while nothing is selected.
  List<WorkItemTab> get visibleTabs => tabs.list.where((t) => t.groupId == selectedGroupId.value).toList();

  /// Focuses an already-open tab currently showing [key], if there is one —
  /// otherwise opens a new one. Pinning a work item is opening it.
  void openWorkItem(String key, {String? groupId}) {
    final existing = tabs.list.where((t) => t.currentKey == key).firstOrNull;
    if (existing != null) {
      setActiveTab(existing);
      return;
    }
    final tab = WorkItemTab(id: _newId('tab'), history: [key], groupId: groupId ?? selectedGroupId.value);
    tabs.add(tab);
    setActiveTab(tab);
  }

  /// Opens a fresh, empty search tab ready to pick a work item — the "+"
  /// button.
  WorkItemTab openSearchTab({String? groupId}) {
    final tab = WorkItemTab(id: _newId('tab'), isSearchTab: true, groupId: groupId ?? selectedGroupId.value);
    tabs.add(tab);
    setActiveTab(tab);
    return tab;
  }

  void resolveSearchTab(WorkItemTab tab, String key) => _replace(tab, tab.resolvedTo(key));

  void navigate(WorkItemTab tab, String key) => _replace(tab, tab.navigatedTo(key));

  void goBack(WorkItemTab tab) => _replace(tab, tab.steppedBack());

  void goForward(WorkItemTab tab) => _replace(tab, tab.steppedForward());

  void _replace(WorkItemTab tab, WorkItemTab updated) {
    final index = tabs.list.indexWhere((t) => t.id == tab.id);
    if (index < 0) return;
    tabs[index] = updated;
    requestSave();
  }

  /// Closes [tab]. If it was active, focuses its nearest remaining sibling in
  /// the same group, or falls back to "Pinned work items" once the group it
  /// was in has none left.
  void close(WorkItemTab tab) {
    final siblings = tabs.list.where((t) => t.groupId == tab.groupId).toList();
    final siblingIndex = siblings.indexWhere((t) => t.id == tab.id);
    final index = tabs.list.indexWhere((t) => t.id == tab.id);
    if (index < 0) return;
    tabs.removeAt(index);
    if (activeTabId.value == tab.id) {
      final remaining = siblings.where((t) => t.id != tab.id).toList();
      final next = remaining.isEmpty ? null : remaining[siblingIndex.clamp(0, remaining.length - 1)];
      if (next != null) {
        setActiveTab(next);
      } else {
        setActiveLeadingView(WorkItemsLeadingView.pinnedWorkItems);
      }
    }
    requestSave();
  }

  void closeOthers(WorkItemTab keep) {
    tabs.removeWhere((t, _) => t.groupId == keep.groupId && t.id != keep.id);
    setActiveTab(keep);
  }

  void closeAllInGroup(String? groupId) {
    tabs.removeWhere((t, _) => t.groupId == groupId);
    if (activeTab?.groupId == groupId) setActiveLeadingView(WorkItemsLeadingView.pinnedWorkItems);
    requestSave();
  }

  void setActiveTab(WorkItemTab tab) {
    activeLeadingView.value = null;
    activeTabId.value = tab.id;
    // Following a tab into a different group brings that group along, so the
    // strip does not appear to lose the tab that was just clicked.
    if (tab.groupId != selectedGroupId.value) selectedGroupId.value = tab.groupId;
    requestSave();
  }

  void setActiveLeadingView(WorkItemsLeadingView view) {
    activeTabId.value = null;
    activeLeadingView.value = view;
    requestSave();
  }

  void moveToIndex(int oldIndex, int newIndex) {
    tabs.moveToIndex(oldIndex, newIndex);
    requestSave();
  }

  void selectGroup(String? groupId) {
    selectedGroupId.value = groupId;
    requestSave();
  }

  WorkItemTabGroup createGroup({required String name, required Color color, required WorkItemGroupIcon icon}) {
    final group = WorkItemTabGroup(id: _newId('group'), name: name, color: color, icon: icon);
    groups.add(group);
    requestSave();
    return group;
  }

  void editGroup(WorkItemTabGroup group, {String? name, Color? color, WorkItemGroupIcon? icon}) {
    if (name != null) group.name = name;
    if (color != null) group.color = color;
    if (icon != null) group.icon = icon;
    requestSave();
  }

  /// Deletes a group; its tabs fall back to neutral rather than closing.
  void deleteGroup(WorkItemTabGroup group) {
    for (final tab in tabs.list.where((t) => t.groupId == group.id)) {
      _replace(tab, tab.copyWith(clearGroup: true));
    }
    groups.removeWhere((g, _) => g.id == group.id);
    if (selectedGroupId.value == group.id) selectedGroupId.value = null;
    requestSave();
  }

  void addTabToGroup(WorkItemTab tab, String? groupId) => _replace(tab, groupId == null ? tab.copyWith(clearGroup: true) : tab.copyWith(groupId: groupId));

  String _newId(String prefix) => '$prefix:${DateTime.now().microsecondsSinceEpoch}';

  /// Coalesces bursts of changes into at most one write per second.
  void requestSave() => _saveRequested = true;

  Future<void> _save() async {
    final file = await _dataFile;
    if (!await file.exists()) await file.create(recursive: true);
    try {
      await file.writeAsString(
        JsonEncoder.withIndent(' ' * 4).convert({
          'schemaVersion': _schemaVersion,
          'activeTabId': activeTabId.value,
          'activeLeadingView': activeLeadingView.value?.name,
          'selectedGroupId': selectedGroupId.value,
          'groups': groups.list.map((g) => g.toJson()).toList(),
          'tabs': tabs.list.map((t) => t.toJson()).toList(),
        }),
      );
    } on Object catch (e) {
      loggy.error('work_item_tabs.json could not be written to: $e');
    }
  }
}
