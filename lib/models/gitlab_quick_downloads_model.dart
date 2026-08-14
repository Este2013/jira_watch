import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/gitlab_api_model.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:jira_watcher/utils/string_utils.dart';
import 'package:loggy/loggy.dart';
import 'package:observable_datasets/observable_list.dart';
import 'package:path/path.dart' as p;

/// A saved shortcut that pulls one file (or folder) straight out of a pipeline's
/// artifacts, skipping the job → browse → navigate → download dance.
///
/// Both patterns can be plain substrings or regular expressions, because build
/// outputs are often versioned (`MyApp-1.4.2.exe`) and a fixed name would break
/// on every release.
class GitLabQuickDownloadRule {
  GitLabQuickDownloadRule({
    required this.id,
    required this.label,
    required this.jobPattern,
    required this.pathPattern,
    this.jobIsRegex = false,
    this.pathIsRegex = true,
    this.stage,
  });

  final int id;
  String label;

  /// Matched against the job's name.
  String jobPattern;
  bool jobIsRegex;

  /// Optional stage restriction, useful when several stages have similar job names.
  String? stage;

  /// Matched against each entry's full path inside the artifacts archive.
  String pathPattern;
  bool pathIsRegex;

  factory GitLabQuickDownloadRule.fromJson(Map<String, dynamic> json) => GitLabQuickDownloadRule(
    id: json['id'] as int,
    label: json['label'] as String? ?? '',
    jobPattern: json['jobPattern'] as String? ?? '',
    pathPattern: json['pathPattern'] as String? ?? '',
    jobIsRegex: json['jobIsRegex'] as bool? ?? false,
    pathIsRegex: json['pathIsRegex'] as bool? ?? true,
    stage: json['stage'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'label': label,
    'jobPattern': jobPattern,
    'pathPattern': pathPattern,
    'jobIsRegex': jobIsRegex,
    'pathIsRegex': pathIsRegex,
    'stage': stage,
  };

  GitLabQuickDownloadRule copy() => GitLabQuickDownloadRule.fromJson(toJson());

  /// Whether both patterns are usable; a saved rule with a broken regex would
  /// otherwise fail only at download time.
  bool get isValid {
    if (label.trim().isEmpty || jobPattern.trim().isEmpty || pathPattern.trim().isEmpty) return false;
    if (jobIsRegex && !jobPattern.isValidRegex()) return false;
    if (pathIsRegex && !pathPattern.isValidRegex()) return false;
    return true;
  }

  bool matchesJob(Map<String, dynamic> job) {
    final name = job['name'] as String? ?? '';
    if (stage != null && stage!.isNotEmpty && job['stage'] != stage) return false;
    if (jobIsRegex) {
      if (!jobPattern.isValidRegex()) return false;
      return RegExp(jobPattern, caseSensitive: false).hasMatch(name);
    }
    return name.toLowerCase().contains(jobPattern.toLowerCase());
  }

  bool matchesPath(String path) {
    if (pathIsRegex) {
      if (!pathPattern.isValidRegex()) return false;
      return RegExp(pathPattern, caseSensitive: false).hasMatch(path);
    }
    return path.toLowerCase().contains(pathPattern.toLowerCase());
  }

  /// The directory the pattern is rooted at, so the archive walk can start there
  /// instead of at the root.
  String get searchRoot => literalDirectoryPrefix(pathPattern, isRegex: pathIsRegex);
}

/// The leading directory part of a pattern that is a plain literal.
///
/// For `AppPackages/Studio_\d+\.\d+\.msix` this is `AppPackages`, which is what
/// lets a search skip sibling trees like `Symbols/` entirely. Returns an empty
/// string when the pattern starts with something non-literal and the whole
/// archive has to be considered.
String literalDirectoryPrefix(String pattern, {required bool isRegex}) {
  var literal = pattern;
  if (isRegex) {
    final metacharacter = RegExp(r'[\\^$.|?*+()\[\]{}]').firstMatch(pattern);
    if (metacharacter != null) literal = pattern.substring(0, metacharacter.start);
  }
  final lastSlash = literal.lastIndexOf('/');
  return lastSlash <= 0 ? '' : literal.substring(0, lastSlash);
}

/// An artifact entry a rule resolved to.
class GitLabQuickDownloadMatch {
  const GitLabQuickDownloadMatch({
    required this.jobId,
    required this.jobName,
    required this.path,
    required this.isDirectory,
    this.size,
  });

  final int jobId;
  final String jobName;
  final String path;
  final bool isDirectory;
  final int? size;

  /// Path without the trailing slash GitLab puts on directories, for joining
  /// and for use as a request parameter.
  String get cleanPath => stripTrailingSlash(path);

  String get fileName => p.basename(cleanPath);
}

/// No job in the pipeline matched the rule's job pattern.
class QuickDownloadNoMatchingJob implements Exception {
  QuickDownloadNoMatchingJob(this.rule, this.availableJobs);
  final GitLabQuickDownloadRule rule;
  final List<String> availableJobs;
}

/// The job was found, but nothing inside its archive matched the path pattern.
class QuickDownloadNoMatchingPath implements Exception {
  QuickDownloadNoMatchingPath(this.rule, this.jobName, this.sampleEntries, this.totalEntries);
  final GitLabQuickDownloadRule rule;
  final String jobName;
  final List<String> sampleEntries;

  /// Full count, which can exceed [sampleEntries] — the dialog says so rather
  /// than implying the archive is smaller than it is.
  final int totalEntries;

