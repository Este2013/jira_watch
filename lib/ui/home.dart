import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jira_watcher/dao/updates_dao.dart';
import 'package:jira_watcher/main.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_logo.dart';
import 'package:jira_watcher/ui/utils/update_failed_dialog.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_main.dart';
import 'package:jira_watcher/ui/to_do_widgets/to_do_main.dart';
import 'package:jira_watcher/ui/updates_dialog.dart';
import 'package:jira_watcher/ui/updates_widgets/updates_home_view.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:jira_watcher/ui/settings.dart';
import 'package:jira_watcher/ui/utils/app_changelog.dart';
import 'package:jira_watcher/ui/utils/jira_ui_utils/jira_work_item_search.dart';
import 'package:loggy/loggy.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'utils/under_constuction_notice.dart';
import 'utils/widgets/animated_icons.dart';

enum HomePage {
  updates('Updates', Symbols.dashboard, 'View the latest changes made in projects you work on.'),
  workItems('Work items', Symbols.bug_report, null),
  toDo('To do', Symbols.assessment, 'Locally keep track of your own tasks.'),
  // GitLab draws its own mark instead of [icon]; see [buildIcon].
  gitlab('GitLab', Symbols.fork_right, 'Browse your GitLab projects, pipelines and releases.');

  const HomePage(this.title, this.icon, this.subtitle);

  final String title;
  final IconData icon;
  final String? subtitle;

  /// GitLab uses its own brand mark, which needs a different mechanism to fill on
  /// selection than a Material Symbol does.
  Widget buildIcon({required bool isSelected}) => switch (this) {
    HomePage.gitlab => GitLabTanukiIcon(isSelected: isSelected),
    _ => IconFilledOnSelection(Icon(icon), isSelected: isSelected),
  };
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with UiLoggy {
  HomePage _currentPage = HomePage.updates;

  void _onRailSelect(int index) {
    final page = HomePage.values[index];
    loggy.info('User selected "${page.title}" tab (#$index)');
    setState(() => _currentPage = page);
  }

  /// The one list that cannot be generated from [HomePage], so it is isolated
  /// here to keep the coupling explicit.
  List<Widget> _pageBodies() {
    assert(HomePage.values.length == 4);
    return [
      // Updates
      Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Expanded(child: Text(_currentPage.title)),
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
      // Work items
      UnderConstructionNotice(),
      // To do
      TodoPagePreLoadView(),
      // GitLab
      Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Expanded(child: Text(HomePage.gitlab.title)),
              Expanded(
                child: Center(
                  child: Text(
                    HomePage.gitlab.subtitle!,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).hintColor),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
          actions: [],
        ),
        body: GitLabPagePreLoadView(),
      ),
    ];
  }

  @override
  void initState() {
    // A rolled-back update would otherwise be invisible: the app simply reopens
    // on the old version with no explanation.
    if (updateAftermath.hadFailure) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => showDialog(
          context: context,
          builder: (context) => UpdateFailedDialog(report: updateAftermath.failureReport!),
        ),
      );
    }

    var lastVersion = SettingsModel().lastAppVersion;
    SettingsModel().appInfo.version.then((ver) {
      if (isVersionStrictlyAbove(ver, baseline: lastVersion)) {
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

  String currentPageSubtitle(HomePage currentPage) => currentPage.subtitle ?? 'No subtitle for this page, call the dev.';

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
                selectedIndex: _currentPage.index,
                onDestinationSelected: _onRailSelect,
                labelType: NavigationRailLabelType.all,
                trailingAtBottom: true,
                leading: IconButton(
                  tooltip: 'Search (Ctrl F)',
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) => WorkItemSearchDialog(),
                  ),
                  icon: Icon(Symbols.search),
                ),

                destinations: [
                  for (final page in HomePage.values)
                    NavigationRailDestination(
                      icon: page.buildIcon(isSelected: _currentPage == page),
                      label: Text(page.title),
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
                  index: _currentPage.index,
                  children: _pageBodies(),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
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
  late final AnimationController _fillCtrl;

  @override
  void initState() {
    super.initState();

    _crankCtrl = AnimationController(
      vsync: this,
      duration: Durations.medium1,
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

    _fillCtrl = AnimationController(
      vsync: this,
      duration: Durations.medium1,
      value: 0,
      lowerBound: 0,
      upperBound: 1,
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

    _fillCtrl.forward();

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

    _fillCtrl.animateTo(0);
    // 5) Settle: return crank to neutral
    await _crankCtrl.reverse();
  }

  @override
  Widget build(BuildContext context) => IconButton(
    onPressed: _openSettingsDialog,
    icon: AnimatedBuilder(
      animation: Listenable.merge([_crankCtrl, _spinCtrl, _fillCtrl]),
      builder: (context, child) {
        // Total turns = crank offset + spinning turns
        final turns = _crankTurns.value + _spinCtrl.value;

        return Transform.rotate(
          angle: turns * 2 * math.pi,
          child: Icon(Symbols.settings, fill: _fillCtrl.value),
        );
      },
    ),
  );
}
