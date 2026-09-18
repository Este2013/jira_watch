import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/jira_work_item_data.dart';
import 'package:jira_watcher/models/work_item_tabs_model.dart';
import 'package:jira_watcher/ui/updates_widgets/issue_ui_elements.dart';
import 'package:jira_watcher/ui/updates_widgets/updates_view_single_work_item/single_work_item_view.dart';
import 'package:jira_watcher/ui/updates_widgets/updates_view_single_work_item/work_item_details_view.dart';
import 'package:material_symbols_icons/symbols.dart';

/// A real (resolved) tab's content: the current work item, with an
/// [IssueNavigationScope] so any issue reference clicked inside it — a linked
/// issue, a mention, the Development card's own links — moves within this tab
/// rather than popping the usual dialog. The scope also carries the tab's
/// back/forward, which [SingleJiraWorkItemView] renders in its own header
/// rather than this widget drawing a second toolbar above it.
class WorkItemTabContent extends StatelessWidget {
  const WorkItemTabContent({super.key, required this.tab});

  final WorkItemTab tab;

  @override
  Widget build(BuildContext context) {
    final key = tab.currentKey;
    if (key == null) return const SizedBox.shrink();
    final model = WorkItemTabsModel();

    return IssueNavigationScope(
      onOpen: (newKey) => model.navigate(tab, newKey),
      hasHistory: true,
      onBack: tab.canGoBack ? () => model.goBack(tab) : null,
      onForward: tab.canGoForward ? () => model.goForward(tab) : null,
      // Keyed by the work item key alone: visiting the same key twice in a
      // row (stepping back then forward again) reuses the state and does not
      // refetch, but a genuinely different key always does.
      child: SingleJiraWorkItemView(JiraWorkItemData({'key': key}), key: ValueKey(key)),
    );
  }
}

/// A search tab's content: pick a work item to resolve it into a real tab.
class WorkItemSearchTabContent extends StatefulWidget {
  const WorkItemSearchTabContent({super.key, required this.tab});

  final WorkItemTab tab;

  @override
  State<WorkItemSearchTabContent> createState() => _WorkItemSearchTabContentState();
}

class _WorkItemSearchTabContentState extends State<WorkItemSearchTabContent> {
  final _controller = TextEditingController();
  Timer? _debounce;
  late Future<List> _resultsFuture = _search('');

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      // A block body, deliberately: `setState(() => _resultsFuture = ...)`
      // makes the callback's own return value the assignment's value — a
      // Future — which setState rejects outright as "looks async".
      setState(() {
        _resultsFuture = _search(value.trim());
      });
    });
  }

  /// A direct key match (`STUDIO-1234`) alongside a free-text search, the
  /// same two-pronged approach the Ctrl+F search dialog uses — a key rarely
  /// matches Jira's own text index well, since it is not part of the summary.
  Future<List> _search(String query) async {
    final results = <dynamic>[];
    for (final match in RegExp(r'[A-Za-z]+-[0-9]+').allMatches(query)) {
      final key = match.group(0);
      if (key == null) continue;
      final item = await DataModel().jiraApi.workItem(key);
      if (item != null) results.add(item);
    }
    if (query.isNotEmpty || results.isEmpty) {
      final searchResults = await DataModel().jiraApi.jqlSearch(
        '${query.isEmpty ? '' : 'text ~ "$query"'} ORDER BY updated DESC',
        fields: ['issuetype', 'priority', 'status', 'statusCategory', 'summary'],
      );
      for (final issue in (searchResults?['issues'] as List? ?? const [])) {
        if (!results.any((r) => r['key'] == issue['key'])) results.add(issue);
      }
    }
    return results;
  }

  void _pick(String key) => WorkItemTabsModel().resolveSearchTab(widget.tab, key);

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _controller,
          autofocus: true,
          onChanged: _onChanged,
          decoration: const InputDecoration(
            isDense: true,
            border: OutlineInputBorder(),
            prefixIcon: Icon(Symbols.search),
            hintText: 'Search by key or text — pick a work item to open it in this tab',
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: FutureBuilder<List>(
            future: _resultsFuture,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
              final items = snapshot.data!;
              if (items.isEmpty) {
                return Center(
                  child: Text(
                    _controller.text.trim().isEmpty ? 'Type to search' : 'Nothing matches',
                    style: TextStyle(color: Theme.of(context).hintColor),
                  ),
                );
              }
              return ListView(children: [for (final item in items) IssueLinkTile(item, onSelect: _pick)]);
            },
          ),
        ),
      ],
    ),
  );
}
