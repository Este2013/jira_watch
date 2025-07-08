import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jira_watch/home/home.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:jira_watch/api_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Jira API Key Checker',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    // home: SplashScreen(),
    routes: {
      '/apikey': (context) => ApiKeyInputScreen(),
      '/home': (context) => HomeScreen(),
      '/': (context) => SplashScreen(),
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
    await APIModel().load();
    if (!APIModel().isReady) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/apikey');
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(body: Center(child: CircularProgressIndicator()));
}

class ApiKeyInputScreen extends StatefulWidget {
  const ApiKeyInputScreen({super.key});

  @override
  State<ApiKeyInputScreen> createState() => _ApiKeyInputScreenState();
}

class _ApiKeyInputScreenState extends State<ApiKeyInputScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _apiKeyController = TextEditingController();
  final TextEditingController _domainController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadExistingValues();
  }

  Future<void> _loadExistingValues() async {
    await APIModel().load();
    _emailController.text = APIModel().email ?? '';
    _apiKeyController.text = APIModel().apiKey ?? '';
    _domainController.text = APIModel().domain ?? '';
  }

  Future<void> _saveCredentials() async {
    final email = _emailController.text.trim();
    final apiKey = _apiKeyController.text.trim();
    String domain = _domainController.text.trim();

    if (email.isEmpty || apiKey.isEmpty || domain.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('All fields are required.')),
      );
      return;
    }

    if (!domain.endsWith('.atlassian.net')) {
      domain += '.atlassian.net';
    }

    await APIModel().update(email: email, apiKey: apiKey, domain: domain);

    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 600),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Your Jira Credentials', style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 16),
              TextField(
                controller: _domainController,
                decoration: InputDecoration(
                  labelText: 'Jira Domain (e.g. your-site.atlassian.net)',
                  border: OutlineInputBorder(),
                  suffix: Text('.atlassian.net'),
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email Address (for API Auth)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 8),
              TextField(
                controller: _apiKeyController,
                decoration: InputDecoration(
                  labelText: 'API Key',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: _apiKeyController.text));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('API Key copied to clipboard')),
                      );
                    },
                    icon: Icon(Icons.copy),
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 16),
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
                  ElevatedButton(
                    onPressed: _saveCredentials,
                    child: Text('Save and continue'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
