import 'dart:async';
import 'dart:math';
import 'dart:math' as math;

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/to_do_tasks_models.dart';
import 'package:jira_watcher/ui/to_do_widgets/to_do_main.dart';
import 'package:jira_watcher/ui/utils/jira_ui_utils/jira_images.dart';
import 'package:jira_watcher/ui/updates_widgets/updates_view_single_work_item/single_work_item_view.dart';
import 'package:jira_watcher/dao/api_dao.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:jira_watcher/ui/utils/time_utils.dart';
import 'package:jira_watcher/ui/settings.dart';
import 'package:material_symbols_icons/symbols.dart';
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

  late FutureOr<(Iterable<JiraWorkItemData>, bool, String?)> futurePage;
  String? nextPageToken;

  Set<String> activeProjectFilters = {};
  dynamic timeFilter;

  JiraWorkItemData? selectedWorkItem;

  /// Multi-selection (independent from [selectedWorkItem], which only drives the
  /// right-side preview). Stores work item keys so it survives list rebuilds.
  final Set<String> multiSelectedKeys = {};

  /// Anchor index for Ctrl+Shift range selection.
  int? selectionAnchorIndex;

  final ScrollController scrollController = ScrollController(keepScrollOffset: true);

  final List<JiraWorkItemData> allLoadedWorkItems = [];

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
  Future _resetAndFetchFirstPage() {
    pageShown = 0;
    hasMore = true;
    isLoading = false;
    totalAvailable = null;
    nextPageToken = null;
    allLoadedWorkItems.clear();
    return startFetchingNewPage();
  }

  Future<void> startFetchingNewPage() {
    if (isLoading || !hasMore) return Future.value();

    setState(() => isLoading = true);

    return futurePage =
        DataModel().fetchLastUpdatedWorkItemsByPage(
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
              allLoadedWorkItems.addAll(items);

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
        case 'all time':
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
  }

  DateTime? get beforeDateTime {
    if (timeFilter is String?) {
      switch (timeFilter) {
        case 'all time':
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
        if (isAllowedToShowIssueDialog && !isIssueDialogShown && selectedWorkItem != null && minSizeForLargeView >= constraints.maxWidth && (ModalRoute.of(context)?.isCurrent ?? true)) {
          // there is a selection AND
          // size is too small for side-by-side AND
          // there is no open dialog
          //  => we show selected work item in a dialog
          SchedulerBinding.instance.addPostFrameCallback(
            (_) {
              showDialog(
                context: context,
                builder: (_) => SingleJiraWorkItemDialog(
                  selectedWorkItem!,
                  key: Key(selectedWorkItem!.data['key']),
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
        return Focus(
          // Observe bubbled key events (e.g. Escape) without stealing focus from
          // the filter fields or list.
          skipTraversal: true,
          onKeyEvent: (node, event) {
            if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.escape && multiSelectedKeys.isNotEmpty) {
              clearMultiSelection();
              return KeyEventResult.handled;
            }
            return KeyEventResult.ignored;
          },
          child: Padding(
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
                              init: timeFilter ?? 'all time',
                              save: (data) {
                                setState(() => timeFilter = data);
                                _saveFilters();
                                _resetAndFetchFirstPage();
                              },
                            ),
                            RefreshFutureIconButton(tooltip: 'Refresh', onRefresh: _resetAndFetchFirstPage),
                            // IconButton(
                            //   onPressed: _resetAndFetchFirstPage,
                            //   icon: Icon(Symbols.refresh),
                            //   tooltip: 'Refresh',
                            // ),
                          ],
                        ),
                      ),
                      // list
                      Expanded(
                        child: Stack(
                          children: [
                            EdgeOverscrollListener(
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
                                  future: DataModel().workItemMarkedAsReadTime(),
                                  builder: (_, _) {
                                    return ListView.builder(
                                      controller: scrollController,
                                      itemCount: allLoadedWorkItems.length + (isLoading || hasMore ? 1 : 0), // +1 for footer
                                      itemBuilder: (context, index) {
                                        if (index < allLoadedWorkItems.length) {
                                          final t = allLoadedWorkItems[index];
                                          final isMultiSelected = t.key != null && multiSelectedKeys.contains(t.key);
                                          final prevSelected = _isOutlinedAt(index - 1);
                                          final nextSelected = _isOutlinedAt(index + 1);
                                          return JiraWorkItemPreviewItem(
                                            key: Key(t.key ?? ''),
                                            workItem: t,
                                            index: index,
                                            updateView: selectWorkItem,
                                            isSelected: selectedWorkItem != null && selectedWorkItem?.key == t.key,
                                            isMultiSelected: isMultiSelected,
                                            groupTop: !prevSelected,
                                            groupBottom: !nextSelected,
                                            onToggleMultiSelect: _toggleMultiSelect,
                                            onRangeMultiSelect: _rangeMultiSelect,
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
                                                : FilledButton(
                                                    onPressed: () => startFetchingNewPage().whenComplete(
                                                      () => SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                                                        loadMoreIfNoScrollPossible;
                                                      }),
                                                    ),
                                                    child: Text('Load more'),
                                                  ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                            if (multiSelectedKeys.length >= 2)
                              Positioned(
                                right: 16,
                                bottom: 16,
                                child: SelectionFabMenu(
                                  count: multiSelectedKeys.length,
                                  allRead: _allSelectedRead,
                                  onMarkAllRead: () => _markAllAsRead(read: true),
                                  onMarkAllUnread: () => _markAllAsRead(read: false),
                                  onKeepForLater: _keepAllForLater,
                                  onAddToTask: _addAllToTask,
                                  onOpenAll: _openAllInBrowser,
                                  onClear: clearMultiSelection,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (minSizeForLargeView < constraints.maxWidth) VerticalDivider(),
                if (minSizeForLargeView < constraints.maxWidth)
                  Expanded(
                    child: selectedWorkItem == null
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Center(child: Text('← Select a work item in the list to your left to view its recent changes')),
                          )
                        : SingleJiraWorkItemView(
                            selectedWorkItem!,
                            key: Key(selectedWorkItem!.data['key']),
                          ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  void selectWorkItem(int index) {
    final tkt = allLoadedWorkItems[index];
    setState(() {
      // A plain click selects exactly this item (like a normal list selection),
      // becoming both the lone member of the selection and the anchor for any
      // following Ctrl+Shift range select, and previews it on the right.
      multiSelectedKeys.clear();
      if (tkt.key != null) multiSelectedKeys.add(tkt.key!);
      selectionAnchorIndex = index;
      selectedWorkItem = tkt;
      isAllowedToShowIssueDialog = true;
    });
  }

  void _toggleMultiSelect(int index) {
    final key = allLoadedWorkItems[index].key;
    if (key == null) return;
    setState(() {
      if (!multiSelectedKeys.remove(key)) {
        multiSelectedKeys.add(key);
      }
      selectionAnchorIndex = index;
    });
  }

  void _rangeMultiSelect(int index) {
    final anchor = selectionAnchorIndex ?? index;
    final start = min(anchor, index);
    final end = max(anchor, index);
    setState(() {
      for (var i = start; i <= end && i < allLoadedWorkItems.length; i++) {
        final key = allLoadedWorkItems[i].key;
        if (key != null) multiSelectedKeys.add(key);
      }
      selectionAnchorIndex = index;
    });
  }

  void clearMultiSelection() => setState(() {
    multiSelectedKeys.clear();
    selectionAnchorIndex = null;
  });

  List<JiraWorkItemData> get _selectedItems => allLoadedWorkItems.where((w) => w.key != null && multiSelectedKeys.contains(w.key)).toList();

  /// True when every selected item has already been read. Drives whether the FAB
  /// menu offers "Mark all as read" (default) or "Mark all as unread".
  bool get _allSelectedRead => _selectedItems.every((w) {
    final updated = w.fields?['updated'] as String?;
    if (updated == null) return true;
    final readTime = DataModel().syncWorkItemMarkedAsReadTimeCache?[w.key];
    if (readTime == null) return false;
    final updatedTime = DateTime.parse(updated);
    return readTime.isAfter(updatedTime) || readTime.isAtSameMomentAs(updatedTime);
  });

  /// Whether the item at [i] is selected (and thus outlined). The previewed item
  /// is a normal member of [multiSelectedKeys], so this is the single source of
  /// truth for both outlining and grouping.
  bool _isOutlinedAt(int i) {
    if (i < 0 || i >= allLoadedWorkItems.length) return false;
    final key = allLoadedWorkItems[i].key;
    return key != null && multiSelectedKeys.contains(key);
  }

  Future<void> _markAllAsRead({required bool read}) async {
    await DataModel().markAllAsRead(_selectedItems.map((e) => (e.key!, DateTime.parse(e.fields?['updated'] as String? ?? e.fields?['created']))), isRead: read);
    if (mounted) setState(() {});
  }

  void _keepAllForLater() {
    final keys = _selectedItems.map((w) => w.key!).toList();
    if (keys.isEmpty) return;
    final title = keys.length <= 3 ? keys.join(', ') : '${keys.length} work items';
    DataModel().todoTasks.createNewTask(title: title, workItemKeys: keys).whenComplete(() {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Saved ${keys.length} work items in your "To do" queue')),
      );
      clearMultiSelection();
    });
  }

  void _addAllToTask() {
    showDialog(
      context: context,
      builder: (context) => AddIssuesToDoDialog(_selectedItems),
    ).whenComplete(() {
      if (mounted) clearMultiSelection();
    });
  }

  Future<void> _openAllInBrowser() async {
    final items = _selectedItems;
    final domain = APIDao().domain;
    if (domain == null) return;
    if (items.length > 10) {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Open many tabs?'),
          content: Text('This will open ${items.length} browser tabs.'),
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(false), child: const Text('Cancel')),
            FilledButton(onPressed: () => Navigator.of(context).pop(true), child: const Text('Open all')),
          ],
        ),
      );
      if (confirmed != true) return;
    }
    for (final w in items) {
      if (w.key != null) {
        launchUrl(Uri.parse('https://$domain/browse/${w.key}'));
      }
    }
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
                  icon: Icon(Symbols.add),
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

class JiraWorkItemPreviewItem extends StatefulWidget {
  final JiraWorkItemData workItem;
  final int index;
  final void Function(int index)? updateView;
  final Function()? changedSize;

  /// Whether this item is the one shown in the right-side preview.
  final bool isSelected;

  /// Whether this item is part of the multi-selection (Ctrl / Ctrl+Shift click).
  final bool isMultiSelected;

  /// True when the multi-selected item directly above is not selected (start of a
  /// visual group) — used to round the top of the group outline.
  final bool groupTop;

  /// True when the multi-selected item directly below is not selected (end of a
  /// visual group) — used to round the bottom of the group outline.
  final bool groupBottom;

  final void Function(int index)? onToggleMultiSelect;
  final void Function(int index)? onRangeMultiSelect;

  const JiraWorkItemPreviewItem({
    super.key,
    required this.workItem,
    required this.index,
    this.updateView,
    required this.changedSize,
    required this.isSelected,
    this.isMultiSelected = false,
    this.groupTop = true,
    this.groupBottom = true,
    this.onToggleMultiSelect,
    this.onRangeMultiSelect,
  });

  @override
  State<JiraWorkItemPreviewItem> createState() => _JiraWorkItemPreviewItemState();
}

class _JiraWorkItemPreviewItemState extends State<JiraWorkItemPreviewItem> {
  /// Read state is derived from the shared cache on every build so that bulk
  /// "mark as read/unread" actions are reflected without recreating the item.
  DateTime? get lastReadTime => DataModel().syncWorkItemMarkedAsReadTimeCache?[widget.workItem.key];

  @override
  Widget build(BuildContext context) {
    final colors = _workItemColors(context, widget.workItem);
    final fields = widget.workItem['fields'] ?? {};

    final summary = fields['summary'] ?? 'No Title';
    final updated = fields['updated'] as String? ?? '';
    final lastUpdateData = (widget.workItem['changelog']['histories'] as List).firstOrNull;
    bool lastEditWasAComment;
    if (lastUpdateData == null) {
      lastEditWasAComment = ((fields['comment']?['comments'] ?? []) as List).isNotEmpty;
    } else {
      lastEditWasAComment = DateTime.parse(lastUpdateData['created']).isBefore(DateTime.tryParse(((fields['comment']?['comments'] ?? []) as List).firstOrNull?['updated'] ?? '') ?? DateTime(0));
    }

    return AnimatedBuilder(
      animation: Listenable.merge([SettingsModel().markAsReadOnOpen, SettingsModel().useCompactJiraWorkItemDisplay]),

      builder: (context, _) {
        bool shouldMarkAsReadOnOpen = SettingsModel().markAsReadOnOpen.value;
        String useCompactMode = SettingsModel().useCompactJiraWorkItemDisplay.value;
        DateTime? updatedTime = DateTime.parse(updated);
        bool isRead = lastReadTime != null ? lastReadTime!.isAfter(updatedTime) || lastReadTime!.isAtSameMomentAs(updatedTime) : false;

        var optionsWhenSelected = Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 2),
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(4),
            child: AnimatedBuilder(
              animation: ToDoTasksModel().toDoTasksControllers,
              builder: (context, _) {
                return BottomNavigationBar(
                  key: ValueKey(isRead),
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  items: [
                    BottomNavigationBarItem(icon: Icon(isRead ? Symbols.mark_email_unread : Symbols.mark_email_read), label: isRead ? 'Mark as unread' : 'Mark as read'),
                    BottomNavigationBarItem(
                      icon: Transform.rotate(angle: pi / 4, child: Icon(Symbols.push_pin)),
                      label: 'Keep for later',
                    ),
                    BottomNavigationBarItem(icon: Icon(Symbols.assignment_add), label: AddToTasksLabel.createLabelFor(widget.workItem)),
                    BottomNavigationBarItem(icon: Icon(Symbols.open_in_browser), label: 'View on website'),
                  ],
                  onTap: (value) {
                    // Mark as (un)reads
                    if (value == 0) {
                      markAsReadOrUnread(updated, isRead);
                    } else if (value == 1) {
                      keepForLater(context);
                    } else if (value == 2) {
                      addToTasks(context);
                    } else if (value == 3) {
                      viewInBrowser(context);
                    }
                  },
                );
              },
            ),
          ),
        );
        var showAsCompact = (useCompactMode == 'Always' || (useCompactMode == 'When issue was read' && !widget.isSelected && isRead));

        // Outline color that auto-adapts to the theme: near-white in dark mode,
        // near-black in light mode.
        final selectionColor = Theme.of(context).colorScheme.onSurface;

        // Outline every selected item. The previewed item is a normal member of
        // the selection, so this is driven purely by the multi-selection state.
        final showOutline = widget.isMultiSelected;
        final outlineTop = widget.groupTop;
        final outlineBottom = widget.groupBottom;
        // Spacing between items is preserved; the painter bridges this gap.
        const double cardGap = 8; // 4px bottom margin + 4px top margin

        Widget card = Card(
          clipBehavior: Clip.hardEdge,
          color: colors['bg']?.withAlpha(Theme.brightnessOf(context) == Brightness.light ? 255 : 50),
          shape: showOutline
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(outlineTop ? 8 : 0),
                    bottom: Radius.circular(outlineBottom ? 8 : 0),
                  ),
                )
              : isRead
              ? null
              : RoundedRectangleBorder(
                  side: BorderSide(color: colors['border']!, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
          margin: EdgeInsets.zero,
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
                      spacing: 12,
                      children: [
                        // Current assignee avatar at the lead of every entry.
                        Builder(
                          builder: (context) {
                            final assignee = fields['assignee'];
                            final avatarUrl = assignee?['avatarUrls']?['24x24'];
                            return SizedBox.square(
                              dimension: 24,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10000),
                                child: Tooltip(
                                  message: assignee != null ? 'Assigned to ${assignee['displayName']}' : 'Unassigned',
                                  child: avatarUrl != null ? JiraAvatar(key: Key('assignee-${widget.workItem['id']}'), url: avatarUrl) : Icon(Symbols.person_off, size: 18, color: Theme.of(context).disabledColor),
                                ),
                              ),
                            );
                          },
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  WorkItemLinkWithParentsRow(widget.workItem, compact: showAsCompact),
                                  const SizedBox(width: 8),
                                  // Middle region. The status chip slides between the left
                                  // edge (expanded) and the right edge (compact) of this
                                  // region. An invisible placeholder reserves the chip's
                                  // resting spot so the overlaid chip never overlaps text.
                                  Expanded(
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Row(
                                          children: showAsCompact
                                              ? [
                                                  Expanded(
                                                    child: Text(
                                                      summary,
                                                      style: Theme.of(context).textTheme.titleMedium,
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 8),
                                                  Visibility(
                                                    visible: false,
                                                    maintainSize: true,
                                                    maintainAnimation: true,
                                                    maintainState: true,
                                                    child: JiraWorkItemStatusIndicator(issue: widget.workItem),
                                                  ),
                                                ]
                                              : [
                                                  Visibility(
                                                    visible: false,
                                                    maintainSize: true,
                                                    maintainAnimation: true,
                                                    maintainState: true,
                                                    child: JiraWorkItemStatusIndicator(issue: widget.workItem),
                                                  ),
                                                  const Spacer(),
                                                  TimeAgoDisplay(timeStr: updated),
                                                  Text(
                                                    ', by ',
                                                    style: TextStyle(fontSize: 12, color: Theme.of(context).brightness == Brightness.light ? Colors.grey[700] : Colors.grey[300]),
                                                  ),
                                                ],
                                        ),
                                        AnimatedAlign(
                                          duration: Durations.medium1,
                                          curve: Curves.easeInOut,
                                          alignment: showAsCompact ? Alignment.centerRight : Alignment.centerLeft,
                                          child: JiraWorkItemStatusIndicator(issue: widget.workItem),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  SizedBox.square(
                                    dimension: 24,
                                    child: Builder(
                                      builder: (context) {
                                        var updatorData = lastEditWasAComment
                                            ? widget.workItem.fields!['comment']['comments'].last['author']
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
                                                      : 'Changed ${((lastUpdateData['items'] as List).firstOrNull?['field'])}'}\n${timeAgo(timeStr: updated)}'
                                                : updatorData['displayName'],
                                            child: JiraAvatar(key: Key(widget.workItem['id']), url: updatorData['avatarUrls']['32x32']),
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
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (widget.isSelected) optionsWhenSelected,
                  ],
                ),
              ),
              onTap: () async {
                final keyboard = HardwareKeyboard.instance;
                final ctrl = keyboard.isControlPressed || keyboard.isMetaPressed;
                final shift = keyboard.isShiftPressed;
                // Ctrl+Shift click: range select. Ctrl click: toggle. Both are
                // independent from the right-side preview.
                if (ctrl && shift) {
                  widget.onRangeMultiSelect?.call(widget.index);
                  return;
                } else if (ctrl) {
                  widget.onToggleMultiSelect?.call(widget.index);
                  return;
                }
                // Plain click: open in preview (and optionally mark as read).
                if (shouldMarkAsReadOnOpen && widget.workItem.key != null) {
                  var updatedTime = DateTime.parse(updated);
                  await DataModel().markAsRead(widget.workItem.key!, updatedTime);
                  if (mounted) setState(() {});
                }
                widget.updateView?.call(widget.index);
              },
              onSecondaryTapDown: (details) => showContextMenu(
                context,
                onItemSelected: (value) {},
                contextMenu: ContextMenu(
                  position: details.globalPosition,
                  entries: <ContextMenuEntry>[
                    MenuItem(
                      label: Center(
                        child: Text(widget.workItem.key ?? 'unknown key'),
                      ),
                      enabled: false,
                    ),
                    const MenuDivider(),
                    MenuItem(
                      label: Text('Mark as ${isRead ? "un" : ""}read'),
                      icon: Icon(isRead ? Symbols.mark_email_unread : Symbols.mark_email_read, fill: 1),
                      onSelected: (value) => markAsReadOrUnread(updated, isRead),
                    ),
                    MenuItem(
                      label: Text('Keep for later'),
                      icon: Transform.rotate(angle: pi / 4, child: const Icon(Symbols.keep, fill: 1)),
                      onSelected: (value) => keepForLater(context),
                    ),
                    MenuItem(
                      label: AddToTasksLabel(workItem: widget.workItem),
                      icon: const Icon(Symbols.assignment_add, fill: 1),
                      onSelected: (value) => addToTasks(context),
                    ),
                    MenuItem(
                      label: Text('View on website'),
                      icon: const Icon(Symbols.open_in_browser, fill: 1),
                      onSelected: (value) => viewInBrowser(context),
                    ),
                    const MenuDivider(),
                    MenuItem(
                      label: const Text('Copy identifier'),
                      icon: const Icon(Symbols.content_copy),
                      onSelected: (value) => widget.workItem.key != null ? Clipboard.setData(ClipboardData(text: widget.workItem.key!)) : null,
                    ),

                    MenuItem(
                      label: const Text('Copy link'),
                      icon: const Icon(Symbols.link, fill: 1),
                      onSelected: (value) => widget.workItem.key != null ? Clipboard.setData(ClipboardData(text: widget.workItem.key!)) : null,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
        // Always wrap in CustomPaint (null painter when not outlined) so the
        // widget tree structure stays stable across selection changes. A
        // conditional wrapper would re-parent the Card and reset the AnimatedSize
        // state, killing the expand/collapse animation.
        card = CustomPaint(
          foregroundPainter: showOutline
              ? _SelectionOutlinePainter(
                  color: selectionColor,
                  top: outlineTop,
                  bottom: outlineBottom,
                  radius: 8,
                  strokeWidth: 2,
                  gap: cardGap,
                )
              : null,
          child: card,
        );
        return Padding(padding: const EdgeInsets.all(4), child: card);
      },
    );
  }

  Future<void> markAsReadOrUnread(String updated, bool isRead) async {
    if (widget.workItem.key == null) return;
    var updatedTime = DateTime.parse(updated);

    await DataModel().markAsRead(widget.workItem.key!, updatedTime, isRead: !isRead);
    if (mounted) setState(() {});
  }

  Future<ToDoTask> keepForLater(BuildContext context) => DataModel().todoTasks
      .createNewTask(
        title: '${widget.workItem.key} — ${widget.workItem.fields?['summary']}',
        workItemKeys: [widget.workItem.key!],
      )
      .whenComplete(
        // ignore: use_build_context_synchronously
        () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Saved in your "To do" queue as "${widget.workItem.key}"'),
          ),
        ),
      );

  void addToTasks(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AddIssueToDoDialog(widget.workItem),
    );
  }

  void viewInBrowser(BuildContext context) {
    String? getWorkItemUrl(dynamic workItemKey) {
      final domain = APIDao().domain;
      if (domain != null && workItemKey != null) {
        return 'https://$domain/browse/$workItemKey';
      }
      return null;
    }

    var workItemURL = getWorkItemUrl(widget.workItem.key);
    if (workItemURL != null) {
      launchUrl(Uri.parse(workItemURL));
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Something went wrong'),
          content: Text('The given workItemURL is null?\nFor workItem key: ${widget.workItem.key}, domain ${APIDao().domain}'),
        ),
      );
    }
  }

  Map<String, Color> _workItemColors(BuildContext context, JiraWorkItemData workItem) {
    var type = workItem['fields']['issuetype']['name'];
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

class AddToTasksLabel extends StatelessWidget {
  const AddToTasksLabel({
    super.key,
    required this.workItem,
  });

  final JiraWorkItemData workItem;

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: DataModel().todoTasks.toDoTasksControllers,
    builder: (context, child) => Text(createLabelFor(workItem)),
  );

  static String createLabelFor(JiraWorkItemData workItem) {
    int taskCount = taskCountOfWorkItem(workItem);
    return 'Add to tasks${taskCount > 0 ? " ($taskCount)" : ""}';
  }

  static int taskCountOfWorkItem(JiraWorkItemData workItem) => workItem.key == null
      ? 0
      : DataModel().todoTasks.toDoTasksControllers.list
            .where(
              (task) => task.linkedWorkItems.list.any(
                (link) => link.contains(workItem.key!),
              ),
            )
            .toList()
            .length;
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
                        leading: Icon(Symbols.error, color: Colors.red),
                        trailing: IconButton(
                          onPressed: () => SettingsModel().starredProjects.value = List.from(SettingsModel().starredProjects.value?.where((p) => p != SettingsModel().starredProjects.value?[index]) ?? []),
                          icon: Icon(Symbols.delete_forever),
                          tooltip: 'Remove from my starred projects',
                        ),
                      );
                    }
                    return ListTile(
                      title: Text('Project ${SettingsModel().starredProjects.value?[index] ?? ''}'),
                      subtitle: Text('Status: ${snapshot.error}'),
                      leading: Icon(Symbols.error_outline, color: Colors.orange),
                    );
                  }
                  return ListTile(
                    title: Text('Project ${SettingsModel().starredProjects.value?[index] ?? ''}'),
                    subtitle: Text('Status: OK'),
                    leading: Icon(Symbols.check_circle, color: Colors.green),
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
  Widget build(BuildContext context) => DropdownMenu<String>(
    enableSearch: false,
    leadingIcon: const Icon(Symbols.calendar_today),
    initialSelection: _dropdownSelection,
    dropdownMenuEntries: const [
      DropdownMenuEntry(value: 'all time', label: 'All time'),
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

class RefreshFutureIconButton extends StatefulWidget {
  const RefreshFutureIconButton({
    super.key,
    required this.onRefresh,
    this.iconSize,
    this.tooltip,
    this.accelDuration = const Duration(milliseconds: 220),
    this.decelMinDuration = const Duration(milliseconds: 180),
    this.decelMaxDuration = const Duration(milliseconds: 650),
    this.fastSpinPeriod = const Duration(milliseconds: 320), // fast!
  });

  /// The work to perform. Animation runs until this Future completes.
  final Future<void> Function() onRefresh;

  final double? iconSize;
  final String? tooltip;

  /// Ease-in time (ramp up).
  final Duration accelDuration;

  /// Ease-out time range (scaled based on how much of the current turn remains).
  final Duration decelMinDuration;
  final Duration decelMaxDuration;

  /// How long one full rotation takes while "running".
  final Duration fastSpinPeriod;

  @override
  State<RefreshFutureIconButton> createState() => _RefreshFutureIconButtonState();
}

class _RefreshFutureIconButtonState extends State<RefreshFutureIconButton> with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;

  bool _running = false;

  @override
  void initState() {
    super.initState();
    // We'll change duration dynamically (accel/fast/decel),
    // so initial duration is just a placeholder.
    _ctrl = AnimationController(vsync: this, duration: widget.fastSpinPeriod);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  Future<void> _start() async {
    if (_running) return;
    setState(() => _running = true);

    // Ease-in into motion: animate a partial turn with curve.
    // (We keep it simple: start from 0 each time.)
    _ctrl
      ..stop()
      ..value = 0.0
      ..duration = widget.accelDuration;

    // Ramp up a bit (e.g. to 1/3 turn) with ease-in.
    await _ctrl.animateTo(0.33, curve: Curves.easeIn);

    if (!mounted) return;

    // Fast constant spinning while the Future runs.
    _ctrl.duration = widget.fastSpinPeriod;
    _ctrl.repeat();

    try {
      await widget.onRefresh();
    } finally {
      if (!mounted) return;

      // Ease-out to a clean stop: finish the current revolution smoothly.
      _ctrl.stop();

      final current = _ctrl.value; // 0..1
      final remaining = 1.0 - current; // 0..1

      int lerpInt(int a, int b, double t) => a + ((b - a) * t).round();

      final minMs = widget.decelMinDuration.inMilliseconds;
      final maxMs = widget.decelMaxDuration.inMilliseconds;

      // Longer decel if more distance remains; always eased-out.
      final decelMs = lerpInt(minMs, maxMs, remaining);
      _ctrl.duration = Duration(milliseconds: decelMs);

      await _ctrl.animateTo(1.0, curve: Curves.easeOutCubic);
      _ctrl.value = 0.0;

      if (mounted) setState(() => _running = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: widget.tooltip,
      onPressed: _start,
      iconSize: widget.iconSize,
      icon: AnimatedBuilder(
        animation: _ctrl,
        child: const Icon(Symbols.refresh),
        builder: (context, child) {
          return Transform.rotate(
            angle: _ctrl.value * 2 * math.pi,
            child: child,
          );
        },
      ),
    );
  }
}

/// Paints a continuous outline around a (group of) multi-selected item(s).
///
/// Only the outer corners of a contiguous group are rounded: [top]/[bottom]
/// control whether the respective edge is closed (rounded) or left open so the
/// side lines of consecutive selected items meet seamlessly.
class _SelectionOutlinePainter extends CustomPainter {
  _SelectionOutlinePainter({
    required this.color,
    required this.top,
    required this.bottom,
    required this.radius,
    required this.strokeWidth,
    this.gap = 0,
  });

  final Color color;
  final bool top;
  final bool bottom;
  final double radius;
  final double strokeWidth;

  /// How far an open edge extends past the card bounds into the inter-card gap
  /// so the side rails of consecutive selected items join across the spacing.
  final double gap;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final inset = strokeWidth / 2;
    final left = inset;
    final right = size.width - inset;
    final topY = inset;
    final botY = size.height - inset;
    final r = radius;

    // Vertical sides. When an edge is open (no rounding) the line bridges into
    // the gap to meet the neighbouring selected item, keeping the spacing.
    final startY = top ? topY + r : -gap;
    final endY = bottom ? botY - r : size.height + gap;
    canvas.drawLine(Offset(left, startY), Offset(left, endY), paint);
    canvas.drawLine(Offset(right, startY), Offset(right, endY), paint);

    if (top) {
      final p = Path()
        ..moveTo(left, topY + r)
        ..arcToPoint(Offset(left + r, topY), radius: Radius.circular(r), clockwise: true)
        ..lineTo(right - r, topY)
        ..arcToPoint(Offset(right, topY + r), radius: Radius.circular(r), clockwise: true);
      canvas.drawPath(p, paint);
    }
    if (bottom) {
      final p = Path()
        ..moveTo(left, botY - r)
        ..arcToPoint(Offset(left + r, botY), radius: Radius.circular(r), clockwise: false)
        ..lineTo(right - r, botY)
        ..arcToPoint(Offset(right, botY - r), radius: Radius.circular(r), clockwise: false);
      canvas.drawPath(p, paint);
    }
  }

  @override
  bool shouldRepaint(_SelectionOutlinePainter oldDelegate) => oldDelegate.color != color || oldDelegate.top != top || oldDelegate.bottom != bottom || oldDelegate.radius != radius || oldDelegate.strokeWidth != strokeWidth || oldDelegate.gap != gap;
}

/// Material 3 style FAB menu shown at the bottom-right of the Updates list when
/// two or more items are multi-selected. Offers bulk actions on the selection.
class SelectionFabMenu extends StatefulWidget {
  const SelectionFabMenu({
    super.key,
    required this.count,
    required this.allRead,
    required this.onMarkAllRead,
    required this.onMarkAllUnread,
    required this.onKeepForLater,
    required this.onAddToTask,
    required this.onOpenAll,
    required this.onClear,
  });

  final int count;
  final bool allRead;
  final VoidCallback onMarkAllRead;
  final VoidCallback onMarkAllUnread;
  final VoidCallback onKeepForLater;
  final VoidCallback onAddToTask;
  final VoidCallback onOpenAll;
  final VoidCallback onClear;

  @override
  State<SelectionFabMenu> createState() => _SelectionFabMenuState();
}

class _SelectionFabMenuState extends State<SelectionFabMenu> {
  bool _open = false;

  void _run(VoidCallback action) {
    setState(() => _open = false);
    action();
  }

  /// A single extended-FAB-styled button with the label first and the icon
  /// after it (no built-in FAB supports this order, so it's hand-rolled).
  Widget _menuItem(IconData icon, String label, VoidCallback onTap, {Color? color}) {
    final colorScheme = Theme.of(context).colorScheme;
    final background = color ?? colorScheme.primaryContainer;
    final foreground = color != null ? colorScheme.onError : colorScheme.onPrimaryContainer;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: background,
        elevation: 3,
        borderRadius: BorderRadius.circular(16),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => _run(onTap),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(label, style: Theme.of(context).textTheme.labelLarge?.copyWith(color: foreground)),
                const SizedBox(width: 12),
                Icon(icon, color: foreground, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      AnimatedSize(
        duration: Durations.short3,
        alignment: Alignment.bottomRight,
        curve: Curves.easeOut,
        child: _open
            ? Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Only offer "unread" once everything is read; otherwise the
                  // sensible bulk action is to mark the unread ones as read.
                  if (widget.allRead) _menuItem(Symbols.mark_email_unread, 'Mark all as unread', widget.onMarkAllUnread) else _menuItem(Symbols.mark_email_read, 'Mark all as read', widget.onMarkAllRead),
                  _menuItem(Symbols.push_pin, 'Keep for later', widget.onKeepForLater),
                  _menuItem(Symbols.assignment_add, 'Add all to a task', widget.onAddToTask),
                  _menuItem(Symbols.open_in_browser, 'Open all on website', widget.onOpenAll),
                ],
              )
            : const SizedBox.shrink(),
      ),
      FloatingActionButton.extended(
        heroTag: 'selection_fab_main',
        onPressed: () => setState(() => _open = !_open),
        icon: Icon(_open ? Symbols.arrow_back : Symbols.checklist),
        label: AnimatedSize(
          duration: Durations.short3,
          child: Row(
            spacing: 8,
            children: [
              Text(_open ? 'Close' : '${widget.count} selected'),
              IconButton(
                onPressed: widget.onClear,
                icon: const Icon(Symbols.clear),
                tooltip: 'Clear selection',
                visualDensity: .compact,
                iconSize: 20,
              ),
            ],
          ),
        ),
        extendedPadding: EdgeInsetsDirectional.only(start: 16.0, end: 8.0),
      ),

      // A subtle "clear selection" affordance below the main FAB when closed.
    ],
  );
}
