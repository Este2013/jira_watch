import 'package:flutter/material.dart';
import 'package:jira_watcher/dao/gitlab_dao.dart';
import 'package:jira_watcher/dao/gitlab_download_service.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/gitlab_tabs_model.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_download_ui.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_paginated_list.dart';
import 'package:jira_watcher/ui/gitlab_widgets/views/gitlab_jobs_view.dart';
import 'package:jira_watcher/ui/gitlab_widgets/views/gitlab_pipelines_view.dart';
import 'package:loggy/loggy.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:path/path.dart' as p;

/// Lists only the jobs that actually produced an artifacts archive.
class GitLabArtifactsView extends StatefulWidget {
  const GitLabArtifactsView({super.key, required this.tab});

  final GitLabProjectTab tab;

  @override
  State<GitLabArtifactsView> createState() => _GitLabArtifactsViewState();
}

class _GitLabArtifactsViewState extends State<GitLabArtifactsView> {
  int _reloadToken = 0;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            Text(
              'Jobs that produced downloadable artifacts',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).hintColor),
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
          key: ValueKey('artifacts|${widget.tab.projectId}|$_reloadToken'),
          emptyMessage: 'No jobs with artifacts found.',
          separated: true,
          // GitLab has no "only jobs with artifacts" filter, so pages are fetched
          // whole and filtered client-side. A page can legitimately come back
          // empty after filtering; the list widget handles that by fetching on.
          fetchPage: (page) async {
            final result = await DataModel().gitlab.jobs(widget.tab.projectId, page: page);
            final withArtifacts = result.items
                .where((j) => ((j as Map)['artifacts'] as List?)?.any((a) => (a as Map)['file_type'] == 'archive') ?? false)
                .toList();
            return GitLabPage<dynamic>(items: withArtifacts, nextPage: result.nextPage);
          },
          itemBuilder: (context, job, _) => GitLabJobRow(tab: widget.tab, job: job),
        ),
      ),
    ],
  );
}

/// Opens the archive browser for a job.
Future<void> showGitLabArtifactBrowser(BuildContext context, GitLabProjectTab tab, Map<String, dynamic> job) async {
  final supported = await GitLabDao().supportsArtifactTree();
  if (!context.mounted) return;

  if (!supported) {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Symbols.info, fill: 1),
        title: const Text('Browsing needs a newer GitLab'),
        content: Text(
          'Listing the contents of an artifacts archive needs GitLab 18.8 or newer. '
          '${GitLabDao().instanceVersion == null ? '' : 'This instance reports ${GitLabDao().instanceVersion}. '}'
          'You can still download the whole archive.',
        ),
        actions: [
          TextButton(onPressed: Navigator.of(context).pop, child: const Text('Close')),
          FilledButton(
            onPressed: () {
              Navigator.of(context).pop();
              downloadJobArchive(context, tab, job);
            },
            child: const Text('Download archive'),
          ),
        ],
      ),
    );
    return;
  }

  await showDialog(
    context: context,
    builder: (context) => GitLabArtifactBrowserDialog(tab: tab, job: job),
  );
}

class GitLabArtifactBrowserDialog extends StatefulWidget {
  const GitLabArtifactBrowserDialog({super.key, required this.tab, required this.job});

  final GitLabProjectTab tab;
  final Map<String, dynamic> job;

  @override
  State<GitLabArtifactBrowserDialog> createState() => _GitLabArtifactBrowserDialogState();
}

class _GitLabArtifactBrowserDialogState extends State<GitLabArtifactBrowserDialog> with UiLoggy {
  /// Directory segments; empty is the archive root.
  List<String> _path = [];

  int get _jobId => widget.job['id'] as int;
  int get _projectId => widget.tab.projectId;
  String get _pathString => _path.join('/');

  void _enter(String directoryName) => setState(() => _path = [..._path, directoryName]);

  void _truncateTo(int index) => setState(() => _path = _path.sublist(0, index));

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Row(
      children: [
        Expanded(child: Text('Artifacts of ${widget.job['name']}', maxLines: 1, overflow: TextOverflow.ellipsis)),
        IconButton(
          tooltip: 'Download whole archive',
          icon: const Icon(Symbols.folder_zip),
          onPressed: () => downloadJobArchive(context, widget.tab, widget.job),
        ),
      ],
    ),
    constraints: const BoxConstraints(maxWidth: 700, maxHeight: 650),
    actions: [TextButton(onPressed: Navigator.of(context).pop, child: const Text('Close'))],
    content: SizedBox(
      width: 640,
      child: Column(
        children: [
          _breadcrumb(),
          const Divider(),
          Expanded(
            child: GitLabPaginatedList(
              key: ValueKey('tree|$_jobId|$_pathString'),
              emptyMessage: 'This folder is empty.',
              fetchPage: (page) => DataModel().gitlab.artifactTree(
                _projectId,
                _jobId,
                path: _pathString.isEmpty ? null : _pathString,
                page: page,
              ),
              itemBuilder: (context, entry, _) => _entryTile(entry),
            ),
          ),
        ],
      ),
    ),
  );

  Widget _breadcrumb() => SizedBox(
    height: 36,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      reverse: true,
      child: Row(
        children: [
          TextButton.icon(
            icon: const Icon(Symbols.folder_zip, size: 16),
            label: const Text('archive'),
            onPressed: _path.isEmpty ? null : () => _truncateTo(0),
          ),
          for (final (index, segment) in _path.indexed) ...[
            const Icon(Symbols.chevron_right, size: 16),
            TextButton(
              onPressed: index == _path.length - 1 ? null : () => _truncateTo(index + 1),
              child: Text(segment),
            ),
          ],
        ],
      ),
    ),
  );

  Widget _entryTile(Map<String, dynamic> entry) {
    final isDirectory = entry['type'] == 'directory' || entry['type'] == 'tree';
    final name = entry['name'] as String? ?? p.basename('${entry['path']}');
    final size = (entry['size'] as num?)?.toInt();

    return ListTile(
      dense: true,
      leading: Icon(isDirectory ? Symbols.folder : Symbols.description, fill: isDirectory ? 1 : 0),
      title: Text(name, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: isDirectory ? null : Text(GitLabJobRow.formatBytes(size)),
      trailing: isDirectory
          ? const Icon(Symbols.chevron_right)
          : IconButton(
              tooltip: 'Download this file',
              icon: const Icon(Symbols.download),
              onPressed: () => _downloadFile(entry['path'] as String? ?? name, name),
            ),
      onTap: isDirectory ? () => _enter(name) : () => _downloadFile(entry['path'] as String? ?? name, name),
    );
  }

  Future<void> _downloadFile(String artifactPath, String fileName) => runGitLabDownload(
    context,
    label: artifactPath,
    suggestedName: fileName,
    run: (destination, task) => GitLabDownloadService().downloadArtifactFile(
      projectId: _projectId,
      jobId: _jobId,
      artifactPath: artifactPath,
      destination: destination,
      task: task,
    ),
  );
}
