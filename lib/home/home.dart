import 'package:flutter/material.dart';
import 'package:jira_watch/home/home_overview.dart';
import 'package:jira_watch/main.dart';
import 'package:jira_watch/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _currentPage = 'Overview';

  void _selectPage(String page) {
    setState(() {
      _currentPage = page;
    });
    Navigator.pop(context); // close drawer on selection
  }

  Widget _buildPageContent() {
    switch (_currentPage) {
      case 'Projects':
        return Center(child: Text('Projects Page', style: TextStyle(fontSize: 24)));
      case 'Issues':
        return Center(child: Text('Issues Page', style: TextStyle(fontSize: 24)));
      default:
        return OverviewPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home - $_currentPage'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.remove('jira_api_key');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ApiKeyInputScreen()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Text(
                'Menu',
                style: TextStyle(fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Overview'),
              onTap: () => _selectPage('Overview'),
            ),
            ListTile(
              leading: Icon(Icons.folder),
              title: Text('Projects'),
              onTap: () => _selectPage('Projects'),
            ),
            ListTile(
              leading: Icon(Icons.bug_report),
              title: Text('Issues'),
              onTap: () => _selectPage('Issues'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () => showDialog(context: context, builder: (context) => SettingsDialog()),
            ),
          ],
        ),
      ),
      body: _buildPageContent(),
    );
  }
}
