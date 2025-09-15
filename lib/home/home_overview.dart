import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/ui/home/overview_widgets/avatar.dart';
import 'package:jira_watcher/ui/home/overview_widgets/issue_details/issue_details.dart';
import 'package:jira_watcher/dao/api_dao.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:jira_watcher/ui/home/time_utils.dart';
import 'package:jira_watcher/ui/settings.dart';

import '../ui/home/overview_widgets/issue_badge.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({super.key});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  final now = DateTime.now();

  // paging
  int pageShown = 0; // current page index
  final int pageSize = 25; // keep your existing page size here
  bool isLoading = false; // fetching in progress?
  bool hasMore = true; // more pages left?
  int? totalAvailable; // optional: if your API returns total in value.$2

  late FutureOr<(Iterable<IssueData>, bool, String?)> futurePage;
  String? nextPageToken;

  Set<String> activeProjectFilters = {};
  String? timeFilter;

  Widget? view;

  final ScrollController scrollController = ScrollController(keepScrollOffset: true);

  final List<IssueData> allLoadedIssues = [];

  @override
  void initState() {
    super.initState();

    // Start listening for bottom reach to trigger next page
    scrollController.addListener(_onScrollNearBottom);

    // initial load
    _resetAndFetchFirstPage();

    SettingsModel().starredProjects.addListener(
      () => setState(() {
        _resetAndFetchFirstPage();
      }),
    );
  }

  void _onScrollNearBottom() {
    // Fetch when we're within ~100px of the bottom
    if (!isLoading && hasMore && scrollController.position.pixels >= scrollController.position.maxScrollExtent - 100) {
      startFetchingNewPage();
    }
  }

  void _resetAndFetchFirstPage() {
    pageShown = 0;
    hasMore = true;
    isLoading = false;
    totalAvailable = null;
    nextPageToken = null;
    allLoadedIssues.clear();
    startFetchingNewPage();
  }

  void startFetchingNewPage() {
    if (isLoading || !hasMore) return;

    setState(() => isLoading = true);

    futurePage =
        DataModel().fetchLastUpdatedIssuesByPage(
            pageSize: pageSize,
            pageIndex: pageShown,
            filterByProjectCodes: activeProjectFilters.isEmpty ? null : activeProjectFilters.toList(),
            before: beforeDateTime,
            after: afterDateTime,
            nextPageToken: nextPageToken,
          )
          ..then((value) {
            final items = value.$1.toList();
            final isLastPage = value.$2;

            setState(() {
              pageShown += 1;
              nextPageToken = value.$3;
              allLoadedIssues.addAll(items);

              // Determine whether there are more pages:
              // Option A (robust if API provides total):

              hasMore = !isLastPage;

              isLoading = false;
            });
          }).catchError((e, st) {
            setState(() => isLoading = false);
            // (Optional) surface the error if you wish
            debugPrint('Paging error: $e\n$st');
          });
  }

  DateTime? get afterDateTime {
    switch (timeFilter) {
      case null:
        return null;
      case 'today':
        return DateTime(now.year, now.month, now.day);
      case 'yesterday':
        return DateTime(now.year, now.month, now.day).subtract(const Duration(days: 1));
      case 'week':
        {
          int weekday = now.weekday; // Monday = 1, Sunday = 7
          return DateTime(now.year, now.month, now.day).subtract(Duration(days: weekday - 1));
        }
      case 'last week':
        {
          int weekday = now.weekday; // Monday = 1, Sunday = 7
          return DateTime(now.year, now.month, now.day).subtract(Duration(days: weekday - 1)).subtract(Duration(days: 7));
        }
    }
    throw Exception();
    // return null;
  }

  DateTime? get beforeDateTime {
    switch (timeFilter) {
      case null:
        return null;
      case 'today':
        return null;
      case 'yesterday':
        return DateTime(now.year, now.month, now.day);
      case 'week':
        {
          int weekday = now.weekday; // Monday = 1, Sunday = 7
          DateTime startOfWeek = DateTime(now.year, now.month, now.day).subtract(Duration(days: weekday - 1));
          return DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day, 23, 59, 59, 999).add(const Duration(days: 6));
        }
      case 'last week':
        {
          int weekday = now.weekday; // Monday = 1, Sunday = 7
          DateTime startOfWeek = DateTime(now.year, now.month, now.day).subtract(Duration(days: weekday - 1)).subtract(Duration(days: 7));
          return DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day, 23, 59, 59, 999).add(const Duration(days: 6));
        }
    }
    throw Exception();
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      children: [
        Expanded(
          child: Column(
            children: [
              // filters
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  spacing: 8,
                  children: [
                    // per project filtering
                    Expanded(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            spacing: 8,
                            children:
                                (SettingsModel().starredProjects.value
                                          ?.map<Widget>(
                                            (p) => ProjectFilteringButton(
                                              projectCode: p,
                                              activeFilters: activeProjectFilters,
                                              toggleFilter: (code) => setState(() {
                                                activeProjectFilters.toggle(code); // (note: use the param "code", not "p")
                                                _resetAndFetchFirstPage();
                                              }),
                                            ),
                                          )
                                          .toList() ??
                                      <Widget>[])
                                  ..add(
                                    IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => SettingsDialog(initialPage: SettingsDialogPage.projects),
                                        );
                                      },
                                      icon: Icon(Icons.add),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                    // Time filtering
                    Row(
                      spacing: 8,
                      children: [
                        DropdownMenu<String?>(
                          enableSearch: false,
                          leadingIcon: Icon(Icons.calendar_today),
                          initialSelection: timeFilter,
                          dropdownMenuEntries: const [
                            DropdownMenuEntry(value: null, label: 'All time'),
                            DropdownMenuEntry(value: 'today', label: 'Today'),
                            DropdownMenuEntry(value: 'yesterday', label: 'Yesterday'),
                            DropdownMenuEntry(value: 'week', label: 'This week'),
                            DropdownMenuEntry(value: 'last week', label: 'Last week'),
                          ],
                          onSelected: (value) {
                            setState(() => timeFilter = value);
                            _resetAndFetchFirstPage();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // list
              Expanded(
                child: EdgeOverscrollListener(
                  childScrollCtrl: scrollController,
                  onOverscrollAtBottom: () {
                    if (!isLoading && hasMore) {
                      // If user overscrolls past the bottom, kick off next page too
                      startFetchingNewPage();
                    }
                  },
                  onOverscrollAtTop: null,
                  child: NotificationListener<OverscrollNotification>(
                    // keep your overscroll prints if you like
                    onNotification: (overscroll) {
                      if (overscroll.overscroll > 0 && !isLoading && hasMore) {
                        // If user overscrolls past the bottom, kick off next page too
                        startFetchingNewPage();
                      }
                      return false;
                    },
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: allLoadedIssues.length + (isLoading || hasMore ? 1 : 0), // +1 for footer
                      itemBuilder: (context, index) {
                        if (index < allLoadedIssues.length) {
                          final t = allLoadedIssues[index];
                          return JiraTicketPreviewItem(ticket: t, updateView: updateView);
                        }

                        // Footer row: show a loader while fetching; when finished and !hasMore, show a subtle end cap.
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Center(
                            child: isLoading ? const SizedBox(height: 24, width: 24, child: CircularProgressIndicator(strokeWidth: 2)) : const Text('No more items'),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        VerticalDivider(),
        Expanded(child: view ?? Placeholder()),
      ],
    ),
  );

  void updateView(Widget w) => setState(() => view = w);

  @override
  void dispose() {
    scrollController.removeListener(_onScrollNearBottom);
    scrollController.dispose();
    super.dispose();
  }
}

class ProjectFilteringButton extends StatelessWidget {
  const ProjectFilteringButton({
    super.key,
    required this.projectCode,
    required this.activeFilters,
    required this.toggleFilter,
  });

  final String projectCode;
  final Set<String> activeFilters;
  final void Function(String code) toggleFilter;

  @override
  Widget build(BuildContext context) => ClipOval(
    child: Material(
      child: InkWell(
        onTap: () => toggleFilter(projectCode),
        child: Tooltip(
          message: projectCode,
          child: Builder(
            builder: (context) {
              Widget base = ClipOval(child: JiraProjectAvatar(projectCode: projectCode));
              if (activeFilters.contains(projectCode)) {
                base = Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.green, width: 2),
                  ),
                  padding: EdgeInsets.all(2),
                  child: base,
                );
              }

              return base;
            },
          ),
        ),
      ),
    ),
  );
}

class JiraTicketPreviewItem extends StatelessWidget {
  final dynamic ticket;
  final Function(Widget)? updateView;

  const JiraTicketPreviewItem({super.key, required this.ticket, this.updateView});

  @override
  Widget build(BuildContext context) {
    final colors = _ticketColors(context, ticket);
    final fields = ticket['fields'] ?? {};

    final summary = fields['summary'] ?? 'No Title';
    final updated = fields['updated'] as String? ?? '';
    final lastUpdateData = (ticket['changelog']['histories'] as List).firstOrNull;
    // print(lastUpdateData);

    return Card(
      clipBehavior: Clip.hardEdge,
      color: colors['bg']?.withAlpha(Theme.brightnessOf(context) == Brightness.light ? 255 : 50),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: colors['border']!, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.all(4),
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IssueLinkWithParentsRow(ticket),
                  const Spacer(),

                  TimeAgoDisplay(timeStr: updated),
                  Text(
                    ', by ',
                    style: TextStyle(fontSize: 12, color: Theme.of(context).brightness == Brightness.light ? Colors.grey[700] : Colors.grey[300]),
                  ),
                  SizedBox.square(
                    dimension: 24,
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(10000),
                      child: lastUpdateData == null
                          ? Tooltip(
                              message: fields['creator']['displayName'],
                              child: JiraAvatar(key: Key(ticket['id']), url: fields['creator']['avatarUrls']['32x32']),
                            )
                          : Tooltip(
                              message: lastUpdateData['author']['displayName'],
                              child: JiraAvatar(key: Key(lastUpdateData['id']), url: lastUpdateData['author']['avatarUrls']['32x32']),
                            ),
                    ),
                  ),
                ],
              ),
              Text(
                summary,
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        onTap: () => updateView?.call(
          IssueDetailsView(
            ticket,
            key: Key(ticket.data['key']),
          ),
        ),
      ),
    );
  }

  Map<String, Color> _ticketColors(context, ticket) {
    var type = ticket['fields']['issuetype']['name'];
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    switch (type) {
      case 'Bug':
        return {
          'bg': isLightTheme ? Colors.red.shade50 : Colors.red.shade900,
          'border': Colors.red.shade700,
        };
      case 'Task':
        return {
          'bg': isLightTheme ? Colors.blue.shade50 : Colors.blue.shade900,
          'border': Colors.blue.shade700,
        };
      case 'Story':
        return {
          'bg': isLightTheme ? Colors.green.shade50 : Colors.green.shade900,
          'border': Colors.green.shade700,
        };
      case 'Epic':
        return {
          'bg': isLightTheme ? Colors.purple.shade50 : Colors.purple.shade900,
          'border': Colors.purple.shade700,
        };
      default:
        return {
          'bg': isLightTheme ? Colors.grey.shade50 : Colors.grey.shade900,
          'border': Colors.grey.shade700,
        };
    }
  }
}

class OnError400TestForProjects extends StatefulWidget {
  const OnError400TestForProjects({super.key});

  @override
  State<OnError400TestForProjects> createState() => _OnError400TestForProjectsState();
}

class _OnError400TestForProjectsState extends State<OnError400TestForProjects> {
  late List<Future> projectsData;
  @override
  void initState() {
    projectsData = [for (var p in SettingsModel().starredProjects.value ?? []) DataModel().fetchSingleProject(p)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
          color: Theme.of(context).colorScheme.errorContainer,
          child: Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'An error occured while fetching your projects data',
                  style: Theme.of(context).textTheme.titleLarge!.merge(TextStyle(color: Theme.of(context).colorScheme.onErrorContainer)),
                ),
                Text(
                  'Error 404: Some of the projects might have been deleted',
                  style: Theme.of(context).textTheme.titleMedium!.merge(TextStyle(color: Theme.of(context).colorScheme.onErrorContainer)),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: projectsData.length,
            itemBuilder: (context, index) {
              return FutureBuilder(
                future: projectsData[index],
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return ListTile(
                      title: Text('Checking project ${SettingsModel().starredProjects.value?[index] ?? ''}...'),
                      trailing: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    final errorMsg = snapshot.error.toString();
                    if (errorMsg.endsWith('400') || errorMsg.endsWith('404')) {
                      return ListTile(
                        title: Text('Project ${SettingsModel().starredProjects.value?[index] ?? ''}'),
                        subtitle: Text('Status: Error 400 - Project may have been deleted or is inaccessible.'),
                        leading: Icon(Icons.error, color: Colors.red),
                        trailing: IconButton(
                          onPressed: () => SettingsModel().starredProjects.value = List.from(SettingsModel().starredProjects.value?.where((p) => p != SettingsModel().starredProjects.value?[index]) ?? []),
                          icon: Icon(Icons.delete_forever),
                          tooltip: 'Remove from my starred projects',
                          //TODO make this refresh the main page (need to listen to starred projects in the main page)
                        ),
                      );
                    }
                    return ListTile(
                      title: Text('Project ${SettingsModel().starredProjects.value?[index] ?? ''}'),
                      subtitle: Text('Status: ${snapshot.error}'),
                      leading: Icon(Icons.error_outline, color: Colors.orange),
                    );
                  }
                  return ListTile(
                    title: Text('Project ${SettingsModel().starredProjects.value?[index] ?? ''}'),
                    subtitle: Text('Status: OK'),
                    leading: Icon(Icons.check_circle, color: Colors.green),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

extension on Set {
  void toggle(element) {
    if (contains(element)) {
      remove(element);
      return;
    }
    add(element);
  }
}

class EdgeOverscrollListener extends StatefulWidget {
  const EdgeOverscrollListener({super.key, required this.child, required this.childScrollCtrl, required this.onOverscrollAtTop, required this.onOverscrollAtBottom});
  final Widget child;
  final ScrollController childScrollCtrl;

  final VoidCallback? onOverscrollAtTop, onOverscrollAtBottom;
  @override
  State<EdgeOverscrollListener> createState() => _EdgeOverscrollListenerState();
}

class _EdgeOverscrollListenerState extends State<EdgeOverscrollListener> {
  ScrollController get _controller => widget.childScrollCtrl;

  void _onPointerSignal(PointerSignalEvent event) {
    if (event is! PointerScrollEvent) return;
    if (!_controller.hasClients) return;

    final pos = _controller.position;
    final dy = event.scrollDelta.dy; // >0 scrolls down, <0 scrolls up

    final atTop = pos.pixels <= pos.minScrollExtent && !pos.outOfRange;
    final atBottom = pos.pixels >= pos.maxScrollExtent && !pos.outOfRange;

    if (dy > 0 && atBottom) {
      // user is trying to scroll further down past bottom
      widget.onOverscrollAtBottom?.call();
      // trigger your action here
    } else if (dy < 0 && atTop) {
      // user is trying to scroll further up past top
      widget.onOverscrollAtTop?.call();
      // trigger your action here
    }
  }

  @override
  Widget build(BuildContext context) => Listener(
    onPointerSignal: _onPointerSignal,
    child: widget.child,
  );
}
