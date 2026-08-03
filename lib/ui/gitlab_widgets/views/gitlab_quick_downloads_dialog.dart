import 'package:flutter/material.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/gitlab_quick_downloads_model.dart';
import 'package:jira_watcher/models/gitlab_tabs_model.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_suggest_field.dart';
import 'package:jira_watcher/ui/gitlab_widgets/views/gitlab_jobs_view.dart';
import 'package:jira_watcher/ui/utils/widgets/dialog_widgets.dart/action_buttons.dart';
import 'package:loggy/loggy.dart';
import 'package:material_symbols_icons/symbols.dart';

/// Manage a project's quick-download rules.
class GitLabQuickDownloadsDialog extends StatefulWidget {
  const GitLabQuickDownloadsDialog({super.key, required this.tab, this.testPipelineId});

  final GitLabProjectTab tab;

  /// A pipeline to test rules against; normally the newest one on screen.
  final int? testPipelineId;

  @override
  State<GitLabQuickDownloadsDialog> createState() => _GitLabQuickDownloadsDialogState();
}

class _GitLabQuickDownloadsDialogState extends State<GitLabQuickDownloadsDialog> {
  GitLabQuickDownloadsModel get _model => GitLabQuickDownloadsModel();

  @override
  Widget build(BuildContext context) {
    final rules = _model.forProject(widget.tab.projectId);

    return AlertDialog(
      title: const Text('Quick artifact downloads'),
      constraints: const BoxConstraints(maxWidth: 720, maxHeight: 680),
      actions: [
        Row(
          children: [
            TextButton.icon(
              icon: const Icon(Symbols.add),
              label: const Text('Add a rule'),
              onPressed: () async {
                final rule = _model.createRule(widget.tab.projectId);
                await _edit(rule);
                if (mounted) setState(() {});
              },
            ),
            const Spacer(),
            TextButton(onPressed: Navigator.of(context).pop, child: const Text('Close')),
          ],
        ),
      ],
      content: SizedBox(
        width: 660,
        child: AnimatedBuilder(
          animation: rules,
          builder: (context, _) => Column(
            children: [
              Text(
                'These appear at the top of a pipeline\'s download menu, so you can pull a file '
                'out of an artifacts archive in one click.',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).hintColor),
              ),
              const Divider(),
              Expanded(
                child: rules.isEmpty
                    ? const Center(child: Text('No rules yet.'))
                    : ListView.separated(
                        itemCount: rules.length,
                        separatorBuilder: (context, _) => const Divider(height: 1),
                        itemBuilder: (context, index) {
                          final rule = rules[index];
                          return ListTile(
                            leading: Icon(
                              rule.isValid ? Symbols.bolt : Symbols.error,
                              fill: 1,
                              color: rule.isValid ? null : Theme.of(context).colorScheme.error,
                            ),
                            title: Text(rule.label),
                            subtitle: Text(
                              'job ${rule.jobIsRegex ? "matches" : "contains"} ${rule.jobPattern}'
                              '${rule.stage == null || rule.stage!.isEmpty ? "" : " · stage ${rule.stage}"}'
                              '\nfile ${rule.pathIsRegex ? "matches" : "contains"} ${rule.pathPattern}',
                              style: const TextStyle(fontFamily: 'RobotoMono', fontSize: 11),
                            ),
                            isThreeLine: true,
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  tooltip: 'Edit',
                                  icon: const Icon(Symbols.edit),
                                  onPressed: () => _edit(rule),
                                ),
                                IconButton(
                                  tooltip: 'Delete',
                                  icon: Icon(Symbols.delete, fill: 1, color: Theme.of(context).colorScheme.error),
                                  onPressed: () async {
                                    final confirmed = await requestConfirmation(context, 'Delete the rule "${rule.label}"?');
                                    if (confirmed ?? false) _model.deleteRule(widget.tab.projectId, rule);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _edit(GitLabQuickDownloadRule rule) async {
    final edited = await showDialog<GitLabQuickDownloadRule>(
      context: context,
      builder: (context) => _RuleEditorDialog(
        tab: widget.tab,
        rule: rule.copy(),
        testPipelineId: widget.testPipelineId,
      ),
    );
    if (edited != null) _model.replaceRule(widget.tab.projectId, edited);
    if (mounted) setState(() {});
  }
}

class _RuleEditorDialog extends StatefulWidget {
  const _RuleEditorDialog({required this.tab, required this.rule, this.testPipelineId});

  final GitLabProjectTab tab;
  final GitLabQuickDownloadRule rule;
  final int? testPipelineId;

  @override
  State<_RuleEditorDialog> createState() => _RuleEditorDialogState();
}

class _RuleEditorDialogState extends State<_RuleEditorDialog> with UiLoggy {
  late final TextEditingController _label;
  late final TextEditingController _jobPattern;
  late final TextEditingController _stage;
  late final TextEditingController _pathPattern;
  late bool _jobIsRegex;
  late bool _pathIsRegex;

  bool _testing = false;
  String? _testSummary;
  List<String>? _testMatches;
  Object? _testError;

  /// Jobs of the pipeline the dialog was opened from, used to suggest job names,
  /// stages, and — through the matched job — artifact paths.
  List<Map<String, dynamic>>? _pipelineJobs;
  bool _loadingPipeline = false;

  /// Artifact entry paths per job, so switching the job pattern back and forth
  /// does not refetch.
  final Map<int, List<String>> _treeCache = {};

  @override
  void initState() {
    super.initState();
    _label = TextEditingController(text: widget.rule.label);
    _jobPattern = TextEditingController(text: widget.rule.jobPattern);
    _stage = TextEditingController(text: widget.rule.stage ?? '');
    _pathPattern = TextEditingController(text: widget.rule.pathPattern);
    _jobIsRegex = widget.rule.jobIsRegex;
    _pathIsRegex = widget.rule.pathIsRegex;
    _loadPipelineJobs();
  }

  Future<void> _loadPipelineJobs() async {
    final pipelineId = widget.testPipelineId;
    if (pipelineId == null) return;
    setState(() => _loadingPipeline = true);
    try {
      final page = await DataModel().gitlab.pipelineJobs(widget.tab.projectId, pipelineId);
      if (!mounted) return;
      setState(() {
        _pipelineJobs = page.items.map((e) => (e as Map).cast<String, dynamic>()).toList();
        _loadingPipeline = false;
      });
    } on Object catch (e) {
      loggy.warning('Could not load pipeline jobs for suggestions: $e');
      if (!mounted) return;
      setState(() => _loadingPipeline = false);
    }
  }

  /// Reversed so suggestions read in pipeline order rather than newest-first.
  Iterable<Map<String, dynamic>> get _jobsInPipelineOrder => (_pipelineJobs ?? const <Map<String, dynamic>>[]).reversed;

  Future<List<String>> _jobNameOptions() async => _jobsInPipelineOrder.map((j) => j['name'] as String? ?? '').where((n) => n.isNotEmpty).toSet().toList();

  Future<List<String>> _stageOptions() async => _jobsInPipelineOrder.map((j) => j['stage'] as String? ?? '').where((s) => s.isNotEmpty).toSet().toList();

  /// The job the current patterns resolve to, preferring one that has an archive.
  Map<String, dynamic>? get _matchedJob {
    final jobs = _pipelineJobs;
    if (jobs == null || jobs.isEmpty) return null;
    final rule = _current;
    if (rule.jobPattern.isEmpty) return null;
    final candidates = jobs.where(rule.matchesJob).toList();
    if (candidates.isEmpty) return null;
    candidates.sort((a, b) => (b['id'] as int).compareTo(a['id'] as int));
    return candidates.firstWhere(
      (j) => (j['artifacts'] as List?)?.any((a) => (a as Map)['file_type'] == 'archive') ?? false,
      orElse: () => candidates.first,
    );
  }

  Future<List<String>> _pathOptions() async {
    final job = _matchedJob;
    if (job == null) return const [];
    final jobId = job['id'] as int;
    final cached = _treeCache[jobId];
    if (cached != null) return cached;
    try {
      final entries = await DataModel().gitlab.artifactTreeAll(widget.tab.projectId, jobId);
      final paths = entries
          .map((e) => '${e['path'] ?? e['name']}${(e['type'] == 'directory' || e['type'] == 'tree') ? '/' : ''}')
          .where((path) => path.isNotEmpty)
          .toList();
      _treeCache[jobId] = paths;
      return paths;
    } on Object catch (e) {
      loggy.warning('Could not load the artifact tree for job $jobId: $e');
      return const [];
    }
  }

  @override
  void dispose() {
    _label.dispose();
    _jobPattern.dispose();
    _stage.dispose();
    _pathPattern.dispose();
    super.dispose();
  }

  GitLabQuickDownloadRule get _current => GitLabQuickDownloadRule(
    id: widget.rule.id,
    label: _label.text.trim(),
    jobPattern: _jobPattern.text.trim(),
    pathPattern: _pathPattern.text.trim(),
    jobIsRegex: _jobIsRegex,
    pathIsRegex: _pathIsRegex,
    stage: _stage.text.trim().isEmpty ? null : _stage.text.trim(),
  );

  /// Runs the rule against a real pipeline, so a wrong pattern is caught here
  /// rather than at download time.
  Future<void> _test() async {
    final pipelineId = widget.testPipelineId;
    if (pipelineId == null) return;

    setState(() {
      _testing = true;
      _testSummary = null;
      _testMatches = null;
      _testError = null;
    });

    try {
      final jobsPage = await DataModel().gitlab.pipelineJobs(widget.tab.projectId, pipelineId);
      final jobs = jobsPage.items.map((e) => (e as Map).cast<String, dynamic>()).toList();
      final matches = await GitLabQuickDownloadsModel().resolve(
        projectId: widget.tab.projectId,
        rule: _current,
        pipelineJobs: jobs,
      );
      if (!mounted) return;
      setState(() {
        _testing = false;
        _testSummary = 'Matched ${matches.length} entr${matches.length == 1 ? "y" : "ies"} in job "${matches.first.jobName}".'
            '${matches.length > 1 ? ' The first would be used unless you pick one.' : ''}';
        _testMatches = matches.map((m) => '${m.path}${m.isDirectory ? "/" : ""}  ${GitLabJobRow.formatBytes(m.size)}').toList();
      });
    } on Object catch (e) {
      loggy.info('Quick download rule test failed: $e');
      if (!mounted) return;
      setState(() {
        _testing = false;
        _testError = e;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final current = _current;
    return AlertDialog(
      title: const Text('Quick download rule'),
      constraints: const BoxConstraints(maxWidth: 640, maxHeight: 700),
      actions: [
        Row(
          children: [
            if (widget.testPipelineId != null)
              TextButton.icon(
                icon: _testing
                    ? const SizedBox.square(dimension: 16, child: CircularProgressIndicator(strokeWidth: 2))
                    : const Icon(Symbols.play_circle),
                label: const Text('Test on latest pipeline'),
                onPressed: (_testing || !current.isValid) ? null : _test,
              ),
            const Spacer(),
            const CancelButton(),
            FilledButton(
              onPressed: current.isValid ? () => Navigator.of(context).pop(current) : null,
              child: const Text('Save'),
            ),
          ],
        ),
      ],
      content: SizedBox(
        width: 580,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 16,
            children: [
              TextField(
                controller: _label,
                onChanged: (_) => setState(() {}),
                decoration: const InputDecoration(
                  labelText: 'Name',
                  helperText: 'Shown in the pipeline download menu',
                  border: OutlineInputBorder(),
                ),
              ),
              GitLabSuggestField(
                key: ValueKey('job|${_pipelineJobs?.length}'),
                controller: _jobPattern,
                label: 'Job',
                helper: _suggestionHelper('Which job produced the archive'),
                hint: _jobIsRegex ? r'^build-x86' : 'build-x86',
                isRegex: _jobIsRegex,
                onRegexToggled: (value) => setState(() => _jobIsRegex = value),
                onChanged: (_) => setState(() {}),
                optionsProvider: _jobNameOptions,
                emptyOptionsMessage: 'No jobs to suggest',
                leadingIconFor: (_) => Symbols.play_circle,
              ),
              GitLabSuggestField(
                key: ValueKey('stage|${_pipelineJobs?.length}'),
                controller: _stage,
                label: 'Stage (optional)',
                helper: 'Restrict to one stage when job names repeat across stages',
                isRegex: false,
                onChanged: (_) => setState(() {}),
                optionsProvider: _stageOptions,
                emptyOptionsMessage: 'No stages to suggest',
                leadingIconFor: (_) => Symbols.layers,
              ),
              GitLabSuggestField(
                // Rebuilt when the matched job changes, so the suggestion list is
                // reloaded from that job's archive.
                key: ValueKey('path|${_matchedJob?['id']}'),
                controller: _pathPattern,
                label: 'File or folder inside the archive',
                helper: _pathHelper(),
                hint: _pathIsRegex ? r'Release/MyApp-.*\.exe$' : 'Release/MyApp.exe',
                isRegex: _pathIsRegex,
                onRegexToggled: (value) => setState(() => _pathIsRegex = value),
                onChanged: (_) => setState(() {}),
                optionsProvider: _pathOptions,
                emptyOptionsMessage: _matchedJob == null ? 'Set a job first to list its files' : 'This archive has no entries',
                leadingIconFor: (option) => option.endsWith('/') ? Symbols.folder : Symbols.description,
              ),
              if (_pathIsRegex && hasGeneralizableNumbers(_pathPattern.text))
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    icon: const Icon(Symbols.auto_fix_high, size: 18),
                    label: const Text('Make version numbers flexible'),
                    onPressed: () => setState(() {
                      _pathPattern.text = generalizeNumbersToRegex(_pathPattern.text);
                    }),
                  ),
                ),
              if (_testSummary != null || _testError != null || _testMatches != null) _testResults(),
            ],
          ),
        ),
      ),
    );
  }

  String _suggestionHelper(String base) {
    if (widget.testPipelineId == null) return base;
    if (_loadingPipeline) return '$base — loading suggestions…';
    final count = _pipelineJobs?.length;
    return count == null ? base : '$base — $count job${count == 1 ? '' : 's'} available, click to browse';
  }

  String _pathHelper() {
    if (_matchedJob == null) {
      return _jobPattern.text.trim().isEmpty
          ? 'Set a job above to browse its files'
          : 'No job in this pipeline matches that job pattern yet';
    }
    return 'Suggestions come from "${_matchedJob!['name']}". Use a regex when the name is versioned.';
  }

  Widget _testResults() {
    if (_testError != null) {
      return Card(
        color: Theme.of(context).colorScheme.errorContainer,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: DefaultTextStyle(
            style: TextStyle(color: Theme.of(context).colorScheme.onErrorContainer),
            child: quickDownloadFailureDetail(context, _testError!),
          ),
        ),
      );
    }
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Row(
              spacing: 8,
              children: [
                const Icon(Symbols.check_circle, fill: 1, color: Colors.green, size: 18),
                Expanded(child: Text(_testSummary ?? '')),
              ],
            ),
            if (_testMatches != null)
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 160),
                child: SingleChildScrollView(
                  child: SelectableText(
                    _testMatches!.join('\n'),
                    style: const TextStyle(fontFamily: 'RobotoMono', fontSize: 11),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// Explains a resolution failure, including what *was* available, so a wrong
/// pattern can be fixed without guessing.
Widget quickDownloadFailureDetail(BuildContext context, Object error) {
  if (error is QuickDownloadNoMatchingJob) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text('No job matched "${error.rule.jobPattern}".', style: const TextStyle(fontWeight: FontWeight.bold)),
        const Text('This pipeline contains:'),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 200),
          child: SingleChildScrollView(
            child: SelectableText(
              error.availableJobs.join('\n'),
              style: const TextStyle(fontFamily: 'RobotoMono', fontSize: 11),
            ),
          ),
        ),
      ],
    );
  }
  if (error is QuickDownloadNoMatchingPath) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text('Nothing in "${error.jobName}" matched "${error.rule.pathPattern}".', style: const TextStyle(fontWeight: FontWeight.bold)),
        Text('The archive contains ${error.sampleEntries.length >= 60 ? "these among others" : "these entries"}:'),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 220),
          child: SingleChildScrollView(
            child: SelectableText(
              error.sampleEntries.join('\n'),
              style: const TextStyle(fontFamily: 'RobotoMono', fontSize: 11),
            ),
          ),
        ),
      ],
    );
  }
  if (error is QuickDownloadJobHasNoArtifacts) {
    return Text('The job "${error.jobName}" matched, but it produced no artifacts archive.');
  }
  return SelectableText('$error');
}
