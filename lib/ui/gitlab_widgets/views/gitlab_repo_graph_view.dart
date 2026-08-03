import 'package:flutter/material.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/gitlab_tabs_model.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_paginated_list.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_ref_field.dart';
import 'package:jira_watcher/ui/gitlab_widgets/views/gitlab_commits_view.dart';
import 'package:loggy/loggy.dart';
import 'package:material_symbols_icons/symbols.dart';

/// A chronological commit list annotated with the branches and tags that point at
/// each commit, plus a lineage gutter marking merges.
///
/// Deliberately not a topological graph: this answers "what landed, on what, and
/// when" without the layout machinery a full network graph needs.
class GitLabRepoGraphView extends StatefulWidget {
  const GitLabRepoGraphView({super.key, required this.tab});

  final GitLabProjectTab tab;

  @override
  State<GitLabRepoGraphView> createState() => _GitLabRepoGraphViewState();
}

class _GitLabRepoGraphViewState extends State<GitLabRepoGraphView> with UiLoggy {
  late final TextEditingController _refController;
  int _reloadToken = 0;

  /// Commit sha to the refs pointing at it.
  Map<String, List<({String name, bool isTag})>> _refsBySha = {};
  bool _loadingRefs = false;

  String get _ref => (widget.tab.viewState['graphRef'] as String?) ?? '';
  set _ref(String value) {
    widget.tab.viewState['graphRef'] = value;
    DataModel().gitlabTabs.requestSave();
  }

  @override
  void initState() {
    super.initState();
    _refController = TextEditingController(text: _ref);
    _loadRefs();
  }

  @override
  void dispose() {
    _refController.dispose();
    super.dispose();
  }

  /// Branch and tag heads, so commits can be labelled without a request per row.
  Future<void> _loadRefs() async {
    setState(() => _loadingRefs = true);
    final map = <String, List<({String name, bool isTag})>>{};
    try {
      final results = await Future.wait([
        DataModel().gitlab.branches(widget.tab.projectId, perPage: 100),
        DataModel().gitlab.tags(widget.tab.projectId, perPage: 100),
      ]);

      void record(Iterable items, bool isTag) {
        for (final raw in items) {
          final entry = (raw as Map).cast<String, dynamic>();
          final commit = entry['commit'] as Map?;
          final sha = (commit?['id'] ?? entry['target']) as String?;
          final name = entry['name'] as String?;
          if (sha == null || name == null) continue;
          map.putIfAbsent(sha, () => []).add((name: name, isTag: isTag));
        }
      }

      record(results[0].items, false);
      record(results[1].items, true);
    } on Object catch (e) {
      loggy.warning('Could not load refs for the repo graph: $e');
    }
    if (!mounted) return;
    setState(() {
      _refsBySha = map;
      _loadingRefs = false;
    });
  }

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          spacing: 8,
          children: [
            GitLabRefField(
              projectId: widget.tab.projectId,
              controller: _refController,
              label: 'Branch or tag (default branch if empty)',
              width: 320,
              onSubmitted: (value) => setState(() {
                _ref = value;
                _reloadToken++;
              }),
            ),
            if (_loadingRefs)
              const Padding(
                padding: EdgeInsets.only(left: 4),
                child: SizedBox.square(dimension: 16, child: CircularProgressIndicator(strokeWidth: 2)),
              ),
            const Spacer(),
            Text(
              '${_refsBySha.length} labelled commit${_refsBySha.length == 1 ? '' : 's'}',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).hintColor),
            ),
            IconButton(
              tooltip: 'Refresh',
              icon: const Icon(Symbols.refresh),
              onPressed: () {
                _loadRefs();
                setState(() => _reloadToken++);
              },
            ),
          ],
        ),
      ),
      const Divider(height: 1),
      Expanded(
        child: GitLabPaginatedList(
          key: ValueKey('graph|${widget.tab.projectId}|$_ref|$_reloadToken'),
          emptyMessage: 'No commits found.',
          fetchPage: (page) => DataModel().gitlab.commits(
            widget.tab.projectId,
            page: page,
            ref: _ref.isEmpty ? null : _ref,
          ),
          itemBuilder: (context, commit, index) {
            final sha = commit['id'] as String? ?? '';
            final parents = (commit['parent_ids'] as List?)?.length ?? 1;
            return GitLabCommitRow(
              commit: commit,
              refBadges: _refsBySha[sha] ?? const [],
              leading: _GraphGutter(isMerge: parents > 1, isFirst: index == 0),
            );
          },
        ),
      ),
    ],
  );
}

/// The vertical lineage line and this commit's node.
class _GraphGutter extends StatelessWidget {
  const _GraphGutter({required this.isMerge, required this.isFirst});

  final bool isMerge;
  final bool isFirst;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: 16,
    height: 44,
    child: CustomPaint(
      painter: _GraphGutterPainter(
        nodeColor: Theme.of(context).colorScheme.primary,
        lineColor: Theme.of(context).dividerColor,
        // Fills a merge node so the trunk does not show through the hole.
        surfaceColor: Theme.of(context).colorScheme.surface,
        isMerge: isMerge,
        isFirst: isFirst,
      ),
    ),
  );
}

class _GraphGutterPainter extends CustomPainter {
  _GraphGutterPainter({
    required this.nodeColor,
    required this.lineColor,
    required this.surfaceColor,
    required this.isMerge,
    required this.isFirst,
  });

  final Color nodeColor;
  final Color lineColor;
  final Color surfaceColor;
  final bool isMerge;
  final bool isFirst;

  static const double _radius = 4;

  @override
  void paint(Canvas canvas, Size size) {
    final centre = Offset(size.width / 2, size.height / 2);
    final line = Paint()
      ..color = lineColor
      ..strokeWidth = 2;

    // The trunk, left open at the node itself.
    if (!isFirst) canvas.drawLine(Offset(centre.dx, 0), Offset(centre.dx, centre.dy - _radius - 1), line);
    canvas.drawLine(Offset(centre.dx, centre.dy + _radius + 1), Offset(centre.dx, size.height), line);

    // A merge gets an incoming stub and a hollow node, so it reads differently
    // from an ordinary commit at a glance.
    if (isMerge) {
      canvas.drawLine(
        Offset(centre.dx + _radius, centre.dy - _radius),
        Offset(size.width, centre.dy - _radius * 3),
        line,
      );
      canvas.drawCircle(centre, _radius, Paint()..color = surfaceColor);
      canvas.drawCircle(
        centre,
        _radius,
        Paint()
          ..color = nodeColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2,
      );
      return;
    }
    canvas.drawCircle(centre, _radius, Paint()..color = nodeColor);
  }

  @override
  bool shouldRepaint(_GraphGutterPainter oldDelegate) =>
      oldDelegate.nodeColor != nodeColor ||
      oldDelegate.lineColor != lineColor ||
      oldDelegate.surfaceColor != surfaceColor ||
      oldDelegate.isMerge != isMerge ||
      oldDelegate.isFirst != isFirst;
}
