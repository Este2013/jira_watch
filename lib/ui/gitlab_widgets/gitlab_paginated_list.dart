import 'package:flutter/material.dart';
import 'package:jira_watcher/dao/gitlab_dao.dart';
import 'package:loggy/loggy.dart';
import 'package:material_symbols_icons/symbols.dart';

typedef GitLabPageFetcher = Future<GitLabPage> Function(int page);
typedef GitLabJsonItemBuilder = Widget Function(BuildContext context, Map<String, dynamic> item, int index);

/// A paginated GitLab list, following the app's existing convention: an
/// accumulating list, a near-bottom scroll trigger, and a manual "Load more"
/// footer as a fallback.
///
/// To reload (filter change, refresh button), give the widget a new [Key] — the
/// state is rebuilt and paging restarts from page 1.
class GitLabPaginatedList extends StatefulWidget {
  const GitLabPaginatedList({
    super.key,
    required this.fetchPage,
    required this.itemBuilder,
    this.emptyMessage = 'Nothing to show.',
    this.padding,
    this.separated = false,
  });

  final GitLabPageFetcher fetchPage;
  final GitLabJsonItemBuilder itemBuilder;
  final String emptyMessage;
  final EdgeInsetsGeometry? padding;
  final bool separated;

  @override
  State<GitLabPaginatedList> createState() => _GitLabPaginatedListState();
}

class _GitLabPaginatedListState extends State<GitLabPaginatedList> with UiLoggy {
  final _scrollController = ScrollController();
  final List<Map<String, dynamic>> _items = [];

  bool _isLoading = false;
  int? _nextPage = 1;
  Object? _error;

  /// The page whose request failed, so a retry resumes there instead of
  /// discarding the pages already loaded.
  int? _failedPage;

  /// Stamps responses so a slow earlier request cannot overwrite a newer one.
  int _requestSeq = 0;

  bool get _hasMore => _nextPage != null;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _fetchMore();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final position = _scrollController.position;
    if (position.pixels >= position.maxScrollExtent - 100) _fetchMore();
  }

  Future<void> _fetchMore() async {
    if (_isLoading || _nextPage == null) return;
    final page = _nextPage!;
    final seq = ++_requestSeq;
    setState(() => _isLoading = true);

    try {
      final result = await widget.fetchPage(page);
      if (!mounted || seq != _requestSeq) return;
      setState(() {
        _items.addAll(result.items.map((e) => (e as Map).cast<String, dynamic>()));
        _nextPage = result.nextPage;
        _isLoading = false;
      });
      // An empty page leaves the viewport unfilled with no scroll event to
      // trigger the next one.
      if (mounted && _hasMore && result.items.isEmpty) _fetchMore();
    } on Object catch (e, s) {
      loggy.error('Failed to load page $page: $e\n$s');
      if (!mounted || seq != _requestSeq) return;
      setState(() {
        _error = e;
        _isLoading = false;
        // Stops the scroll listener from hammering a failing endpoint.
        _failedPage = page;
        _nextPage = null;
      });
    }
  }

  void _retry() {
    setState(() {
      _error = null;
      _nextPage = _failedPage ?? 1;
      _failedPage = null;
    });
    _fetchMore();
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null && _items.isEmpty) {
      return Center(
        child: Card(
          child: ListTile(
            leading: Icon(Symbols.error, fill: 1, color: Theme.of(context).colorScheme.error),
            title: const Text('Could not load this list'),
            subtitle: Text('$_error'),
            trailing: TextButton(onPressed: _retry, child: const Text('Retry')),
          ),
        ),
      );
    }

    if (_items.isEmpty && !_isLoading && !_hasMore) {
      return Center(child: Text(widget.emptyMessage));
    }

    final footerCount = (_isLoading || _hasMore || _error != null) ? 1 : 0;

    return ListView.separated(
      controller: _scrollController,
      padding: widget.padding,
      itemCount: _items.length + footerCount,
      separatorBuilder: (context, index) => widget.separated ? const Divider(height: 1) : const SizedBox.shrink(),
      itemBuilder: (context, index) {
        if (index >= _items.length) return _footer();
        return widget.itemBuilder(context, _items[index], index);
      },
    );
  }

  Widget _footer() => Padding(
    padding: const EdgeInsets.all(16),
    child: Center(
      child: _isLoading
          ? const CircularProgressIndicator(strokeWidth: 2)
          : _error != null
          ? TextButton.icon(
              icon: const Icon(Symbols.refresh),
              label: Text('Could not load more — retry'),
              onPressed: _retry,
            )
          : FilledButton(onPressed: _fetchMore, child: const Text('Load more')),
    ),
  );
}
