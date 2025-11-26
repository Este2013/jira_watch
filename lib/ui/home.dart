import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jira_watcher/ui/to_do_widgets/to_do_page.dart';
import 'package:jira_watcher/ui/updates_dialog.dart';
import 'package:jira_watcher/ui/updates_widgets/updates_home_view.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:jira_watcher/ui/settings.dart';
import 'package:jira_watcher/ui/utils/app_changelog.dart';
import 'package:jira_watcher/ui/utils/jira_ui_utils/jira_work_item_search.dart';
import 'package:loggy/loggy.dart';

import 'utils/under_constuction_notice.dart';

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
      case 'Work items':
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
        loggy.info('User selected "Updates" tab (#$index)');
        setState(() => _currentPage = 'Updates');
        break;
      case 1:
        loggy.info('User selected "Work items" tab (#$index)');
        setState(() => _currentPage = 'Work items');
        break;
      case 2:
        loggy.info('User selected "To do" tab (#$index)');
        setState(() => _currentPage = 'To do');
        break;
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
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) => fetchNewUpdateDataAndShowResults(context, ver, alertIfNoNewVersion: false));
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
      case 'Work items':
      default:
        return 'No subtitle for this page, call the dev.';
    }
  }

  @override
  Widget build(BuildContext context) => Shortcuts(
    shortcuts: {
      LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyF): OpenWorkItemSearchDialogIntent(),
    },
    child: Actions(
      actions: {
        OpenWorkItemSearchDialogIntent: OpenWorkItemSearchDialogAction(context),
      },
      child: Focus(
        autofocus: true,
        child: Scaffold(
          body: Row(
            children: [
              NavigationRail(
                groupAlignment: 0,
                selectedIndex: _selectedIndex,
                onDestinationSelected: _onRailSelect,
                labelType: NavigationRailLabelType.all,
                trailingAtBottom: true,
                leading: IconButton(
                  tooltip: 'Search (Ctrl F)',
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) => WorkItemSearchDialog(),
                  ),
                  icon: Icon(Icons.search),
                ),

                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.dashboard),
                    label: Text('Updates'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.bug_report),
                    label: Text('Work items'),
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
                      TodoPagePreLoadView(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
