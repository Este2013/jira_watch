import 'package:flutter/material.dart';
import 'package:jira_watch/home/home_overview.dart';
import 'package:jira_watch/ui/settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _currentPage = 'Overview';

  int get _selectedIndex {
    switch (_currentPage) {
      case 'Overview':
        return 0;
      case 'Issues':
        return 1;
      case 'Settings':
        return 2;
      default:
        return 0;
    }
  }

  void _onRailSelect(int index) {
    switch (index) {
      case 0:
        setState(() => _currentPage = 'Overview');
        break;
      case 1:
        setState(() => _currentPage = 'Issues');
        break;
      case 2:
        showDialog(context: context, builder: (context) => SettingsDialog());
        break;
    }
  }

  Widget _buildPageContent() {
    switch (_currentPage) {
      case 'Issues':
        return Center(child: Text('Issues Page', style: TextStyle(fontSize: 24)));
      default:
        return OverviewSynchronousPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home - $_currentPage'),
        actions: [
          // IconButton(
          //   icon: Icon(Icons.logout),
          //   onPressed: () async {
          //     final prefs = await SharedPreferences.getInstance();
          //     await prefs.remove('jira_api_key');
          //     // ignore: use_build_context_synchronously
          //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ApiKeyInputScreen()));
          //   },
          // ),
        ],
      ),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onRailSelect,
            labelType: NavigationRailLabelType.all,
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.dashboard),
                label: Text('Overview'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bug_report),
                label: Text('Issues'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                label: Text('Settings'),
              ),
            ],
          ),
          VerticalDivider(width: 1),
          Expanded(
            child: _buildPageContent(),
          ),
        ],
      ),
    );
  }
}
