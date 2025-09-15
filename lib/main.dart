import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:jira_watcher/ui/home/home.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:jira_watcher/ui/home/overview_widgets/avatar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:jira_watcher/dao/api_dao.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: SettingsModel().theme,
    builder: (context, _) {
      return MaterialApp(
        title: 'Jira API Key Checker',
        theme: ThemeData(primarySwatch: Colors.blue),
        darkTheme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
        themeMode: ThemeMode.values.firstWhere((element) => element.name == SettingsModel().theme.value),
        // home: SplashScreen(),
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

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkCredentials();
  }

  Future<void> _checkCredentials() async {
    if (!await SettingsModel().isReady) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/settingsError');
    }
    await APIDao().load();
    if (!APIDao().isReady) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/apikey');
    } else {
      // test credentials validityc
      var response = await APIDao().request('/rest/api/3/myself');
      if (response.statusCode == 401) {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, '/apikey', arguments: 401);
        return;
      }
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

class _ApiKeyInputScreenState extends State<ApiKeyInputScreen> {
  Future<Response>? checkValidity;
  late Listenable listener;

  Future<void> _saveCredentials(BuildContext context) async {
    final settings = SettingsModel();
    final email = settings.emailController.text.trim();
    final apiKey = settings.apiKeyController.text.trim();
    String domain = settings.domainController.text.trim();

    if (email.isEmpty || apiKey.isEmpty || domain.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('All fields are required.')),
      );
      return;
    }

    if (!domain.endsWith('.atlassian.net')) {
      domain += '.atlassian.net';
    }

    await APIDao().updateCredentials(email: email, apiKey: apiKey, domain: domain);

    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/home');
  }

  void _checkValidity() {
    if (SettingsModel().domainController.text.isEmpty || SettingsModel().emailController.text.isEmpty || SettingsModel().apiKeyController.text.isEmpty) return;
    setState(() {
      checkValidity = APIDao().testJiraAuth(
        domainOrHost: '${SettingsModel().domainController.text}.atlassian.net',
        email: SettingsModel().emailController.text,
        apiToken: SettingsModel().apiKeyController.text,
      );
    });
  }

  @override
  void initState() {
    listener = Listenable.merge([SettingsModel().domainController, SettingsModel().emailController, SettingsModel().apiKeyController])..addListener(_checkValidity);
    super.initState();
  }

  @override
  void dispose() {
    listener.removeListener(_checkValidity);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 600),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Your Jira Credentials', style: Theme.of(context).textTheme.titleLarge),

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
                  TextField(
                    controller: SettingsModel().emailController,
                    decoration: InputDecoration(
                      labelText: 'Email Address (for API Auth)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextField(
                    controller: SettingsModel().apiKeyController,
                    decoration: InputDecoration(
                      labelText: 'API Key',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: SettingsModel().apiKeyController.text));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('API Key copied to clipboard')),
                          );
                        },
                        icon: Icon(Icons.copy),
                      ),
                    ),
                    obscureText: true,
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () async {
                          const url = 'https://id.atlassian.com/manage-profile/security/api-tokens';
                          if (await canLaunchUrl(Uri.parse(url))) {
                            await launchUrl(Uri.parse(url));
                          }
                        },
                        child: Text('Where do I get my Jira API Key?'),
                      ),
                      Spacer(),
                      FutureBuilder(
                        future: checkValidity,
                        builder: (context, snapshot) {
                          if (snapshot.hasData && snapshot.data!.statusCode == 200) {
                            return ElevatedButton(
                              onPressed: () {
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
        ),
        if (checkValidity != null)
          SizedBox.square(
            dimension: 300,
            child: FutureBuilder<Response>(
              future: checkValidity,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var res = snapshot.data!;
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Builder(
                        builder: (context) {
                          if (res.statusCode == 200) {
                            var data = jsonDecode(res.body);
                            return Column(
                              children: [
                                // Text(data.keys.toString()),
                                Row(
                                  spacing: 16,
                                  children: [
                                    JiraAvatar(url: data['avatarUrls']['48x48']),
                                    Text(data['displayName'], style: Theme.of(context).textTheme.titleLarge),
                                  ],
                                ),
                              ],
                            );
                          }
                          if (res.statusCode == 401) {
                            return Text('⚠️ Your credentials might be incorrect!\n\nError ${res.statusCode}:\n${res.body}', style: TextStyle(color: Colors.amber));
                          }
                          return Text('Error ${res.statusCode}:\n${res.body}');
                        },
                      ),
                    ),
                  );
                }
                return CircularProgressIndicator();
              },
            ),
          ),
      ],
    ),
  );
}
