import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jira_watcher/ui/to_do_widgets/to_do_main.dart';
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
                  child: SettingsButton(
                    childDialogBuilder: (context) {
                      loggy.info('User opens the settings dialog from navigation rail');
                      return SettingsDialog();
                    },
                  ),
                ),
              ),
              VerticalDivider(width: 1),
              Expanded(
                child: IndexedStack(
                  index: _selectedIndex,
                  children: [
                    // Updates page
                    Scaffold(
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
                      body: UpdatesPage(),
                    ),
                    UnderConstructionNotice(),
                    TodoPagePreLoadView(),
                  ],
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

class SettingsButton extends StatefulWidget {
  const SettingsButton({super.key, required this.childDialogBuilder});

  final WidgetBuilder childDialogBuilder;

  @override
  State<SettingsButton> createState() => _SettingsButtonState();
}

class _SettingsButtonState extends State<SettingsButton> with TickerProviderStateMixin {
  late final AnimationController _crankCtrl;
  late final Animation<double> _crankTurns;

  late final AnimationController _spinCtrl;

  @override
  void initState() {
    super.initState();

    _crankCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 180),
    );

    // "Crank back a bit": negative turns means rotate counter-clockwise.
    _crankTurns =
        Tween<double>(begin: 0.0, end: -0.08) // ~ -28.8°
            .chain(CurveTween(curve: Curves.easeOut))
            .animate(_crankCtrl);

    _spinCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
  }

  @override
  void dispose() {
    _crankCtrl.dispose();
    _spinCtrl.dispose();
    super.dispose();
  }

  Future<void> _openSettingsDialog() async {
    // 1) Crank back quickly
    await _crankCtrl.forward();

    // 2) Start spinning while dialog is open
    _spinCtrl.repeat();

    // 3) Show dialog (await closes)
    await showDialog(
      context: context,
      builder: widget.childDialogBuilder,
    );

    if (!mounted) return;

    // 4) Slow down: stop repeating, then ease-out to a "nice" stop
    _spinCtrl.stop();

    final current = _spinCtrl.value; // 0..1 fraction of a full turn
    final remaining = 1.0 - current; // how much left to complete this turn

    // Duration scales with remaining distance for a consistent feel
    final slowDownDuration = Duration(
      milliseconds: (250 + (remaining * 450)).round(), // ~250..700ms
    );

    await _spinCtrl.animateTo(
      1.0,
      duration: slowDownDuration,
      curve: Curves.easeOutCubic,
    );

    // reset spin back to 0 so next open starts clean
    _spinCtrl.value = 0.0;

    // 5) Settle: return crank to neutral
    await _crankCtrl.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _openSettingsDialog,
      icon: AnimatedBuilder(
        animation: Listenable.merge([_crankCtrl, _spinCtrl]),
        builder: (context, child) {
          // Total turns = crank offset + spinning turns
          final turns = _crankTurns.value + _spinCtrl.value;

          return Transform.rotate(
            angle: turns * 2 * math.pi,
            child: child,
          );
        },
        child: const Icon(Icons.settings),
      ),
    );
  }
}
