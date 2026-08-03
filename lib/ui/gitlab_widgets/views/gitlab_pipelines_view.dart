import 'dart:async';
import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:jira_watcher/dao/gitlab_dao.dart';
import 'package:jira_watcher/dao/gitlab_download_service.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/gitlab_api_model.dart';
import 'package:jira_watcher/models/gitlab_quick_downloads_model.dart';
import 'package:jira_watcher/models/gitlab_tabs_model.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_download_ui.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_paginated_list.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_ref_field.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_status.dart';
import 'package:jira_watcher/ui/gitlab_widgets/views/gitlab_jobs_view.dart';
import 'package:jira_watcher/ui/gitlab_widgets/views/gitlab_quick_downloads_dialog.dart';
import 'package:jira_watcher/ui/utils/time_utils.dart';
import 'package:loggy/loggy.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:path/path.dart' as p;
import 'package:url_launcher/url_launcher.dart';

class GitLabPipelinesView extends StatefulWidget {
  const GitLabPipelinesView({super.key, required this.tab});

  final GitLabProjectTab tab;

  @override
  State<GitLabPipelinesView> createState() => _GitLabPipelinesViewState();
}

class _GitLabPipelinesViewState extends State<GitLabPipelinesView> {
  static const _statusOptions = <String?>[null, 'success', 'failed', 'running', 'pending', 'canceled', 'skipped', 'manual'];

  late final TextEditingController _refController;

  /// Bumped to rebuild the list from page 1 on a filter change or refresh.
  int _reloadToken = 0;

  String? get _status => widget.tab.viewState['pipelineStatus'] as String?;
  set _status(String? value) {
    // Kept on the tab, because switching sections unmounts this view.
    widget.tab.viewState['pipelineStatus'] = value;
    DataModel().gitlabTabs.requestSave();
  }

  String get _ref => (widget.tab.viewState['pipelineRef'] as String?) ?? '';
  set _ref(String value) {
    widget.tab.viewState['pipelineRef'] = value;
    DataModel().gitlabTabs.requestSave();
  }

  @override
  void initState() {
    super.initState();
    _refController = TextEditingController(text: _ref);
  }

  @override
  void dispose() {
    _refController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          spacing: 8,
          children: [
            GitLabRefField(
              projectId: widget.tab.projectId,
              controller: _refController,
              onSubmitted: (value) => setState(() {
                _ref = value;
                _reloadToken++;
              }),
            ),
            DropdownMenu<String?>(
              initialSelection: _status,
              enableSearch: false,
              requestFocusOnTap: false,
              label: const Text('Status'),
              dropdownMenuEntries: [
                for (final status in _statusOptions)
                  DropdownMenuEntry(
                    value: status,
                    label: status == null ? 'Any status' : GitLabStatus.from(status).label,
                    leadingIcon: status == null ? null : Icon(GitLabStatus.from(status).icon, size: 18, color: GitLabStatus.from(status).color),
                  ),
              ],
              onSelected: (value) => setState(() {
                _status = value;
                _reloadToken++;
              }),
            ),
            const Spacer(),
            IconButton(
              tooltip: 'Refresh',
              icon: const Icon(Symbols.refresh),
              onPressed: () => setState(() => _reloadToken++),
            ),
          ],
        ),
      ),
      const Divider(height: 1),
      Expanded(
        child: GitLabPaginatedList(
          key: ValueKey('pipelines|${widget.tab.projectId}|$_status|$_ref|$_reloadToken'),
          emptyMessage: 'No pipelines match these filters.',
          separated: true,
          fetchPage: (page) => DataModel().gitlab.pipelines(
            widget.tab.projectId,
            page: page,
            status: _status,
            ref: _ref.isEmpty ? null : _ref,
          ),
          itemBuilder: (context, pipeline, _) => _PipelineRow(
            key: ValueKey(pipeline['id']),
            tab: widget.tab,
            pipeline: pipeline,
          ),
        ),
      ),
    ],
  );
}

class _PipelineRow extends StatefulWidget {
  const _PipelineRow({super.key, required this.tab, required this.pipeline});

  final GitLabProjectTab tab;
  final Map<String, dynamic> pipeline;

  @override
  State<_PipelineRow> createState() => _PipelineRowState();
}

class _PipelineRowState extends State<_PipelineRow> with UiLoggy {
  bool _expanded = false;
  bool _loadingJobs = false;
  List<Map<String, dynamic>>? _jobs;
  Object? _jobsError;

  int get _projectId => widget.tab.projectId;
  int get _pipelineId => widget.pipeline['id'] as int;

