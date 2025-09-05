import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jira_watch/models/data_model.dart';
import 'package:jira_watch/ui/home/overview_widgets/avatar.dart';
import 'package:jira_watch/ui/home/overview_widgets/issue_details/issue_details.dart';
import 'package:jira_watch/dao/api_dao.dart';
import 'package:jira_watch/models/settings_model.dart';
import 'package:jira_watch/ui/settings.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../ui/home/overview_widgets/issue_badge.dart';

// class OverviewPage extends StatefulWidget {
//   const OverviewPage({super.key});

//   @override
//   State<OverviewPage> createState() => _OverviewPageState();
// }

// class _OverviewPageState extends State<OverviewPage> {
//   final now = DateTime.now();
//   int pageShown = 0;
//   late StreamController<int> pageRequester;
//   late Stream<FutureOr<(Iterable<IssueData>, int)>> pageStream;
//   final ValueNotifier<int> maxPageNb = ValueNotifier(-1);

//   //TODO this is currently useless
//   Set<String> activeProjectFilters = {};

//   Widget? view;

//   @override
//   void initState() {
//     super.initState();
//     // add -1 to close the pageStream
//     pageRequester = StreamController()..add(0);
//     pageStream = IssuesModel().getLastUpdatedIssuesPageCached(
//       pageSize: 25,
//       pageIndexStream: pageRequester.stream,
//       filterByProjectCodes: activeProjectFilters.isEmpty ? null : activeProjectFilters.toList(),
//     ); // TODO isolate {nb per page}
//   }

