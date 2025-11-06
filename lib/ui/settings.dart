import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jira_watcher/dao/updates_dao.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/ui/home.dart';
import 'package:jira_watcher/ui/utils/avatar.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:loggy/loggy.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:path/path.dart';
// import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

import '../utils/🪵.dart';

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
      Row(
        children: [
          TextButton.icon(
            onPressed: () => launchUrl(Uri.parse('https://github.com/Este2013/jira_watch')),
            icon: SvgPicture.asset(
              'assets/icons/github-icon.svg',
              height: 20,
              colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn),
            ),
            label: Text('GitHub'),
          ),
          Spacer(),
          TextButton.icon(
            onPressed: () async {
              showAboutDialog(
                // ignore: use_build_context_synchronously
                context: context,
                applicationVersion: await SettingsModel().appInfo.version,
                applicationIcon: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: SvgPicture.asset(
                    'assets/app_icon.svg',
                    height: 48,
                  ),
                ),
                applicationLegalese: """A Jira client, built to easily overview recent ticket updates, and keep tabs on your tasks.\nBuilt and maintained by Esteban Aragon (GitHub @Este2013). \nAdress your dissatisfactions and/or love letters to him. Preferably the latter.""",
              );
            },
            // icon: Icon(),
            label: Text("About"),
          ),
          TextButton(
            onPressed: Navigator.of(context).pop,
            child: Text("Close"),
          ),
        ],
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
  Widget build(BuildContext context) => Center(
    child: ListView(
      shrinkWrap: true,
      children: [
        // Application
        Row(
          spacing: 8,
          children: [
            Text('Application', style: Theme.of(context).textTheme.titleMedium),
            Expanded(child: Divider()),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            spacing: 8,
            children: [
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
                              var data = await _fetchNewUpdateData(context, currentVersion: snapshot.data!);
                              if (!data.$1) return;
                              showDialog(
                                // ignore: use_build_context_synchronously
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('A new update is available!'),
                                  content: SizedBox(
                                    width: 400,
                                    height: 400,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      spacing: 16,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(child: Text('Version ${data.$2!}', style: Theme.of(context).textTheme.titleMedium)),
                                            Text('(Current: ${snapshot.data})'),
                                          ],
                                        ),
                                        if (data.$3?['changelog'] == null)
                                          Expanded(child: Center(child: Text(data.$3?['changelog'] ?? 'No changelog :(')))
                                        else
                                          Card(
                                            child: Padding(
                                              padding: EdgeInsetsGeometry.all(16),
                                              child: SingleChildScrollView(child: Text(data.$3?['changelog'] ?? 'No changelog :(')),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    Row(
                                      spacing: 8,
                                      children: [
                                        TextButton(onPressed: Navigator.of(context).pop, child: Text('Not now')),
                                        Spacer(),
                                        TextButton(
                                          onPressed: () => launchUrl(Uri.parse('https://github.com/Este2013/jira_watch/releases')),
                                          child: Text('Github'),
                                        ),
                                        FilledButton(onPressed: () => launchUrl(Uri.parse('https://este2013.github.io/jira_watch/${data.$3?['x64']}')), child: Text('Download')),
                                      ],
                                    ),
                                  ],
                                ),
                              );
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
            ],
          ),
        ),

        // Updates view
        Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: Row(
            spacing: 8,
            children: [
              Text('Updates view', style: Theme.of(context).textTheme.titleMedium),
              Expanded(child: Divider()),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            spacing: 8,
            children: [
              Text('Mark as read upon selection'),
              Spacer(),
              Switch(
                value: SettingsModel().markAsReadOnOpen.value,
                onChanged: (value) => setState(() {
                  SettingsModel().markAsReadOnOpen.value = value;
                }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            spacing: 8,
            children: [
              Text('Use compact display'),
              Spacer(),
              DropdownMenu<String>(
                enableSearch: false,
                enableFilter: false,
                textInputAction: TextInputAction.none,
                requestFocusOnTap: false,
                initialSelection: SettingsModel().useCompactTicketDisplay.value,
                dropdownMenuEntries: [
                  DropdownMenuEntry(value: 'When issue was read', label: 'When issue was read'),
                  DropdownMenuEntry(value: 'Never', label: 'Never'),
                  DropdownMenuEntry(value: 'Always', label: 'Always'),
                ],
                onSelected: (value) => setState(() {
                  if (value == null) return;
                  SettingsModel().useCompactTicketDisplay.value = value;
                }),
              ),
            ],
          ),
        ),
      ].expand<Widget>((w) => [w, SizedBox(height: 8)]).toList()..removeLast(),
    ),
  );

  Future<(bool, String?, Map?)> _fetchNewUpdateData(BuildContext context, {required String currentVersion}) async {
    return fetchNewUpdateData(
      context: context,
      currentVersion: currentVersion,
      onEmpty: (context) => showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) => _UpToDateDialog('Server has no latest version data (empty response)'),
      ),
      onNoData: (context) => showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) => _UpToDateDialog('Server has no latest version data (no entries: empty map)'),
      ),
      onLatest: (context, mostRecent) => showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) => _UpToDateDialog('You are running the server\'s latest version ($mostRecent)'),
      ),
    );

    // Uri latestDataUri = Uri.parse("https://este2013.github.io/jira_watch/latest.json");
    // final resp = await http.get(latestDataUri);

    // if (resp.statusCode != 200 || resp.bodyBytes.isEmpty) {
    //   return showDialog(
    //     // ignore: use_build_context_synchronously
    //     context: context,
    //     builder: (context) => upToDateDialog('Server has no latest version data (empty response)'),
    //   ).then((value) => (false, null, null));
    // }

    // Map<String, dynamic> data = jsonDecode(resp.body);
    // MapEntry? mostRecent = data.entries.firstOrNull;
    // if (mostRecent == null) {
    //   return showDialog(
    //     // ignore: use_build_context_synchronously
    //     context: context,
    //     builder: (context) => upToDateDialog('Server has no latest version data (no entries: empty map)'),
    //   ).then((value) => (false, null, null));
    // }

    // bool isVersioStrictlyAbove(String version, {required String baseline}) {
    //   var versionL = version.split('.').map(int.parse);
    //   var baselineL = baseline.split('.').map(int.parse).toList();
    //   for (var v in versionL.indexed) {
    //     if (baselineL.length == v.$1) baselineL.add(0);
    //     if (v.$2 > baselineL[v.$1]) {
    //       return true;
    //     }
    //     if (v.$2 < baselineL[v.$1]) {
    //       return false;
    //     }
    //   }
    //   return false;
    // }

    // if (!isVersioStrictlyAbove(mostRecent.key, baseline: currentVersion)) {
    //   return showDialog(
    //     // ignore: use_build_context_synchronously
    //     context: context,
    //     builder: (context) => upToDateDialog('You are running the server\'s latest version (${mostRecent.key})'),
    //   ).then((value) => (false, null, null));
    // }

    // return (true, mostRecent.key as String, mostRecent.value as Map);
  }
}