  bool get isTruncated => totalEntries > sampleEntries.length;
}

/// The matching job produced no artifacts archive at all.
class QuickDownloadJobHasNoArtifacts implements Exception {
  QuickDownloadJobHasNoArtifacts(this.jobName);
  final String jobName;
}

/// Stores quick-download rules per project.
class GitLabQuickDownloadsModel with GlobalLoggy {
  static final GitLabQuickDownloadsModel _instance = GitLabQuickDownloadsModel._internal();

  factory GitLabQuickDownloadsModel() => _instance;

  GitLabQuickDownloadsModel._internal() {
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
    (dir) => File(p.join(dir.path, 'gitlab_quick_downloads.json').replaceFirst(RegExp(r'^\\?/?'), '')),
  );

  /// Project id to its rules.
  final Map<int, ObservableList<GitLabQuickDownloadRule>> _byProject = {};

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
        // stays empty, showing no rules until something else rebuilt that
        // widget from scratch and called forProject again.
        forProject(projectId).addAll(
          (entry.value as List).map((e) => GitLabQuickDownloadRule.fromJson((e as Map).cast<String, dynamic>())),
        );
      }
    } on Object catch (e) {
      loggy.error('gitlab_quick_downloads.json could not be read ($e). Starting with no rules.');
      _byProject.clear();
    }
    return true;
  }

  ObservableList<GitLabQuickDownloadRule> forProject(int projectId) => _byProject.putIfAbsent(projectId, () => ObservableList());

  GitLabQuickDownloadRule createRule(int projectId) {
    final rules = forProject(projectId);
    final id = rules.list.fold<int>(0, (max, r) => r.id > max ? r.id : max) + 1;
    final rule = GitLabQuickDownloadRule(
      id: id,
      label: 'New quick download',
      jobPattern: '',
      pathPattern: '',
    );
    rules.add(rule);
    requestSave();
    return rule;
  }

  void replaceRule(int projectId, GitLabQuickDownloadRule edited) {
    final rules = forProject(projectId);
    final index = rules.list.indexWhere((r) => r.id == edited.id);
    if (index < 0) {
      rules.add(edited);
    } else {
      rules[index] = edited;
    }
    requestSave();
  }

  void deleteRule(int projectId, GitLabQuickDownloadRule rule) {
    forProject(projectId).removeWhere((r, _) => r.id == rule.id);
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
      loggy.error('gitlab_quick_downloads.json could not be written to: $e');
    }
  }

  /// Works out what [rule] points at within [pipelineJobs].
  ///
  /// Throws [QuickDownloadNoMatchingJob], [QuickDownloadJobHasNoArtifacts] or
  /// [QuickDownloadNoMatchingPath] so the caller can explain precisely what went
  /// wrong instead of showing a bare failure.
  Future<List<GitLabQuickDownloadMatch>> resolve({
    required int projectId,
    required GitLabQuickDownloadRule rule,
    required List<Map<String, dynamic>> pipelineJobs,
  }) async {
    final candidates = pipelineJobs.where(rule.matchesJob).toList();
    if (candidates.isEmpty) {
      throw QuickDownloadNoMatchingJob(
        rule,
        pipelineJobs.map((j) => '${j['stage']} / ${j['name']}').toList(),
      );
    }

    // Newest job wins when a pipeline has retries of the same job.
    candidates.sort((a, b) => (b['id'] as int).compareTo(a['id'] as int));

    final withArtifacts = candidates.where((j) => (j['artifacts'] as List?)?.any((a) => (a as Map)['file_type'] == 'archive') ?? false).toList();
    if (withArtifacts.isEmpty) {
      throw QuickDownloadJobHasNoArtifacts(candidates.first['name'] as String? ?? '');
    }

    final job = withArtifacts.first;
    final jobId = job['id'] as int;
    final jobName = job['name'] as String? ?? '';

    // Rooting the walk at the pattern's literal prefix is the difference between
    // a handful of requests and hundreds on an archive that also ships symbols.
    final searchRoot = rule.searchRoot;
    final entries = await DataModel().gitlab.artifactTreeAll(
      projectId,
      jobId,
      path: searchRoot.isEmpty ? null : searchRoot,
    );
    final matches = <GitLabQuickDownloadMatch>[];
    for (final entry in entries) {
      final path = gitlabArtifactPathOf(entry);
      if (path.isEmpty) continue;
      final isDirectory = gitlabArtifactIsDirectory(entry);
      // A directory pattern is matched with and without its trailing slash, so a
      // rule written either way behaves the same.
      if (!rule.matchesPath(path) && !(isDirectory && rule.matchesPath(stripTrailingSlash(path)))) continue;
      matches.add(
        GitLabQuickDownloadMatch(
          jobId: jobId,
          jobName: jobName,
          path: path,
          isDirectory: isDirectory,
          size: (entry['size'] as num?)?.toInt(),
        ),
      );
    }

    if (matches.isEmpty) {
      final allPaths = entries.map(gitlabArtifactPathOf).toList()..sort();
      throw QuickDownloadNoMatchingPath(rule, jobName, allPaths.take(300).toList(), allPaths.length);
    }

    // Shallowest, then alphabetical — a top-level installer should outrank a
    // same-named file buried in a debug-symbols folder.
    matches.sort((a, b) {
      final depth = a.path.split('/').length.compareTo(b.path.split('/').length);
      return depth != 0 ? depth : a.path.compareTo(b.path);
    });
    return matches;
  }
}
