import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jira_watcher/ui/to_do_widgets/to_do_page.dart';
import 'package:jira_watcher/ui/updates_widgets/home_overview.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:jira_watcher/ui/settings.dart';
import 'package:loggy/loggy.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with UiLoggy {
  String _currentPage = 'Updates';

  int get _selectedIndex {
    switch (_currentPage) {
      case 'Updates':
        return 0;
      case 'Issues':
        return 1;
      case 'To do':
        return 2;
      default:
        return 0;
    }
  }

  void _onRailSelect(int index) {
    switch (index) {
      case 0:
        loggy.info('User selected Updates tab (#$index)');
        setState(() => _currentPage = 'Updates');
        break;
      case 1:
        loggy.info('User selected Issues tab (#$index)');
        setState(() => _currentPage = 'Issues');
        break;
      case 2:
        loggy.info('User selected Issues tab (#$index)');
        setState(() => _currentPage = 'To do');
        break;
    }
  }

  Widget _buildPageContent() {
    switch (_currentPage) {
      case 'Issues':
        return UnderConstructionNotice();
      case 'To do':
        return TodoPage();
      default:
        return UpdatesPage();
    }
  }

  @override
  void initState() {
    var lastVersion = SettingsModel().lastAppVersion;
    SettingsModel().appInfo.version.then((ver) {
      if (isVersionGreaterThan(ver, lastVersion)) {
        WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) => showDialog(
            context: context,
            builder: (context) => ChangeLogsDialog(),
          ),
        );
      } else {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          var data = await fetchNewUpdateData(context, currentVersion: ver);
          if (!data.$1) return;
          showDialog(
            // ignore: use_build_context_synchronously
            context: context,
            builder: (context) => NewUpdateAvailableAlertDialog(data: data, version: ver),
          );
        });
      }
    });

    super.initState();
  }

  String currentPageSubtitle(String currentPage) {
    switch (currentPage) {
      case 'Updates':
        return 'View the latest changes made in projects you work on.';
      case 'To do':
        return 'Locally keep track of your own tasks.';
      case 'Issues':
      default:
        return 'No subtitle for this page, call the dev.';
    }
  }

  Future<(bool, String?, Map?)> fetchNewUpdateData(BuildContext context, {required String currentVersion}) async {
    Uri latestDataUri = Uri.parse("https://este2013.github.io/jira_watch/latest.json");
    final resp = await http.get(latestDataUri);

    if (resp.statusCode != 200 || resp.bodyBytes.isEmpty) {
      return (false, null, null);
    }

    Map<String, dynamic> data = jsonDecode(resp.body);
    MapEntry? mostRecent = data.entries.firstOrNull;
    if (mostRecent == null) {
      return (false, null, null);
    }

    bool isVersioStrictlyAbove(String version, {required String baseline}) {
      var versionL = version.split('.').map(int.parse);
      var baselineL = baseline.split('.').map(int.parse).toList();
      for (var v in versionL.indexed) {
        if (baselineL.length == v.$1) baselineL.add(0);
        if (v.$2 > baselineL[v.$1]) {
          return true;
        }
        if (v.$2 < baselineL[v.$1]) {
          return false;
        }
      }
      return false;
    }

    if (!isVersioStrictlyAbove(mostRecent.key, baseline: currentVersion)) {
      return (false, null, null);
    }

    return (true, mostRecent.key as String, mostRecent.value as Map);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Row(
      children: [
        NavigationRail(
          groupAlignment: 0,
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onRailSelect,
          labelType: NavigationRailLabelType.all,
          trailingAtBottom: true,
          destinations: [
            NavigationRailDestination(
              icon: Icon(Icons.dashboard),
              label: Text('Updates'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.bug_report),
              label: Text('Issues'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.assignment),
              label: Text('To do'),
            ),
          ],
          trailing: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: IconButton(
              onPressed: () {
                loggy.info('User opens the settings dialog from navigation rail');
                showDialog(context: context, builder: (context) => SettingsDialog());
              },
              icon: Icon(Icons.settings),
            ),
          ),
        ),
        VerticalDivider(width: 1),
        Expanded(
          child: Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  Expanded(child: Text(_currentPage)),
                  Expanded(
                    child: Center(
                      child: Text(
                        currentPageSubtitle(_currentPage),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).hintColor),
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),

              actions: [],
            ),
            body: IndexedStack(
              index: _selectedIndex,
              children: const [
                UpdatesPage(),
                UnderConstructionNotice(),
                TodoPage(),
              ],
            ),
          ),
        ),
      ],
    ),
  );

  bool isVersionGreaterThan(String newVersion, String currentVersion) {
    List<String> currentV = currentVersion.split(".");
    List<String> newV = newVersion.split(".");
    bool a = false;
    for (var i = 0; i <= 2; i++) {
      a = int.parse(newV[i]) > int.parse(currentV[i]);
      if (int.parse(newV[i]) != int.parse(currentV[i])) break;
    }
    return a;
  }
}

