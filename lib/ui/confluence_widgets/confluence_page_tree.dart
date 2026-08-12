import 'package:flutter/material.dart';
import 'package:jira_watcher/dao/confluence/confluence_api.dart';
import 'package:jira_watcher/models/confluence_tabs_model.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:material_symbols_icons/symbols.dart';

/// A space's articles, as a collapsible tree.
///
/// The whole tree arrives in one fetch — see [ConfluenceApi.pageTree] — so
/// expanding is instant and filtering can look at every page rather than only
/// the ones already loaded.
class ConfluencePageTree extends StatefulWidget {
  const ConfluencePageTree({super.key, required this.tab, required this.onOpen});

  final ConfluenceSpaceTab tab;
  final void Function(ConfluencePageNode node) onOpen;

  @override
  State<ConfluencePageTree> createState() => ConfluencePageTreeState();
}

class ConfluencePageTreeState extends State<ConfluencePageTree> {
  late Future<ConfluenceTree> _tree;
  final _filterController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _filterController.dispose();
    super.dispose();
  }

  void _load() => _tree = ConfluenceApi().pageTree(widget.tab.spaceId);

  /// Exposed so the space view can refresh the tree after the article changes
  /// under it.
  void refresh() => setState(_load);

  /// Filtering keeps a page's ancestors so a match stays reachable, rather than
  /// showing a flat list that loses where each page sits.
  List<ConfluencePageNode> _filtered(List<ConfluencePageNode> nodes, String query) {
    final result = <ConfluencePageNode>[];
    for (final node in nodes) {
      final children = _filtered(node.children, query);
      if (children.isNotEmpty || node.title.toLowerCase().contains(query)) {
        result.add(ConfluencePageNode(id: node.id, title: node.title, openable: node.openable, children: children));
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final query = _filterController.text.trim().toLowerCase();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _filterController,
                  decoration: const InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Symbols.filter_alt, size: 18),
                    hintText: 'Filter pages',
                  ),
                  onChanged: (_) => setState(() {}),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder<ConfluenceTree>(
            future: _tree,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text('The page tree could not be loaded.\n${snapshot.error}', textAlign: TextAlign.center),
                  ),
                );
              }
              if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());

              final tree = snapshot.data!;
              final roots = query.isEmpty ? tree.roots : _filtered(tree.roots, query);
              if (roots.isEmpty) {
                return Center(
                  child: Text(query.isEmpty ? 'This space has no pages.' : 'No page matches.', style: TextStyle(color: Theme.of(context).hintColor)),
                );
              }

              return ListView(
                padding: const EdgeInsets.only(bottom: 12),
                children: [
                  for (final node in roots)
                    _TreeNode(
                      node: node,
                      depth: 0,
                      tab: widget.tab,
                      onOpen: widget.onOpen,
                      // A filter is only useful with its matches visible, so it
                      // overrides whatever was collapsed.
                      forceExpanded: query.isNotEmpty,
                    ),
                  if (tree.truncated)
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'This space has more pages than were loaded. Use search to reach the rest.',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).hintColor),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class _TreeNode extends StatefulWidget {
  const _TreeNode({
    required this.node,
    required this.depth,
    required this.tab,
    required this.onOpen,
    required this.forceExpanded,
  });

  final ConfluencePageNode node;
  final int depth;
  final ConfluenceSpaceTab tab;
  final void Function(ConfluencePageNode node) onOpen;
  final bool forceExpanded;

  @override
  State<_TreeNode> createState() => _TreeNodeState();
}

class _TreeNodeState extends State<_TreeNode> {
  ConfluenceTabsModel get _model => DataModel().confluenceTabs;

  bool get _expanded => widget.forceExpanded || widget.tab.expandedPageIds.contains(widget.node.id);

  void _toggle() => setState(() => _model.setExpanded(widget.tab, widget.node.id, !_expanded));

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isOpen = widget.tab.pageId == widget.node.id;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Material(
          color: isOpen ? scheme.secondaryContainer : Colors.transparent,
          child: InkWell(
            // A folder has no article behind it, so the only thing its row can
            // do is open and close.
            onTap: () => widget.node.openable ? widget.onOpen(widget.node) : _toggle(),
            child: Padding(
              padding: EdgeInsets.only(left: 4 + widget.depth * 14, right: 4, top: 2, bottom: 2),
              child: Row(
                children: [
                  SizedBox(
                    width: 22,
                    child: widget.node.hasChildren
                        ? IconButton(
                            icon: AnimatedRotation(
                              turns: _expanded ? 0 : -0.25,
                              duration: Durations.short3,
                              child: const Icon(Symbols.expand_more),
                            ),
                            iconSize: 16,
                            visualDensity: VisualDensity.compact,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            // A filter decides what is open, so the chevron
                            // would not do what it appears to.
                            onPressed: widget.forceExpanded ? null : _toggle,
                          )
                        : null,
                  ),
                  Icon(
                    widget.node.openable ? Symbols.article : Symbols.folder,
                    size: 15,
                    color: isOpen ? scheme.onSecondaryContainer : Theme.of(context).hintColor,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        widget.node.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: isOpen ? FontWeight.w600 : null),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (_expanded)
          for (final child in widget.node.children)
            _TreeNode(
              node: child,
              depth: widget.depth + 1,
              tab: widget.tab,
              onOpen: widget.onOpen,
              forceExpanded: widget.forceExpanded,
            ),
      ],
    );
  }
}
