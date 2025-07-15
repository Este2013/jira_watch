import 'package:flutter/material.dart';
import 'package:jira_watch/models/settings_model.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:jira_watch/models/api_model.dart';

class SettingsDialog extends StatefulWidget {
  const SettingsDialog({super.key});

  @override
  State<SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final tabs = [
    Tab(
      text: 'General',
      icon: Icon(Icons.settings),
    ),
    Tab(
      text: 'Connection',
      icon: Icon(Icons.account_circle),
    ),
    Tab(
      text: 'Projects',
      icon: Icon(Symbols.ad),
    ),
    Tab(
      text: 'Advanced',
      icon: Icon(Symbols.settings_applications),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text('Settings'),
    content: SizedBox(
      width: 600,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TabBar(controller: _tabController, tabs: tabs),
          SizedBox(
            height: 400,
            width: 450,
            child: TabBarView(
              controller: _tabController,
              children: [
                GeneralSettingsPage(),
                ConnectionSettingsPage(),
                ProjectsSettingsPage(),
                AdvancedSettingsPage(),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class GeneralSettingsPage extends StatefulWidget {
  const GeneralSettingsPage({super.key});

  @override
  State<GeneralSettingsPage> createState() => _GeneralSettingsPageState();
}

class _GeneralSettingsPageState extends State<GeneralSettingsPage> {
  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        spacing: 8,
        children: [
          Text('Theme'),
          Spacer(),
          DropdownMenu(
            dropdownMenuEntries: [
              DropdownMenuEntry(value: 'system', label: 'Same as system', leadingIcon: Icon(Icons.computer)),
              DropdownMenuEntry(value: 'light', label: 'Light theme', leadingIcon: Icon(Icons.light_mode)),
              DropdownMenuEntry(value: 'dark', label: 'Dark theme', leadingIcon: Icon(Icons.dark_mode)),
            ],
            onSelected: (value) => SettingsModel().theme.value = value!,
            initialSelection: SettingsModel().theme.value,
            // VVV disable writing VVV
            enableSearch: false,
            enableFilter: false,
            requestFocusOnTap: false,
            focusNode: FocusNode()..canRequestFocus = false,
          ),
        ],
      ),
    ],
  );
}

class ConnectionSettingsPage extends StatefulWidget {
  const ConnectionSettingsPage({super.key});

  @override
  State<ConnectionSettingsPage> createState() => _ConnectionSettingsPageState();
}

class _ConnectionSettingsPageState extends State<ConnectionSettingsPage> {
  bool editingEnabled = false;

  final TextEditingController _domainController = TextEditingController();
  final TextEditingController _apiKeyController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _apiKeyVisible = false;

  @override
  void initState() {
    super.initState();
    _domainController.text = SettingsModel().domainController.text;
    _apiKeyController.text = SettingsModel().apiKeyController.text;
    _emailController.text = SettingsModel().emailController.text;
  }

  Future<void> _saveSettings() async {
    SettingsModel().domainController.text = _domainController.text.trim();
    SettingsModel().apiKeyController.text = _apiKeyController.text.trim();
    SettingsModel().emailController.text = _emailController.text.trim();
  }

  Future<void> _openInBrowser() async {
    final url = 'https://${_domainController.text.trim()}';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 32,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _domainController,
          enabled: editingEnabled,
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
          enabled: editingEnabled,
          decoration: InputDecoration(labelText: 'User email'),
        ),
        TextField(
          controller: _apiKeyController,
          obscureText: !_apiKeyVisible,
          enabled: editingEnabled,
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
        Row(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () => setState(() {
                editingEnabled = !editingEnabled;
                _domainController.text = SettingsModel().domainController.text;
                _apiKeyController.text = SettingsModel().apiKeyController.text;
                _emailController.text = SettingsModel().emailController.text;
              }),
              child: Text(editingEnabled ? 'Cancel' : 'Edit'),
            ),
            ElevatedButton(
              onPressed: editingEnabled ? _saveSettings : null,
              child: Text('Save'),
            ),
          ],
        ),
      ],
    );
  }
}

// --- Extracted Projects Settings Page ---
class ProjectsSettingsPage extends StatefulWidget {
  const ProjectsSettingsPage({super.key});

  @override
  State<ProjectsSettingsPage> createState() => _ProjectsSettingsPageState();
}

class _ProjectsSettingsPageState extends State<ProjectsSettingsPage> {
  final _searchController = TextEditingController();
  late Future<List<dynamic>> _allProjectsFuture;

  // Normal in-memory state:
  Set<String> _selected = {};

  @override
  void initState() {
    super.initState();
    _allProjectsFuture = APIModel().fetchProjects();

    // Load prefs into _selected once:
    SharedPreferences.getInstance().then((prefs) {
      final list = prefs.getStringList('starred_projects') ?? <String>[];
      setState(() => _selected = list.toSet());
    });
  }

  Future<void> _toggle(String key) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      if (_selected.contains(key)) {
        _selected.remove(key);
      } else {
        _selected.add(key);
      }
    });
    await prefs.setStringList('starred_projects', _selected.toList());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: _allProjectsFuture,
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snap.hasError) {
          return Center(child: Text('Error: ${snap.error}'));
        }
        final all = snap.data!..sort((a, b) => (a['name'] as String).compareTo(b['name']));
        final filtered = all.where((p) {
          final txt = _searchController.text.toLowerCase();
          return p['name'].toLowerCase().contains(txt) || p['key'].toLowerCase().contains(txt);
        }).toList();

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  labelText: 'Search',
                ),
                onChanged: (_) => setState(() {}), // just rebuild the list
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (ctx, i) {
                  final p = filtered[i];
                  final key = p['key'] as String;
                  final name = p['name'] as String;

                  return SwitchListTile(
                    title: Text(key),
                    subtitle: Text(name),
                    value: _selected.contains(key),
                    onChanged: (_) => _toggle(key),
                    secondary: APIModel().avatarFromJira(p['avatarUrls']['16x16'] + '?format=png'),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

extension PartitionExtension<T> on Iterable<T> {
  /// Returns a map with keys `true` and `false`.
  Map<bool, List<T>> partition(bool Function(T) test) {
    return fold({true: <T>[], false: <T>[]}, (map, item) {
      map[test(item)]!.add(item);
      return map;
    });
  }
}

class AdvancedSettingsPage extends StatefulWidget {
  const AdvancedSettingsPage({super.key});

  @override
  State<AdvancedSettingsPage> createState() => _AdvancedSettingsPageState();
}

class _AdvancedSettingsPageState extends State<AdvancedSettingsPage> {
  @override
  Widget build(BuildContext context) => Column(
    children: [
      Row(
        spacing: 8,
        children: [
          Text('Icon cache'),
          Spacer(),
          IconButton(onPressed: () => jiraAvatarCacheManager.emptyCache(), icon: Icon(Icons.delete)),
        ],
      ),
    ],
  );
}