class UnderConstructionNotice extends StatelessWidget {
  const UnderConstructionNotice({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Center(
    child: Row(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('🚧', style: TextStyle(fontSize: 100)),
        Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Text('Under construction', style: TextStyle(fontSize: 32)),
            Text('Send me a heart or a coffee to accelerate development.'),
          ],
        ),
      ],
    ),
  );
}

class NewUpdateAvailableAlertDialog extends StatelessWidget {
  const NewUpdateAvailableAlertDialog({
    super.key,
    required this.data,
    required this.version,
  });

  final (bool, String?, Map?) data;
  final String version;

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text('A new update is available!'),
    content: ScrollbarTheme(
      data: ScrollbarThemeData(thumbVisibility: WidgetStatePropertyAll(true)),
      child: SizedBox(
        width: 400,
        height: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 16,
          children: [
            Row(
              children: [
                Expanded(child: Text('Version ${data.$2!}', style: Theme.of(context).textTheme.titleMedium)),
                Text('(Current: $version)'),
              ],
            ),
            if (data.$3?['changelog'] == null)
              Expanded(
                child: SingleChildScrollView(child: Text(data.$3?['changelog'] ?? 'No changelog :(')),
              )
            else
              Expanded(
                child: Card(
                  child: Padding(
                    padding: EdgeInsetsGeometry.all(16),
                    child: SingleChildScrollView(child: Text(data.$3?['changelog'] ?? 'No changelog :(')),
                  ),
                ),
              ),
          ],
        ),
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
  );
}

