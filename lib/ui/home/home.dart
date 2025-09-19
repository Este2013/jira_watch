import 'package:flutter/material.dart';
import 'package:jira_watcher/home/home_overview.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:jira_watcher/ui/settings.dart';

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
        return OverviewPage();
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
      }
    });

    super.initState();
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

                      TextSpan(text: "\t ᛫ Trying to get the update mechanic going\n"),
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
