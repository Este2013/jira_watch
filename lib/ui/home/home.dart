import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jira_watcher/home/home_overview.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:jira_watcher/ui/settings.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _currentPage = 'Updates';

  int get _selectedIndex {
    switch (_currentPage) {
      case 'Updates':
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
        setState(() => _currentPage = 'Updates');
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
                        Text('(Current: $ver)'),
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
        });
      }
    });

    super.initState();
  }

  String currentPageSubtitle(String currentPage) {
    switch (currentPage) {
      case 'Updates':
        return 'View the latest changes made in projects you work on.';
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
    appBar: AppBar(
      title: Row(
        children: [
          Expanded(child: Text('Home - $_currentPage')),
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
              label: Text('Updates'),
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
      // version 0.1.1
      Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ScrollbarTheme(
            data: ScrollbarThemeData(thumbVisibility: WidgetStatePropertyAll(true)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "What's new in 0.1.1?\n\n",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      TextSpan(
                        children: [
                          TextSpan(text: "✨ "),
                          TextSpan(
                            text: "Features:\n",
                            style: TextStyle(decoration: TextDecoration.underline),
                          ),
                        ],
                      ),

                      TextSpan(text: "\t ᛫ Changelog: on first boot after installing a new version, a changelog is shown. It is also accessible in Settings > General.\n"),
                      TextSpan(text: "\t ᛫ Better login page, with basic input validation.\n"),
                      TextSpan(text: "\t ᛫ Added a default page for when no user project is set.\n"),
                      TextSpan(text: "\t ᛫ Added a button to open the app settings files, in Settings > Advanced.\n"),

                      TextSpan(
                        children: [
                          TextSpan(text: "\n🪲 "),
                          TextSpan(
                            text: "Bug fixes:\n",
                            style: TextStyle(decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                      TextSpan(text: "\t ᛫ 💡 Jira deprecated their /search API, now using /search/jql instead.\n"),

                      // TextSpan(text: "\t ᛫ \n"),
                      TextSpan(
                        children: [
                          TextSpan(text: "\n🧼 "),
                          TextSpan(
                            text: "Chores:\n",
                            style: TextStyle(decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                      TextSpan(text: "\t ᛫ Bumped version number.\n"),
                      TextSpan(text: "\t ᛫ Added About and Licences pages.\n"),
                      TextSpan(text: "\t ᛫ 🛑 BREAKING: set a correct path for app settings. Old settings wont be kept from previous versions.\n"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      // version 0.1.2
      Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ScrollbarTheme(
            data: ScrollbarThemeData(thumbVisibility: WidgetStatePropertyAll(true)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "What's new in 0.1.2?\n\n",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      TextSpan(
                        children: [
                          TextSpan(text: "✨ "),
                          TextSpan(
                            text: "Features:\n",
                            style: TextStyle(decoration: TextDecoration.underline),
                          ),
                        ],
                      ),

                      TextSpan(text: "\t ᛫ Overview filters are now kept through app restarts and page navigation\n"),
                      TextSpan(text: "\t ᛫ Implemented auto-update mechanic\n"),
                      // TextSpan(text: "\t ᛫ \n"),

                      // TextSpan(
                      //   children: [
                      //     TextSpan(text: "\n🪲 "),
                      //     TextSpan(
                      //       text: "Bug fixes:\n",
                      //       style: TextStyle(decoration: TextDecoration.underline),
                      //     ),
                      //   ],
                      // ),
                      // TextSpan(text: "\t ᛫ \n"),
                      TextSpan(
                        children: [
                          TextSpan(text: "\n🧼 "),
                          TextSpan(
                            text: "Chores:\n",
                            style: TextStyle(decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                      TextSpan(text: "\t ᛫ Bumped version number.\n"),
                      TextSpan(text: "\t ᛫ Added application icon 👁️.\n"),
                      TextSpan(text: "\t ᛫ Temporarily removed edit tag (its not working yet).\n"),

                      TextSpan(
                        children: [
                          TextSpan(text: "\n🐞"),
                          TextSpan(
                            text: "Known bugs:\n",
                            style: TextStyle(decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                      TextSpan(text: "\t ᛫ If project filters are changed before request completes, the newer request is not taken into account\n"),
                      // TextSpan(text: "\t ᛫ \n"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      // version 1.0.1
      Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ScrollbarTheme(
            data: ScrollbarThemeData(thumbVisibility: WidgetStatePropertyAll(true)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "What's new in 1.0.1?\n\n",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      TextSpan(
                        children: [
                          TextSpan(text: "✨ "),
                          TextSpan(
                            text: "Features:\n",
                            style: TextStyle(decoration: TextDecoration.underline),
                          ),
                        ],
                      ),

                      TextSpan(text: "\t ᛫ Update detection for binaries (msix are not working)"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      // version 1.0.1
      Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ScrollbarTheme(
            data: ScrollbarThemeData(thumbVisibility: WidgetStatePropertyAll(true)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "What's new in 1.0.2?\n\n",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      TextSpan(
                        children: [
                          TextSpan(text: "✨ "),
                          TextSpan(
                            text: "Features:\n",
                            style: TextStyle(decoration: TextDecoration.underline),
                          ),
                        ],
                      ),

                      TextSpan(text: "\t ᛫ Adds a manual refresh button\n"),
                      TextSpan(text: "\t ᛫ Also I can test if my update mechanic works now :)"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      // version 1.1.0
      Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ScrollbarTheme(
            data: ScrollbarThemeData(thumbVisibility: WidgetStatePropertyAll(true)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "What's new in 1.1.0?\n\n",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      TextSpan(
                        children: [
                          TextSpan(text: "✨ "),
                          TextSpan(
                            text: "Features:\n",
                            style: TextStyle(decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                      TextSpan(text: "\t ᛫ Renamed 'Overview' to 'Updates'\n"),
                      TextSpan(text: "\t ᛫ Updates can now be marked as Read or Unread\n"),
                      TextSpan(text: "\t ᛫ 💬 View issue comments in the comments tab (all formatting isnt handled)\n"),
                      // TextSpan(text: "\t ᛫ \n"),

                      // TextSpan(
                      //   children: [
                      //     TextSpan(text: "\n🪲 "),
                      //     TextSpan(
                      //       text: "Bug fixes:\n",
                      //       style: TextStyle(decoration: TextDecoration.underline),
                      //     ),
                      //   ],
                      // ),
                      // TextSpan(text: "\t ᛫ \n"),
                      TextSpan(
                        children: [
                          TextSpan(text: "\n🧼 "),
                          TextSpan(
                            text: "Chores:\n",
                            style: TextStyle(decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                      TextSpan(text: "\t ᛫ Bumped version number.\n"),

                      TextSpan(
                        children: [
                          TextSpan(text: "\n🐞"),
                          TextSpan(
                            text: "Known bugs:\n",
                            style: TextStyle(decoration: TextDecoration.underline),
                          ),
                        ],
                      ),
                      TextSpan(text: "\t ᛫ Emojis are not rendered in comments (there is no Atlassian API for that)\n"),
                      TextSpan(text: "\t ᛫ Newer request is dropped by UI if project filters are changed before request completes\n"),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
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
