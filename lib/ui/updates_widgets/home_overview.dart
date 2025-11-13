import 'dart:async';
import 'dart:math';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/ui/to_do_widgets/to_do_page.dart';
import 'package:jira_watcher/ui/utils/avatar.dart';
import 'package:jira_watcher/ui/updates_widgets/updates_view_single_ticket/single_ticket_view.dart';
import 'package:jira_watcher/dao/api_dao.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:jira_watcher/ui/utils/time_utils.dart';
import 'package:jira_watcher/ui/settings.dart';
import 'package:url_launcher/url_launcher.dart';

import 'issue_ui_elements.dart';

class UpdatesPage extends StatefulWidget {
  const UpdatesPage({super.key});

  @override
  State<UpdatesPage> createState() => _UpdatesPageState();
}

class _UpdatesPageState extends State<UpdatesPage> {
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
  dynamic timeFilter;

  IssueData? selectedTicket;

  final ScrollController scrollController = ScrollController(keepScrollOffset: true);

  final List<IssueData> allLoadedIssues = [];

  bool isAllowedToShowIssueDialog = true;
  bool isIssueDialogShown = false;

  @override
  void initState() {
    super.initState();

    // Start listening for bottom reach to trigger next page
    scrollController.addListener(_onScrollNearBottom);

    // Set any eventual filters from the previous session
    var filters = SettingsModel().filters.value;
    activeProjectFilters = ((filters['active_projects'] ?? []) as List).cast<String>().toSet();

    timeFilter = filters['time_filter'];
    if (timeFilter is List) {
      timeFilter = timeFilter.map((f) => DateTime.parse(f)).toList();
    }

    // initial load
    _resetAndFetchFirstPage();

    SettingsModel().starredProjects.addListener(_setStateResetAndFetchFirstPage);
  }

  void _saveFilters() {
    var filters = <String, dynamic>{};
    filters['active_projects'] = activeProjectFilters.toList();
    if (timeFilter is String?) {
      filters['time_filter'] = timeFilter;
    } else {
      filters['time_filter'] = (timeFilter as List).cast<DateTime>().map<String>((d) => d.toIso8601String()).toList();
    }

    SettingsModel().filters.value = filters;
  }

  void _onScrollNearBottom() {
    // Fetch when we're within ~100px of the bottom
    if (!isLoading && hasMore && scrollController.position.pixels >= scrollController.position.maxScrollExtent - 100) {
      startFetchingNewPage();
    }
  }

  void _setStateResetAndFetchFirstPage() => setState(() {
    _resetAndFetchFirstPage();
  });
  void _resetAndFetchFirstPage() {
    pageShown = 0;
    hasMore = true;
    isLoading = false;
    totalAvailable = null;
    nextPageToken = null;
    allLoadedIssues.clear();
    startFetchingNewPage();
  }

  Future<void> startFetchingNewPage() {
    if (isLoading || !hasMore) return Future.value();

    setState(() => isLoading = true);

    return futurePage =
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
    if (timeFilter is String?) {
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
    }
    if (timeFilter is List) {
      return timeFilter.first;
    }
    throw Exception();
    // return null;
  }

  DateTime? get beforeDateTime {
    if (timeFilter is String?) {
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
    }
    if (timeFilter is List) {
      return timeFilter.last;
    }
    throw Exception();
  }