class _UpToDateDialog extends StatelessWidget {
  const _UpToDateDialog(this.details);
  final String details;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        spacing: 8,
        children: [
          Icon(Icons.check_circle, color: Colors.green),
          Text('You are up to date'),
        ],
      ),
      content: Text(details),
      actions: [
        TextButton(
          onPressed: Navigator.of(context).pop,
          child: Text('Got it'),
        ),
      ],
    );
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
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: ScrollbarTheme(
      data: ScrollbarThemeData(thumbVisibility: WidgetStatePropertyAll(true)),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Column(
            children: [
              Row(
                spacing: 8,
                children: [
                  Text('Data', style: Theme.of(context).textTheme.titleMedium),
                  Expanded(child: Divider()),
                ],
              ),
              Column(
                spacing: 8,
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
                      TextButton(onPressed: () => launchUrl(SettingsModel().settingsFolderUri), child: Text("View in folder")),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Row(
                  spacing: 8,
                  children: [
                    Text('Logging', style: Theme.of(context).textTheme.titleMedium),
                    Expanded(child: Divider()),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  spacing: 8,
                  children: [
                    SelectableText(
                      FileLogPrinter.logFile.path,
                      textAlign: TextAlign.end,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      spacing: 8,
                      children: [
                        TextButton.icon(
                          icon: Icon(Icons.menu_book),
                          onPressed: () => showDialog(context: context, builder: (context) => _LogsDialog()),
                          label: Text("Read the logs"),
                        ),
                        TextButton.icon(icon: Icon(Icons.folder), onPressed: () => launchUrl(SettingsModel().settingsFolderUri), label: Text("Open in folder")),
                      ],
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Row(
                  spacing: 8,
                  children: [
                    Text('Diagnostics', style: Theme.of(context).textTheme.titleMedium),
                    Expanded(child: Divider()),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  spacing: 8,
                  children: [
                    Row(
                      spacing: 8,
                      children: [
                        Text('Test writing to settings folder'),
                        Spacer(),
                        TextButton.icon(
                          icon: Icon(Icons.settings),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => DiagnosticsDialog(
                                testName: 'Writing to settings folder',
                                stdout: testWritingToSettingsFolder(),
                              ),
                            );
                          },
                          label: Text('Run test'),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 8,
                      children: [
                        Text('Test fetching new update data'),
                        Spacer(),
                        TextButton.icon(
                          icon: Icon(Icons.update),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => DiagnosticsDialog(
                                testName: 'Writing to settings folder',
                                stdout: testFetchingNewUpdateData(context),
                              ),
                            );
                          },
                          label: Text('Run test'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ].expand<Widget>((w) => [w, SizedBox(height: 8)]).toList()..removeLast(),
          ),
        ),
      ),
    ),
  );

  Stream<String> testWritingToSettingsFolder() async* {
    File test = File(join(SettingsModel().settingsFolder.path, 'diag_test_file.txt'));
    yield 'Test file is located at:\n${test.path}';
    var exists = await test.exists();
    yield 'The file ${exists ? '' : 'does not '}exist';
    if (!exists) {
      yield 'Creating file...';
      await test.create();
      yield 'File created';
    }
    yield 'Writing to file...';
    await test.writeAsString('How are you doing today?');
    var sink = test.openWrite(mode: FileMode.append);
    sink.writeln('\nQuite fine thank you :)');
    await sink.flush();
    await sink.close();
    yield 'File written to.';
    yield 'Reading file...';
    String contents = await test.readAsString();
    yield 'Read the following contents:\n$contents';
    yield 'Contents are as expected?\n${contents == 'How are you doing today?\nQuite fine thank you :)\n'}';

    yield 'Cleaning up...';
    await test.delete();

    yield 'File was correctly deleted:\n${!await test.exists()}';
  }

  Stream<String> testFetchingNewUpdateData(BuildContext context) async* {
    Future<String> currentVersion = SettingsModel().appInfo.version;

    yield '💡 This test fakes the current version as being 0.0.0.';
    yield 'Fetching release data from:\n$latestDataUri';
    var data = await fetchNewUpdateData(context: context, currentVersion: '0.0.0');
    yield 'Found the following:\nIs a new version available? => ${data.$1}\nWhat is that version\'s number? => ${data.$2}\nChangelog:\n${JsonEncoder.withIndent('    ').convert(data.$3)}';

    yield '';

    yield '💡 Now testing with the actual correct version: ${await currentVersion}';
    // ignore: use_build_context_synchronously
    data = await fetchNewUpdateData(context: context, currentVersion: await currentVersion);
    yield 'Found the following:\nIs a new version available? => ${data.$1}\nWhat is that version\'s number? => ${data.$2}\nChangelog:\n${JsonEncoder.withIndent('    ').convert(data.$3)}';
  }
}

class DiagnosticsDialog extends StatefulWidget {
  const DiagnosticsDialog({super.key, required this.testName, required this.stdout});
  final String testName;

  final Stream<String> stdout;
  @override
  State<DiagnosticsDialog> createState() => _DiagnosticsDialogState();
}

class _DiagnosticsDialogState extends State<DiagnosticsDialog> {
  late Stream stream;
  List<String> stdout = [];

  @override
  void initState() {
    stream = widget.stdout.asBroadcastStream();

    super.initState();
    stream
        .forEach(
          (element) => setState(() {
            stdout.add(element.replaceAll('\n', '\n    | '));
          }),
        )
        .onError(
          (error, stackTrace) => stdout.add('[ERROR] $error\n$stackTrace'.replaceAll('\n', '\n    | ')),
        );
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    constraints: BoxConstraints.expand(),
    title: Row(
      spacing: 16,
      children: [
        Text(widget.testName),
        StreamBuilder(
          stream: stream,
          builder: (_, snap) {
            if (snap.hasError) {
              return IconButton(
                onPressed: () => Clipboard.setData(ClipboardData(text: snap.error.toString())),
                icon: Icon(Icons.error),
                tooltip: snap.error.toString(),
              );
            }
            return snap.connectionState == ConnectionState.active ? CircularProgressIndicator() : SizedBox.shrink();
          },
        ),
      ],
    ),
    actions: [TextButton(onPressed: Navigator.of(context).pop, child: Text('Exit'))],
    content: Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: SelectableText(stdout.join('\n')),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class _LogsDialog extends StatefulWidget {
  const _LogsDialog();

  @override
  State<_LogsDialog> createState() => _LogsDialogState();
}

class _LogsDialogState extends State<_LogsDialog> with UiLoggy {
  late Timer pollTimer;
  String? contents;

  @override
  void initState() {
    super.initState();
    pollTimer = Timer.periodic(
      Duration(seconds: 1),
      (timer) async {
        var temp = await FileLogPrinter.logFile.readAsString();

        if (contents != temp) {
          setState(() {
            contents = temp;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    pollTimer.cancel();
    super.dispose();
  }

  String emoteForLevel(String level) {
    if (level == 'Debug') return '🐛';
    if (level == 'Info') return 'ℹ️';
    if (level == 'Warning') return '⚠️';
    if (level == 'Error') return '❌';
    return '❔';
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text('Logs reader'),
    constraints: BoxConstraints(minWidth: double.maxFinite),
    actions: [
      TextButton(
        onPressed: () => loggy.debug('Writing a debug message...'),
        child: Text(emoteForLevel('Debug')),
      ),
      TextButton(
        onPressed: () => loggy.info('Writing an info message...'),
        child: Text(emoteForLevel('Info')),
      ),
      TextButton(
        onPressed: () => loggy.warning('Writing a warning message...'),
        child: Text(emoteForLevel('Warning')),
      ),
      TextButton(
        onPressed: () => loggy.error('Writing an error message...'),
        child: Text(emoteForLevel('Error')),
      ),
      TextButton(
        onPressed: Navigator.of(context).pop,
        child: Text('Close'),
      ),
    ],
    content: DefaultTextStyle(
      style: TextStyle(fontFamily: 'RobotoMono'),
      child: FutureBuilder(
        key: ValueKey(hash),
        future: FileLogPrinter.logFile.readAsLines(),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.hasData) {
            return SingleChildScrollView(
              child: SelectableText.rich(
                TextSpan(
                  children: [
                    for (var line in asyncSnapshot.data!) ...[
                      if (line.startsWith(RegExp(r'[0-9]{4}-[0-9]{2}-[0-9]{2}T'))) ...[
                        TextSpan(text: emoteForLevel(line.split(' ')[1])),
                        TextSpan(text: ' '),
                        TextSpan(
                          text: line.split(' ')[0].split('T')[1],
                          style: TextStyle(color: Colors.greenAccent),
                        ),
                        TextSpan(text: ' '),

                        TextSpan(
                          text: line.split(RegExp(r'[\[\]]'))[1],
                          style: TextStyle(color: Theme.of(context).hintColor),
                        ),
                        TextSpan(text: ' '),

                        TextSpan(text: line.split(RegExp(r']')).sublist(1).join(']')),
                      ] else
                        TextSpan(text: line),
                      TextSpan(text: '\n'),
                    ],
                  ],
                ),
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    ),
  );
}
