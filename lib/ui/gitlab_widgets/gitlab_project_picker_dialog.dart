import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jira_watcher/dao/gitlab_dao.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/gitlab_tabs_model.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_images.dart';
import 'package:jira_watcher/ui/utils/time_utils.dart';
import 'package:loggy/loggy.dart';
import 'package:material_symbols_icons/symbols.dart';

/// A step in the drill-down path.
class _Crumb {
  const _Crumb.root() : groupId = null, myProjects = false, label = 'All groups';
  const _Crumb.myProjects() : groupId = null, myProjects = true, label = 'Your projects';
  const _Crumb.group(this.groupId, this.label) : myProjects = false;

  final int? groupId;
  final bool myProjects;
  final String label;
}

/// Inside a group, subgroups are exhausted before projects, so the level still
/// behaves as one accumulating list with one `hasMore`.
enum _Stage { subgroups, projects }

class GitLabProjectPickerDialog extends StatefulWidget {
  const GitLabProjectPickerDialog({super.key});

  @override
  State<GitLabProjectPickerDialog> createState() => _GitLabProjectPickerDialogState();
}

class _GitLabProjectPickerDialogState extends State<GitLabProjectPickerDialog> with UiLoggy {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();

  List<_Crumb> _path = [const _Crumb.root()];

  /// Each entry is `(isProject, json)`.
  final List<(bool, Map<String, dynamic>)> _items = [];

  bool _isLoading = false;
  int? _nextPage = 1;
  _Stage _stage = _Stage.subgroups;
  Object? _error;

  Timer? _debounce;

  /// Responses are stamped so a slower earlier request cannot overwrite a newer one.
  int _requestSeq = 0;