  @override
  Widget build(BuildContext context) {
    var noProjectDisplay = Center(
      child: Column(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('No project is selected'),
          FilledButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => SettingsDialog(initialPage: SettingsDialogPage.projects),
              );
            },
            child: const Text('Choose my projects'),
          ),
        ],
      ),
    );
    if (SettingsModel().starredProjects.value?.isEmpty ?? true) {
      return noProjectDisplay;
    }

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) => loadMoreIfNoScrollPossible());

    return LayoutBuilder(
      builder: (context, constraints) {
        double minSizeForLargeView = 1200;
        if (isAllowedToShowIssueDialog && !isIssueDialogShown && selectedTicket != null && minSizeForLargeView >= constraints.maxWidth && (ModalRoute.of(context)?.isCurrent ?? true)) {
          // there is a selection AND
          // size is too small for side-by-side AND
          // there is no open dialog
          //  => we show selected ticket in a dialog

          SchedulerBinding.instance.addPostFrameCallback(
            (_) {
              showDialog(
                context: context,
                builder: (_) => SingleTicketDialog(
                  selectedTicket!,
                  key: Key(selectedTicket!.data['key']),
                ),
              ).whenComplete(
                () => setState(() {
                  isIssueDialogShown = false;
                }),
              );
              setState(() {
                isIssueDialogShown = true;
                isAllowedToShowIssueDialog = false;
              });
            },
          );
        } else if (isIssueDialogShown && minSizeForLargeView < constraints.maxWidth) {
          // the dialog is shown but we have enough space to show it separately
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) => Navigator.of(context).pop());
        }
        if (minSizeForLargeView < constraints.maxWidth && !isAllowedToShowIssueDialog) {
          SchedulerBinding.instance.addPostFrameCallback(
            (_) => setState(() {
              isAllowedToShowIssueDialog = true;
            }),
          );
        }
        return Padding(
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
                            child: ProjectFilteringRow(
                              activeProjectFilters: activeProjectFilters,
                              toggleProjectCode: (code) => setState(() {
                                activeProjectFilters.toggle(code);
                                _resetAndFetchFirstPage();
                                _saveFilters();
                              }),
                            ),
                          ),
                          TimeFilterDropdown(
                            init: timeFilter,
                            save: (data) {
                              setState(() => timeFilter = data);
                              _saveFilters();
                              _resetAndFetchFirstPage();
                            },
                          ),
                          IconButton(
                            onPressed: _resetAndFetchFirstPage,
                            icon: Icon(Icons.refresh),
                            tooltip: 'Refresh',
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
                          child: FutureBuilder(
                            future: DataModel().issueMarkedAsReadTime(),
                            builder: (_, _) {
                              return ListView.builder(
                                controller: scrollController,
                                itemCount: allLoadedIssues.length + (isLoading || hasMore ? 1 : 0), // +1 for footer
                                itemBuilder: (context, index) {
                                  if (index < allLoadedIssues.length) {
                                    final t = allLoadedIssues[index];
                                    return JiraTicketPreviewItem(
                                      key: Key(t.key ?? ''),
                                      ticket: t,
                                      updateView: selectTicket,
                                      isSelected: selectedTicket != null && selectedTicket?.key == t.key,
                                      changedSize: loadMoreIfNoScrollPossible,
                                    );
                                  }

                                  // Footer row: show a loader while fetching; when finished and !hasMore, show a subtle end cap.
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                                    child: Center(
                                      child: isLoading
                                          ? const SizedBox(
                                              height: 24,
                                              width: 24,
                                              child: CircularProgressIndicator(strokeWidth: 2),
                                            )
                                          : noProjectDisplay,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (minSizeForLargeView < constraints.maxWidth) VerticalDivider(),
              if (minSizeForLargeView < constraints.maxWidth)
                Expanded(
                  child: selectedTicket == null
                      ? Placeholder()
                      : SingleTicketView(
                          selectedTicket!,
                          key: Key(selectedTicket!.data['key']),
                        ),
                ),
            ],
          ),
        );
      },
    );
  }

  void selectTicket(IssueData tkt) {
    setState(() {
      selectedTicket = tkt;
      isAllowedToShowIssueDialog = true;
    });
  }

  @override
  void dispose() {
    scrollController.removeListener(_onScrollNearBottom);
    scrollController.dispose();
    SettingsModel().starredProjects.removeListener(_setStateResetAndFetchFirstPage);
    super.dispose();
  }

  void loadMoreIfNoScrollPossible() {
    if (scrollController.position.maxScrollExtent == 0.0) {
      startFetchingNewPage().whenComplete(
        () => SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
          loadMoreIfNoScrollPossible;
        }),
      );
    }
  }
}

