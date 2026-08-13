import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jira_watcher/dao/gitlab_dao.dart';
import 'package:jira_watcher/dao/gitlab_oauth_server.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_images.dart';
import 'package:jira_watcher/ui/utils/expandable_panel.dart';
import 'package:jira_watcher/ui/utils/widgets/app_snackbar.dart';
import 'package:jira_watcher/ui/utils/widgets/dialog_widgets.dart/action_buttons.dart';
import 'package:loggy/loggy.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:url_launcher/url_launcher.dart';

class GitLabSettingsPage extends StatefulWidget {
  const GitLabSettingsPage({super.key});

  @override
  State<GitLabSettingsPage> createState() => _GitLabSettingsPageState();
}

class _GitLabSettingsPageState extends State<GitLabSettingsPage> with UiLoggy {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _portController;

  @override
  void initState() {
    super.initState();
    _portController = TextEditingController(text: '${GitLabDao().oauthPort}');
  }

  @override
  void dispose() {
    _portController.dispose();
    super.dispose();
  }

  int get _port => int.tryParse(_portController.text) ?? kGitLabDefaultOAuthPort;

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<GitLabConnectionState>(
    valueListenable: GitLabDao().connection,
    builder: (context, state, _) => Center(
      child: ScrollbarTheme(
        data: ScrollbarThemeData(thumbVisibility: WidgetStatePropertyAll(true)),
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(right: 16),
          children: switch (state) {
            GitLabConnectionState.unknown => [Center(child: CircularProgressIndicator())],
            GitLabConnectionState.connecting => _connectingChildren(),
            GitLabConnectionState.connected => _connectedChildren(),
            GitLabConnectionState.error => [_errorCard(), ..._setupChildren()],
            _ => _setupChildren(),
          },
        ),
      ),
    ),
  );

  // SETUP /////////////////////////////////////////////////////////////////////

  List<Widget> _setupChildren() => [
    _sectionHeader('Connect to GitLab'),
    Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          spacing: 16,
          children: [
            SizedBox(height: 8),
            TextFormField(
              controller: SettingsModel().gitlabHostController,
              decoration: InputDecoration(
                labelText: 'GitLab host',
                hintText: 'gitlab.com',
                prefix: Text('https://'),
                border: OutlineInputBorder(),
              ),
              autovalidateMode: AutovalidateMode.onUnfocus,
              validator: (value) {
                final v = (value ?? '').trim();
                if (v.isEmpty) return 'A host is required (for example gitlab.com)';
                if (v.contains('://') || v.contains('/')) return 'Enter the host only, without https:// or a path';
                if (!RegExp(r'^[A-Za-z0-9.-]+(:\d+)?$').hasMatch(v)) return 'That does not look like a hostname';
                return null;
              },
              onChanged: (_) => setState(() {}),
            ),
            TextFormField(
              controller: SettingsModel().gitlabAppIdController,
              style: TextStyle(fontFamily: 'RobotoMono'),
              decoration: InputDecoration(
                labelText: 'Application ID',
                border: OutlineInputBorder(),
                helperText: 'From your GitLab application. Not a secret.',
              ),
              autovalidateMode: AutovalidateMode.onUnfocus,
              validator: (value) => (value ?? '').trim().isEmpty ? 'An Application ID is required' : null,
              onChanged: (_) => setState(() {}),
            ),
          ],
        ),
      ),
    ),

    _sectionHeader('Redirect URI'),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Paste this into your GitLab application exactly as shown. A single character of difference makes sign-in fail.',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).hintColor),
          ),
          Row(
            spacing: 8,
            children: [
              Expanded(
                child: SelectableText(
                  gitlabRedirectUri(_port),
                  style: TextStyle(fontFamily: 'RobotoMono'),
                ),
              ),
              IconButton(
                visualDensity: VisualDensity.compact,
                tooltip: 'Copy redirect URI',
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: gitlabRedirectUri(_port)));
                  showAppSnackBar(context, SnackBar(content: Text('Redirect URI copied')));
                },
                icon: Icon(Symbols.content_copy),
              ),
              SizedBox(
                width: 110,
                child: TextField(
                  controller: _portController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Port', isDense: true),
                  onChanged: (_) => setState(() {}),
                ),
              ),
            ],
          ),
        ],
      ),
    ),

    _sectionHeader('Scopes'),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (final scope in kGitLabOAuthScopes.split(' '))
            Chip(
              label: Text(scope, style: TextStyle(fontFamily: 'RobotoMono')),
              visualDensity: VisualDensity.compact,
            ),
        ],
      ),
    ),

    SizedBox(height: 8),
    ExpandablePanel(
      'How to set this up',
      isInitiallyExpanded: false,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          for (final (i, step) in const [
            'Open GitLab, then User settings > Applications, and add a new application.',
            'Paste the redirect URI shown above into the Redirect URI field.',
            'Leave "Confidential" UNCHECKED — this app cannot keep a secret.',
            'Tick the api and read_repository scopes.',
            'Save the application, then copy its Application ID.',
            'Paste the Application ID above and press Connect.',
          ].indexed)
            Text('${i + 1}. $step'),
        ],
      ),
    ),

    SizedBox(height: 8),
    Row(
      children: [
        TextButton.icon(
          icon: Icon(Symbols.help, fill: 1),
          onPressed: _openApplicationsPage,
          label: Text('Where do I get an Application ID?'),
        ),
        Spacer(),
        FilledButton.icon(
          icon: Icon(Symbols.link),
          onPressed: _canConnect ? _connect : null,
          label: Text('Connect'),
        ),
      ],
    ),
  ];

  bool get _canConnect => SettingsModel().gitlabHostController.text.trim().isNotEmpty && SettingsModel().gitlabAppIdController.text.trim().isNotEmpty;

  Future<void> _openApplicationsPage() async {
    final host = SettingsModel().gitlabHostController.text.trim();
    if (host.isEmpty) return;
    final url = Uri.https(host, '/-/user_settings/applications');
    if (await canLaunchUrl(url)) await launchUrl(url);
  }

  Future<void> _connect() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    loggy.info('User starts the GitLab OAuth flow');
    await GitLabDao().saveConnectionSettings(
      host: SettingsModel().gitlabHostController.text,
      applicationId: SettingsModel().gitlabAppIdController.text,
      oauthPort: _port,
    );
    try {
      await GitLabDao().connect();
    } on GitLabOAuthCancelledException {
      // Expected when the user backs out; the state notifier already reset.
    } on Object catch (e) {
      loggy.warning('GitLab connection attempt failed: $e');
    }
  }

  // CONNECTING ////////////////////////////////////////////////////////////////

  List<Widget> _connectingChildren() => [
    SizedBox(height: 24),
    LinearProgressIndicator(),
    SizedBox(height: 16),
    Text('Waiting for authorization in your browser…', textAlign: TextAlign.center),
    SizedBox(height: 8),
    Text(
      'Approve the request on ${GitLabDao().host}, then return here.',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).hintColor),
    ),
    SizedBox(height: 16),
    Center(
      child: TextButton(
        onPressed: GitLabDao().cancelConnect,
        child: Text('Cancel'),
      ),
    ),
  ];

  // CONNECTED /////////////////////////////////////////////////////////////////

  List<Widget> _connectedChildren() {
    final dao = GitLabDao();
    final user = dao.cachedUser;
    final tokens = dao.tokens;

    return [
      Card(
        child: ListTile(
          leading: GitLabAvatar(
            url: user?['avatar_url'] as String?,
            size: 48,
            fallbackLabel: user?['name'] as String?,
          ),
          title: Text(user?['name'] as String? ?? 'Connected'),
          subtitle: SelectableText('@${user?['username'] ?? '?'} · ${dao.host}'),
          trailing: IconButton(
            tooltip: 'Copy username',
            onPressed: () => Clipboard.setData(ClipboardData(text: '${user?['username']}')),
            icon: Icon(Symbols.content_copy),
          ),
        ),
      ),
      ListTile(
        title: Text('GitLab host'),
        trailing: SelectableText(dao.host, style: Theme.of(context).textTheme.bodyMedium),
      ),
      ListTile(
        title: Text('Granted scopes'),
        trailing: Wrap(
          spacing: 4,
          children: [
            for (final scope in tokens?.scopes ?? <String>{})
              Chip(
                label: Text(scope, style: TextStyle(fontSize: 11, fontFamily: 'RobotoMono')),
                visualDensity: VisualDensity.compact,
              ),
          ],
        ),
      ),
      ListTile(
        title: Text('Access token'),
        subtitle: Text(_expiryLabel(tokens)),
        trailing: IconButton(
          tooltip: 'Refresh now',
          onPressed: _refreshNow,
          icon: Icon(Symbols.refresh),
        ),
      ),
      ListTile(
        title: Text('Manage applications'),
        trailing: IconButton(
          tooltip: 'Open GitLab applications',
          onPressed: _openApplicationsPage,
          icon: Icon(Symbols.open_in_browser),
        ),
      ),
      SizedBox(height: 12),
      Center(
        child: OutlinedButton.icon(
          style: OutlinedButton.styleFrom(foregroundColor: Theme.of(context).colorScheme.error),
          icon: Icon(Symbols.link_off),
          label: Text('Disconnect'),
          onPressed: _disconnect,
        ),
      ),
    ];
  }

  static String _expiryLabel(GitLabTokenSet? tokens) {
    if (tokens == null) return 'No token';
    final remaining = tokens.expiresAt.difference(DateTime.now().toUtc());
    if (remaining.isNegative) return 'Expired — will renew on the next request';
    if (remaining.inMinutes < 60) return 'Expires in ${remaining.inMinutes} min';
    return 'Expires in ${remaining.inHours}h ${remaining.inMinutes % 60}min';
  }

  Future<void> _refreshNow() async {
    try {
      await GitLabDao().refreshNow();
      if (!mounted) return;
      setState(() {});
      showAppSnackBar(context, SnackBar(content: Text('Access token renewed')));
    } on Object catch (e) {
      loggy.warning('Manual GitLab token refresh failed: $e');
      if (!mounted) return;
      showAppSnackBar(context, SnackBar(content: Text('Could not renew the token: $e')));
    }
  }

  Future<void> _disconnect() async {
    final confirmed = await requestConfirmation(
      context,
      'This will revoke this app\'s access to your GitLab account. Your open project tabs are kept.',
    );
    if (!(confirmed ?? false)) return;
    await GitLabDao().disconnect();
    GitLabAvatar.clearMemoryCache();
  }

  // SHARED ////////////////////////////////////////////////////////////////////

  Widget _errorCard() => Card(
    child: ListTile(
      leading: Icon(Symbols.error, fill: 1, color: Theme.of(context).colorScheme.error),
      title: Text('Could not connect to GitLab'),
      subtitle: Text('${GitLabDao().lastError}'),
    ),
  );

  Widget _sectionHeader(String title) => Padding(
    padding: const EdgeInsets.only(top: 24.0),
    child: Row(
      spacing: 8,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        Expanded(child: Divider()),
      ],
    ),
  );
}