//   @override
//   void dispose() {
//     pageRequester.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Row(
//         children: [
//           Expanded(
//             child: Column(
//               children: [
//                 // filters
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8.0),
//                   child: Row(
//                     children: [
//                       // TODO per project filtering
//                       Expanded(
//                         child: Card(
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Row(
//                               spacing: 8,
//                               children:
//                                   SettingsModel().starredProjects.value
//                                       ?.map(
//                                         (p) => ProjectFilteringButton(
//                                           projectCode: p,
//                                           activeFilters: activeProjectFilters,
//                                           toggleFilter: (code) => setState(() {
//                                             activeProjectFilters.toggle(p);
//                                             // TODO this handling is raelly bad. Find a better way. pageRequester.add(-1);
//                                             // pageStream = IssuesModel().getLastUpdatedIssuesPageCached(
//                                             //   pageSize: 25,
//                                             //   pageIndexStream: pageRequester.stream,
//                                             //   filterByProjectCodes: activeProjectFilters.isEmpty ? null : activeProjectFilters.toList(),
//                                             // );
//                                           }),
//                                         ),
//                                       )
//                                       .toList() ??
//                                   [],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 // list
//                 Expanded(
//                   child: StreamBuilder(
//                     stream: pageStream,
//                     builder: (context, snapshot) {
//                       print(snapshot.connectionState);
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return Center(child: CircularProgressIndicator());
//                       }
//                       if (snapshot.hasError) return ErrorWidget('${snapshot.error}');

//                       if (snapshot.hasData) {
//                         return FutureBuilder(
//                           key: ValueKey(pageShown),
//                           //TODO this thing needs to recieve actual Futures.
//                           future: Future.value(snapshot.data!),
//                           builder: (context, futureSnapshot) {
//                             if (futureSnapshot.connectionState == ConnectionState.waiting) {
//                               return Center(child: CircularProgressIndicator());
//                             }
//                             if (futureSnapshot.hasError) {
//                               return ErrorWidget('${futureSnapshot.error}\n\n${(futureSnapshot.error as Error).stackTrace}');
//                             }
//                             if (futureSnapshot.hasData) {
//                               WidgetsBinding.instance.addPostFrameCallback((_) {
//                                 maxPageNb.value = futureSnapshot.data!.$2 ~/ 25; // TODO isolate nb per page
//                               });
//                               return ListView(
//                                 children: [
//                                   ...futureSnapshot.data!.$1.map((t) => JiraTicketPreviewItem(ticket: t, updateView: updateView)),
//                                 ],
//                               );
//                             }
//                             return Center(child: CircularProgressIndicator(color: Colors.amber));
//                           },
//                         );
//                       }
//                       return Center(child: CircularProgressIndicator(color: Colors.amber));
//                     },
//                   ),
//                 ),

//                 AnimatedBuilder(
//                   animation: maxPageNb,
//                   builder: (context, _) {
//                     var pageWin = getPageWindow();

//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           IconButton(
//                             onPressed: () {
//                               pageRequester.add(0);
//                               setState(() => pageShown = 0);
//                             },
//                             icon: Icon(Symbols.keyboard_double_arrow_left),
//                           ),
//                           IconButton(
//                             onPressed: () {
//                               pageRequester.add(pageShown - 1);
//                               setState(() => pageShown--);
//                             },
//                             icon: Icon(Symbols.keyboard_arrow_left),
//                           ),

//                           for (var i = pageWin.$1; i <= pageWin.$2; i++)
//                             i == pageShown
//                                 ? IconButton.filled(
//                                     onPressed: null,
//                                     icon: Text(i.toString()),
//                                   )
//                                 : IconButton(
//                                     onPressed: () {
//                                       pageRequester.add(i);
//                                       setState(() => pageShown = i);
//                                     },
//                                     icon: Text(i.toString()),
//                                   ),

//                           IconButton(
//                             onPressed: () {
//                               pageRequester.add(pageShown + 1);
//                               setState(() => pageShown++);
//                             },
//                             icon: Icon(Symbols.keyboard_arrow_right),
//                           ),
//                           IconButton(
//                             onPressed: () {
//                               pageRequester.add(maxPageNb.value);
//                               setState(() => pageShown = maxPageNb.value);
//                             },
//                             icon: Icon(Symbols.keyboard_double_arrow_right),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//           VerticalDivider(),
//           Expanded(child: view ?? Placeholder()),
//         ],
//       ),
//     );
//   }

//   void updateView(Widget w) => setState(() => view = w);

//   (int, int) getPageWindow() {
//     if (maxPageNb.value < 5) {
//       // Less than 5 pages, show all
//       return (0, maxPageNb.value);
//     }
//     // Try to center pageShown in a window of 5
//     int minWindow = pageShown - 2;
//     int maxWindow = pageShown + 2;

//     if (minWindow < 0) {
//       // Shift right if at the start
//       maxWindow += -minWindow;
//       minWindow = 0;
//     }
//     if (maxWindow > maxPageNb.value) {
//       // Shift left if at the end
//       minWindow -= (maxWindow - maxPageNb.value);
//       maxWindow = maxPageNb.value;
//     }
//     minWindow = max(0, minWindow);
//     maxWindow = min(maxPageNb.value, maxWindow);

//     return (minWindow, maxWindow);
//   }
// }

class OverviewSynchronousPage extends StatefulWidget {
  const OverviewSynchronousPage({super.key});

  @override
  State<OverviewSynchronousPage> createState() => _OverviewSynchronousPageState();
}

class _OverviewSynchronousPageState extends State<OverviewSynchronousPage> {
  final now = DateTime.now();
  int pageShown = 0;
  late FutureOr<(Iterable<IssueData>, int)> futurePage;
  final ValueNotifier<int> maxPageNb = ValueNotifier(-1);

  Set<String> activeProjectFilters = {};
  String? timeFilter;

  Widget? view;

  @override
  void initState() {
    super.initState();
    // add -1 to close the pageStream
    // pageRequester = StreamController()..add(0);
    futurePage = DataModel().fetchLastUpdatedIssuesByPage(
      pageSize: 25,
      pageIndex: pageShown,
      filterByProjectCodes: activeProjectFilters.isEmpty ? null : activeProjectFilters.toList(),
    ); // TODO isolate {nb per page}
  }

  void startFetchingNewPage() => setState(() {
    futurePage = DataModel().fetchLastUpdatedIssuesByPage(
      pageSize: 25,
      pageIndex: pageShown,
      filterByProjectCodes: activeProjectFilters.isEmpty ? null : activeProjectFilters.toList(),
      before: beforeDateTime,
      after: afterDateTime,
    );
  });

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
                                                activeProjectFilters.toggle(p);
                                                pageShown = 0;
                                                startFetchingNewPage();
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
                          leadingIcon: Icon(Icons.calendar_today),
                          initialSelection: timeFilter,
                          dropdownMenuEntries: const [
                            DropdownMenuEntry(value: null, label: 'All time'),
                            DropdownMenuEntry(value: 'today', label: 'Today'),
                            DropdownMenuEntry(value: 'yesterday', label: 'Yesterday'),
                            DropdownMenuEntry(value: 'week', label: 'This week'),
                          ],
                          onSelected: (value) {
                            setState(() {
                              timeFilter = value;
                            });
                            startFetchingNewPage();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // list
              Expanded(
                child: FutureBuilder<(Iterable<IssueData>, int)>(
                  key: ValueKey(pageShown),

                  //TODO this thing needs to recieve actual Futures.
                  future: Future.value(futurePage),
                  builder: (context, futureSnapshot) {
                    if (futureSnapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (futureSnapshot.hasError) {
                      if (futureSnapshot.error.toString().endsWith('400')) {
                        // need to check which project has been deleted
                        return OnError400TestForProjects();
                      }
                      return ErrorWidget('${futureSnapshot.error}${(futureSnapshot.error is Error) ? '\n\n${(futureSnapshot.error as Error).stackTrace}' : ''}');
                    }
                    if (futureSnapshot.hasData) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (maxPageNb.value != futureSnapshot.data!.$2 ~/ 25) {
                          setState(() {
                            // TODO isolate nb per page
                            maxPageNb.value = futureSnapshot.data!.$2 ~/ 25;
                          });
                        }
                      });
                      return ListView(
                        children: [
                          ...futureSnapshot.data!.$1.map((t) => JiraTicketPreviewItem(ticket: t, updateView: updateView)),
                        ],
                      );
                    }
                    return Center(child: CircularProgressIndicator(color: Colors.amber));
                  },
                ),
              ),

              AnimatedBuilder(
                animation: maxPageNb,
                builder: (context, _) {
                  var pageWin = getPageWindow();

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              pageShown = 0;
                              startFetchingNewPage();
                            });
                          },
                          icon: Icon(Symbols.keyboard_double_arrow_left),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              pageShown--;
                              startFetchingNewPage();
                            });
                          },
                          icon: Icon(Symbols.keyboard_arrow_left),
                        ),

                        for (var i = pageWin.$1; i <= pageWin.$2; i++)
                          i == pageShown
                              ? IconButton.filled(
                                  onPressed: null,
                                  icon: Text(i.toString()),
                                )
                              : IconButton(
                                  onPressed: () {
                                    setState(() {
                                      pageShown = i;
                                      startFetchingNewPage();
                                    });
                                  },
                                  icon: Text(i.toString()),
                                ),

                        IconButton(
                          onPressed: () {
                            setState(() {
                              pageShown++;

                              startFetchingNewPage();
                            });
                          },
                          icon: Icon(Symbols.keyboard_arrow_right),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              pageShown = maxPageNb.value;

                              startFetchingNewPage();
                            });
                          },
                          icon: Icon(Symbols.keyboard_double_arrow_right),
                        ),
                      ],
                    ),
                  );
                },
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

  (int, int) getPageWindow() {
    if (maxPageNb.value < 5) {
      // Less than 5 pages, show all
      return (0, maxPageNb.value);
    }
    // Try to center pageShown in a window of 5
    int minWindow = pageShown - 2;
    int maxWindow = pageShown + 2;

    if (minWindow < 0) {
      // Shift right if at the start
      maxWindow += -minWindow;
      minWindow = 0;
    }
    if (maxWindow > maxPageNb.value) {
      // Shift left if at the end
      minWindow -= (maxWindow - maxPageNb.value);
      maxWindow = maxPageNb.value;
    }
    minWindow = max(0, minWindow);
    maxWindow = min(maxPageNb.value, maxWindow);

    return (minWindow, maxWindow);
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
    final summary = ticket['fields']['summary'] ?? 'No Title';

    return Card(
      color: colors['bg'],
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
              IssueHeaderRow(ticket),
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