class ProjectFilteringRow extends StatelessWidget {
  const ProjectFilteringRow({super.key, required this.activeProjectFilters, required this.toggleProjectCode});
  final void Function(String projectCode) toggleProjectCode;
  final Set<String> activeProjectFilters;

  @override
  Widget build(BuildContext context) => Card(
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
                          toggleFilter: toggleProjectCode,
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
  );
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
  Widget build(BuildContext context) {
    Widget base = ClipOval(
      child: JiraProjectAvatar(key: Key('Avatar of $projectCode'), projectCode: projectCode),
    );

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

    return ClipOval(
      child: Material(
        child: InkWell(
          onTap: () => toggleFilter(projectCode),
          child: Tooltip(message: projectCode, child: base),
        ),
      ),
    );
  }
}

class JiraTicketPreviewItem extends StatefulWidget {
  final IssueData ticket;
  final Function(IssueData ticket)? updateView;
  final Function()? changedSize;
  final bool isSelected;

  const JiraTicketPreviewItem({super.key, required this.ticket, this.updateView, required this.changedSize, required this.isSelected});

  @override
  State<JiraTicketPreviewItem> createState() => _JiraTicketPreviewItemState();
}

class _JiraTicketPreviewItemState extends State<JiraTicketPreviewItem> {
  late DateTime? lastReadTime;