class ChangeLogsDialog extends StatelessWidget {
  const ChangeLogsDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var versionsData = <Widget>[
      // version 0
      Card(
        child: Center(child: Text("V0: The app now exist 😎")),
      ),
      ChangeLogCard(
        '0.1.1',
        sections: [
          ChangeLogSection.features([
            ChangeLogItem('📋 On first boot after installing a new version, a changelog is shown. It is also accessible in Settings > General.'),
            ChangeLogItem('🧑 Better login page, with basic input validation.'),
            ChangeLogItem('📄 Added a default page for when no user project is set.'),
            ChangeLogItem('⚙️ Added a button to open the app settings files, in Settings > Advanced.'),
          ]),
          ChangeLogSection.bugFixes([
            ChangeLogItem('💡 Jira deprecated their /search API, now using /search/jql instead.'),
          ]),
          ChangeLogSection.chores([
            ChangeLogItem('Bumped version number.'),
            ChangeLogItem('Added About and Licences pages.'),
            ChangeLogItem('🛑 BREAKING: set a correct path for app settings. Old settings won’t be kept from previous versions.'),
          ]),
        ],
      ),

      ChangeLogCard(
        '0.1.2',
        sections: [
          ChangeLogSection.features([
            ChangeLogItem('🔍 Overview filters are now kept through app restarts and page navigation'),
            ChangeLogItem('🔄️ Implemented auto-update mechanic'),
          ]),
          ChangeLogSection.chores([
            ChangeLogItem('Bumped version number.'),
            ChangeLogItem('Added application icon 👁️.'),
            ChangeLogItem('Temporarily removed edit tag (it’s not working yet).'),
          ]),
          ChangeLogSection.knownBugs([
            ChangeLogItem('If project filters are changed before request completes, the newer request is not taken into account'),
          ]),
        ],
      ),

      ChangeLogCard(
        '1.0.2',
        sections: [
          ChangeLogSection.features([
            ChangeLogItem('🔄️ Adds a manual refresh button'),
            ChangeLogItem('😀 Also I can test if my update mechanic works now :)'),
          ]),
        ],
      ),

      ChangeLogCard(
        '1.1.0',
        sections: [
          ChangeLogSection.features([
            ChangeLogItem("Renamed 'Overview' to 'Updates'"),
            ChangeLogItem('📫 Updates can now be marked as Read or Unread'),
            ChangeLogItem('⚙️ Added setting "Mark as read upon selection"'),
            ChangeLogItem("💬 View issue comments in the comments tab (all formatting isn't handled)"),
            ChangeLogItem('🏃 View issue status in list and details'),
            ChangeLogItem('🧪 [Experiment] Ticket details view'),
          ]),
          ChangeLogSection.bugFixes([
            ChangeLogItem('Chosen app theme is now kept between sessions'),
          ]),
          ChangeLogSection.chores([
            ChangeLogItem('Bumped version number.'),
          ]),
          ChangeLogSection.knownBugs([
            ChangeLogItem('Emojis are not rendered in comments (there is no Atlassian API for that)'),
            ChangeLogItem('Newer request is dropped by UI if project filters are changed before request completes'),
            ChangeLogItem('Comments: nested replies are not shown as nested'),
          ]),
        ],
      ),

      ChangeLogCard(
        '1.1.1',
        sections: [
          ChangeLogSection.features([
            ChangeLogItem('🔑 [BREAKING] API key is encrypted when stored in file system.'),
            ChangeLogItem('ℹ️ Your already saved API key (in plain text) will be encrypted and removed from settings file.'),
          ]),
          ChangeLogSection.bugFixes([
            ChangeLogItem('File that keeps track of the read status was not created properly'),
            ChangeLogItem('Changelog was not scrollable in "new update" notification dialog'),
          ]),
          ChangeLogSection.chores([
            ChangeLogItem('Bumped version number.'),
            ChangeLogItem('Added dependencies to flutter_secure_storage and cryptography packages.'),
          ]),
          ChangeLogSection.knownBugs([
            ChangeLogItem('Emojis are not rendered in comments (there is no Atlassian API for that)'),
            ChangeLogItem('Newer request is dropped by UI if project filters are changed before request completes'),
            ChangeLogItem('Comments: nested replies are not shown as nested'),
          ]),
        ],
      ),

      ChangeLogCard(
        '1.2.0',
        sections: [
          ChangeLogSection.features([
            ChangeLogItem('⚙️ Settings: Added Compact listing mode for Updates view'),
            ChangeLogItem('🕜 Custom time filtering is now available'),
            ChangeLogItem('📖 Ticket details view is now available with default fields! (custom fields tbd)'),
            ChangeLogItem('🌐 Added link to GitHub in settings'),
            ChangeLogItem('😣 Added logs and diagnostics options to help troubleshooting'),
          ]),
          ChangeLogSection.chores([
            ChangeLogItem('Bumped version number.'),
            ChangeLogItem('Removed dependency to flutter_json.'),
            ChangeLogItem('Added dependency to fading_edge_scrollview and calendar_date_picker2.'),
            ChangeLogItem('Refactored the ticket details 🡢 json view for more helpful debugging and inspection'),
          ]),
          // ChangeLogSection.bugFixes([]),
          ChangeLogSection.knownBugs([
            ChangeLogItem('Emojis are not rendered in comments (there is no Atlassian API for that)'),
            ChangeLogItem('Newer request is dropped by UI if project filters are changed before request completes'),
            ChangeLogItem('Comments: nested replies are not shown as nested'),
          ]),
        ],
      ),
      ChangeLogCard(
        '1.3.0',
        sections: [
          ChangeLogSection.features([
            ChangeLogItem('☀️ Assigned to and Reporter field are now lit when you are the person in it'),
            ChangeLogItem('🔣 Tables are now rendered'),
            ChangeLogItem('🎴 Panels are now rendered'),
            ChangeLogItem('🖼️ Images and videos are now rendered'),
            ChangeLogItem('🖱️ Whole description and comments can now be selected and copied'),
          ]),
          ChangeLogSection.bugFixes([
            ChangeLogItem('😎 SVGs from jira would not get in-line style (eg. colors would be lost)'),
            ChangeLogItem('🔗 Links from the details view would not open in browser'),
            ChangeLogItem('🥸 Mentions in light mode were unreadable'),
            ChangeLogItem('🛑 App no longer commits seppuku when switching pages then editing projects (setstate after dispose)'),
            ChangeLogItem('🧑‍🚀 Corrected spacing after AdfRenderer widgets'),
            ChangeLogItem('🛞 Attachements loading animation was stretched horizontally'),
            ChangeLogItem('🙍 Incorrect person was shown as updater when the update was a comment'),
          ]),
          ChangeLogSection.chores([
            ChangeLogItem('Bumped version number.'),
            ChangeLogItem('Added dependency to xml.'),
          ]),
          ChangeLogSection.knownBugs([
            ChangeLogItem('Emojis are not rendered in comments (there is no Atlassian API for that)'),
            ChangeLogItem('Newer request is dropped by UI if project filters are changed before request completes'),
            ChangeLogItem('Comments: nested replies are not shown as nested'),
          ]),
        ],
      ),
    ];
    var ctrl = PageController(initialPage: versionsData.length - 1);
    return AlertDialog(
      title: Text("Your app was updated!"),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  visualDensity: VisualDensity.compact,
                  onPressed: () => ctrl.previousPage(duration: Durations.short4, curve: Curves.bounceIn),
                  icon: Icon(Icons.navigate_before),
                ),
                IconButton(
                  visualDensity: VisualDensity.compact,
                  onPressed: () => ctrl.nextPage(duration: Durations.short4, curve: Curves.bounceIn),
                  icon: Icon(Icons.navigate_next),
                ),
              ],
            ),
            Spacer(),
            TextButton(onPressed: Navigator.of(context).pop, child: Text("Yep yep")),
          ],
        ),
      ],
      content: SizedBox(
        width: 600,
        height: 400,
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FutureBuilder(
              future: SettingsModel().appInfo.version,
              builder: (context, asyncSnapshot) {
                if (asyncSnapshot.hasData) {
                  return Text(
                    "You are now running version ${asyncSnapshot.data}",
                    style: Theme.of(context).textTheme.titleMedium,
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
            Expanded(
              child: PageView(
                controller: ctrl,
                children: versionsData,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChangeLogCard extends StatelessWidget {
  const ChangeLogCard(this.version, {super.key, required this.sections, this.intro, this.outro});

  final String version;
  final List<ChangeLogSection> sections;
  final TextSpan? intro, outro;

  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: ScrollbarTheme(
        data: ScrollbarThemeData(thumbVisibility: WidgetStatePropertyAll(true)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SelectableText.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "What's new in $version?\n\n",

                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ?intro,
                  for (var section in sections) ...[section.toTextSpan(), TextSpan(text: '\n')],
                  ?outro,
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class ChangeLogSection {
  ChangeLogSection(this.name, {required this.emote, required this.items});

  factory ChangeLogSection.features(List<ChangeLogItem> items) => ChangeLogSection('Features:', emote: '✨', items: items);
  factory ChangeLogSection.bugFixes(List<ChangeLogItem> items) => ChangeLogSection('Bug fixes', emote: '🪲', items: items);
  factory ChangeLogSection.chores(List<ChangeLogItem> items) => ChangeLogSection('Chores', emote: '🧼', items: items);
  factory ChangeLogSection.knownBugs(List<ChangeLogItem> items) => ChangeLogSection('Known bugs', emote: '🐛', items: items);

  String emote, name;
  List<ChangeLogItem> items;

  TextSpan toTextSpan() {
    return TextSpan(
      children: [
        TextSpan(text: '$emote '),
        TextSpan(
          text: '$name\n',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        for (var i in items) ...[i.toTextSpan(), TextSpan(text: '\n')],
      ],
    );
  }
}

class ChangeLogItem {
  ChangeLogItem(this.description, {this.subItems});

  String description;
  List<ChangeLogItem>? subItems;

  TextSpan toTextSpan({int indent = 0}) {
    String indentStr = '    ' * (indent);
    String prefix = ' ᛫ ';
    var mainItem = TextSpan(text: '$indentStr$prefix${description.replaceAll('\n', '\n$indentStr   ')}');
    if (subItems == null || subItems!.isEmpty) {
      return mainItem;
    }
    return TextSpan(
      children: [
        mainItem,
        for (var i in subItems!) i.toTextSpan(indent: indent + 1),
      ],
    );
  }
}
