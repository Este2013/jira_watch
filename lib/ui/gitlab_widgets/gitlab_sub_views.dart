import 'package:flutter/material.dart';
import 'package:jira_watcher/models/gitlab_tabs_model.dart';
import 'package:jira_watcher/ui/gitlab_widgets/views/gitlab_artifacts_view.dart';
import 'package:jira_watcher/ui/gitlab_widgets/views/gitlab_branches_view.dart';
import 'package:jira_watcher/ui/gitlab_widgets/views/gitlab_commits_view.dart';
import 'package:jira_watcher/ui/gitlab_widgets/views/gitlab_deploy_views.dart';
import 'package:jira_watcher/ui/gitlab_widgets/views/gitlab_jobs_view.dart';
import 'package:jira_watcher/ui/gitlab_widgets/views/gitlab_merge_requests_view.dart';
import 'package:jira_watcher/ui/gitlab_widgets/views/gitlab_overview_view.dart';
import 'package:jira_watcher/ui/gitlab_widgets/views/gitlab_pipelines_view.dart';
import 'package:jira_watcher/ui/gitlab_widgets/views/gitlab_repo_graph_view.dart';
import 'package:jira_watcher/ui/gitlab_widgets/views/gitlab_tags_view.dart';

typedef GitLabSubViewBuilder = Widget Function(GitLabProjectTab tab);

/// Where each project sub-view is implemented.
///
/// Landing a real sub-view means replacing one entry here; nothing else moves.
///
/// Note that `GitLabProjectView` only keeps the *current* section's sub-views
/// alive, so any state that must survive a section switch belongs on
/// [GitLabProjectTab.viewState] rather than in a widget's `State`.
final Map<GitLabSubView, GitLabSubViewBuilder> gitLabSubViewRegistry = {
  // Anything not listed below falls back to a placeholder.
  for (final view in GitLabSubView.values) view: (tab) => GitLabSubViewPlaceholder(view: view, tab: tab),

  GitLabSubView.overview: (tab) => GitLabOverviewView(tab: tab, key: ValueKey('overview-${tab.projectId}')),

  GitLabSubView.mergeRequests: (tab) => GitLabMergeRequestsView(tab: tab, key: ValueKey('mrs-${tab.projectId}')),
  GitLabSubView.branches: (tab) => GitLabBranchesView(tab: tab, key: ValueKey('branches-${tab.projectId}')),
  GitLabSubView.commits: (tab) => GitLabCommitsView(tab: tab, key: ValueKey('commits-${tab.projectId}')),
  GitLabSubView.tags: (tab) => GitLabTagsView(tab: tab, key: ValueKey('tags-${tab.projectId}')),
  GitLabSubView.repoGraph: (tab) => GitLabRepoGraphView(tab: tab, key: ValueKey('graph-${tab.projectId}')),

  GitLabSubView.pipelines: (tab) => GitLabPipelinesView(tab: tab, key: ValueKey('pipelines-${tab.projectId}')),
  GitLabSubView.jobs: (tab) => GitLabJobsView(tab: tab, key: ValueKey('jobs-${tab.projectId}')),
  GitLabSubView.artifacts: (tab) => GitLabArtifactsView(tab: tab, key: ValueKey('artifacts-${tab.projectId}')),

  GitLabSubView.releases: (tab) => GitLabReleasesView(tab: tab, key: ValueKey('releases-${tab.projectId}')),
  GitLabSubView.featureFlags: (tab) => GitLabFeatureFlagsView(tab: tab, key: ValueKey('flags-${tab.projectId}')),
};

class GitLabSubViewPlaceholder extends StatelessWidget {
  const GitLabSubViewPlaceholder({super.key, required this.view, required this.tab});

  final GitLabSubView view;
  final GitLabProjectTab tab;

  @override
  Widget build(BuildContext context) => Center(
    child: Row(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('🚧', style: TextStyle(fontSize: 72)),
        Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(view.label, style: TextStyle(fontSize: 28)),
            Text(
              'Not built yet for ${tab.pathWithNamespace}.',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).hintColor),
            ),
          ],
        ),
      ],
    ),
  );
}
