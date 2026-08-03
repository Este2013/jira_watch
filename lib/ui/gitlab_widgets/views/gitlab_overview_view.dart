import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/gitlab_tabs_model.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_paginated_list.dart';
import 'package:jira_watcher/ui/gitlab_widgets/views/gitlab_commits_view.dart';
import 'package:loggy/loggy.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:url_launcher/url_launcher.dart';

/// The project's landing view: readme, with recent commits beside it when the
/// window is wide enough and stacked beneath it when it is not.
class GitLabOverviewView extends StatefulWidget {
  const GitLabOverviewView({super.key, required this.tab});

  final GitLabProjectTab tab;

  @override
  State<GitLabOverviewView> createState() => _GitLabOverviewViewState();
}

class _GitLabOverviewViewState extends State<GitLabOverviewView> with UiLoggy {
  /// Beyond this the readme and the commit list sit side by side.
  static const double _twoPaneBreakpoint = 1100;

  Future<(String, String)?>? _readme;
  int _reloadToken = 0;

  @override
  void initState() {
    super.initState();
    _readme = DataModel().gitlab.readme(widget.tab.projectId);
  }

  void _refresh() => setState(() {
    _readme = DataModel().gitlab.readme(widget.tab.projectId);
    _reloadToken++;
  });

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            Text(
              widget.tab.pathWithNamespace,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).hintColor),
            ),
            const Spacer(),
            IconButton(
              tooltip: 'Refresh',
              icon: const Icon(Symbols.refresh),
              onPressed: _refresh,
            ),
          ],
        ),
      ),
      const Divider(height: 1),
      Expanded(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final readme = _readmePane();
            final commits = _commitsPane();
            if (constraints.maxWidth < _twoPaneBreakpoint) {
              return ListView(
                children: [
                  readme,
                  const Divider(),
                  SizedBox(height: 420, child: commits),
                ],
              );
            }
            return Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(flex: 3, child: SingleChildScrollView(child: readme)),
                const VerticalDivider(width: 1),
                Expanded(flex: 2, child: commits),
              ],
            );
          },
        ),
      ),
    ],
  );

  Widget _readmePane() => FutureBuilder<(String, String)?>(
    future: _readme,
    builder: (context, snapshot) {
      if (snapshot.connectionState != ConnectionState.done) {
        return const Padding(
          padding: EdgeInsets.all(32),
          child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
        );
      }
      if (snapshot.hasError) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            child: ListTile(
              leading: Icon(Symbols.error, fill: 1, color: Theme.of(context).colorScheme.error),
              title: const Text('Could not load the readme'),
              subtitle: Text('${snapshot.error}'),
              trailing: TextButton(onPressed: _refresh, child: const Text('Retry')),
            ),
          ),
        );
      }
      final readme = snapshot.data;
      if (readme == null) {
        return const Padding(
          padding: EdgeInsets.all(32),
          child: Center(child: Text('This project has no readme.')),
        );
      }
      final (name, content) = readme;
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 8,
              children: [
                const Icon(Symbols.description, size: 16),
                Text(name, style: Theme.of(context).textTheme.labelLarge),
              ],
            ),
            const SizedBox(height: 12),
            MarkdownBody(
              data: content,
              selectable: true,
              // Relative links and images resolve against the repo, which this
              // renderer cannot do, so only absolute links are followed.
              onTapLink: (text, href, title) {
                if (href == null) return;
                final uri = Uri.tryParse(href);
                if (uri != null && uri.hasScheme) launchUrl(uri);
              },
            ),
          ],
        ),
      );
    },
  );

  Widget _commitsPane() => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          spacing: 8,
          children: [
            const Icon(Symbols.commit, size: 16),
            Text('Recent commits', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
      ),
      Expanded(
        child: GitLabPaginatedList(
          key: ValueKey('overview-commits|${widget.tab.projectId}|$_reloadToken'),
          emptyMessage: 'No commits yet.',
          separated: true,
          fetchPage: (page) => DataModel().gitlab.commits(widget.tab.projectId, page: page, perPage: 20),
          itemBuilder: (context, commit, _) => GitLabCommitRow(commit: commit),
        ),
      ),
    ],
  );
}
