import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:jira_watcher/utils/string_utils.dart';
import 'package:loggy/loggy.dart';
import 'package:observable_datasets/observable_list.dart';
import 'package:path/path.dart' as p;

/// How a rule's [GitLabQuickBranchRule.pattern] is matched against a branch name.
enum GitLabBranchMatchType {
  exact('Exact name'),
  contains('Contains'),
  regex('Regex');

  const GitLabBranchMatchType(this.label);
  final String label;
}

/// A saved shortcut that resolves to a branch, so switching a filter to
/// "whatever the release branch is called this week" is one click instead of a
/// search.
///
/// [exact] needs no lookup at all — the pattern *is* the branch name, so
/// selecting one is instant and works even before any branch list has loaded.
/// [contains] and [regex] can match more than one branch, in which case the
/// most recently committed-to one wins — that is what "the current release
/// branch" usually means when it is not named the same thing twice in a row.
class GitLabQuickBranchRule {
  GitLabQuickBranchRule({
    required this.id,
    required this.label,
    required this.pattern,
    this.matchType = GitLabBranchMatchType.exact,
  });

  final int id;
  String label;
  String pattern;
  GitLabBranchMatchType matchType;

  factory GitLabQuickBranchRule.fromJson(Map<String, dynamic> json) => GitLabQuickBranchRule(
    id: json['id'] as int,
    label: json['label'] as String? ?? '',
    pattern: json['pattern'] as String? ?? '',
    matchType: GitLabBranchMatchType.values.firstWhere(
      (t) => t.name == json['matchType'],
      orElse: () => GitLabBranchMatchType.exact,
    ),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'label': label,
    'pattern': pattern,
    'matchType': matchType.name,
  };

  GitLabQuickBranchRule copy() => GitLabQuickBranchRule.fromJson(toJson());

  /// A saved rule with a broken regex would otherwise fail only when tapped.
  bool get isValid {
    if (label.trim().isEmpty || pattern.trim().isEmpty) return false;
    if (matchType == GitLabBranchMatchType.regex && !pattern.isValidRegex()) return false;
    return true;
  }

  bool matches(String branchName) {
    switch (matchType) {
      case GitLabBranchMatchType.exact:
        return branchName == pattern;
      case GitLabBranchMatchType.contains:
        return branchName.toLowerCase().contains(pattern.toLowerCase());
      case GitLabBranchMatchType.regex:
        if (!pattern.isValidRegex()) return false;
        return RegExp(pattern, caseSensitive: false).hasMatch(branchName);
    }
  }
}

/// No branch in the project matched the rule.
class QuickBranchNoMatch implements Exception {
  QuickBranchNoMatch(this.rule);
  final GitLabQuickBranchRule rule;
}

/// When a branch was last committed to, or null when the API gave no usable
/// date. Duplicated from the branches view rather than imported from it: a
/// model has no business depending on a UI file for one date-extraction line.
DateTime? _branchLastCommit(Map<String, dynamic> branch) {
  final commit = branch['commit'] as Map?;
  final raw = (commit?['committed_date'] ?? commit?['created_at']) as String?;
  return raw == null ? null : DateTime.tryParse(raw);
}

/// Stores quick-branch rules per project.
class GitLabQuickBranchesModel with GlobalLoggy {
  static final GitLabQuickBranchesModel _instance = GitLabQuickBranchesModel._internal();

  factory GitLabQuickBranchesModel() => _instance;

  GitLabQuickBranchesModel._internal() {
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
    (dir) => File(p.join(dir.path, 'gitlab_quick_branches.json').replaceFirst(RegExp(r'^\\?/?'), '')),
  );

  /// Project id to its rules.
  final Map<int, ObservableList<GitLabQuickBranchRule>> _byProject = {};

  late Future<bool> isReady;
  bool _saveRequested = false;
  // ignore: unused_field
  Timer? _saveTimer;

  Future<bool> _getReady() async {
    final file = await _dataFile;
    if (!await file.exists()) return true;
    try {
      final raw = await file.readAsString();
      if (raw.trim().isEmpty) return true;
      final data = jsonDecode(raw) as Map<String, dynamic>;
      final projects = data['projects'] as Map<String, dynamic>? ?? {};
      for (final entry in projects.entries) {
        final projectId = int.tryParse(entry.key);
        if (projectId == null) continue;
        // Populated in place via forProject rather than replaced with a new
        // ObservableList: a page can render — and call forProject — before
        // this file finishes reading, since that is disk I/O and the first
        // frame is not. Swapping in a new object then would leave whatever
        // already grabbed the old one listening to a list that only ever
        // stays empty, showing no favorites until something else rebuilt that
        // widget from scratch and called forProject again.
        forProject(projectId).addAll(
          (entry.value as List).map((e) => GitLabQuickBranchRule.fromJson((e as Map).cast<String, dynamic>())),
        );
      }
    } on Object catch (e) {
      loggy.error('gitlab_quick_branches.json could not be read ($e). Starting with no rules.');
      _byProject.clear();
    }
    return true;
  }

