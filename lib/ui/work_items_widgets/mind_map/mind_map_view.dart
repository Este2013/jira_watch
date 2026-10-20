/// The Mind map tab: a search bar, the navigator, and whatever node is open.
///
/// Two ways in, and they are meant to feed each other. Search when you know
/// roughly what you are after — and it looks in your own words, the notes and
/// tags and link titles you wrote, not Jira's summaries. Navigate when you do
/// not: every jump shows what is adjacent, which is how you find the thing you
/// could not have named.
library;

import 'package:flutter/material.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:jira_watcher/models/mind_map_model.dart';
import 'package:jira_watcher/models/mind_map_suggestions.dart';
import 'package:jira_watcher/models/work_item_tabs_model.dart';
import 'package:jira_watcher/ui/utils/in_app_links.dart';
import 'package:jira_watcher/ui/work_items_widgets/mind_map/mind_map_dialogs.dart';
import 'package:jira_watcher/ui/work_items_widgets/mind_map/mind_map_inspector.dart';
import 'package:jira_watcher/ui/work_items_widgets/mind_map/mind_map_navigator.dart';
import 'package:material_symbols_icons/symbols.dart';

class MindMapView extends StatefulWidget {
  const MindMapView({super.key, this.model, this.suggestions});

  /// Both default to the app's own. A test passes an in-memory map and a
  /// suggester with no Jira behind it; nothing else ever does.
  final MindMapModel? model;
  final MindMapSuggestions? suggestions;

  @override
  State<MindMapView> createState() => _MindMapViewState();
}

class _MindMapViewState extends State<MindMapView> {
  late final MindMapModel _model = widget.model ?? MindMapModel();
  final _search = TextEditingController();

  late final MindMapSuggestions _suggestions = widget.suggestions ?? MindMapSuggestions.shared;

  /// Tags being browsed by. A search and a tag filter work together — "the
  /// flaky thing, among the regression ones".
  final Set<String> _tags = {};

  /// The ghosts around the focused node, by node id. Held rather than rebuilt
  /// in `build` so the navigator is not handed a different future every frame.
  MindMapNodeSuggestions _nodeSuggestions = MindMapNodeSuggestions.empty;
  String? _suggestionsFor;

  /// The link the navigator is centred on, when it is centred on one.
  ///
  /// A view state rather than a move of the map's own focus: the node it was
  /// reached from stays focused underneath, so stepping back out of a link
  /// lands exactly where it was opened from.
  MindMapLink? _focusedLink;

  /// Past this, the inspector gets a column of its own. Below it, the
  /// navigator keeps the whole window and a node opens over it.
  static const double _twoPaneWidth = 1040;

  bool get _searching => _search.text.trim().isNotEmpty || _tags.isNotEmpty;

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  /// Asks what else belongs around [node], once per node rather than per frame.
  void _loadSuggestions(MindMapNode? node) {
    if (node == null) {
      if (_suggestionsFor != null) {
        _suggestionsFor = null;
        _nodeSuggestions = MindMapNodeSuggestions.empty;
      }
      return;
    }
    if (_suggestionsFor == node.id) return;
    _suggestionsFor = node.id;
    _nodeSuggestions = MindMapNodeSuggestions.empty;
    _suggestions.forNode(node).then((result) {
      // The reader may well have moved on while Jira was thinking.
      if (mounted && _suggestionsFor == node.id) setState(() => _nodeSuggestions = result);
    });
  }

  void _focus(String? nodeId) {
    setState(() {
      _search.clear();
      _focusedLink = null;
      _model.focus(nodeId);
    });
  }

  /// Centres on a link: the nodes holding it come into the ring, connected to
  /// it by the same dashed line any other loose connection gets.
  void _focusLink(MindMapLink link) => setState(() {
    _search.clear();
    _focusedLink = link;
  });

