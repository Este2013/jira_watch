import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:jira_watch/api_model.dart';

class SettingsDialog extends StatefulWidget {
  const SettingsDialog({super.key});

  @override
  State<SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> with SingleTickerProviderStateMixin {
  final TextEditingController _domainController = TextEditingController();
  final TextEditingController _apiKeyController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  String _search = '';

  bool _apiKeyVisible = false;
  late TabController _tabController;

  // For projects tab
  List<dynamic> allProjects = [];
  Set<String> starredProjects = {};
  bool isLoadingProjects = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _searchController.addListener(() {
      setState(() {
        _search = _searchController.text.trim().toLowerCase();
      });
    });
    _loadSettings();
    _loadProjectsPrefsAndFetch();
  }

  Future<void> _loadSettings() async {
    await APIModel().load();
    _domainController.text = APIModel().domain ?? '';
    _apiKeyController.text = APIModel().apiKey ?? '';
    _emailController.text = APIModel().email ?? '';
  }

  Future<void> _saveSettings() async {
    await APIModel().update(
      domain: _domainController.text.trim(),
      apiKey: _apiKeyController.text.trim(),
      email: _emailController.text.trim(),
    );
    Navigator.pop(context);
  }

  Future<void> _openInBrowser() async {
    final url = 'https://${_domainController.text.trim()}';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  // --- Projects tab logic ---
  Future<void> _loadProjectsPrefsAndFetch() async {
    await APIModel().load();
    if (APIModel().apiKey != null && APIModel().email != null && APIModel().domain != null) {
      await _fetchStarredProjects();
      await _fetchProjects();
    }
  }

  Future<void> _fetchStarredProjects() async {
    starredProjects = await APIModel().fetchAndStoreStarredProjects();
    setState(() {});
  }

  Future<void> _fetchProjects() async {
    setState(() => isLoadingProjects = true);
    try {
      final data = await APIModel().getJson('/rest/api/3/project/search');
      setState(() {
        allProjects = data['values'] ?? [];
        isLoadingProjects = false;
      });
    } catch (_) {
      setState(() => isLoadingProjects = false);
    }
  }

  Future<void> _toggleStar(String key) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      if (starredProjects.contains(key)) {
        starredProjects.remove(key);
      } else {
        starredProjects.add(key);
      }
    });
    await prefs.setStringList('starred_projects', starredProjects.toList());
  }

  Future<void> _addCustomProject(String key) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      starredProjects.add(key);
    });
    await prefs.setStringList('starred_projects', starredProjects.toList());
  }

  Widget _buildProjectsTab() {
    if (isLoadingProjects) {
      return Center(child: CircularProgressIndicator());
    }
    final starred = allProjects.where((p) => starredProjects.contains(p['key'])).toList();
    final unstarred = allProjects.where((p) => !starredProjects.contains(p['key'])).toList();
    final filteredUnstarred = _search.isEmpty ? unstarred : unstarred.where((p) => (p['name']?.toString().toLowerCase().contains(_search) ?? false) || (p['key']?.toString().toLowerCase().contains(_search) ?? false)).toList();

    return ListView(
      shrinkWrap: true,
      children: [
        Text('Starred Projects', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ...starred.map(
          (p) => SwitchListTile(
            title: Text('${p['name']} (${p['key']})'),
            value: starredProjects.contains(p['key']),
            onChanged: (_) => _toggleStar(p['key']),
          ),
        ),
        if (starred.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text('No starred projects.', style: TextStyle(color: Colors.grey)),
          ),
        Divider(),
        Row(
          children: [
            Expanded(
              child: Text('Other Projects', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              width: 200,
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                ),
              ),
            ),
          ],
        ),
        ...filteredUnstarred.map(
          (p) => SwitchListTile(
            title: Text('${p['name']} (${p['key']})'),
            value: starredProjects.contains(p['key']),
            onChanged: (_) => _toggleStar(p['key']),
          ),
        ),
        Divider(),
        Text('Add Project by Key', style: TextStyle(fontWeight: FontWeight.bold)),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _addController,
                decoration: InputDecoration(
                  hintText: 'e.g. DEMO',
                ),
              ),
            ),
            SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                final key = _addController.text.trim().toUpperCase();
                if (key.isNotEmpty) _addCustomProject(key);
              },
              child: Text('Add'),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text('Settings'),
    content: SizedBox(
      width: 400,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'Connection'),
              Tab(text: 'Projects'),
            ],
          ),
          SizedBox(
            height: 400,
            child: TabBarView(
              controller: _tabController,
              children: [
                // General tab
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 32,
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
                // Projects tab
                _buildProjectsTab(),
              ],
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
