import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:loggy/loggy.dart';
import 'package:observable_datasets/observable_list.dart';
import 'package:path/path.dart' as path;

/// One open space tab.
///
/// Keyed by [tabId] rather than by the space, unlike a GitLab project tab: the
/// same space can be open twice on purpose, so a duplicate needs an identity of
/// its own or closing one would close both.
///
/// The display fields are denormalised rather than resolved from [spaceId] on
/// launch, so the tab strip renders immediately and offline instead of waiting
/// on one request per tab.
class ConfluenceSpaceTab {
  ConfluenceSpaceTab({
    required this.tabId,
    required this.spaceId,
    required this.spaceKey,
    required this.spaceName,
    this.iconPath,
    this.pageId,
    this.pageTitle,
    Set<String>? expandedPageIds,
    List<String>? history,
    int? historyIndex,
  }) : expandedPageIds = expandedPageIds ?? {},
       history = history ?? [?pageId],
       historyIndex = historyIndex ?? (pageId == null ? -1 : 0);

  final String tabId;
  final String spaceId;
  String spaceKey;
  String spaceName;

  /// The space's icon, as the path the API returns. Denormalised like the name
  /// so a restored tab draws it without a request first; null until a space
  /// opened from search has been looked up.
  String? iconPath;

  /// The article on show. Null means the tab is still on the space's landing
  /// state, with nothing selected in the tree.
  String? pageId;

  /// Kept beside [pageId] so a restored tab can label itself before its page
  /// has loaded.
  String? pageTitle;

  /// The pages visited in this tab, oldest first, and where in them the reader
  /// currently is. Going back moves the cursor rather than dropping entries, so
  /// forward still works — and opening a new page from partway back drops what
  /// was ahead, exactly as a browser does.
  final List<String> history;
  int historyIndex;

  bool get canGoBack => historyIndex > 0;
  bool get canGoForward => historyIndex >= 0 && historyIndex < history.length - 1;

  /// Shows [pageId], recording it in the trail.
  void openPage(String? pageId, {String? title}) {
    this.pageId = pageId;
    pageTitle = title;
    if (pageId == null || history.elementAtOrNull(historyIndex) == pageId) return;

    // Anything ahead of the cursor is dropped: navigating from partway back
    // starts a new branch, which is what a browser does and what a forward
    // button leading somewhere unrelated would not.
    if (historyIndex < history.length - 1) history.removeRange(historyIndex + 1, history.length);
    history.add(pageId);
    historyIndex = history.length - 1;
  }

  /// Moves the cursor. Returns the page now open, or null if there was nowhere
  /// to go.
  String? goBack() => _move(-1);
  String? goForward() => _move(1);

  String? _move(int step) {
    final target = historyIndex + step;
    if (target < 0 || target >= history.length) return null;
    historyIndex = target;
    pageId = history[target];
    // The title belonged to the page being left, so it goes rather than lying
    // about which article the tab is on.
    pageTitle = null;
    return pageId;
  }

  /// Which tree nodes are open. Persisted because collapsing a large space back
  /// to its roots on every restart is the kind of thing that makes a reader stop
  /// using the tree.
  final Set<String> expandedPageIds;

  static var _counter = 0;

  /// Unique per tab, including across two tabs on the same space opened in the
  /// same microsecond — hence the counter as well as the clock.
  static String newTabId() => '${DateTime.now().microsecondsSinceEpoch}-${_counter++}';

  ConfluenceSpaceTab duplicate() => ConfluenceSpaceTab(
    tabId: newTabId(),
    spaceId: spaceId,
    spaceKey: spaceKey,
    spaceName: spaceName,
    iconPath: iconPath,
    pageId: pageId,
    pageTitle: pageTitle,
    expandedPageIds: {...expandedPageIds},
    history: [...history],
    historyIndex: historyIndex,
  );

  factory ConfluenceSpaceTab.fromJson(Map<String, dynamic> json) => ConfluenceSpaceTab(
    // Tabs written before duplication existed have no id; minting one on read
    // keeps an older file loadable rather than dropping its tabs.
    tabId: json['tabId'] as String? ?? newTabId(),
    spaceId: json['spaceId'] as String? ?? '',
    spaceKey: json['spaceKey'] as String? ?? '',
    spaceName: json['spaceName'] as String? ?? '',
    iconPath: json['iconPath'] as String?,
    pageId: json['pageId'] as String?,
    pageTitle: json['pageTitle'] as String?,
    expandedPageIds: (json['expandedPageIds'] as List? ?? const []).map((e) => '$e').toSet(),
    history: (json['history'] as List?)?.map((e) => '$e').toList(),
    historyIndex: json['historyIndex'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'tabId': tabId,
    'spaceId': spaceId,
    'spaceKey': spaceKey,
    'spaceName': spaceName,
    'iconPath': iconPath,
    'pageId': pageId,
    'pageTitle': pageTitle,
    'expandedPageIds': expandedPageIds.toList(),
    'history': history,
    'historyIndex': historyIndex,
  };
}

/// Owns the open Confluence space tabs and their persistence.
class ConfluenceTabsModel with GlobalLoggy {
  static final ConfluenceTabsModel _instance = ConfluenceTabsModel._internal();

  factory ConfluenceTabsModel() => _instance;