  void _toggleLinkNodes() => setState(() {
    final showing = !_model.linksAsNodes.value;
    _model.setLinksAsNodes(showing);
    // Turning the mode off while standing on a link would leave the middle
    // showing something the map no longer draws.
    if (!showing) _focusedLink = null;
  });

  Future<void> _addLinkTo(MindMapNode node) async {
    await showDialog<void>(
      context: context,
      builder: (_) => MindMapLinkDialog(model: _model, nodeId: node.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _model.isReady,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) return const Center(child: CircularProgressIndicator());

        return AnimatedBuilder(
          animation: _model.listenable,
          builder: (context, _) {
            final focused = _model.focusedNode;
            // Scheduled off the build rather than run in it: this can call
            // setState once Jira answers, and it reads the node that is
            // current as of this frame.
            WidgetsBinding.instance.addPostFrameCallback((_) => _loadSuggestions(focused));

            return Column(
              children: [
                _header(context),
                const Divider(height: 1),
                Expanded(child: _body(context, focused)),
              ],
            );
          },
        );
      },
    );
  }

  Widget _header(BuildContext context) {
    final theme = Theme.of(context);
    final tags = _model.allTags;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      child: Column(
        spacing: 8,
        children: [
          Row(
            spacing: 12,
            children: [
              Expanded(
                child: TextField(
                  controller: _search,
                  decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: const Icon(Symbols.search),
                    hintText: 'Search your map — a word from a note, a tag, a link, a key…',
                    border: const OutlineInputBorder(),
                    suffixIcon: _search.text.isEmpty
                        ? null
                        : IconButton(
                            icon: const Icon(Symbols.close, size: 18),
                            onPressed: () => setState(_search.clear),
                          ),
                  ),
                  onChanged: (_) => setState(() {}),
                ),
              ),
              FilledButton.tonalIcon(
                icon: const Icon(Symbols.hub, size: 18),
                label: const Text('New topic'),
                onPressed: () async {
                  final created = await showDialog<MindMapNode>(
                    context: context,
                    builder: (_) => MindMapTopicDialog(model: _model, parentId: _model.focusedNodeId.value),
                  );
                  if (created != null) _focus(created.id);
                },
              ),
              FilledButton.tonalIcon(
                icon: const Icon(Symbols.description, size: 18),
                label: const Text('Add work item'),
                onPressed: () async {
                  final placed = await showDialog<MindMapNode>(
                    context: context,
                    builder: (_) => MindMapAttachWorkItemDialog(model: _model, suggestions: _suggestions, parentId: _model.focusedNodeId.value),
                  );
                  if (placed != null) _focus(placed.id);
                },
              ),
            ],
          ),
          if (tags.isNotEmpty)
            SizedBox(
              height: 34,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (final tag in tags)
                    Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: FilterChip(
                        label: Text('#$tag'),
                        selected: _tags.contains(tag),
                        visualDensity: VisualDensity.compact,
                        onSelected: (selected) => setState(() => selected ? _tags.add(tag) : _tags.remove(tag)),
                      ),
                    ),
                  if (_tags.isNotEmpty)
                    TextButton(
                      onPressed: () => setState(_tags.clear),
                      child: Text('Clear', style: theme.textTheme.labelMedium),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _body(BuildContext context, MindMapNode? focused) {
    if (_searching) return _results(context);
    if (_model.nodes.list.isEmpty) return _EmptyMap(onCreate: () => _newTopic(context));

    final link = _focusedLink;

    // Standing on a link, the ring is everything that holds it — as loose
    // connections, which is exactly what they are and exactly how they are
    // drawn: a dashed line out to each.
    final neighbours = link != null ? [for (final holder in _model.nodesLinking(link.url)) MindMapNeighbour(holder, MindMapRelation.connected)] : (focused == null ? [for (final root in _model.rootNodes) MindMapNeighbour(root, MindMapRelation.child)] : _model.neighboursOf(focused.id));

    final navigator = Stack(
      children: [
        Positioned.fill(
          child: MindMapNavigator(
            focused: focused,
            focusedLink: link,
            neighbours: neighbours,
            // The ring around a link is the nodes holding it; drawing its own
            // node's other links there as well would say nothing about where
            // the reader is standing.
            links: (link == null && focused != null && _model.linksAsNodes.value) ? focused.links : const [],
            holdersOf: (candidate) => _model.nodesLinking(candidate.url).length,
            ghosts: link == null ? _nodeSuggestions.ghosts : const [],
            onFocus: _focus,
            onFocusLink: _focusLink,
            onOpenLink: (candidate) => openLink(context, candidate.url),
            onAddLink: _addLinkTo,
            onToggleLinkNodes: _toggleLinkNodes,
            linkNodesOn: _model.linksAsNodes.value,
            onAcceptGhost: (ghost) => _acceptGhost(ghost, focused),
            onNodeMenu: (node, position) => _nodeMenu(context, node, position),
            onCentreTap: () => link == null ? _openInspector(context, focused) : openLink(context, link.url),
            onAddChild: () => link == null ? _newTopic(context) : null,
            onEditCurrent: () => link == null ? _editCurrent(context, focused) : openLink(context, link.url),
            onGoBack: () => link == null ? _goBack(focused) : setState(() => _focusedLink = null),
            onShowOverflow: (hidden) => _showOverflow(context, hidden),
          ),
        ),
        if (focused != null || link != null)
          Positioned(
            left: 12,
            top: 12,
            child: _breadcrumb(context, focused, link),
          ),
      ],
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < _twoPaneWidth || (focused == null && link == null)) return navigator;
        return Row(
          children: [
            Expanded(child: navigator),
            const VerticalDivider(width: 1),
            SizedBox(
              width: 380,
              child: link != null
                  ? MindMapLinkInspector(key: ValueKey(link.id), model: _model, link: link, onFocus: _focus)
                  : MindMapInspector(
                      // Keyed by node, so the notes field belongs to the node
                      // it is showing rather than carrying text across a jump.
                      key: ValueKey(focused!.id),
                      model: _model,
                      suggestions: _suggestions,
                      node: focused,
                      onFocus: _focus,
                    ),
            ),
          ],
        );
      },
    );
  }

  Widget _breadcrumb(BuildContext context, MindMapNode? focused, MindMapLink? link) {
    final theme = Theme.of(context);
    final path = focused == null ? <MindMapNode>[] : _model.pathTo(focused.id);

    return Material(
      color: theme.colorScheme.surface.withValues(alpha: 0.86),
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        // Capped and elided rather than left to grow: a deep path, or a link
        // with a long title on the end of one, would otherwise run off the
        // side of the map.
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 4,
            children: [
              InkWell(
                onTap: () => _focus(null),
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: Icon(Symbols.workspaces, size: 16, color: theme.colorScheme.primary),
                ),
              ),
              for (final node in path) ...[
                Text('›', style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor)),
                Builder(
                  builder: (context) {
                    // The node under a link stays clickable: it is where Escape
                    // would take you, so saying so costs nothing.
                    final isHere = node.id == focused?.id && link == null;
                    return Flexible(
                      child: InkWell(
                        onTap: isHere ? null : () => _focus(node.id),
                        borderRadius: BorderRadius.circular(12),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                          child: Text(
                            node.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: isHere ? null : theme.colorScheme.primary,
                              fontWeight: isHere ? FontWeight.w700 : null,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
              if (link != null) ...[
                Text('›', style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor)),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 4,
                      children: [
                        Icon(link.icon, size: 13, color: theme.colorScheme.tertiary),
                        Flexible(
                          child: Text(
                            link.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _results(BuildContext context) {
    final theme = Theme.of(context);
    final query = _search.text.trim();
    final hits = _model.search(query, tags: _tags);

    // A key typed into the box that the map has never been given is not a
    // failed search — it is the most likely reason anyone types a key here.
    final key = RegExp(r'^[A-Za-z][A-Za-z0-9_]*-[0-9]+$').firstMatch(query)?.group(0)?.toUpperCase();
    final offerToAdd = key != null && _model.nodeForWorkItem(key) == null;

    if (hits.isEmpty && !offerToAdd) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            Icon(Symbols.search_off, size: 48, color: theme.hintColor),
            Text('Nothing on the map matches that.', style: theme.textTheme.titleMedium),
            Text('Try fewer words — the search also reads your notes, tags and links.', style: theme.textTheme.bodySmall?.copyWith(color: theme.hintColor)),
          ],
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      children: [
        if (offerToAdd)
          Card(
            color: theme.colorScheme.secondaryContainer,
            child: ListTile(
              leading: const Icon(Symbols.auto_awesome),
              title: Text('Put $key on the map'),
              subtitle: const Text('It is not here yet. Jira will be asked where it belongs.'),
              onTap: () => _attachKey(context, key),
            ),
          ),
        for (final hit in hits)
          ListTile(
            leading: Icon(hit.node.kind.icon, color: hit.node.color),
            title: Text(hit.node.title),
            subtitle: Text(
              [
                _model.pathTo(hit.node.id).map((n) => n.title).join(' › '),
                hit.reason,
              ].where((s) => s.isNotEmpty).join('  ·  '),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: hit.node.tags.isEmpty
                ? null
                : Wrap(
                    spacing: 4,
                    children: [for (final tag in hit.node.tags.take(3)) Chip(label: Text(tag), visualDensity: VisualDensity.compact, padding: EdgeInsets.zero)],
                  ),
            onTap: () => _focus(hit.node.id),
          ),
      ],
    );
  }

  Future<void> _newTopic(BuildContext context) async {
    final created = await showDialog<MindMapNode>(
      context: context,
      builder: (_) => MindMapTopicDialog(model: _model, parentId: _model.focusedNodeId.value),
    );
    if (created != null) _focus(created.id);
  }

  /// Enter, with nothing picked out in the ring. The home constellation is not
  /// a node, so there is nothing there to edit.
  void _editCurrent(BuildContext context, MindMapNode? focused) {
    if (focused == null) return;
    showDialog<MindMapNode>(
      context: context,
      builder: (_) => MindMapTopicDialog(model: _model, editing: focused),
    );
  }

  /// Escape and Backspace: up a level, and off the last one back to the home
  /// constellation. Already home, there is nowhere further to go.
  void _goBack(MindMapNode? focused) {
    if (focused == null) return;
    _focus(focused.parentId);
  }

  Future<void> _attachKey(BuildContext context, String key) async {
    final placed = await showDialog<MindMapNode>(
      context: context,
      builder: (_) => MindMapPlacementDialog(model: _model, suggestions: _suggestions, workItemKey: key),
    );
    if (placed != null) _focus(placed.id);
  }

  void _acceptGhost(MindMapGhost ghost, MindMapNode? focused) {
    if (focused == null) return;
    acceptMindMapGhost(_model, near: focused, ghost: ghost);
    // The ghost is real now, so it should stop being offered: clearing who the
    // suggestions were for makes the next frame ask again.
    setState(() {
      _suggestionsFor = null;
      _nodeSuggestions = MindMapNodeSuggestions.empty;
    });
  }

  void _openInspector(BuildContext context, MindMapNode? focused) {
    if (focused == null) return;
    // Only reachable on a narrow window; the wide layout already has it open.
    if (MediaQuery.sizeOf(context).width >= _twoPaneWidth) return;

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (context) => FractionallySizedBox(
        heightFactor: 0.9,
        child: AnimatedBuilder(
          animation: _model.listenable,
          builder: (context, _) {
            final node = _model.nodeById(focused.id);
            if (node == null) return const SizedBox.shrink();
            return MindMapInspector(
              key: ValueKey(node.id),
              model: _model,
              suggestions: _suggestions,
              node: node,
              onFocus: (id) {
                Navigator.of(context).pop();
                _focus(id);
              },
              onClose: Navigator.of(context).pop,
            );
          },
        ),
      ),
    );
  }

  void _showOverflow(BuildContext context, List<MindMapNeighbour> hidden) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Also here'),
        content: SizedBox(
          width: 420,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (final neighbour in hidden)
                  ListTile(
                    dense: true,
                    leading: Icon(neighbour.node.kind.icon, color: neighbour.node.color),
                    title: Text(neighbour.node.title, maxLines: 1, overflow: TextOverflow.ellipsis),
                    subtitle: Text(switch (neighbour.relation) {
                      MindMapRelation.parent => 'Up a level',
                      MindMapRelation.child => 'Inside',
                      MindMapRelation.connected => neighbour.edge?.label ?? 'Connected',
                    }),
                    onTap: () {
                      Navigator.of(context).pop();
                      _focus(neighbour.node.id);
                    },
                  ),
              ],
            ),
          ),
        ),
        actions: [TextButton(onPressed: Navigator.of(context).pop, child: const Text('Close'))],
      ),
    );
  }

  void _nodeMenu(BuildContext context, MindMapNode node, Offset position) {
    showContextMenu(
      context,
      contextMenu: ContextMenu(
        position: position,
        entries: <ContextMenuEntry>[
          MenuItem(
            label: Center(child: Text(node.title, maxLines: 1, overflow: TextOverflow.ellipsis)),
            enabled: false,
          ),
          const MenuDivider(),
          MenuItem(
            label: const Text('Open'),
            icon: const Icon(Symbols.my_location),
            onSelected: (_) => _focus(node.id),
          ),
          MenuItem(
            label: const Text('Edit'),
            icon: const Icon(Symbols.edit),
            onSelected: (_) => showDialog(
              context: context,
              builder: (_) => MindMapTopicDialog(model: _model, editing: node),
            ),
          ),
          MenuItem(
            label: const Text('Connect to…'),
            icon: const Icon(Symbols.polyline),
            onSelected: (_) => showDialog(
              context: context,
              builder: (_) => MindMapConnectDialog(model: _model, from: node),
            ),
          ),
          MenuItem(
            label: const Text('Move into…'),
            icon: const Icon(Symbols.drive_file_move),
            onSelected: (_) => showDialog(
              context: context,
              builder: (_) => MindMapMoveDialog(model: _model, node: node),
            ),
          ),
          if (node.workItemKey case final key?) ...[
            const MenuDivider(),
            MenuItem(
              label: const Text('Open as tab'),
              icon: const Icon(Symbols.tab),
              onSelected: (_) => WorkItemTabsModel().openWorkItem(key),
            ),
          ],
          const MenuDivider(),
          MenuItem(
            label: const Text('Remove from the map'),
            icon: const Icon(Symbols.delete),
            onSelected: (_) async {
              if (await confirmMindMapDelete(context, _model, node)) _model.deleteNode(node.id);
            },
          ),
        ],
      ),
    );
  }
}

/// What the tab shows before anything is on the map.
class _EmptyMap extends StatelessWidget {
  const _EmptyMap({required this.onCreate});

  final VoidCallback onCreate;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 520),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            Icon(Symbols.hub, size: 72, color: theme.colorScheme.primary),
            Text('Nothing on the map yet', style: theme.textTheme.headlineSmall),
            Text(
              'Start with a topic in your own words — an area you work in, a release, '
              'a kind of bug you keep meeting. Then put work items inside it, and the map '
              'will start suggesting where the next one belongs.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor),
            ),
            FilledButton.icon(
              icon: const Icon(Symbols.add),
              label: const Text('Create the first topic'),
              onPressed: onCreate,
            ),
          ],
        ),
      ),
    );
  }
}
