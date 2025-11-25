import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jira_watcher/dao/updates_dao.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/ui/home.dart';
import 'package:jira_watcher/ui/updates_dialog.dart';
import 'package:jira_watcher/ui/utils/avatar.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:jira_watcher/ui/utils/json_viewer.dart';
import 'package:jira_watcher/utils/local_auth.dart';
import 'package:jira_watcher/utils/string_utils.dart';
import 'package:loggy/loggy.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:path/path.dart';
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
    constraints: BoxConstraints(maxWidth: 650, maxHeight: 650),
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
                applicationLegalese: """A Jira client, built to easily overview recent work item updates, and keep tabs on your tasks.\nBuilt and maintained by Esteban Aragon (GitHub @Este2013). \nAdress your dissatisfactions and/or love letters to him. Preferably the latter.""",
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
          Expanded(
            child: SizedBox(
              width: 450,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
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
                  Text('Current version'),
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
                            onPressed: () => fetchNewUpdateDataAndShowResults(context, snapshot.data!),
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
                  Text('Updade track'),
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
                      return SegmentedButton<UpdateTrack>(
                        segments: const [
                          ButtonSegment(
                            value: UpdateTrack.main,
                            icon: Icon(Symbols.home, size: 16, fill: 1),
                            label: Text('Stable'),
                          ),
                          ButtonSegment(
                            value: UpdateTrack.beta,
                            icon: Icon(Symbols.experiment, size: 16, fill: 1),
                            label: Text('Beta'),
                          ),
                        ],
                        selected: {SettingsModel().updateTrack.value},
                        onSelectionChanged: (newSelection) {
                          if (newSelection.isNotEmpty) {
                            SettingsModel().updateTrack.value = newSelection.first;
                            setState(() {});
                            if (newSelection.first == UpdateTrack.beta) {
                              fetchNewUpdateDataAndShowResults(context, snapshot.data!);
                            }
                          }
                        },
                        multiSelectionEnabled: false,
                        showSelectedIcon: false,
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
                  SegmentedButton<String>(
                    segments: const [
                      ButtonSegment(
                        value: 'system',
                        icon: Icon(Icons.computer, size: 16),
                        label: Text('System'),
                      ),
                      ButtonSegment(
                        value: 'light',
                        icon: Icon(Icons.light_mode, size: 16),
                        label: Text('Light'),
                      ),
                      ButtonSegment(
                        value: 'dark',
                        icon: Icon(Icons.dark_mode, size: 16),
                        label: Text('Dark'),
                      ),
                    ],
                    selected: {SettingsModel().theme.value},
                    onSelectionChanged: (newSelection) {
                      if (newSelection.isNotEmpty) {
                        SettingsModel().theme.value = newSelection.first;
                        setState(() {}); // refresh UI if needed
                      }
                    },
                    multiSelectionEnabled: false,
                    showSelectedIcon: false,
                  ),
                ],
              ),
            ],
          ),
        ),

        // Jira Updates view
        Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: Row(
            spacing: 8,
            children: [
              Text('Jira Updates view', style: Theme.of(context).textTheme.titleMedium),
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
                initialSelection: SettingsModel().useCompactJiraWorkItemDisplay.value,
                dropdownMenuEntries: [
                  DropdownMenuEntry(value: 'When issue was read', label: 'When update was read'),
                  DropdownMenuEntry(value: 'Never', label: 'Never'),
                  DropdownMenuEntry(value: 'Always', label: 'Always'),
                ],
                onSelected: (value) => setState(() {
                  if (value == null) return;
                  SettingsModel().useCompactJiraWorkItemDisplay.value = value;
                }),
              ),
            ],
          ),
        ),
      ].expand<Widget>((w) => [w, SizedBox(height: 8)]).toList()..removeLast(),
    ),
  );
}

class ConnectionSettingsPage extends StatefulWidget {
  const ConnectionSettingsPage({super.key});

  @override
  State<ConnectionSettingsPage> createState() => _ConnectionSettingsPageState();
}

