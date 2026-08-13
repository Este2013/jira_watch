import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:jira_watcher/dao/windows_self_update_dao.dart';
import 'package:jira_watcher/ui/home.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:jira_watcher/ui/settings.dart';
import 'package:jira_watcher/ui/utils/jira_ui_utils/jira_images.dart';
import 'package:jira_watcher/ui/utils/widgets/app_snackbar.dart';
import 'package:jira_watcher/ui/utils/widgets/github_button.dart';
import 'package:jira_watcher/utils/%F0%9F%AA%B5.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:media_kit/media_kit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:jira_watcher/dao/jira/jira_api.dart';
import 'package:jira_watcher/dao/jira/jira_auth.dart';
import 'package:loggy/loggy.dart';
import 'package:window_manager/window_manager.dart';

/// What the last update attempt left behind, read once at startup so the home
/// screen can report a failure the user would otherwise never hear about.
UpdateAftermath updateAftermath = const UpdateAftermath();

void main(List<String> args) async {
  // Answered before anything else is initialised, so this costs a process start
  // and nothing more. The updater runs a freshly extracted build this way to
  // prove it can actually start — catching a corrupt extraction, a missing VC++
  // runtime or an antivirus quarantine while the installed app is still
  // untouched. Returning here also means no window is ever shown, since the
  // Windows runner creates the window hidden and only Dart reveals it.
  if (args.contains('--self-test')) {
    stdout.writeln(WindowsSelfUpdateDao.selfTestMarker);
    exit(0);
  }

  Loggy.initLoggy(
    logPrinter: FileLogPrinter(),
  );
  logInfo('Starting Jira Watcher app');
  if (Platform.isWindows) {
    MediaKit.ensureInitialized();
  }
  Future.wait([
    SettingsModel().appInfo.version,
    SettingsModel().appInfo.buildNumber,
  ]).then(
    (value) => logInfo('App version: ${value[0]} (${value[1]})${kDebugMode ? ", in debug mode" : ""}'),
  );

  WidgetsFlutterBinding.ensureInitialized();

  // Confirms a completed update and tidies up after it. Runs before the window
  // appears because the helper is watching for the confirmation marker against a
  // timeout, and it never throws — a bookkeeping problem must not stop startup.
  updateAftermath = await WindowsSelfUpdateDao().finishPendingWork(args);

  await windowManager.ensureInitialized();
  windowManager.waitUntilReadyToShow(
    WindowOptions(minimumSize: Size(900, 600)),
    () async {
      await windowManager.show();
      await windowManager.focus();
    },
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget with UiLoggy {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    loggy.info('Building main MaterialApp');
    return AnimatedBuilder(
      animation: SettingsModel().theme,
      builder: (context, _) {
        loggy.debug('Rebuilding MaterialApp with theme changed to: ${SettingsModel().theme.value}');
        return MaterialApp(
          title: 'Jira Watcher',
          theme: ThemeData(primarySwatch: Colors.blue),
          darkTheme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
          themeMode: ThemeMode.values.firstWhere(
            (element) => element.name == SettingsModel().theme.value,
            orElse: () => ThemeMode.system,
          ),
          routes: {
            '/settingsError': (context) => ErrorWidget('An error occured while loading the app settings'),
            '/apikey': (context) => ApiKeyInputScreen(code: ModalRoute.of(context)!.settings.arguments as int?),
            '/home': (context) => HomeScreen(),
            '/': (context) => SplashScreen(),
          },
        );
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with UiLoggy {
  @override
  void initState() {
    super.initState();
    _checkCredentials();
  }

  Future<void> _checkCredentials() async {
    if (!await SettingsModel().isReady) {
      loggy.info('checking credentials...');
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/settingsError');
    }
    await JiraAuth().load();
    if (!JiraAuth().isReady) {
      loggy.warning('No Jira credentials stored, navigating to /apikey');
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/apikey');
    } else {
      // The raw response, not the typed call: this needs the status code, since a
      // 401 means the stored token expired and only that should send the user back
      // to the sign-in screen.
      loggy.debug('Testing credentials via /rest/api/3/myself');
      var response = await JiraApi().myselfRaw();
      loggy.debug('Response status: ${response.statusCode}');
      if (response.statusCode == 401) {
        loggy.error('Invalid credentials (401), navigating to /apikey');
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, '/apikey', arguments: 401);
        return;
      }
      loggy.info('Credentials are valid, navigating to /home');
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(body: Center(child: CircularProgressIndicator()));
}

class ApiKeyInputScreen extends StatefulWidget {
  const ApiKeyInputScreen({super.key, this.code});
  final int? code;

  @override
  State<ApiKeyInputScreen> createState() => _ApiKeyInputScreenState();
}

class _ApiKeyInputScreenState extends State<ApiKeyInputScreen> with UiLoggy {
  Future<Response>? checkValidity;
  late Listenable listener;

  Future<void> _saveCredentials(BuildContext context) async {
    loggy.info('Saving credentials...');
    loggy.info('Verifying before saving credentials...');
    final settings = SettingsModel();
    final email = settings.emailController.text.trim();
    final apiKey = settings.apiKeyController.text.trim();
    String domain = settings.domainController.text.trim();

    if (email.isEmpty || apiKey.isEmpty || domain.isEmpty) {
      loggy.warning('Some credentials are empty. Refusing to proceed.');
      showAppSnackBar(context, SnackBar(content: Text('All fields are required.')));
      return;
    }

    loggy.info('All credentials are present');
    if (!domain.endsWith('.atlassian.net')) {
      domain += '.atlassian.net';
    }
    bool success = true;
    await JiraAuth().update(email: email, apiToken: apiKey, domain: domain).onError(
      // ignore: use_build_context_synchronously
      (error, stackTrace) {
        success = false;
        loggy.error('An error occured while updating credentials in API DAO:\n$error\n$stackTrace');
        showAppSnackBar(
          context,
          SnackBar(
            backgroundColor: Theme.of(context).colorScheme.errorContainer,
            content: Text(
              'An error occured while saving your credentials',
              style: TextStyle(color: Theme.of(context).colorScheme.onErrorContainer),
            ),
            action: SnackBarAction(
              textColor: Theme.of(context).colorScheme.onErrorContainer,
              label: 'Inspect',
              onPressed: () => AlertDialog(
                backgroundColor: Theme.of(context).colorScheme.errorContainer,
                title: Text('Error occured while saving your credentials'),
                content: SelectableText.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: error.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: '\n'),
                      TextSpan(text: stackTrace.toString()),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
    if (!success) return;
    loggy.info('Login was ${success ? '' : 'NOT '}successful. Proceeding to /home.');
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/home');
  }

  void _checkValidity() {
    if (anyControllerIsEmpty()) {
      setState(() {
        checkValidity = null;
      });
      return;
    }
    setState(() {
      checkValidity = _testJiraAuth();
    });
  }

  bool anyControllerIsEmpty() => SettingsModel().domainController.text.isEmpty || SettingsModel().emailController.text.isEmpty || SettingsModel().apiKeyController.text.isEmpty;

  /// Checks what has been typed, before any of it is saved, so the site is
  /// normalised here rather than assumed to already end in .atlassian.net.
  Future<Response> _testJiraAuth() => JiraAuth.test(
    domainOrHost: SettingsModel().domainController.text,
    email: SettingsModel().emailController.text,
    apiToken: SettingsModel().apiKeyController.text,
  );

  @override
  void initState() {
    listener = Listenable.merge([SettingsModel().domainController, SettingsModel().emailController, SettingsModel().apiKeyController])..addListener(_checkValidity);
    if (SettingsModel().domainController.text.isEmpty || SettingsModel().emailController.text.isEmpty || SettingsModel().apiKeyController.text.isEmpty) return;
    checkValidity = _testJiraAuth();
    super.initState();
  }

  @override
  void dispose() {
    listener.removeListener(_checkValidity);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 24),
        Expanded(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 600),
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text('Your Jira Credentials', style: Theme.of(context).textTheme.titleLarge),
                    Spacer(),
                    if (checkValidity != null)
                      FutureBuilder<Response>(
                        future: checkValidity,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            var res = snapshot.data!;
                            if (res.statusCode == 200) {
                              var data = jsonDecode(res.body);
                              return Row(
                                spacing: 8,
                                children: [
                                  JiraAvatar(url: data['avatarUrls']['48x48']),
                                  Text(data['displayName'], style: Theme.of(context).textTheme.titleLarge),
                                ],
                              );
                            }
                            if (res.statusCode == 404) {
                              return Tooltip(
                                message: "Your Jira domain is likely incorrect.\nError ${res.statusCode}: ${res.body}",
                                child: Text('😕', style: Theme.of(context).textTheme.titleLarge),
                              );
                            }
                            if (res.statusCode == 401) {
                              return Tooltip(
                                message: "Your credentials might be incorrect.\nError ${res.statusCode}: ${res.body}",
                                child: Text('🤔', style: Theme.of(context).textTheme.titleLarge),
                              );
                            }
                            return Tooltip(
                              message: "Error ${res.statusCode}: ${res.body}",
                              child: Text('😵', style: Theme.of(context).textTheme.titleLarge),
                            );
                          }
                          return CircularProgressIndicator();
                        },
                      )
                    else
                      Tooltip(
                        message: "I'm not peeking",
                        child: Text('👀', style: Theme.of(context).textTheme.titleLarge),
                      ),
                  ],
                ),

                if (widget.code == 401)
                  Card(
                    color: Theme.of(context).colorScheme.errorContainer,
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text.rich(
                        TextSpan(
                          style: TextStyle(color: Theme.of(context).colorScheme.onErrorContainer),
                          children: [
                            TextSpan(
                              text: 'Error 401: Unauthorized\n',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: 'Your credentials might have expired. Renew your API key if necessary.'),
                          ],
                        ),
                      ),
                    ),
                  ),

                SizedBox(height: 8),
                TextFormField(
                  controller: SettingsModel().domainController,
                  decoration: InputDecoration(
                    labelText: 'Jira Domain (e.g. your-site.atlassian.net)',
                    border: OutlineInputBorder(),
                    suffix: Text('.atlassian.net'),
                  ),
                  validator: (value) {
                    return (value != null && value.isNotEmpty && RegExp(r'^[a-zA-Z]+$').hasMatch(value)) ? null : 'domain must be one word, with only alphabetical characters (eg. "mycompany")';
                  },
                  autovalidateMode: AutovalidateMode.onUnfocus,
                ),
                TextFormField(
                  controller: SettingsModel().emailController,
                  decoration: InputDecoration(
                    labelText: 'Email Address (for API Auth)',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => (value != null && value.isNotEmpty) ? null : 'email adress must be provided',
                  autovalidateMode: AutovalidateMode.onUnfocus,
                ),
                TextFormField(
                  controller: SettingsModel().apiKeyController,
                  decoration: InputDecoration(
                    labelText: 'API Key',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: SettingsModel().apiKeyController.text));
                        showAppSnackBar(context, SnackBar(content: Text('API Key copied to clipboard')));
                      },
                      icon: Icon(Symbols.content_copy),
                    ),
                  ),
                  obscureText: true,
                  validator: (value) => (value != null && value.isNotEmpty) ? null : 'API key must be provided',
                  autovalidateMode: AutovalidateMode.onUnfocus,
                ),
                Row(
                  children: [
                    TextButton.icon(
                      icon: Icon(Symbols.help, fill: 1),
                      onPressed: () async {
                        const url = 'https://id.atlassian.com/manage-profile/security/api-tokens';
                        if (await canLaunchUrl(Uri.parse(url))) {
                          await launchUrl(Uri.parse(url));
                        }
                      },
                      label: Text('Where do I get my Jira API Key?'),
                    ),
                    Spacer(),
                    FutureBuilder(
                      future: checkValidity,
                      builder: (context, snapshot) {
                        if (snapshot.hasData && snapshot.data!.statusCode == 200) {
                          return ElevatedButton(
                            onPressed: () {
                              loggy.info('User clicked on Save and Continue');
                              _saveCredentials(context);
                            },
                            child: Text('Save and continue'),
                          );
                        }
                        return ElevatedButton(
                          onPressed: null,
                          child: Text('Save and continue'),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 8, top: 8, bottom: 8),
          child: Row(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: SettingsModel().appInfo.version,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return SizedBox.square(
                        dimension: 16,
                        child: CircularProgressIndicator(),
                      );
                    }
                    return SelectableText('Version ${snapshot.data!}', style: TextStyle(color: Theme.of(context).hintColor));
                  },
                ),
              ),
              Expanded(child: Center(child: OpenInGitHubButton())),
              Expanded(
                child: Align(
                  alignment: .centerEnd,
                  child: SettingsButton(
                    childDialogBuilder: (context) {
                      loggy.info('User opens the settings dialog from navigation rail');
                      return SettingsDialog(allowConnectionBasedSettings: false);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