  Future<void> _toggle() async {
    setState(() => _expanded = !_expanded);
    if (_expanded) await _ensureJobs();
  }

  /// Jobs are fetched only when a row is opened — the pipelines list response
  /// carries no job or duration data, so eagerly loading them would mean one
  /// request per row on every page.
  Future<List<Map<String, dynamic>>?> _ensureJobs() async {
    if (_jobs != null || _loadingJobs) return _jobs;
    setState(() {
      _loadingJobs = true;
      _jobsError = null;
    });
    try {
      final result = await DataModel().gitlab.pipelineJobs(_projectId, _pipelineId);
      final jobs = result.items.map((e) => (e as Map).cast<String, dynamic>()).toList();
      if (!mounted) return null;
      setState(() {
        _jobs = jobs;
        _loadingJobs = false;
      });
      return jobs;
    } on Object catch (e) {
      loggy.error('Could not load jobs for pipeline $_pipelineId: $e');
      if (!mounted) return null;
      setState(() {
        _jobsError = e;
        _loadingJobs = false;
      });
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final status = GitLabStatus.from(widget.pipeline['status'] as String?);
    final iid = widget.pipeline['iid'] ?? widget.pipeline['id'];
    final name = widget.pipeline['name'] as String?;
    final ref = widget.pipeline['ref'] as String? ?? '';
    final webUrl = widget.pipeline['web_url'] as String?;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: _toggle,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              spacing: 12,
              children: [
                AnimatedRotation(
                  turns: _expanded ? 0 : -0.25,
                  duration: Durations.short3,
                  child: const Icon(Symbols.expand_more, size: 18),
                ),
                GitLabStatusChip(status: status),
                SizedBox(
                  width: 76,
                  child: Text('#$iid', style: const TextStyle(fontFamily: 'RobotoMono')),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name ?? ref,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Row(
                        spacing: 6,
                        children: [
                          const Icon(Symbols.fork_right, size: 13),
                          Flexible(
                            child: Text(ref, maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.bodySmall),
                          ),
                          const Icon(Symbols.commit, size: 13),
                          Text(
                            shortSha(widget.pipeline['sha'] as String?),
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(fontFamily: 'RobotoMono'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (widget.pipeline['source'] != null)
                  Chip(
                    label: Text('${widget.pipeline['source']}'.replaceAll('_', ' '), style: const TextStyle(fontSize: 11)),
                    visualDensity: VisualDensity.compact,
                    padding: EdgeInsets.zero,
                  ),
                SizedBox(
                  width: 96,
                  child: Text(
                    timeAgo(timeStr: widget.pipeline['created_at'] as String?),
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.end,
                  ),
                ),
                _PipelineDownloadsButton(tab: widget.tab, pipelineId: _pipelineId, loadJobs: _ensureJobs),
                if (webUrl != null)
                  IconButton(
                    tooltip: 'Open in browser',
                    icon: const Icon(Symbols.open_in_browser),
                    visualDensity: VisualDensity.compact,
                    onPressed: () => launchUrl(Uri.parse(webUrl)),
                  ),
              ],
            ),
          ),
        ),
        AnimatedSize(
          duration: Durations.short3,
          curve: Curves.easeInOut,
          child: _expanded ? _stages() : const SizedBox.shrink(),
        ),
      ],
    );
  }

  Widget _stages() {
    if (_loadingJobs) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
      );
    }
    if (_jobsError != null) {
      return Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          spacing: 8,
          children: [
            Icon(Symbols.error, fill: 1, size: 18, color: Theme.of(context).colorScheme.error),
            Expanded(child: Text('Could not load jobs: $_jobsError')),
            TextButton(
              onPressed: () {
                setState(() => _jobs = null);
                _ensureJobs();
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }
    final jobs = _jobs;
    if (jobs == null || jobs.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(12),
        child: Text('This pipeline has no jobs.'),
      );
    }

    // GitLab returns jobs newest-first, which puts the last stage at the top.
    // Reversing restores pipeline order (earliest stage first) for both the
    // stages and the jobs within each one.
    final stages = <String, List<Map<String, dynamic>>>{};
    for (final job in jobs.reversed) {
      stages.putIfAbsent(job['stage'] as String? ?? 'other', () => []).add(job);
    }

    return Container(
      color: Theme.of(context).colorScheme.surfaceContainerLow,
      padding: const EdgeInsets.only(left: 42, right: 12, top: 8, bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          for (final entry in stages.entries)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12,
              children: [
                SizedBox(
                  width: 110,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      entry.key,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Theme.of(context).hintColor),
                    ),
                  ),
                ),
                Expanded(
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [for (final job in entry.value) _JobChip(tab: widget.tab, job: job)],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _JobChip extends StatelessWidget {
  const _JobChip({required this.tab, required this.job});

  final GitLabProjectTab tab;
  final Map<String, dynamic> job;

  bool get _hasArtifacts => (job['artifacts'] as List?)?.any((a) => (a as Map)['file_type'] == 'archive') ?? false;

  @override
  Widget build(BuildContext context) {
    final status = GitLabStatus.from(job['status'] as String?);
    final webUrl = job['web_url'] as String?;

    return Tooltip(
      message: '${job['name']}\n${status.label} · ${formatGitLabDuration(job['duration'] as num?)}',
      child: Material(
        color: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
          side: BorderSide(color: Theme.of(context).dividerColor),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: webUrl == null ? null : () => launchUrl(Uri.parse(webUrl)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 6,
              children: [
                Icon(status.icon, size: 14, color: status.color, fill: status.isFinished ? 1 : 0),
                Text('${job['name']}', style: const TextStyle(fontSize: 12)),
                Text(
                  formatGitLabDuration(job['duration'] as num?),
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).hintColor),
                ),
                if (_hasArtifacts)
                  IconButton(
                    icon: const Icon(Symbols.download),
                    iconSize: 14,
                    visualDensity: VisualDensity.compact,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    tooltip: 'Download artifacts archive',
                    onPressed: () => downloadJobArchive(context, tab, job),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Sentinel for the "Manage quick downloads…" menu entry.
const Object _manageQuickDownloads = 'manage-quick-downloads';

/// Resolves a quick-download rule against a pipeline and downloads what it points at.
Future<void> runQuickDownload(
  BuildContext context,
  GitLabProjectTab tab,
  GitLabQuickDownloadRule rule,
  List<Map<String, dynamic>> pipelineJobs, {
  int? pipelineId,
}) async {
  if (!await GitLabDao().supportsArtifactTree()) {
    if (!context.mounted) return;
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Symbols.info, fill: 1),
        title: const Text('Quick downloads need a newer GitLab'),
        content: Text(
          'Matching a file inside an artifacts archive needs GitLab 18.8 or newer, because that is '
          'when the API to list archive contents was added. '
          '${GitLabDao().instanceVersion == null ? '' : 'This instance reports ${GitLabDao().instanceVersion}.'}',
        ),
        actions: [TextButton(onPressed: Navigator.of(context).pop, child: const Text('Close'))],
      ),
    );
    return;
  }

  List<GitLabQuickDownloadMatch> matches;
  try {
    matches = await GitLabQuickDownloadsModel().resolve(
      projectId: tab.projectId,
      rule: rule,
      pipelineJobs: pipelineJobs,
    );
  } on Object catch (e) {
    if (!context.mounted) return;
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: Icon(Symbols.search_off, fill: 1, color: Theme.of(context).colorScheme.error),
        title: Text('"${rule.label}" found nothing'),
        content: SizedBox(width: 520, child: quickDownloadFailureDetail(context, e)),
        actions: [
          TextButton(onPressed: Navigator.of(context).pop, child: const Text('Close')),
          FilledButton(
            onPressed: () {
              Navigator.of(context).pop();
              showDialog(
                context: context,
                // Carries the pipeline through, so the editor can suggest this
                // pipeline's jobs and files while the pattern is being fixed.
                builder: (context) => GitLabQuickDownloadsDialog(tab: tab, testPipelineId: pipelineId),
              );
            },
            child: const Text('Edit rules'),
          ),
        ],
      ),
    );
    return;
  }

  // Several matches is not an error — the user picks.
  var match = matches.first;
  if (matches.length > 1) {
    if (!context.mounted) return;
    final picked = await showDialog<GitLabQuickDownloadMatch>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('"${rule.label}" matched ${matches.length} entries'),
        constraints: const BoxConstraints(maxWidth: 640, maxHeight: 560),
        actions: [TextButton(onPressed: Navigator.of(context).pop, child: const Text('Cancel'))],
        content: SizedBox(
          width: 580,
          child: ListView.builder(
            itemCount: matches.length,
            itemBuilder: (context, index) {
              final candidate = matches[index];
              return ListTile(
                dense: true,
                leading: Icon(candidate.isDirectory ? Symbols.folder : Symbols.description, fill: candidate.isDirectory ? 1 : 0),
                title: Text(candidate.path, style: const TextStyle(fontFamily: 'RobotoMono', fontSize: 12)),
                subtitle: candidate.isDirectory ? const Text('folder') : Text(GitLabJobRow.formatBytes(candidate.size)),
                onTap: () => Navigator.of(context).pop(candidate),
              );
            },
          ),
        ),
      ),
    );
    if (picked == null) return;
    match = picked;
  }

  if (!context.mounted) return;

  if (match.isDirectory) {
    await _downloadMatchedFolder(context, tab, match);
    return;
  }

  await runGitLabDownload(
    context,
    label: '${rule.label}\n${match.path}',
    suggestedName: match.fileName,
    run: (destination, task) => GitLabDownloadService().downloadArtifactFile(
      projectId: tab.projectId,
      jobId: match.jobId,
      artifactPath: match.cleanPath,
      destination: destination,
      task: task,
    ),
  );
}

/// A rule can point at a folder. GitLab's single-file endpoint cannot serve one,
/// so every file underneath is fetched into a directory the user chooses.
Future<void> _downloadMatchedFolder(BuildContext context, GitLabProjectTab tab, GitLabQuickDownloadMatch match) async {
  final entries = await DataModel().gitlab.artifactTreeAll(tab.projectId, match.jobId, path: match.cleanPath);
  final files = entries
      .where((e) => !gitlabArtifactIsDirectory(e))
      .map(gitlabArtifactPathOf)
      .where((path) => path.isNotEmpty)
      .toList();

  if (!context.mounted) return;

  if (files.isEmpty) {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Symbols.folder_off, fill: 1),
        title: const Text('That folder is empty'),
        content: Text('"${match.path}" contains no files to download.'),
        actions: [TextButton(onPressed: Navigator.of(context).pop, child: const Text('Close'))],
      ),
    );
    return;
  }

  final directory = await getDirectoryPath(confirmButtonText: 'Save ${files.length} files here');
  if (directory == null || !context.mounted) return;

  final task = GitLabDownloadTask(label: match.path, destination: File(directory));
  final failures = <String>[];

  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => _FolderDownloadDialog(
      task: task,
      files: files,
      run: (path) async {
        // Archive layout is preserved relative to the matched folder.
        final relative = p.posix.relative(path, from: match.cleanPath);
        final destination = File(p.join(directory, relative));
        try {
          await GitLabDownloadService().downloadArtifactFile(
            projectId: tab.projectId,
            jobId: match.jobId,
            artifactPath: path,
            destination: destination,
            task: task,
          );
        } on Object catch (e) {
          failures.add('$relative — $e');
        }
      },
    ),
  );

  if (!context.mounted) return;

  if (failures.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Saved ${files.length} files to ${p.basename(directory)}'),
        action: SnackBarAction(
          label: 'Show in folder',
          onPressed: () => revealInFileManager(File(p.join(directory, p.basename(files.first)))),
        ),
      ),
    );
  } else {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: Icon(Symbols.warning, fill: 1, color: Theme.of(context).colorScheme.error),
        title: Text('${failures.length} of ${files.length} files failed'),
        content: SizedBox(
          width: 520,
          child: SingleChildScrollView(child: SelectableText(failures.join('\n'))),
        ),
        actions: [TextButton(onPressed: Navigator.of(context).pop, child: const Text('Close'))],
      ),
    );
  }
}