  bool get _isSearching => _searchController.text.trim().isNotEmpty;
  _Crumb get _level => _path.last;
  bool get _hasMore => _nextPage != null;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _fetchMore();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final position = _scrollController.position;
    if (position.pixels >= position.maxScrollExtent - 100) _fetchMore();
  }

  void _onSearchChanged(String _) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), _reload);
    setState(() {});
  }

  void _reload() {
    // Bumping the sequence here discards anything still in flight.
    _requestSeq++;
    setState(() {
      _items.clear();
      _nextPage = 1;
      _stage = _Stage.subgroups;
      _error = null;
      _isLoading = false;
    });
    _fetchMore();
  }

  void _push(_Crumb crumb) {
    setState(() => _path = [..._path, crumb]);
    _reload();
  }

  void _truncateTo(int index) {
    if (index == _path.length - 1) return;
    setState(() => _path = _path.sublist(0, index + 1));
    _reload();
  }

  Future<void> _fetchMore() async {
    if (_isLoading || _nextPage == null) return;
    final page = _nextPage!;
    final seq = ++_requestSeq;
    setState(() => _isLoading = true);

    try {
      final api = DataModel().gitlab;
      final level = _level;
      final search = _searchController.text.trim();

      final GitLabPage result;
      final bool itemsAreProjects;
      var stage = _stage;
      int? nextPage;

      if (_isSearching) {
        result = await api.searchProjects(search: search, page: page);
        itemsAreProjects = true;
        nextPage = result.nextPage;
      } else if (level.myProjects) {
        result = await api.myProjects(page: page);
        itemsAreProjects = true;
        nextPage = result.nextPage;
      } else if (level.groupId == null) {
        result = await api.topLevelGroups(page: page);
        itemsAreProjects = false;
        nextPage = result.nextPage;
      } else if (stage == _Stage.subgroups) {
        result = await api.subgroups(level.groupId!, page: page);
        itemsAreProjects = false;
        // Once subgroups run out, restart paging over the group's projects.
        nextPage = result.nextPage ?? 1;
        if (result.nextPage == null) stage = _Stage.projects;
      } else {
        result = await api.groupProjects(level.groupId!, page: page);
        itemsAreProjects = true;
        nextPage = result.nextPage;
      }

      if (!mounted || seq != _requestSeq) return;

      setState(() {
        _items.addAll(result.items.map((e) => (itemsAreProjects, (e as Map).cast<String, dynamic>())));
        _stage = stage;
        _nextPage = nextPage;
        _isLoading = false;
      });

      // An empty page can leave the viewport unfilled and no scroll event to
      // trigger the next one.
      if (mounted && _hasMore && result.items.isEmpty) _fetchMore();
    } on Object catch (e, s) {
      loggy.error('Failed to load GitLab picker page $page: $e\n$s');
      if (!mounted || seq != _requestSeq) return;
      setState(() {
        _error = e;
        _isLoading = false;
        _nextPage = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text('Open a GitLab project'),
    constraints: BoxConstraints(maxWidth: 650, maxHeight: 650),
    actions: [TextButton(onPressed: Navigator.of(context).pop, child: Text('Cancel'))],
    content: SizedBox(
      width: 600,
      child: Column(
        children: [
          TextField(
            autofocus: true,
            controller: _searchController,
            onChanged: _onSearchChanged,
            decoration: InputDecoration(
              prefixIcon: Icon(Symbols.search),
              labelText: 'Search projects on ${GitLabDao().host}',
              suffixIcon: _isSearching
                  ? IconButton(
                      icon: Icon(Symbols.close),
                      tooltip: 'Clear search',
                      onPressed: () {
                        _searchController.clear();
                        _reload();
                      },
                    )
                  : null,
            ),
          ),
          SizedBox(height: 8),
          _breadcrumb(),
          Divider(),
          if (_error != null) _errorCard(),
          Expanded(child: _list()),
        ],
      ),
    ),
  );

  Widget _breadcrumb() => Opacity(
    // Search spans the whole instance, so the browse path does not apply to it.
    opacity: _isSearching ? .4 : 1,
    child: SizedBox(
      height: 36,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        reverse: true,
        child: Row(
          children: [
            for (final (index, crumb) in _path.indexed) ...[
              if (index > 0) Icon(Symbols.chevron_right, size: 16),
              TextButton(
                onPressed: _isSearching ? null : () => _truncateTo(index),
                child: Text(crumb.label),
              ),
            ],
          ],
        ),
      ),
    ),
  );

  Widget _errorCard() => Card(
    child: ListTile(
      leading: Icon(Symbols.error, fill: 1, color: Theme.of(context).colorScheme.error),
      title: Text('Could not load projects'),
      subtitle: Text('$_error'),
      trailing: TextButton(onPressed: _reload, child: Text('Retry')),
    ),
  );

  Widget _list() {
    // Pinned at the root, because personal-namespace projects never appear under
    // top-level groups.
    final showMyProjects = !_isSearching && _level.groupId == null && !_level.myProjects;
    final leadingCount = showMyProjects ? 1 : 0;
    final footerCount = (_isLoading || _hasMore) ? 1 : 0;

    if (leadingCount == 0 && footerCount == 0 && _items.isEmpty) {
      return Center(child: Text(_isSearching ? 'No projects match that search.' : 'Nothing here.'));
    }

    return ListView.builder(
      controller: _scrollController,
      itemCount: leadingCount + _items.length + footerCount,
      itemBuilder: (context, index) {
        if (showMyProjects && index == 0) {
          return ListTile(
            leading: Icon(Symbols.person),
            title: Text("Projects you're a member of"),
            subtitle: Text('Includes projects outside any group'),
            trailing: Icon(Symbols.chevron_right),
            onTap: () => _push(const _Crumb.myProjects()),
          );
        }

        final itemIndex = index - leadingCount;
        if (itemIndex >= _items.length) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: _isLoading
                  ? const CircularProgressIndicator(strokeWidth: 2)
                  : FilledButton(onPressed: _fetchMore, child: Text('Load more')),
            ),
          );
        }

        final (isProject, json) = _items[itemIndex];
        return isProject ? _projectTile(json) : _groupTile(json);
      },
    );
  }

  Widget _groupTile(Map<String, dynamic> group) => ListTile(
    leading: GitLabAvatar(url: group['avatar_url'] as String?, fallbackLabel: group['name'] as String?),
    title: Text(group['name'] as String? ?? ''),
    subtitle: Text(group['full_path'] as String? ?? '', maxLines: 1, overflow: TextOverflow.ellipsis),
    trailing: Icon(Symbols.chevron_right),
    onTap: () => _push(_Crumb.group(group['id'] as int, group['name'] as String? ?? '')),
  );

  Widget _projectTile(Map<String, dynamic> project) {
    final id = project['id'] as int;
    final isOpen = DataModel().gitlabTabs.tabs.list.any((t) => t.projectId == id);
    final lastActivity = project['last_activity_at'] as String?;

    return ListTile(
      selected: isOpen,
      leading: GitLabAvatar(url: project['avatar_url'] as String?, fallbackLabel: project['name'] as String?),
      title: Text(project['name'] as String? ?? ''),
      subtitle: Text(project['path_with_namespace'] as String? ?? '', maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: isOpen
          ? Chip(label: Text('Open'), visualDensity: VisualDensity.compact)
          : lastActivity == null
          ? null
          : Text(timeAgo(timeStr: lastActivity), style: Theme.of(context).textTheme.bodySmall),
      onTap: () => Navigator.of(context).pop(GitLabProjectTab.fromProjectJson(project)),
    );
  }
}