  ConfluenceTabsModel._internal() {
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
    (dir) => File(path.join(dir.path, 'confluence_tabs.json').replaceFirst(RegExp(r'^\\?/?'), '')),
  );

  late final ObservableList<ConfluenceSpaceTab> tabs;
  final ValueNotifier<String?> activeTabId = ValueNotifier(null);

  late Future<bool> isReady;
  bool _saveRequested = false;
  // ignore: unused_field
  Timer? _saveTimer;

  Future<bool> _getReady() async {
    final file = await _dataFile;
    if (!await file.exists()) {
      tabs = ObservableList();
      return true;
    }
    // A hand-edited or truncated file must degrade to no tabs, not take the page down.
    try {
      final raw = await file.readAsString();
      if (raw.trim().isEmpty) {
        tabs = ObservableList();
        return true;
      }
      final data = jsonDecode(raw) as Map<String, dynamic>;
      final list = (data['tabs'] as List? ?? []).map((e) => ConfluenceSpaceTab.fromJson((e as Map).cast<String, dynamic>())).toList();
      tabs = ObservableList(initialData: list);
      final saved = data['activeTabId'] as String?;
      activeTabId.value = list.any((t) => t.tabId == saved) ? saved : list.firstOrNull?.tabId;
    } on Object catch (e) {
      loggy.error('confluence_tabs.json could not be read ($e). Starting with no open tabs.');
      tabs = ObservableList();
    }
    return true;
  }

  ConfluenceSpaceTab? get activeTab {
    final id = activeTabId.value;
    if (id == null) return null;
    return tabs.list.where((t) => t.tabId == id).firstOrNull;
  }

  int get activeIndex {
    final index = tabs.list.indexWhere((t) => t.tabId == activeTabId.value);
    return index < 0 ? 0 : index;
  }

  /// Always appends, unlike GitLab's openProject, which focuses an already-open
  /// project instead. Opening the same space twice is a feature here.
  void openSpace(ConfluenceSpaceTab tab) {
    tabs.add(tab);
    setActive(tab);
  }

  void duplicate(ConfluenceSpaceTab tab) {
    final copy = tab.duplicate();
    final index = tabs.list.indexOf(tab);
    // Placed beside its original rather than at the end, which is where a
    // duplicated browser tab goes and where the eye expects it.
    tabs.insert(index < 0 ? tabs.list.length : index + 1, copy);
    setActive(copy);
  }

  void close(ConfluenceSpaceTab tab) {
    final index = tabs.list.indexOf(tab);
    if (index < 0) return;
    tabs.removeAt(index);
    if (activeTabId.value == tab.tabId) {
      final next = tabs.list.isEmpty ? null : tabs.list[index.clamp(0, tabs.list.length - 1)];
      activeTabId.value = next?.tabId;
    }
    requestSave();
  }

  void closeOthers(ConfluenceSpaceTab keep) {
    tabs.removeWhere((t, _) => t.tabId != keep.tabId);
    activeTabId.value = keep.tabId;
    requestSave();
  }

  void closeAll() {
    tabs.reset();
    activeTabId.value = null;
    requestSave();
  }

  void setActive(ConfluenceSpaceTab tab) {
    activeTabId.value = tab.tabId;
    requestSave();
  }

  /// Fills in details a tab was opened without — a search result knows a page
  /// but not always its space's name or icon.
  void describeSpace(ConfluenceSpaceTab tab, {String? name, String? key, String? iconPath}) {
    if (name != null && name.isNotEmpty) tab.spaceName = name;
    if (key != null && key.isNotEmpty) tab.spaceKey = key;
    if (iconPath != null && iconPath.isNotEmpty) tab.iconPath = iconPath;
    requestSave();
  }

  /// Opens an article, recording it in the tab's history.
  ///
  /// [title] is stored alongside so a restored tab can label itself before the
  /// page loads; the article view corrects it once the page is in, via
  /// [describePage].
  void setPage(ConfluenceSpaceTab tab, String? pageId, {String? title}) {
    tab.openPage(pageId, title: title);
    requestSave();
  }

  /// Corrects the label once the article itself has loaded — a page reached by
  /// a link or by going back was never in the tree to be named.
  void describePage(ConfluenceSpaceTab tab, String title) {
    if (tab.pageTitle == title) return;
    tab.pageTitle = title;
    requestSave();
  }

  /// Moves the history cursor. Returns the page now open, or null if there was
  /// nowhere to go.
  String? goBack(ConfluenceSpaceTab tab) => _saved(tab.goBack());
  String? goForward(ConfluenceSpaceTab tab) => _saved(tab.goForward());

  String? _saved(String? pageId) {
    requestSave();
    return pageId;
  }

  void setExpanded(ConfluenceSpaceTab tab, String pageId, bool expanded) {
    if (expanded) {
      tab.expandedPageIds.add(pageId);
    } else {
      tab.expandedPageIds.remove(pageId);
    }
    requestSave();
  }

  void moveToIndex(int oldIndex, int newIndex) {
    tabs.moveToIndex(oldIndex, newIndex);
    requestSave();
  }

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
          'tabs': tabs.list.map((t) => t.toJson()).toList(),
        }),
      );
    } on Object catch (e) {
      loggy.error('confluence_tabs.json could not be written to: $e');
    }
  }
}