class _FolderDownloadDialog extends StatefulWidget {
  const _FolderDownloadDialog({required this.task, required this.files, required this.run});

  final GitLabDownloadTask task;
  final List<String> files;
  final Future<void> Function(String path) run;

  @override
  State<_FolderDownloadDialog> createState() => _FolderDownloadDialogState();
}

class _FolderDownloadDialogState extends State<_FolderDownloadDialog> {
  int _done = 0;
  String? _current;

  @override
  void initState() {
    super.initState();
    _runAll();
  }

  Future<void> _runAll() async {
    for (final path in widget.files) {
      if (widget.task.isCancelled) break;
      if (mounted) setState(() => _current = path);
      await widget.run(path);
      if (mounted) setState(() => _done++);
    }
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: const Text('Downloading folder'),
    content: SizedBox(
      width: 460,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 12,
        children: [
          Text('$_done of ${widget.files.length} files'),
          LinearProgressIndicator(value: widget.files.isEmpty ? null : _done / widget.files.length),
          Text(
            _current ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).hintColor),
          ),
        ],
      ),
    ),
    actions: [TextButton(onPressed: widget.task.cancel, child: const Text('Cancel'))],
  );
}

/// Downloads a job's whole artifact archive.
Future<void> downloadJobArchive(BuildContext context, GitLabProjectTab tab, Map<String, dynamic> job) async {
  final jobId = job['id'] as int;
  final suggested = '${tab.name}-${job['name']}-$jobId.zip'.replaceAll(RegExp(r'[<>:"/\\|?*]'), '_');
  await runGitLabDownload(
    context,
    label: '${job['name']} artifacts archive',
    suggestedName: suggested,
    run: (destination, task) => GitLabDownloadService().downloadJobArchive(
      projectId: tab.projectId,
      jobId: jobId,
      destination: destination,
      task: task,
    ),
  );
}

