import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:loggy/loggy.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:observable_datasets/observable_list.dart';
import 'package:path/path.dart' as path;

/// Top-level grouping of a project's sub-views, mirroring GitLab's own sidebar.
enum GitLabSection {
  home('Home', Symbols.home),
  code('Code', Symbols.code),
  build('Build', Symbols.build),
  deploy('Deploy', Symbols.rocket_launch);

  const GitLabSection(this.label, this.icon);

  final String label;
  final IconData icon;
}

/// A single project sub-view. Persisted by [name] — never by index, since
/// inserting a value would otherwise scramble every saved tab.
enum GitLabSubView {
  overview(GitLabSection.home, 'Overview', Symbols.dashboard),
  mergeRequests(GitLabSection.code, 'Merge requests', Symbols.merge),
  branches(GitLabSection.code, 'Branches', Symbols.fork_right),
  commits(GitLabSection.code, 'Commits', Symbols.commit),
  tags(GitLabSection.code, 'Tags', Symbols.label),
  repoGraph(GitLabSection.code, 'Repo graph', Symbols.account_tree),
  pipelines(GitLabSection.build, 'Pipelines', Symbols.conversion_path),
  jobs(GitLabSection.build, 'Jobs', Symbols.browse_activity),
  artifacts(GitLabSection.build, 'Artifacts', Symbols.package_2),
  releases(GitLabSection.deploy, 'Releases', Symbols.rocket_launch),
  featureFlags(GitLabSection.deploy, 'Feature flags', Symbols.flag);

  const GitLabSubView(this.section, this.label, this.icon);

  final GitLabSection section;
  final String label;
  final IconData icon;

  static List<GitLabSubView> of(GitLabSection section) => values.where((v) => v.section == section).toList();

  static GitLabSubView byName(String? name) => values.firstWhere((v) => v.name == name, orElse: () => GitLabSubView.overview);
}

/// One open project tab.
///
/// The display fields are denormalised rather than resolved from [projectId] on
/// launch, so the tab strip renders immediately and offline instead of waiting on
/// one request per tab.
class GitLabProjectTab {
  GitLabProjectTab({
    required this.projectId,
    required this.pathWithNamespace,
    required this.name,
    this.avatarUrl,
    this.webUrl,
    this.subView = GitLabSubView.overview,
    Map<String, dynamic>? viewState,
  }) : viewState = viewState ?? {};

  final int projectId;
  String pathWithNamespace;
  String name;
  String? avatarUrl;
  String? webUrl;
  GitLabSubView subView;

  /// Per-sub-view state that has to survive a section switch, because the project
  /// view only keeps the current section's sub-views alive.
  final Map<String, dynamic> viewState;

  factory GitLabProjectTab.fromProjectJson(Map<String, dynamic> json) => GitLabProjectTab(
    projectId: json['id'] as int,
    pathWithNamespace: json['path_with_namespace'] as String? ?? json['name'] as String? ?? '',
    name: json['name'] as String? ?? '',
    avatarUrl: json['avatar_url'] as String?,
    webUrl: json['web_url'] as String?,
  );

  factory GitLabProjectTab.fromJson(Map<String, dynamic> json) => GitLabProjectTab(
    projectId: json['projectId'] as int,
    pathWithNamespace: json['pathWithNamespace'] as String? ?? '',
    name: json['name'] as String? ?? '',
    avatarUrl: json['avatarUrl'] as String?,
    webUrl: json['webUrl'] as String?,
    subView: GitLabSubView.byName(json['subView'] as String?),
    viewState: (json['viewState'] as Map?)?.cast<String, dynamic>(),
  );

  Map<String, dynamic> toJson() => {
    'projectId': projectId,
    'pathWithNamespace': pathWithNamespace,
    'name': name,
    'avatarUrl': avatarUrl,
    'webUrl': webUrl,
    'subView': subView.name,
    'viewState': viewState,
  };
}

/// Owns the open GitLab project tabs and their persistence.
class GitLabTabsModel with GlobalLoggy {
  static final GitLabTabsModel _instance = GitLabTabsModel._internal();

  factory GitLabTabsModel() => _instance;

  GitLabTabsModel._internal() {
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
    (dir) => File(path.join(dir.path, 'gitlab_tabs.json').replaceFirst(RegExp(r'^\\?/?'), '')),
  );

  late final ObservableList<GitLabProjectTab> tabs;
  final ValueNotifier<int?> activeProjectId = ValueNotifier(null);

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
      final list = (data['tabs'] as List? ?? []).map((e) => GitLabProjectTab.fromJson((e as Map).cast<String, dynamic>())).toList();
      tabs = ObservableList(initialData: list);
      final saved = data['activeProjectId'] as int?;
      activeProjectId.value = list.any((t) => t.projectId == saved) ? saved : list.firstOrNull?.projectId;
    } on Object catch (e) {
      loggy.error('gitlab_tabs.json could not be read ($e). Starting with no open tabs.');
      tabs = ObservableList();
    }
    return true;
  }

  GitLabProjectTab? get activeTab {
    final id = activeProjectId.value;
    if (id == null) return null;
    return tabs.list.where((t) => t.projectId == id).firstOrNull;
  }

  int get activeIndex {
    final index = tabs.list.indexWhere((t) => t.projectId == activeProjectId.value);
    return index < 0 ? 0 : index;
  }

  /// Focuses the project if it is already open, otherwise appends a new tab.
  void openProject(GitLabProjectTab tab) {
    final existing = tabs.list.where((t) => t.projectId == tab.projectId).firstOrNull;
    if (existing != null) {
      // Refresh the denormalised display fields while we have fresh data.
      existing.name = tab.name;
      existing.pathWithNamespace = tab.pathWithNamespace;
      existing.avatarUrl = tab.avatarUrl;
      existing.webUrl = tab.webUrl;
      setActive(existing);
      return;
    }
    tabs.add(tab);
    setActive(tab);
  }

  void close(GitLabProjectTab tab) {
    final index = tabs.list.indexOf(tab);
    if (index < 0) return;
    tabs.removeAt(index);
    if (activeProjectId.value == tab.projectId) {
      final next = tabs.list.isEmpty ? null : tabs.list[index.clamp(0, tabs.list.length - 1)];
      activeProjectId.value = next?.projectId;
    }
    requestSave();
  }

  void closeOthers(GitLabProjectTab keep) {
    tabs.removeWhere((t, _) => t.projectId != keep.projectId);
    activeProjectId.value = keep.projectId;
    requestSave();
  }

  void closeAll() {
    tabs.reset();
    activeProjectId.value = null;
    requestSave();
  }

  void setActive(GitLabProjectTab tab) {
    activeProjectId.value = tab.projectId;
    requestSave();
  }

  void setSubView(GitLabProjectTab tab, GitLabSubView subView) {
    tab.subView = subView;
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
          'activeProjectId': activeProjectId.value,
          'tabs': tabs.list.map((t) => t.toJson()).toList(),
        }),
      );
    } on Object catch (e) {
      loggy.error('gitlab_tabs.json could not be written to: $e');
    }
  }
}
