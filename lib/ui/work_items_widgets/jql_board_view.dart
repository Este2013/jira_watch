import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jira_watcher/models/dashboards_model.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/updates_filters.dart';
import 'package:jira_watcher/models/work_item_tabs_model.dart';
import 'package:jira_watcher/ui/updates_widgets/updates_property_filters.dart';
import 'package:jira_watcher/ui/updates_widgets/updates_view_single_work_item/work_item_details_view.dart';
import 'package:jira_watcher/ui/utils/widgets/work_item_list_preview.dart';
import 'package:material_symbols_icons/symbols.dart';

/// A JQL board's content: the same chips, JQL toggle, and free-text field the
/// work item search uses, except the query is the board's own saved one — it
/// persists back into [DashboardsModel] as it is edited — and the results are
/// a paginated, readable list rather than a one-off pick.
///
/// Keyed by the board's id at the call site, so switching boards remounts
/// this fresh rather than trying to reconcile one board's fetched page
/// against another's.
class JqlBoardView extends StatefulWidget {
  const JqlBoardView({super.key, required this.board, required this.config});

  final Board board;
  final JqlBoardConfig config;

  @override
  State<JqlBoardView> createState() => _JqlBoardViewState();
}

class _JqlBoardViewState extends State<JqlBoardView> {
  static const _pageSize = 25;

  /// The width the list is kept to, the same as every other reading list in
  /// the app (Confluence's own content, Pinned work items).
  static const double _maxListWidth = 800;

  final _controller = TextEditingController();
  Timer? _debounce;

  /// Seeded once from the board's saved query, then owned locally — edits
  /// flow back out to [DashboardsModel] as they happen, but are not re-read
  /// from [widget.config] afterwards: this widget is remounted (via its
  /// call site's `ValueKey`) whenever the board itself changes, so there is
  /// never a second, external writer to reconcile against.
  late UpdatesQuery _query = widget.config.query;

  List<dynamic> _items = const [];
  bool _isLoading = true;
  bool _hasMore = true;
  String? _nextPageToken;

  /// Bumped per request so a slower, superseded one cannot overwrite a newer
  /// one's results.
  int _requestSeq = 0;

  @override
  void initState() {
    super.initState();
    _controller.text = _query.textSearch;
    _load();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () => _onQueryChanged(_query.copyWith(textSearch: value)));
  }

  /// Takes the row's new query: saves it onto the board, and asks Jira again
  /// only when it actually changed what is being asked — toggling into JQL
  /// mode and straight back out of it is not a reason to refetch.
  void _onQueryChanged(UpdatesQuery changed) {
    final wasAsking = _query.clauses.join(' AND ');
    // The search text is the one part of the query the row can change without
    // the field knowing: leaving JQL mode hands back whatever `text ~ ...`
    // was typed there. Guarded, so echoing a keystroke never moves the cursor.
    if (changed.textSearch != _controller.text) _controller.text = changed.textSearch;
    setState(() => _query = changed);
    DashboardsModel().updateBoardConfig(widget.board, widget.config.copyWith(query: changed));
    if (changed.clauses.join(' AND ') != wasAsking) _load();
  }

  Future<void> _load() async {
    final seq = ++_requestSeq;
    setState(() {
      _isLoading = true;
      _items = const [];
      _nextPageToken = null;
      _hasMore = true;
    });
    await _fetchPage(seq);
  }

  Future<void> _loadMore() async {
    if (_isLoading || !_hasMore) return;
    setState(() => _isLoading = true);
    await _fetchPage(_requestSeq);
  }

  Future<void> _fetchPage(int seq) async {
    final where = _query.clauses.join(' AND ');
    final data = await DataModel().jiraApi.jqlSearch(
      where.isEmpty ? 'ORDER BY updated DESC' : '$where ORDER BY updated DESC',
      maxResults: _pageSize,
      nextPageToken: _nextPageToken,
      fields: ['issuetype', 'priority', 'status', 'statusCategory', 'summary'],
    );
    if (!mounted || seq != _requestSeq) return;
    setState(() {
      _isLoading = false;
      _items = [..._items, ...(data?['issues'] as List? ?? const [])];
      _hasMore = data?['isLast'] != true;
      _nextPageToken = data?['nextPageToken'] as String?;
    });
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PropertyFilterRow(
          query: _query,
          onQueryChanged: _onQueryChanged,
          searchField: TextField(
            controller: _controller,
            onChanged: _onTextChanged,
            decoration: const InputDecoration(
              isDense: true,
              border: OutlineInputBorder(),
              prefixIcon: Icon(Symbols.search),
              hintText: 'Search this board by text',
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Divider(height: 1),
        Expanded(child: _results(context)),
      ],
    ),
  );

  Widget _results(BuildContext context) {
    if (_isLoading && _items.isEmpty) return const Center(child: CircularProgressIndicator());
    if (_items.isEmpty) return Center(child: Text('Nothing matches', style: TextStyle(color: Theme.of(context).hintColor)));

    return WorkItemListPreview(
      availableKeys: [for (final item in _items) item['key'] as String],
      placeholder: '← Pick a work item to read it here',
      listBuilder: (selectedKey, onSelect) => Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: _maxListWidth),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            children: [
              for (final item in _items)
                IssueLinkTile(
                  item,
                  key: ValueKey(item['key']),
                  onSelect: onSelect,
                  trailing: IconButton(
                    tooltip: 'Open as a tab in this group',
                    icon: const Icon(Symbols.tab),
                    onPressed: () => WorkItemTabsModel().openWorkItem(item['key'] as String),
                  ),
                ),
              if (_hasMore)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: _isLoading
                        ? const SizedBox.square(dimension: 20, child: CircularProgressIndicator(strokeWidth: 2))
                        : TextButton(onPressed: _loadMore, child: const Text('Load more')),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