/// The per-pipeline downloads menu.
///
/// Jobs are loaded on demand when the menu is opened, so the pipeline list stays
/// one request per page.
class _PipelineDownloadsButton extends StatefulWidget {
  const _PipelineDownloadsButton({required this.tab, required this.pipelineId, required this.loadJobs});

  final GitLabProjectTab tab;
  final int pipelineId;
  final Future<List<Map<String, dynamic>>?> Function() loadJobs;

  @override
  State<_PipelineDownloadsButton> createState() => _PipelineDownloadsButtonState();
}

class _PipelineDownloadsButtonState extends State<_PipelineDownloadsButton> {
  bool _busy = false;

  Future<void> _open() async {
    setState(() => _busy = true);
    final jobs = await widget.loadJobs();
    if (!mounted) return;
    setState(() => _busy = false);
    if (jobs == null) return;

    final withArtifacts = jobs
        .where((j) => (j['artifacts'] as List?)?.any((a) => (a as Map)['file_type'] == 'archive') ?? false)
        .toList();

    final box = context.findRenderObject() as RenderBox?;
    if (box == null) return;
    final origin = box.localToGlobal(Offset.zero);
    final overlay = Overlay.of(context).context.size ?? Size.zero;

    final rules = GitLabQuickDownloadsModel().forProject(widget.tab.projectId).list.where((r) => r.isValid).toList();

    if (!mounted) return;
    final selected = await showMenu<Object>(
      context: context,
      position: RelativeRect.fromLTRB(
        origin.dx,
        origin.dy + box.size.height,
        overlay.width - origin.dx - box.size.width,
        0,
      ),
      items: [
        // Quick downloads go first — that's the whole point of them.
        if (rules.isNotEmpty) ...[
          const PopupMenuItem(enabled: false, height: 32, child: Text('QUICK DOWNLOADS', style: TextStyle(fontSize: 10, letterSpacing: .8))),
          for (final rule in rules)
            PopupMenuItem<Object>(
              value: rule,
              child: Row(
                spacing: 8,
                children: [
                  const Icon(Symbols.bolt, fill: 1, size: 18),
                  Expanded(child: Text(rule.label, maxLines: 1, overflow: TextOverflow.ellipsis)),
                ],
              ),
            ),
          const PopupMenuDivider(),
        ],
        if (withArtifacts.isEmpty)
          const PopupMenuItem(enabled: false, child: Text('No artifacts in this pipeline'))
        else ...[
          const PopupMenuItem(enabled: false, height: 32, child: Text('FULL ARCHIVES', style: TextStyle(fontSize: 10, letterSpacing: .8))),
          for (final job in withArtifacts)
            PopupMenuItem<Object>(
              value: job,
              child: Row(
                spacing: 8,
                children: [
                  const Icon(Symbols.folder_zip, size: 18),
                  Expanded(child: Text('${job['name']}', maxLines: 1, overflow: TextOverflow.ellipsis)),
                ],
              ),
            ),
        ],
        const PopupMenuDivider(),
        const PopupMenuItem<Object>(
          value: _manageQuickDownloads,
          child: Row(
            spacing: 8,
            children: [
              Icon(Symbols.settings, size: 18),
              Text('Manage quick downloads…'),
            ],
          ),
        ),
      ],
    );

    if (selected == null || !mounted) return;

    if (selected == _manageQuickDownloads) {
      await showDialog(
        context: context,
        builder: (context) => GitLabQuickDownloadsDialog(tab: widget.tab, testPipelineId: widget.pipelineId),
      );
      if (mounted) setState(() {});
      return;
    }

    if (selected is GitLabQuickDownloadRule) {
      await runQuickDownload(context, widget.tab, selected, jobs, pipelineId: widget.pipelineId);
      return;
    }

    await downloadJobArchive(context, widget.tab, selected as Map<String, dynamic>);
  }

  @override
  Widget build(BuildContext context) => IconButton(
    tooltip: 'Download artifacts',
    visualDensity: VisualDensity.compact,
    icon: _busy
        ? const SizedBox.square(dimension: 18, child: CircularProgressIndicator(strokeWidth: 2))
        : const Icon(Symbols.download),
    onPressed: _busy ? null : _open,
  );
}
