import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

class SettingsDialog extends StatefulWidget {
  const SettingsDialog({super.key});

  @override
  State<SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {
  final TextEditingController _domainController = TextEditingController();
  final TextEditingController _apiKeyController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool _apiKeyVisible = false;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    _domainController.text = prefs.getString('jira_domain') ?? '';
    _apiKeyController.text = prefs.getString('jira_api_key') ?? '';
    _emailController.text = prefs.getString('jira_email') ?? '';
  }

  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('jira_domain', _domainController.text.trim());
    await prefs.setString('jira_api_key', _apiKeyController.text.trim());
    await prefs.setString('jira_email', _emailController.text.trim());
    Navigator.pop(context);
  }

  Future<void> _openInBrowser() async {
    final url = 'https://${_domainController.text.trim()}';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text('Settings'),
    content: SizedBox(
      width: 400,
      child: Column(
        spacing: 16,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _domainController,
            decoration: InputDecoration(
              labelText: 'Jira Domain',
              suffixIcon: IconButton(
                icon: Icon(Icons.open_in_browser),
                onPressed: _openInBrowser,
              ),
            ),
          ),
          TextField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'User email'),
          ),
          TextField(
            controller: _apiKeyController,
            obscureText: !_apiKeyVisible,
            decoration: InputDecoration(
              labelText: 'API Key',
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(_apiKeyVisible ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _apiKeyVisible = !_apiKeyVisible;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.copy),
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: _apiKeyController.text));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('API Key copied to clipboard')),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: Text('Cancel'),
      ),
      ElevatedButton(
        onPressed: _saveSettings,
        child: Text('Save'),
      ),
    ],
  );
}