  ObservableList<GitLabQuickBranchRule> forProject(int projectId) => _byProject.putIfAbsent(projectId, () => ObservableList());

  GitLabQuickBranchRule createRule(int projectId) {
    final rules = forProject(projectId);
    final id = rules.list.fold<int>(0, (max, r) => r.id > max ? r.id : max) + 1;
    final rule = GitLabQuickBranchRule(id: id, label: 'New favorite branch', pattern: '');
    rules.add(rule);
    requestSave();
    return rule;
  }

  void replaceRule(int projectId, GitLabQuickBranchRule edited) {
    final rules = forProject(projectId);
    final index = rules.list.indexWhere((r) => r.id == edited.id);
    if (index < 0) {
      rules.add(edited);
    } else {
      rules[index] = edited;
    }
    requestSave();
  }

  void deleteRule(int projectId, GitLabQuickBranchRule rule) {
    forProject(projectId).removeWhere((r, _) => r.id == rule.id);
    requestSave();
  }

  /// Reorders in place: removes the rule at [oldIndex] and reinserts it so it
  /// ends up at [newIndex]. Wire this straight to a ReorderableListView's
  /// onReorderItem, whose newIndex already accounts for the removal.
  ///
  /// [ObservableList.moveToIndex] itself subtracts one whenever its own
  /// newIndex argument exceeds oldIndex — the adjustment the *deprecated*
  /// onReorder callback needs, since it reports the pre-removal index. Feeding
  /// it onReorderItem's already-adjusted index straight through would apply
  /// that subtraction twice, landing one slot short of where it should. Adding
  /// one back here cancels it out exactly when moveToIndex would otherwise
  /// trigger it.
  void reorder(int projectId, int oldIndex, int newIndex) {
    final forMoveToIndex = newIndex >= oldIndex ? newIndex + 1 : newIndex;
    forProject(projectId).moveToIndex(oldIndex, forMoveToIndex);
    requestSave();
  }

  /// Whether an exact-match favorite already exists for [branchName] — what the
  /// branches view's star icon is either filled or outlined for.
  bool hasExactFavorite(int projectId, String branchName) =>
      forProject(projectId).list.any((r) => r.matchType == GitLabBranchMatchType.exact && r.pattern == branchName);

  /// Adds or removes an exact-match favorite for [branchName] — the star
  /// icon's whole job. Labelled with the branch name itself: a one-click
  /// favorite is exactly the kind of rule nobody wants to stop and name.
  void toggleExactFavorite(int projectId, String branchName) {
    final rules = forProject(projectId);
    final index = rules.list.indexWhere((r) => r.matchType == GitLabBranchMatchType.exact && r.pattern == branchName);
    if (index >= 0) {
      rules.removeAt(index);
    } else {
      rules.add(GitLabQuickBranchRule(
        id: rules.list.fold<int>(0, (max, r) => r.id > max ? r.id : max) + 1,
        label: branchName,
        pattern: branchName,
      ));
    }
    requestSave();
  }

  void requestSave() => _saveRequested = true;

  Future<void> _save() async {
    final file = await _dataFile;
    if (!await file.exists()) await file.create(recursive: true);
    try {
      await file.writeAsString(
        JsonEncoder.withIndent(' ' * 4).convert({
          'schemaVersion': _schemaVersion,
          'projects': {
            for (final entry in _byProject.entries)
              if (entry.value.list.isNotEmpty) '${entry.key}': entry.value.list.map((r) => r.toJson()).toList(),
          },
        }),
      );
    } on Object catch (e) {
      loggy.error('gitlab_quick_branches.json could not be written to: $e');
    }
  }

  /// Resolves [rule] to a single branch name, or throws [QuickBranchNoMatch].
  ///
  /// [exact] never touches the network — the pattern is the answer. The other
  /// two need the project's branches to pick the most recently committed-to
  /// match; [contains] passes its pattern along as a server-side search hint to
  /// cut down what has to be fetched, which [regex] cannot do since the server
  /// only does substring search.
  Future<String> resolveBranch(int projectId, GitLabQuickBranchRule rule) async {
    if (rule.matchType == GitLabBranchMatchType.exact) return rule.pattern;

    final result = await DataModel().gitlab.branchesAll(
      projectId,
      search: rule.matchType == GitLabBranchMatchType.contains ? rule.pattern : null,
    );
    final candidates = result.branches.where((b) => rule.matches(b['name'] as String? ?? '')).toList();
    if (candidates.isEmpty) throw QuickBranchNoMatch(rule);

    candidates.sort((a, b) {
      final dateA = _branchLastCommit(a);
      final dateB = _branchLastCommit(b);
      // A dateless branch sinks to the bottom rather than winning by default.
      if (dateA == null || dateB == null) return dateA == null ? (dateB == null ? 0 : 1) : -1;
      return dateB.compareTo(dateA);
    });
    return candidates.first['name'] as String? ?? candidates.first['name'].toString();
  }
}