  @override
  void initState() {
    lastReadTime = DataModel().syncIssueMarkedAsReadTimeCache?[widget.ticket.key];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final colors = _ticketColors(context, widget.ticket);
    final fields = widget.ticket['fields'] ?? {};

    final summary = fields['summary'] ?? 'No Title';
    final updated = fields['updated'] as String? ?? '';
    final lastUpdateData = (widget.ticket['changelog']['histories'] as List).firstOrNull;
    bool lastEditWasAComment;
    if (lastUpdateData == null) {
      lastEditWasAComment = ((fields['comment']?['comments'] ?? []) as List).isNotEmpty;
    } else {
      lastEditWasAComment = DateTime.parse(lastUpdateData['created']).isBefore(DateTime.tryParse(((fields['comment']?['comments'] ?? []) as List).firstOrNull?['updated'] ?? '') ?? DateTime(0));
    }

    return AnimatedBuilder(
      animation: Listenable.merge([SettingsModel().markAsReadOnOpen, SettingsModel().useCompactTicketDisplay]),

      builder: (context, _) {
        bool shouldMarkAsReadOnOpen = SettingsModel().markAsReadOnOpen.value;
        String useCompactMode = SettingsModel().useCompactTicketDisplay.value;
        DateTime? updatedTime = DateTime.parse(updated);
        bool isRead = lastReadTime != null ? lastReadTime!.isAfter(updatedTime) || lastReadTime!.isAtSameMomentAs(updatedTime) : false;
        var optionsWhenSelected = Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 2),
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(4),
            child: BottomNavigationBar(
              key: ValueKey(isRead),
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              elevation: 0,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.mark_as_unread), label: isRead ? 'Mark as unread' : 'Mark as read'),
                BottomNavigationBarItem(
                  icon: Transform.rotate(angle: pi / 4, child: Icon(Icons.push_pin)),
                  label: 'Keep for later',
                ),
                BottomNavigationBarItem(icon: Icon(Icons.assignment_add), label: 'Add to tasks'),
                BottomNavigationBarItem(icon: Icon(Icons.open_in_browser), label: 'View on website'),
              ],
              onTap: (value) {
                // Mark as (un)reads
                if (value == 0) {
                  if (widget.ticket.key == null) return;
                  var updatedTime = DateTime.parse(updated);

                  DataModel().markAsRead(widget.ticket.key!, updatedTime, isRead: !isRead);
                  setState(() {
                    lastReadTime = !isRead ? updatedTime : null;
                  });
                }
                // Keep for later
                else if (value == 1) {
                  ToDoTasksModel()
                      .createNewTask(
                        title: '${widget.ticket.key} — ${widget.ticket.fields?['summary']}',
                        ticketKeys: [widget.ticket.key!],
                      )
                      .whenComplete(
                        // ignore: use_build_context_synchronously
                        () => ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Saved in your "To do" queue as "${widget.ticket.key}"'),
                          ),
                        ),
                      );
                }
                // Add to tasks
                else if (value == 2) {
                  showDialog(
                    context: context,
                    builder: (context) => AddIssueToDoDialog(widget.ticket),
                  );
                }
                // View on website
                else if (value == 3) {
                  String? getTicketUrl(dynamic ticketKey) {
                    final domain = APIDao().domain;
                    if (domain != null && ticketKey != null) {
                      return 'https://$domain/browse/$ticketKey';
                    }
                    return null;
                  }

                  var ticketUrl = getTicketUrl(widget.ticket.key);
                  if (ticketUrl != null) {
                    launchUrl(Uri.parse(ticketUrl));
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Something went wrong'),
                        content: Text('The given ticketUrl is null?\nFor ticket key: ${widget.ticket.key}, domain ${APIDao().domain}'),
                      ),
                    );
                  }
                }
              },
            ),
          ),
        );
        var showAsCompact = (useCompactMode == 'Always' || (useCompactMode == 'When issue was read' && !widget.isSelected && isRead));

        return Card(
          clipBehavior: Clip.hardEdge,
          color: colors['bg']?.withAlpha(Theme.brightnessOf(context) == Brightness.light ? 255 : 50),
          shape: isRead
              ? null
              : RoundedRectangleBorder(
                  side: BorderSide(color: colors['border']!, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
          margin: EdgeInsets.all(4),
          child: AnimatedSize(
            duration: Durations.medium1,
            onEnd: widget.changedSize,
            child: InkWell(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IssueLinkWithParentsRow(widget.ticket, compact: showAsCompact),
                        if (!showAsCompact)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: TicketStatusIndicator(issue: widget.ticket),
                          ),
                        if (showAsCompact)
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                summary,
                                style: Theme.of(context).textTheme.titleMedium,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                        else
                          Spacer(),

                        if (!showAsCompact) TimeAgoDisplay(timeStr: updated),
                        if (!showAsCompact)
                          Text(
                            ', by ',
                            style: TextStyle(fontSize: 12, color: Theme.of(context).brightness == Brightness.light ? Colors.grey[700] : Colors.grey[300]),
                          ),
                        SizedBox.square(
                          dimension: 24,
                          child: Builder(
                            builder: (context) {
                              var updatorData = lastEditWasAComment
                                  ? widget.ticket.fields!['comment']['comments'].last['author']
                                  : lastUpdateData == null
                                  ? fields['creator']
                                  : lastUpdateData['author'];
                              return ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(10000),
                                child: Tooltip(
                                  message: showAsCompact
                                      ? '${updatorData['displayName']}\n${(lastUpdateData == null && !lastEditWasAComment)
                                            ? 'Created this issue'
                                            : (lastEditWasAComment)
                                            ? 'Commented'
                                            : 'Changed ${((lastUpdateData['items'] as List).firstOrNull?['field'])}'}'
                                      : updatorData['displayName'],
                                  child: JiraAvatar(key: Key(widget.ticket['id']), url: updatorData['avatarUrls']['32x32']),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    if (!showAsCompact)
                      Row(
                        spacing: 16,
                        children: [
                          Expanded(
                            child: Text(
                              summary,
                              style: Theme.of(context).textTheme.titleMedium,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            (lastUpdateData == null && !lastEditWasAComment)
                                ? 'Created this issue'
                                : (!lastEditWasAComment)
                                ? 'Changed ${((lastUpdateData['items'] as List).firstOrNull?['field'])}'
                                : 'Commented',
                            style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).brightness == Brightness.light ? Colors.grey[700] : Colors.grey[300],
                            ),
                          ),
                        ],
                      ),
                    if (widget.isSelected) optionsWhenSelected,
                  ],
                ),
              ),
              onTap: () async {
                if (shouldMarkAsReadOnOpen && widget.ticket.key != null) {
                  var updatedTime = DateTime.parse(updated);
                  DataModel().markAsRead(widget.ticket.key!, updatedTime);
                  setState(() {
                    lastReadTime = updatedTime;
                  });
                }
                widget.updateView?.call(widget.ticket);
              },
            ),
          ),
        );
      },
    );
  }

  Map<String, Color> _ticketColors(BuildContext context, IssueData ticket) {
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
      case 'Improvement':
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

extension<T> on Set<T> {
  void toggle(T element) {
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

class TimeFilterDropdown extends StatefulWidget {
  const TimeFilterDropdown({super.key, required this.save, required this.init});

  final Object? init;
  final void Function(dynamic data) save;

  @override
  State<TimeFilterDropdown> createState() => _TimeFilterDropdownState();
}

class _TimeFilterDropdownState extends State<TimeFilterDropdown> {
  // What the dropdown visually shows as the selected item.
  // Values: null (All time), 'today', 'yesterday', 'week', 'last week', 'custom'
  String? _dropdownSelection; // start on "All time"

  // The actual filter you apply: either a preset string OR a JSON map.
  // Examples:
  //   'today' | 'yesterday' | 'week' | 'last week'
  //   or {"start":"2025-10-01","end":null}
  Object? _timeFilterData;

  @override
  void initState() {
    super.initState();
    _timeFilterData = widget.init;
    _dropdownSelection = widget.init is String? ? widget.init as String? : 'custom';
  }

  void _saveFilters() {
    widget.save(_timeFilterData);
  }

  @override
  Widget build(BuildContext context) => DropdownMenu<String?>(
    enableSearch: false,
    leadingIcon: const Icon(Icons.calendar_today),
    initialSelection: _dropdownSelection,
    dropdownMenuEntries: const [
      DropdownMenuEntry(value: null, label: 'All time'),
      DropdownMenuEntry(value: 'today', label: 'Today'),
      DropdownMenuEntry(value: 'yesterday', label: 'Yesterday'),
      DropdownMenuEntry(value: 'week', label: 'This week'),
      DropdownMenuEntry(value: 'last week', label: 'Last week'),
      DropdownMenuEntry(value: 'custom', label: 'Custom range'),
    ],
    onSelected: (value) async {
      if (value == 'custom') {
        final values = await showCalendarDatePicker2Dialog(
          context: context,
          config: CalendarDatePicker2WithActionButtonsConfig(
            calendarType: CalendarDatePicker2Type.range,
            firstDate: DateTime(1800),
          ),
          dialogSize: const Size(325, 370),
          borderRadius: BorderRadius.circular(15),
          // value: _dialogCalendarPickerValue,
        );
        if (values == null || values.isEmpty) {
          // user cancelled; keep previous selection as-is
          return;
        }
        if (values.length == 1) {
          values.add(DateTime.parse(values.first!.toIso8601String()));
        }
        values.last = values.last?.add(Duration(days: 1));
        setState(() {
          _timeFilterData = values;
          _dropdownSelection = 'custom';
        });
        _saveFilters();
        return;
      }

      // Presets (or All time)
      setState(() {
        _timeFilterData = value; // 'today' | 'yesterday' | ... | null
        _dropdownSelection = value; // reflect in UI
      });
      _saveFilters();
    },
  );
}
