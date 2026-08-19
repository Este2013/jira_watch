import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jira_watcher/dao/gitlab_dao.dart';
import 'package:jira_watcher/dao/gitlab_oauth_server.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_images.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_logo.dart';
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
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
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
          controller: scrollController,
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
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: IconButton(
                    icon: Icon(Symbols.open_in_new, fill: 1),
                    onPressed: _openApplicationsPage,
                    tooltip: 'Get my Application ID',
                    visualDensity: .compact,
                  ),
                ),
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
            'Paste this into your GitLab application exactly as shown:',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).hintColor),
          ),
          Row(
            spacing: 8,
            children: [
              Expanded(
                child: Text(
                  gitlabRedirectUri(_port),
                  style: TextStyle(fontFamily: 'RobotoMono'),
                  overflow: .ellipsis,
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
              SizedBox(),
              SizedBox(
                width: 90,
                child: TextField(
                  controller: _portController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(prefix: Text('Port: ')),
                  onChanged: (_) => setState(() {}),
                ),
              ),
            ],
          ),
        ],
      ),
    ),

    SizedBox(height: 8),
    ExpandablePanel(
      'Full guide',

      isInitiallyExpanded: false,
      suffix: FilledButton.icon(
        icon: Icon(Symbols.link),
        onPressed: _canConnect ? _connect : null,
        label: Text('Connect'),
      ),
      onExpand: () => Future.delayed(Duration(milliseconds: 300)).then(
        (_) => scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        ),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          for (final (i, step) in const [
            'In GitLab > User settings > Applications, add a new application;',
            'Copy and paste the above redirect URI on the website;',
            'Leave "Confidential" UNCHECKED;',
            'Tick the scopes:\n - "api"\n - "read_repository"\n - "read_user"',
            'Save the application, then copy its Application ID.',
            'Paste the Application ID above and press Connect.',
          ].indexed)
            Text('${i + 1}. $step'),
        ],
      ),
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
    GitLabTanukiLogo(),
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
        title: Text('Required scopes'),
        trailing: Container(
          alignment: .centerRight,
          width: 250,
          child: _ScopesRow(scopes: (tokens?.scopes ?? <String>{}).toList()..sort()),
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

/// Shows every scope this app actually requests on one line rather than
/// wrapping, since a row that spills onto a second line reads as a layout bug
/// rather than "there are just a lot of scopes". Whatever does not fit
/// collapses into a single "+N" chip whose tooltip lists the rest.
///
/// This can only ever list what [kGitLabOAuthScopes] asked for and GitLab
/// granted back — not the full set of scopes ticked on the Application page
/// in the browser, which is just the catalog that page's owner is allowed to
/// request from, not what any particular token actually carries. There is no
/// way for this app to read that catalog without an instance-admin token, so
/// the label says "Required" rather than "Granted" to avoid promising a
/// mirror of the browser page this can't deliver.
class _ScopesRow extends StatelessWidget {
  const _ScopesRow({required this.scopes});

  final List<String> scopes;

  static const _chipStyle = TextStyle(fontSize: 11, fontFamily: 'RobotoMono');
  static const _spacing = 4.0;

  // A Chip's own padding/border around its label — generous on purpose, so a
  // few pixels of measurement error still leaves room to spare instead of
  // nudging the last chip past the edge.
  static const _chipOverhead = 32.0;

  double _chipWidth(String label) =>
      (TextPainter(
        text: TextSpan(text: label, style: _chipStyle),
        textDirection: TextDirection.ltr,
      )..layout()).width +
      _chipOverhead;

  @override
  Widget build(BuildContext context) {
    if (scopes.isEmpty) return const SizedBox.shrink();

    return LayoutBuilder(
      builder: (context, constraints) {
        if (!constraints.maxWidth.isFinite) return _row(scopes, hiddenCount: 0);

        final overflowWidth = _chipWidth('+${scopes.length}');
        var used = 0.0;
        var visibleCount = scopes.length;

        for (var i = 0; i < scopes.length; i++) {
          final width = _chipWidth(scopes[i]) + (i == 0 ? 0 : _spacing);
          final remaining = scopes.length - i - 1;
          final roomForOverflow = remaining > 0 ? overflowWidth + _spacing : 0.0;
          if (i > 0 && used + width + roomForOverflow > constraints.maxWidth) {
            visibleCount = i;
            break;
          }
          used += width;
        }

        return _row(scopes.take(visibleCount).toList(), hiddenCount: scopes.length - visibleCount);
      },
    );
  }

  // A Row, not a Wrap: visibleCount is already chosen to fit, so nothing here
  // should need to wrap — guaranteeing it outright reads better than a second
  // line appearing whenever the fit estimate above is a little off.
  Widget _row(List<String> visible, {required int hiddenCount}) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      for (final scope in visible) ...[
        if (scope != visible.first) const SizedBox(width: _spacing),
        Chip(
          label: Text(scope, style: _chipStyle),
          visualDensity: VisualDensity.compact,
        ),
      ],
      if (hiddenCount > 0) ...[
        if (visible.isNotEmpty) const SizedBox(width: _spacing),
        Tooltip(
          message: scopes.skip(visible.length).join('\n'),
          child: Chip(
            label: Text('+$hiddenCount', style: _chipStyle),
            visualDensity: VisualDensity.compact,
          ),
        ),
      ],
    ],
  );
}
