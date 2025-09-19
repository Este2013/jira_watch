import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/ui/home/home.dart';
import 'package:jira_watcher/ui/home/overview_widgets/avatar.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

enum SettingsDialogPage { general, connection, projects, advanced }

class SettingsDialog extends StatefulWidget {
  const SettingsDialog({super.key, this.initialPage = SettingsDialogPage.general});

  final SettingsDialogPage initialPage;

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
    _tabController = TabController(
      length: tabs.length,
      initialIndex: SettingsDialogPage.values.indexed.firstWhere((t) => t.$2 == widget.initialPage).$1,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text('Settings'),
    actions: [
      TextButton(
        onPressed: () => showAboutDialog(context: context),
        child: Text("About"),
      ),
      TextButton(
        onPressed: Navigator.of(context).pop,
        child: Text("Close"),
      ),
    ],
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
    spacing: 8,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Spacer(),
      Row(
        spacing: 8,
        children: [
          Text('Application version'),
          Spacer(),
          FutureBuilder(
            future: SettingsModel().appInfo.version,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return SizedBox.square(
                  dimension: 16,
                  child: CircularProgressIndicator(),
                );
              }
              return Row(
                children: [
                  Text(snapshot.data!),
                  SizedBox(width: 8),
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    onPressed: () => Clipboard.setData(ClipboardData(text: snapshot.data!)),
                    tooltip: "Copy version",
                    icon: Icon(Icons.copy),
                    iconSize: 16,
                  ),
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => ChangeLogsDialog(),
                    ),
                    tooltip: "See what's new",
                    icon: Icon(Icons.new_releases),
                    iconSize: 16,
                  ),
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    onPressed: () async {
                      downloadAndOpenAppinstaller(context);
                    },
                    tooltip: "Check for updates",
                    icon: Icon(Icons.update),
                    iconSize: 16,
                  ),
                ],
              );
            },
          ),
        ],
      ),
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
      Spacer(),
    ],
  );

  Future<void> downloadAndOpenAppinstaller(BuildContext ctx) async {
    try {
      Uri appInstallerUri = Uri.parse("https://este2013.github.io/jira_watch/jira_watcher.appinstaller");

      // 1) Download to a temp file
      final tempDir = await SettingsModel().tempDir;
      final file = File(join(tempDir.path, 'jira_watcher-${DateTime.now().millisecondsSinceEpoch}.appinstaller'));

      final resp = await http.get(appInstallerUri);
      if (resp.statusCode != 200 || resp.bodyBytes.isEmpty) {
        throw Exception('Failed to download .appinstaller (HTTP ${resp.statusCode}).');
      }

      // String? expectedSha256; // e.g., 'c1a2...'
      // // 2) (Optional) Verify checksum
      // if (expectedSha256 != null) {
      //   final actual = crypto.sha256.convert(resp.bodyBytes).toString();
      //   if (actual.toLowerCase() != expectedSha256!.toLowerCase()) {
      //     throw Exception('Checksum mismatch for .appinstaller.');
      //   }
      // }

      // 3) Write file
      if (!await file.parent.exists()) {
        await file.parent.create(recursive: true);
      }
      await file.writeAsBytes(resp.bodyBytes, flush: true);

      // 4) Open with system handler (App Installer)
      final ok = await launchUrl(Uri.file(file.path), mode: LaunchMode.externalApplication);

      if (!ok) {
        // Fallback: try PowerShell Start-Process (some environments need this)
        await Process.run('powershell', [
          '-NoProfile',
          '-Command',
          'Start-Process',
          file.path,
        ]);
      }

      // 5) Schedule cleanup (don’t delete immediately in case App Installer still reading)
      Future.delayed(const Duration(minutes: 5), () {
        if (file.existsSync()) {
          file.delete().catchError((_) {});
        }
      });
    } catch (e) {
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(content: Text('Update check failed: $e')),
      );
    }
  }
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

  bool showOnlySelected = false;

  @override
  void initState() {
    super.initState();
    _allProjectsFuture = DataModel().fetchProjects();

    // Load prefs into _selected once:
    SharedPreferences.getInstance().then((prefs) {
      final list = SettingsModel().starredProjects.value ?? [];
      setState(() => _selected = list.toSet());
    });
  }

  void _toggle(String key) {
    setState(() {
      if (_selected.contains(key)) {
        _selected.remove(key);
      } else {
        _selected.add(key);
      }
    });
    SettingsModel().starredProjects.value = _selected.toList();
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
        final filtered = all
            .where((p) {
              final txt = _searchController.text.toLowerCase();
              return p['name'].toLowerCase().contains(txt) || p['key'].toLowerCase().contains(txt);
            })
            .where(
              (p) => !showOnlySelected || _selected.contains(p['key']),
            )
            .toList();

        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
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
                ),
                IconButton(
                  onPressed: () => setState(() {
                    showOnlySelected = !showOnlySelected;
                  }),
                  icon: Icon(Symbols.star),
                  selectedIcon: Icon(Symbols.star, fill: 1),
                  isSelected: showOnlySelected,
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (ctx, i) {
                  final p = filtered[i];
                  final key = p['key'] as String;
                  final name = p['name'] as String;

                  return SwitchListTile(
                    key: Key(key),
                    title: Text(key),
                    subtitle: Text(name),
                    value: _selected.contains(key),
                    onChanged: (_) => _toggle(key),
                    secondary: JiraAvatar(url: p['avatarUrls']['32x32'] + '?format=png', size: 32),
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
    spacing: 8,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        spacing: 8,
        children: [
          Text('Icon cache'),
          Spacer(),
          IconButton(onPressed: () => jiraAvatarCacheManager.emptyCache(), icon: Icon(Icons.delete)),
        ],
      ),
      Row(
        spacing: 8,
        children: [
          Text('Settings files'),
          Spacer(),
          TextButton(onPressed: () => launchUrl(Uri.directory(join(Platform.environment['APPDATA']!, "com.este", "jira_watcher"))), child: Text("View in folder")),
        ],
      ),
    ],
  );
}