class _ConnectionSettingsPageState extends State<ConnectionSettingsPage> with UiLoggy {
  @override
  Widget build(BuildContext context) => Center(
    child: ListView(
      shrinkWrap: true,
      children: [
        FutureBuilder(
          future: DataModel().jiraApi.myself(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              loggy.error("An error occured while fetching the user's account data 😵\nError: ${snapshot.error}\nStacktrace: ${snapshot.stackTrace}");
              return Card(
                child: ListTile(
                  leading: Icon(Symbols.error, fill: 1, color: Theme.of(context).colorScheme.error),
                  title: Text('An error occured 😵'),
                  subtitle: Text(snapshot.error.toString()),
                ),
              );
            }
            if (snapshot.hasData) {
              if (snapshot.data!.statusCode == 200) {
                var userData = jsonDecode(snapshot.data!.body);
                return Card(
                  child: ListTile(
                    leading: JiraAvatar(url: userData['avatarUrls']['48x48']),
                    title: Text(userData['displayName']),
                    subtitle: SelectableText('Account id: ${userData['accountId']}'),
                    trailing: IconButton(
                      onPressed: () => Clipboard.setData(ClipboardData(text: userData['accountId'])),
                      tooltip: 'Copy account ID',
                      icon: Icon(Symbols.content_copy),
                    ),
                  ),
                );
              }
              loggy.warning("User's account data could not be fetched 😕\nError: ${snapshot.error}\nStacktrace: ${snapshot.stackTrace}");
              return Card(
                child: ListTile(
                  leading: Icon(Symbols.error, fill: 1, color: Theme.of(context).colorScheme.error),
                  title: Text('Your account data could not be fetched 😕'),
                  subtitle: Text('Error ${snapshot.data!.statusCode}: ${snapshot.data!.reasonPhrase}'),
                ),
              );
            }
            return ListTile(
              leading: CircularProgressIndicator(),
              title: Text('Looking for your account...'),
            );
          },
        ),
        ListTile(
          title: Text('Jira domain'),
          trailing: SelectableText(SettingsModel().domainController.text, style: Theme.of(context).textTheme.bodyMedium),
        ),
        ListTile(
          title: Text('User email'),
          trailing: SelectableText(SettingsModel().emailController.text, style: Theme.of(context).textTheme.bodyMedium),
        ),
        ListTile(
          title: Text('Atlassian API key'),
          trailing: IconButton(
            onPressed: () async {
              const url = 'https://id.atlassian.com/manage-profile/security/api-tokens';
              if (await canLaunchUrl(Uri.parse(url))) {
                await launchUrl(Uri.parse(url));
              }
            },
            icon: Icon(Symbols.open_in_browser),
            tooltip: 'Manage your API keys',
          ),
        ),
        SizedBox(height: 8),
        OutlinedButton.icon(
          onPressed: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('🤨 Are you sure?'),
              content: Text('You are about to view some sensitive information.\nDo you really want to edit your Atlassian connection settings?'),
              actions: [
                TextButton(onPressed: Navigator.of(context).pop, child: Text('Cancel')),
                FilledButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    showDialog<bool>(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        // ignore: use_build_context_synchronously
                        LocalAuthManager().authenticate().then(
                          (value) {
                            loggy.info('Authentication result: $value');
                            if (!value) {
                              // ignore: use_build_context_synchronously
                              Navigator.of(context).pop();
                              return;
                            }
                            // ignore: use_build_context_synchronously
                            Navigator.popUntil(context, ModalRoute.withName('/home'));
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pushReplacementNamed('/apikey');
                          },
                        );

                        return AlertDialog(
                          title: Text('Authenticating'),
                          constraints: BoxConstraints(maxWidth: 400, maxHeight: 400, minWidth: 300),
                          content: Column(
                            spacing: 16,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              LinearProgressIndicator(),
                              Text('Please sign in through the system prompt.'),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.errorContainer,
                    foregroundColor: Theme.of(context).colorScheme.onErrorContainer,
                  ),
                  child: Text('I know what I am doing'),
                ),
              ],
            ),
          ),
          icon: Icon(Symbols.edit, fill: 1),
          label: Text('View and edit credentials'),
        ),
      ].map((w) => Padding(padding: EdgeInsetsGeometry.only(bottom: 16), child: w)).toList(),
    ),
  );
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
  Widget build(BuildContext context) => FutureBuilder<List<dynamic>>(
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
  Widget build(BuildContext context) => ScrollbarTheme(
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
                if (Platform.isWindows)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    spacing: 8,
                    children: [
                      TextButton.icon(
                        icon: Icon(Symbols.data_object),
                        onPressed: () => showDialog(context: context, builder: (context) => _PreferencesDialog()),
                        label: Text("View preferences"),
                      ),

                      TextButton.icon(
                        onPressed: () => SettingsModel().settingsFolderUri.then(launchUrl),
                        icon: Icon(Icons.folder),
                        label: Text("View data files in folder"),
                      ),
                    ],
                  ),
                TextButton.icon(
                  style: TextButton.styleFrom(foregroundColor: Theme.of(context).colorScheme.error),
                  onPressed: () => jiraAvatarCacheManager.emptyCache(),
                  icon: Icon(Symbols.delete, fill: 1),
                  label: Text("Delete images and icons cache"),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  FutureBuilder(
                    future: FileLogPrinter.logFile,
                    builder: (context, asyncSnapshot) {
                      if (!asyncSnapshot.hasData) {
                        return Text('...');
                      }
                      return SelectableText(
                        // uChars are zero-spaces, allowing the text to break preferentially before or after '/' and '\' characters.
                        asyncSnapshot.data!.path.replaceAll("/", "/\u200B").replaceAll(r"\", "\\\u200B"),
                        textAlign: TextAlign.center,
                      );
                    },
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
                      if (Platform.isWindows) TextButton.icon(icon: Icon(Icons.folder), onPressed: () => SettingsModel().settingsFolderUri.then(launchUrl), label: Text("Open in folder")),
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
  );

  Stream<String> testWritingToSettingsFolder() async* {
    File test = await SettingsModel().settingsFolder.then((value) => File(join(value.path, 'diag_test_file.txt')));
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
    yield 'Found the following:\nIs a new version available? => ${data.$1}\nWhat is that version\'s number? => ${data.$2}\nChangelog:\n${JsonEncoder.withIndent('    ').convert(data.$2?.toJson())}';

    yield '';

    yield '💡 Now testing with the actual correct version: ${await currentVersion}';
    // ignore: use_build_context_synchronously
    data = await fetchNewUpdateData(context: context, currentVersion: await currentVersion);
    yield 'Found the following:\nIs a new version available? => ${data.$1}\nWhat is that version\'s number? => ${data.$2}\nChangelog:\n${JsonEncoder.withIndent('    ').convert(data.$2?.toJson())}';
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

class _PreferencesDialog extends StatefulWidget {
  const _PreferencesDialog();

  @override
  State<_PreferencesDialog> createState() => _PreferencesDialogState();
}

class _PreferencesDialogState extends State<_PreferencesDialog> with UiLoggy {
  late Timer pollTimer;
  String? contents;
  String minLevelShown = 'Info';
  late TextEditingController searchController;
  bool searchIsCaseSensitive = false;
  bool searchIsRegex = false;

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    pollTimer = Timer.periodic(
      Duration(seconds: 1),
      (timer) async {
        var temp = await (await FileLogPrinter.logFile).readAsString();

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

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text('App Preferences reader'),
    constraints: BoxConstraints(minWidth: double.maxFinite),
    actions: [
      Row(
        spacing: 8,
        children: [
          // Card(
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          //     child: Row(
          //       spacing: 8,
          //       children: [
          //         SizedBox(
          //           width: 250,
          //           child: TextField(
          //             controller: searchController,
          //             decoration: InputDecoration(
          //               prefixIcon: Icon(Icons.search),
          //             ),
          //           ),
          //         ),
          //         Tooltip(
          //           message: 'Match case',
          //           child: InkWell(
          //             borderRadius: BorderRadius.circular(1000),
          //             child: CircleAvatar(
          //               backgroundColor: searchIsCaseSensitive ? null : Colors.transparent,
          //               child: Icon(Symbols.text_fields, size: 20),
          //             ),
          //             onTap: () => setState(() {
          //               searchIsCaseSensitive = !searchIsCaseSensitive;
          //             }),
          //           ),
          //         ),
          //         AnimatedBuilder(
          //           animation: searchController,
          //           builder: (context, _) {
          //             bool regexHasError = (searchController.text.isNotEmpty && !searchController.text.isValidRegex());
          //             return Tooltip(
          //               message: regexHasError ? 'Invalid regular expression' : 'Use regular expression',
          //               child: InkWell(
          //                 borderRadius: BorderRadius.circular(1000),
          //                 child: CircleAvatar(
          //                   backgroundColor: searchIsRegex
          //                       ? regexHasError
          //                             ? Theme.of(context).colorScheme.errorContainer
          //                             : null
          //                       : Colors.transparent,
          //                   child: Icon(Symbols.regular_expression, size: 20),
          //                 ),
          //                 onTap: () => setState(() {
          //                   searchIsRegex = !searchIsRegex;
          //                 }),
          //               ),
          //             );
          //           },
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          Spacer(),
          TextButton(
            onPressed: Navigator.of(context).pop,
            child: Text('Close'),
          ),
        ],
      ),
    ],
    content: DefaultTextStyle(
      style: TextStyle(fontFamily: 'RobotoMono'),
      child: FutureBuilder(
        key: ValueKey(hash),
        future: SettingsModel().settingsFolder.then((dir) => File(join(dir.path, 'shared_preferences.json')).readAsString()),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.hasData) {
            return AnimatedBuilder(
              animation: searchController,
              builder: (context, _) => JsonViewer(data: jsonDecode(asyncSnapshot.data!)),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
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
  String minLevelShown = 'Info';
  late TextEditingController searchController;
  bool searchIsCaseSensitive = false;
  bool searchIsRegex = false;

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    pollTimer = Timer.periodic(
      Duration(seconds: 1),
      (timer) async {
        var temp = await (await FileLogPrinter.logFile).readAsString();

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
  Widget build(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    return AlertDialog(
      title: Row(
        spacing: 8,
        children: [
          Text('Logs reader'),
          PopupMenuButton<String>(
            icon: Icon(Icons.edit),
            tooltip: 'Test writing a message',

            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'debug',
                child: Row(
                  children: [
                    Text(emoteForLevel('Debug')),
                    SizedBox(width: 8),
                    Text('Debug'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'info',
                child: Row(
                  children: [
                    Text(emoteForLevel('Info')),
                    SizedBox(width: 8),
                    Text('Info'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'warning',
                child: Row(
                  children: [
                    Text(emoteForLevel('Warning')),
                    SizedBox(width: 8),
                    Text('Warning'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'error',
                child: Row(
                  children: [
                    Text(emoteForLevel('Error')),
                    SizedBox(width: 8),
                    Text('Error'),
                  ],
                ),
              ),
            ],
            onSelected: (value) {
              switch (value) {
                case 'debug':
                  loggy.debug('Writing a debug message...');
                  break;
                case 'info':
                  loggy.info('Writing an info message...');
                  break;
                case 'warning':
                  loggy.warning('Writing a warning message...');
                  break;
                case 'error':
                  loggy.error('Writing an error message...');
                  break;
              }
            },
          ),
          Spacer(),
          SegmentedButton(
            segments: [
              for (var lvl in ['Debug', 'Info', 'Warning', 'Error']) ButtonSegment(value: lvl, label: Text('${emoteForLevel(lvl)} $lvl')),
            ],
            selected: {minLevelShown},
            multiSelectionEnabled: false,
            showSelectedIcon: false,
            onSelectionChanged: (p0) => setState(() {
              minLevelShown = p0.first;
            }),
          ),
        ],
      ),
      constraints: BoxConstraints(minWidth: double.maxFinite),
      actions: [
        Row(
          spacing: 8,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: Row(
                  spacing: 8,
                  children: [
                    SizedBox(
                      width: 250,
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                    Tooltip(
                      message: 'Match case',
                      child: InkWell(
                        borderRadius: BorderRadius.circular(1000),
                        child: CircleAvatar(
                          backgroundColor: searchIsCaseSensitive ? null : Colors.transparent,
                          child: Icon(Symbols.text_fields, size: 20),
                        ),
                        onTap: () => setState(() {
                          searchIsCaseSensitive = !searchIsCaseSensitive;
                        }),
                      ),
                    ),
                    AnimatedBuilder(
                      animation: searchController,
                      builder: (context, _) {
                        bool regexHasError = (searchController.text.isNotEmpty && !searchController.text.isValidRegex());
                        return Tooltip(
                          message: regexHasError ? 'Invalid regular expression' : 'Use regular expression',
                          child: InkWell(
                            borderRadius: BorderRadius.circular(1000),
                            child: CircleAvatar(
                              backgroundColor: searchIsRegex
                                  ? regexHasError
                                        ? Theme.of(context).colorScheme.errorContainer
                                        : null
                                  : Colors.transparent,
                              child: Icon(Symbols.regular_expression, size: 20),
                            ),
                            onTap: () => setState(() {
                              searchIsRegex = !searchIsRegex;
                            }),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            TextButton(
              onPressed: Navigator.of(context).pop,
              child: Text('Close'),
            ),
          ],
        ),
      ],
      content: DefaultTextStyle(
        style: TextStyle(fontFamily: 'RobotoMono'),
        child: FutureBuilder(
          key: ValueKey(hash),
          future: FileLogPrinter.logFile.then((value) => value.readAsLines()),
          builder: (context, asyncSnapshot) {
            if (asyncSnapshot.hasData) {
              return AnimatedBuilder(
                animation: searchController,
                builder: (context, _) => FadingEdgeScrollView.fromSingleChildScrollView(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: SelectableText.rich(
                      TextSpan(
                        children: [
                          for (var entry in filtered(asyncSnapshot.data!)) ...[
                            ...[
                              TextSpan(text: emoteForLevel(entry.first.split(' ')[1])),
                              TextSpan(text: ' '),
                              TextSpan(
                                text: entry.first.split(' ')[0].split('T')[1],
                                style: TextStyle(color: isLightTheme ? Colors.green : Colors.greenAccent),
                              ),
                              TextSpan(text: ' '),

                              TextSpan(
                                text: entry.first.split(RegExp(r'[\[\]]'))[1],
                                style: TextStyle(color: Theme.of(context).hintColor),
                              ),
                              TextSpan(text: ' '),

                              TextSpan(
                                text: entry.first.split(RegExp(r']')).sublist(1).join(']'),
                                style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
                              ),
                            ],
                            if (entry.length > 1)
                              for (var line in entry.sublist(1))
                                TextSpan(
                                  text: '\n    | $line',
                                  style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
                                ),
                            TextSpan(text: '\n'),
                          ],
                        ],
                      ),
                    ),
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

  Iterable<List<String>> filtered(List<String> list) => filteredBySearch(filteredByLevel(groupedByEntries(list)));

  Iterable<List<String>> filteredBySearch(Iterable<List<String>> listOfEntries) sync* {
    if (searchController.text.isEmpty) {
      for (var entry in listOfEntries) {
        yield entry;
      }
      return;
    }

    if (searchIsRegex) {
      if (!searchController.text.isValidRegex()) {
        for (var entry in listOfEntries) {
          yield entry;
        }
        return;
      }
      var regexp = RegExp(searchController.text, caseSensitive: searchIsCaseSensitive);
      for (var entry in listOfEntries) {
        String entryString = entry.join('\n');
        if (regexp.hasMatch(entryString)) {
          yield entry;
        }
      }
      return;
    }
    for (var entry in listOfEntries) {
      String entryString = entry.join('\n');
      if (entryString.contains(searchController.text)) {
        yield entry;
      }
    }
  }

  Iterable<List<String>> filteredByLevel(Iterable<List<String>> listOfEntries) sync* {
    /// Maps filter level to its map of allowed levels
    Map levetIsOutTable = {
      'Debug': {
        'Debug': true,
        'Info': true,
        'Warning': true,
        'Error': true,
      },
      'Info': {
        'Debug': false,
        'Info': true,
        'Warning': true,
        'Error': true,
      },
      'Warning': {
        'Debug': false,
        'Info': false,
        'Warning': true,
        'Error': true,
      },
      'Error': {
        'Debug': false,
        'Info': false,
        'Warning': false,
        'Error': true,
      },
    };

    bool currentLogEntryIsFilteredOut = false;
    for (var entry in listOfEntries) {
      if (entry.isEmpty) continue;
      String line = entry.first;
      if (line.startsWith(RegExp(r'[0-9]{4}-[0-9]{2}-[0-9]{2}T'))) {
        String level = line.split(' ')[1];
        bool isLevelAllowed = levetIsOutTable[minLevelShown][level] ?? true;
        if (isLevelAllowed) {
          yield entry;
          currentLogEntryIsFilteredOut = false;
        } else {
          currentLogEntryIsFilteredOut = true;
        }
      } else {
        // this is part of the above log line
        if (!currentLogEntryIsFilteredOut) {
          yield entry;
        }
      }
    }
  }

  Iterable<List<String>> groupedByEntries(List<String> listOfLines) sync* {
    if (listOfLines.isEmpty) return;
    List<String> currentEntry = [];
    for (var line in listOfLines) {
      if (line.startsWith(RegExp(r'[0-9]{4}-[0-9]{2}-[0-9]{2}T'))) {
        if (currentEntry.isNotEmpty) {
          yield currentEntry;
        }
        currentEntry = [];
      }
      currentEntry.add(line);
    }
    if (currentEntry.isNotEmpty) {
      yield currentEntry;
    }
  }
}
