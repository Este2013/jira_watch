import 'package:flutter/material.dart';
import 'package:jira_watcher/dao/gitlab_dao.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_project_view.dart';
import 'package:jira_watcher/ui/settings.dart';
import 'package:loggy/loggy.dart';
import 'package:material_symbols_icons/symbols.dart';

/// Gates the GitLab page on the DAO having loaded its stored credentials.
class GitLabPagePreLoadView extends StatelessWidget {
  const GitLabPagePreLoadView({super.key});

  @override
  Widget build(BuildContext context) => FutureBuilder(
    future: Future.wait([DataModel().gitlab.isReady, DataModel().gitlabTabs.isReady]),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
      return const GitLabPage();
    },
  );
}

class GitLabPage extends StatelessWidget {
  const GitLabPage({super.key});

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<GitLabConnectionState>(
    valueListenable: GitLabDao().connection,
    builder: (context, state, _) => switch (state) {
      GitLabConnectionState.unknown || GitLabConnectionState.connecting => const Center(child: CircularProgressIndicator()),
      GitLabConnectionState.connected => const GitLabWorkspaceView(),
      _ => GitLabConnectCallToAction(state: state),
    },
  );
}

class GitLabConnectCallToAction extends StatelessWidget with UiLoggy {
  GitLabConnectCallToAction({super.key, required this.state});

  final GitLabConnectionState state;

  String get _title => switch (state) {
    GitLabConnectionState.disconnected => 'Sign in to GitLab',
    GitLabConnectionState.error => 'GitLab connection problem',
    _ => 'Not set up yet',
  };

  String get _subtitle => switch (state) {
    GitLabConnectionState.disconnected => 'Your GitLab session has ended. Sign in again to keep browsing.',
    GitLabConnectionState.error => '${GitLabDao().lastError}',
    _ => 'Connect a GitLab account to browse projects, pipelines and releases.',
  };

  @override
  Widget build(BuildContext context) => Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 460),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        children: [
          Text('🦊', style: TextStyle(fontSize: 72)),
          Text(_title, style: const TextStyle(fontSize: 28), textAlign: TextAlign.center),
          Text(
            _subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).hintColor),
          ),
          FilledButton.icon(
            icon: const Icon(Symbols.link),
            label: const Text('Connect to GitLab'),
            onPressed: () {
              loggy.info('User opens the GitLab settings from the connect call to action');
              showDialog(
                context: context,
                builder: (context) => const SettingsDialog(initialPage: SettingsDialogPage.gitlab),
              );
            },
          ),
        ],
      ),
    ),
  );
}
