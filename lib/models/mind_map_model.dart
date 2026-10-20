/// The mind map: a nested graph of topics and work items, kept as a visual
/// index of what the reader is working on.
///
/// Two relationships, deliberately kept apart, because they answer different
/// questions:
///
///  - **Containment** ([MindMapNode.parentId]) is "what is this part of?". It
///    gives the map its skeleton — a tree of topics a reader can descend into
///    — and it is what makes a node's interior a *subgraph* rather than a flat
///    pile.
///  - **Connection** ([MindMapEdge]) is "what does this have to do with that?".
///    It crosses the tree freely, which is the whole point: the two tickets
///    that block each other rarely live under the same topic.
///
/// The navigator shows both at once — a focused node's parent, its children and
/// everything connected to it all orbit it together — so neither relationship
/// is a second-class citizen.
///
/// Persisted exactly the way `WorkItemTabsModel` and `DashboardsModel` persist
/// theirs: a singleton, [ObservableList]s, and a save coalesced to at most one
/// write a second, so holding a key down in the notes field does not hammer the
/// disk.
library;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:loggy/loggy.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:observable_datasets/observable_list.dart';
import 'package:path/path.dart' as path;

/// What a node stands for.
///
/// Persisted by name rather than index, so a kind added later cannot renumber
/// what is already on disk.
enum MindMapNodeKind {
  /// A concept the reader invented: an area, a feature, a release, a
  /// half-formed idea. The skeleton of the map.
  topic('Topic', Symbols.hub),

  /// A Jira work item placed on the map. Its title is a cached copy of the
  /// summary — the live one is fetched for display, but a cached one means the
  /// map still reads correctly offline, or when Jira has forgotten the issue.
  workItem('Work item', Symbols.description);

  const MindMapNodeKind(this.label, this.icon);

  final String label;
  final IconData icon;

  static MindMapNodeKind byName(String? name) => values.firstWhere((v) => v.name == name, orElse: () => MindMapNodeKind.topic);
}

/// The swatches a node can be given, by index — stored as an index rather than
/// an ARGB value so the palette can be re-tuned for a theme later without
/// rewriting every saved map.
const mindMapPalette = <Color>[
  Color(0xFF6C8EBF), // slate blue
  Color(0xFF4F9D69), // green
  Color(0xFFB8860B), // amber
  Color(0xFFB4594E), // clay
  Color(0xFF7D6BA8), // violet
  Color(0xFF3F8A8C), // teal
  Color(0xFFA85C8A), // plum
  Color(0xFF6F7A87), // grey
];

Color mindMapColor(int index) => mindMapPalette[index.abs() % mindMapPalette.length];

/// One link held inside a node.
///
/// [group] is what makes a node's links a *web* rather than a list: links with
/// the same group name are shown together under it, so a node can hold "the
/// Qase runs", "the merge requests" and "the specs" side by side without
/// needing a child node for each.
class MindMapLink {
  const MindMapLink({required this.id, required this.url, required this.title, this.group, this.note});

  final String id;
  final String url;
  final String title;

  /// The heading this link sits under inside the node, or null for ungrouped.
  final String? group;

  /// A line of the reader's own about why this link is here.
  final String? note;

  MindMapLink copyWith({String? url, String? title, String? group, String? note, bool clearGroup = false, bool clearNote = false}) => MindMapLink(
    id: id,
    url: url ?? this.url,
    title: title ?? this.title,
    group: clearGroup ? null : (group ?? this.group),
    note: clearNote ? null : (note ?? this.note),
  );

  Map<String, dynamic> toJson() => {'id': id, 'url': url, 'title': title, 'group': group, 'note': note};

  static MindMapLink? fromJson(Map json) {
    final id = json['id'];
    final url = json['url'];
    if (id is! String || id.isEmpty || url is! String || url.isEmpty) return null;
    return MindMapLink(
      id: id,
      url: url,
      title: (json['title'] as String?)?.trim().isNotEmpty == true ? json['title'] as String : url,
      group: (json['group'] as String?)?.trim().isNotEmpty == true ? (json['group'] as String).trim() : null,
      note: (json['note'] as String?)?.trim().isNotEmpty == true ? json['note'] as String : null,
    );
  }

  /// The service a URL points at, for the icon beside it. Recognising a handful
  /// by host is enough to make a list of links scannable at a glance, which is
  /// the whole job — anything unrecognised gets the generic link icon.
  IconData get icon {
    final host = Uri.tryParse(url)?.host.toLowerCase() ?? '';
    if (host.contains('qase')) return Symbols.fact_check;
    if (host.contains('gitlab')) return Symbols.merge;
    if (host.contains('github')) return Symbols.code;
    if (host.contains('atlassian') && url.contains('/wiki')) return Symbols.book_2;
    if (host.contains('atlassian')) return Symbols.task_alt;
    if (host.contains('figma')) return Symbols.design_services;
    if (host.contains('youtube') || host.contains('vimeo')) return Symbols.play_circle;
    if (host.contains('docs.google') || host.contains('sharepoint') || host.contains('office')) return Symbols.description;
    return Symbols.link;
  }
}

/// The form of a URL that decides whether two links are the same one.
///
/// Scheme and host are case-insensitive and a trailing slash means nothing, so
/// two people pasting the same page should not leave the map holding two of it.
/// Everything past the host is left exactly as written — a query or a fragment
/// is frequently the whole point of a link, and normalising those away would
/// merge two genuinely different destinations.
String canonicalLinkUrl(String url) {
  final trimmed = url.trim();
  final uri = Uri.tryParse(trimmed);
  if (uri == null || !uri.hasScheme || uri.host.isEmpty) return trimmed.toLowerCase();

  final path = uri.path.endsWith('/') && uri.path.length > 1 ? uri.path.substring(0, uri.path.length - 1) : uri.path;
  return uri.replace(scheme: uri.scheme.toLowerCase(), host: uri.host.toLowerCase(), path: path).toString();
}

/// One node of the map.
///
/// Immutable: every mutator on [MindMapModel] replaces the node in the list
/// rather than reaching into it. That is what makes the navigator's animation
/// honest — it diffs the constellation it is showing against the new one, which
/// only works if a node that did not change is still the same value.
class MindMapNode {
  MindMapNode({
    required this.id,
    required this.kind,
    required this.title,
    this.workItemKey,
    this.parentId,
    List<String> tags = const [],
    this.notes = '',
    List<MindMapLink> links = const [],
    List<int> taskIds = const [],
    this.accent = 0,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : tags = List.unmodifiable(tags),
       links = List.unmodifiable(links),
       taskIds = List.unmodifiable(taskIds),
       createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();

  final String id;
  final MindMapNodeKind kind;
  final String title;

  /// The Jira key, on a [MindMapNodeKind.workItem] node. Null on a topic.
  final String? workItemKey;

  /// The node this one lives inside, or null for a node in the home
  /// constellation.
  final String? parentId;

  final List<String> tags;
  final String notes;
  final List<MindMapLink> links;

  /// Ids of `ToDoTask`s adopted by this node. The tasks themselves stay in
  /// `ToDoTasksModel`: a task on the map is the same task the To Do page shows,
  /// not a copy of it, so ticking it off in either place is the same act.
  final List<int> taskIds;

  final int accent;
  final DateTime createdAt;
  final DateTime updatedAt;

  Color get color => mindMapColor(accent);

  /// True when there is anything inside worth opening the node for. Drives the
  /// "there is more in here" dot the navigator draws.
  bool get hasInterior => notes.trim().isNotEmpty || links.isNotEmpty || taskIds.isNotEmpty;

  MindMapNode copyWith({
    String? title,
    String? workItemKey,
    String? parentId,
    bool clearParent = false,
    List<String>? tags,
    String? notes,
    List<MindMapLink>? links,
    List<int>? taskIds,
    int? accent,
    bool touch = true,
  }) => MindMapNode(
    id: id,
    kind: kind,
    title: title ?? this.title,
    workItemKey: workItemKey ?? this.workItemKey,
    parentId: clearParent ? null : (parentId ?? this.parentId),
    tags: tags ?? this.tags,
    notes: notes ?? this.notes,
    links: links ?? this.links,
    taskIds: taskIds ?? this.taskIds,
    accent: accent ?? this.accent,
    createdAt: createdAt,
    updatedAt: touch ? DateTime.now() : updatedAt,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'kind': kind.name,
    'title': title,
    'workItemKey': workItemKey,
    'parentId': parentId,
    'tags': tags,
    'notes': notes,
    'links': links.map((l) => l.toJson()).toList(),
    'taskIds': taskIds,
    'accent': accent,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt.toIso8601String(),
  };

  /// Null for a record too broken to place — no id, or nothing to draw as a
  /// name. The caller drops it rather than taking the whole map down for one
  /// bad row.
  static MindMapNode? fromJson(Map json) {
    final id = json['id'];
    if (id is! String || id.isEmpty) return null;
    final kind = MindMapNodeKind.byName(json['kind'] as String?);
    final key = (json['workItemKey'] as String?)?.trim();
    final title = (json['title'] as String?)?.trim();
    if ((title == null || title.isEmpty) && (key == null || key.isEmpty)) return null;

    return MindMapNode(
      id: id,
      kind: kind,
      title: (title == null || title.isEmpty) ? key! : title,
      workItemKey: (key == null || key.isEmpty) ? null : key,
      parentId: (json['parentId'] as String?)?.trim().isNotEmpty == true ? json['parentId'] as String : null,
      tags: ((json['tags'] as List?) ?? const []).whereType<String>().toList(),
      notes: json['notes'] as String? ?? '',
      links: ((json['links'] as List?) ?? const []).whereType<Map>().map(MindMapLink.fromJson).whereType<MindMapLink>().toList(),
      taskIds: ((json['taskIds'] as List?) ?? const []).whereType<int>().toList(),
      accent: json['accent'] as int? ?? 0,
      createdAt: DateTime.tryParse(json['createdAt'] as String? ?? ''),
      updatedAt: DateTime.tryParse(json['updatedAt'] as String? ?? ''),
    );
  }
}

/// A connection between two nodes, regardless of where either sits in the tree.
///
/// Undirected as far as the navigator is concerned — both ends orbit each other
/// — but [from] and [to] are kept as written so a label like "blocks" still
/// reads the right way round.
class MindMapEdge {
  const MindMapEdge({required this.id, required this.from, required this.to, this.label, this.fromJiraLinkType});

  final String id;
  final String from;
  final String to;

  /// What the reader called this connection, if anything.
  final String? label;

  /// Set when this edge was accepted from a Jira issue link rather than drawn
  /// by hand — kept so the map can tell the two apart and never offer the same
  /// suggestion twice.
  final String? fromJiraLinkType;

  bool touches(String nodeId) => from == nodeId || to == nodeId;

  /// The end of this edge that is not [nodeId].
  String? otherEnd(String nodeId) => from == nodeId ? to : (to == nodeId ? from : null);

  Map<String, dynamic> toJson() => {'id': id, 'from': from, 'to': to, 'label': label, 'fromJiraLinkType': fromJiraLinkType};

  static MindMapEdge? fromJson(Map json) {
    final id = json['id'], from = json['from'], to = json['to'];
    if (id is! String || from is! String || to is! String) return null;
    if (from == to) return null;
    return MindMapEdge(
      id: id,
      from: from,
      to: to,
      label: (json['label'] as String?)?.trim().isNotEmpty == true ? json['label'] as String : null,
      fromJiraLinkType: json['fromJiraLinkType'] as String?,
    );
  }
}

/// How a node reached the ring around the focused one.
///
/// The navigator draws each differently — containment reads up and down,
/// connection reads sideways — which is what keeps a circle of eight nodes
/// legible instead of a cloud of identical dots.
enum MindMapRelation { parent, child, connected }

/// One node in the ring, with the reason it is there.
class MindMapNeighbour {
  const MindMapNeighbour(this.node, this.relation, {this.edge});

  final MindMapNode node;
  final MindMapRelation relation;

  /// The edge that put it there, for a [MindMapRelation.connected] neighbour.
  final MindMapEdge? edge;
}

/// A node matched by [MindMapModel.search], with what matched.
class MindMapSearchHit {
  const MindMapSearchHit(this.node, this.score, this.reason);

  final MindMapNode node;
  final int score;

  /// Why this came back — "tagged regression", "in the notes", … Shown under
  /// the result, so a hit that matched something invisible does not look like
  /// a mistake.
  final String reason;
}

/// Owns the map and its persistence.
class MindMapModel with GlobalLoggy {
  static final MindMapModel _instance = MindMapModel._internal();

  factory MindMapModel() => _instance;

  MindMapModel._internal() : _persists = true {
    isReady = _getReady();
    _saveTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_saveRequested) {
        _saveRequested = false;
        _save();
      }
    });
  }

  /// A map of its own, with nothing on disk behind it.
  ///
  /// The singleton reads the real settings folder in its constructor, which a
  /// test has no business touching; this gives the graph logic somewhere to be
  /// exercised that saves nowhere.
  @visibleForTesting
  MindMapModel.inMemory() : _persists = false {
    nodes = ObservableList();
    edges = ObservableList();
    isReady = Future.value(true);
  }

  static const int _schemaVersion = 1;

  /// False for the in-memory map a test drives, which must not write to the
  /// reader's real settings folder.
  final bool _persists;

  /// Late so that an [inMemory] map never asks for a settings folder it has no
  /// use for — reaching for one costs a `package_info` platform channel that
  /// does not exist outside a running app.
  late final Future<File> _dataFile = SettingsModel().settingsFolder.then(
    (dir) => File(path.join(dir.path, 'mind_map.json').replaceFirst(RegExp(r'^\\?/?'), '')),
  );

  late final ObservableList<MindMapNode> nodes;
  late final ObservableList<MindMapEdge> edges;

  /// The node the navigator is centred on, or null for the home constellation
  /// of root topics.
  final ValueNotifier<String?> focusedNodeId = ValueNotifier(null);

  /// Whether a node's links are drawn around it as nodes of their own.
  ///
  /// A way of looking at the map rather than a property of it — but a saved
  /// one, because a reader who works this way works this way every time, and
  /// having to switch it back on at every launch would be its own small tax.
  final ValueNotifier<bool> linksAsNodes = ValueNotifier(false);

  /// Everything that should redraw the navigator when it changes.
  Listenable get listenable => Listenable.merge([nodes, edges, focusedNodeId, linksAsNodes]);

  late Future<bool> isReady;
  bool _saveRequested = false;
  // ignore: unused_field
  Timer? _saveTimer;

  Future<bool> _getReady() async {
    final file = await _dataFile;
    if (!await file.exists()) {
      nodes = ObservableList();
      edges = ObservableList();
      return true;
    }
    // A hand-edited or truncated file must degrade to an empty map, not take
    // the page down.
    try {
      final raw = await file.readAsString();
      if (raw.trim().isEmpty) {
        nodes = ObservableList();
        edges = ObservableList();
        return true;
      }
      final data = jsonDecode(raw) as Map<String, dynamic>;
      final loaded = ((data['nodes'] as List?) ?? const []).whereType<Map>().map(MindMapNode.fromJson).whereType<MindMapNode>().toList();
      nodes = ObservableList(initialData: loaded);

      final ids = loaded.map((n) => n.id).toSet();
      // An edge to a node that is no longer there would orbit nothing. Dropped
      // on load rather than guarded at every use.
      edges = ObservableList(
        initialData: ((data['edges'] as List?) ?? const [])
            .whereType<Map>()
            .map(MindMapEdge.fromJson)
            .whereType<MindMapEdge>()
            .where((e) => ids.contains(e.from) && ids.contains(e.to))
            .toList(),
      );

      final savedFocus = data['focusedNodeId'] as String?;
      focusedNodeId.value = ids.contains(savedFocus) ? savedFocus : null;
      linksAsNodes.value = data['linksAsNodes'] as bool? ?? false;
    } on Object catch (e) {
      loggy.error('mind_map.json could not be read ($e). Starting with an empty map.');
      nodes = ObservableList();
      edges = ObservableList();
    }
    return true;
  }

  // READING ///////////////////////////////////////////////////////////////////

  MindMapNode? nodeById(String? id) => id == null ? null : nodes.list.where((n) => n.id == id).firstOrNull;

  MindMapNode? get focusedNode => nodeById(focusedNodeId.value);

  /// The nodes with no parent — what the navigator shows before anything is
  /// focused, and the "big topics" a reader starts from.
  List<MindMapNode> get rootNodes => nodes.list.where((n) => n.parentId == null).toList();

  List<MindMapNode> childrenOf(String id) => nodes.list.where((n) => n.parentId == id).toList();

  List<MindMapEdge> edgesOf(String id) => edges.list.where((e) => e.touches(id)).toList();

  /// The node standing for a Jira key, if the map already has one.
  MindMapNode? nodeForWorkItem(String key) {
    final wanted = key.trim().toUpperCase();
    return nodes.list.where((n) => n.workItemKey?.toUpperCase() == wanted).firstOrNull;
  }

  /// Every work item key on the map, for the suggestion engine to match
  /// against.
  Set<String> get workItemKeys => nodes.list.map((n) => n.workItemKey?.toUpperCase()).whereType<String>().toSet();

  /// Every node holding a link to [url] — what a link node is connected to.
  ///
  /// The same URL filed under three topics is the most interesting thing a map
  /// can tell you about it: those three topics have something in common that
  /// nobody has written down yet.
  List<MindMapNode> nodesLinking(String url) {
    final wanted = canonicalLinkUrl(url);
    return nodes.list.where((n) => n.links.any((l) => canonicalLinkUrl(l.url) == wanted)).toList();
  }

  /// The link a node holds for [url], if it holds one.
  MindMapLink? linkOn(MindMapNode node, String url) {
    final wanted = canonicalLinkUrl(url);
    return node.links.where((l) => canonicalLinkUrl(l.url) == wanted).firstOrNull;
  }

  void setLinksAsNodes(bool value) {
    if (linksAsNodes.value == value) return;
    linksAsNodes.value = value;
    requestSave();
  }

  List<String> get allTags {
    final tags = <String>{};
    for (final node in nodes.list) {
      tags.addAll(node.tags);
    }
    return tags.toList()..sort();
  }

  /// Everything that orbits [id]: its parent, its children, and everything
  /// connected to it.
  ///
  /// Ordered parent-first, then children, then connections, so the navigator
  /// can lay them out in a stable ring — a node that keeps its slot between two
  /// visits is a node a reader learns the position of.
  List<MindMapNeighbour> neighboursOf(String id) {
    final node = nodeById(id);
    if (node == null) return const [];

    final out = <MindMapNeighbour>[];
    final parent = nodeById(node.parentId);
    if (parent != null) out.add(MindMapNeighbour(parent, MindMapRelation.parent));

    for (final child in childrenOf(id)) {
      out.add(MindMapNeighbour(child, MindMapRelation.child));
    }

    for (final edge in edgesOf(id)) {
      final other = nodeById(edge.otherEnd(id));
      // A connection that duplicates the containment already shown would put
      // the same node in the ring twice.
      if (other == null || out.any((n) => n.node.id == other.id)) continue;
      out.add(MindMapNeighbour(other, MindMapRelation.connected, edge: edge));
    }

    return out;
  }

  /// The chain of containment from a root down to [id], ending with [id]
  /// itself. The breadcrumb above the navigator.
  List<MindMapNode> pathTo(String id) {
    final out = <MindMapNode>[];
    final seen = <String>{};
    var current = nodeById(id);
    while (current != null && seen.add(current.id)) {
      out.insert(0, current);
      current = nodeById(current.parentId);
    }
    return out;
  }

  /// True when [candidateId] is [id] itself or sits somewhere beneath it — the
  /// check that stops a node being filed inside its own subtree, which would
  /// detach the whole branch from the map and strand it.
  bool isSelfOrDescendant(String candidateId, String id) {
    if (candidateId == id) return true;
    final seen = <String>{};
    var current = nodeById(candidateId);
    while (current != null && seen.add(current.id)) {
      if (current.parentId == id) return true;
      current = nodeById(current.parentId);
    }
    return false;
  }

  // WRITING ///////////////////////////////////////////////////////////////////

  MindMapNode createTopic({required String title, String? parentId, List<String> tags = const [], int accent = 0}) {
    final node = MindMapNode(
      id: _newId('node'),
      kind: MindMapNodeKind.topic,
      title: title.trim().isEmpty ? 'Untitled topic' : title.trim(),
      parentId: parentId,
      tags: tags,
      accent: accent,
    );
    nodes.add(node);
    requestSave();
    return node;
  }

  /// Puts a Jira work item on the map, or returns the node it already has —
  /// the same key twice would be two places to look for one ticket, which is
  /// exactly the confusion the map exists to end.
  MindMapNode attachWorkItem({required String key, required String title, String? parentId, List<String> tags = const []}) {
    final existing = nodeForWorkItem(key);
    if (existing != null) {
      if (parentId != null && existing.parentId != parentId) moveNode(existing.id, parentId);
      return nodeById(existing.id)!;
    }
    final node = MindMapNode(
      id: _newId('node'),
      kind: MindMapNodeKind.workItem,
      title: title.trim().isEmpty ? key : title.trim(),
      workItemKey: key.trim().toUpperCase(),
      parentId: parentId,
      tags: tags,
      // Inherits its topic's colour, so a ticket reads as belonging to where it
      // was put rather than arriving in an unrelated one.
      accent: nodeById(parentId)?.accent ?? 0,
    );
    nodes.add(node);
    requestSave();
    return node;
  }

  void update(String id, MindMapNode Function(MindMapNode) change) {
    final index = nodes.list.indexWhere((n) => n.id == id);
    if (index < 0) return;
    nodes[index] = change(nodes.list[index]);
    requestSave();
  }

  void rename(String id, String title) => update(id, (n) => n.copyWith(title: title.trim().isEmpty ? n.title : title.trim()));

  void setNotes(String id, String notes) => update(id, (n) => n.copyWith(notes: notes));

  void setAccent(String id, int accent) => update(id, (n) => n.copyWith(accent: accent));

  void addTag(String id, String tag) {
    final clean = tag.trim().toLowerCase();
    if (clean.isEmpty) return;
    update(id, (n) => n.tags.contains(clean) ? n : n.copyWith(tags: [...n.tags, clean]));
  }

  void removeTag(String id, String tag) => update(id, (n) => n.copyWith(tags: n.tags.where((t) => t != tag).toList()));

  /// Re-files a node under a different parent. Refuses a move into its own
  /// subtree, and refuses to make a node its own parent.
  void moveNode(String id, String? newParentId) {
    if (id == newParentId) return;
    if (newParentId != null && isSelfOrDescendant(newParentId, id)) {
      loggy.warning('Refusing to move $id into its own descendant $newParentId.');
      return;
    }
    update(id, (n) => newParentId == null ? n.copyWith(clearParent: true) : n.copyWith(parentId: newParentId));
  }

  /// Deletes a node. Its children are adopted by its parent rather than deleted
  /// with it: a reader removing a topic usually means "this grouping was
  /// wrong", not "throw away everything I filed under it".
  void deleteNode(String id) {
    final node = nodeById(id);
    if (node == null) return;
    for (final child in childrenOf(id)) {
      update(child.id, (n) => node.parentId == null ? n.copyWith(clearParent: true) : n.copyWith(parentId: node.parentId));
    }
    edges.removeWhere((e, _) => e.touches(id));
    nodes.removeWhere((n, _) => n.id == id);
    if (focusedNodeId.value == id) focusedNodeId.value = node.parentId;
    requestSave();
  }

  /// Connects two nodes, or returns the edge they already have. Returns null
  /// for a connection that cannot exist (a node to itself, or an id that is not
  /// on the map).
  MindMapEdge? connect(String from, String to, {String? label, String? fromJiraLinkType}) {
    if (from == to) return null;
    if (nodeById(from) == null || nodeById(to) == null) return null;
    final existing = edges.list.where((e) => (e.from == from && e.to == to) || (e.from == to && e.to == from)).firstOrNull;
    if (existing != null) return existing;

    final edge = MindMapEdge(id: _newId('edge'), from: from, to: to, label: label, fromJiraLinkType: fromJiraLinkType);
    edges.add(edge);
    requestSave();
    return edge;
  }

  void disconnect(String edgeId) {
    edges.removeWhere((e, _) => e.id == edgeId);
    requestSave();
  }

  bool areConnected(String a, String b) => edges.list.any((e) => (e.from == a && e.to == b) || (e.from == b && e.to == a));

  MindMapLink addLink(String nodeId, {required String url, String? title, String? group, String? note}) {
    final link = MindMapLink(
      id: _newId('link'),
      url: url.trim(),
      title: (title?.trim().isNotEmpty ?? false) ? title!.trim() : _titleFromUrl(url),
      group: (group?.trim().isNotEmpty ?? false) ? group!.trim() : null,
      note: (note?.trim().isNotEmpty ?? false) ? note!.trim() : null,
    );
    update(nodeId, (n) => n.copyWith(links: [...n.links, link]));
    return link;
  }

  void updateLink(String nodeId, MindMapLink link) => update(nodeId, (n) => n.copyWith(links: [for (final l in n.links) if (l.id == link.id) link else l]));

  void removeLink(String nodeId, String linkId) => update(nodeId, (n) => n.copyWith(links: n.links.where((l) => l.id != linkId).toList()));

  void attachTask(String nodeId, int taskId) => update(nodeId, (n) => n.taskIds.contains(taskId) ? n : n.copyWith(taskIds: [...n.taskIds, taskId]));

  void detachTask(String nodeId, int taskId) => update(nodeId, (n) => n.copyWith(taskIds: n.taskIds.where((t) => t != taskId).toList()));

  void focus(String? nodeId) {
    focusedNodeId.value = nodeId == null ? null : (nodeById(nodeId) == null ? null : nodeId);
    requestSave();
  }

  /// The last path segment, spaced out, as a stand-in name for a pasted URL.
  static String _titleFromUrl(String url) {
    final uri = Uri.tryParse(url.trim());
    if (uri == null) return url.trim();
    final segment = uri.pathSegments.where((s) => s.trim().isNotEmpty).lastOrNull;
    if (segment == null || segment.isEmpty) return uri.host.isEmpty ? url.trim() : uri.host;
    return Uri.decodeComponent(segment).replaceAll(RegExp(r'[-_+]'), ' ').trim();
  }

  // SEARCHING /////////////////////////////////////////////////////////////////

  /// Finds nodes by whatever the reader remembers about them.
  ///
  /// The point of the map is to find a ticket whose Jira wording you have
  /// forgotten, so this deliberately looks well past the title: tags, the notes
  /// inside a node, the titles and URLs of its links, and the work item key all
  /// count. Each hit says which of those matched, so a result that looks
  /// unrelated explains itself.
  ///
  /// [tags] narrows to nodes carrying all of them, and works with an empty
  /// [query] — browsing by tag is a search in its own right.
  List<MindMapSearchHit> search(String query, {Set<String> tags = const {}}) {
    final needle = query.trim().toLowerCase();
    final hits = <MindMapSearchHit>[];

    for (final node in nodes.list) {
      if (tags.isNotEmpty && !tags.every(node.tags.contains)) continue;

      if (needle.isEmpty) {
        hits.add(MindMapSearchHit(node, 1, tags.isEmpty ? node.kind.label : 'tagged ${tags.join(', ')}'));
        continue;
      }

      var best = 0;
      var reason = '';
      void consider(int score, String why) {
        if (score > best) {
          best = score;
          reason = why;
        }
      }

      if (node.workItemKey != null) {
        final key = node.workItemKey!.toLowerCase();
        if (key == needle) {
          consider(1000, 'that work item');
        } else if (key.contains(needle)) {
          consider(700, node.workItemKey!);
        }
      }
      consider(_score(needle, node.title.toLowerCase()), 'in the title');
      for (final tag in node.tags) {
        // Tags exist to be searched by, so a tag match outranks the same words
        // appearing loose in a note.
        consider((_score(needle, tag) * 0.9).round(), 'tagged $tag');
      }
      if (node.notes.toLowerCase().contains(needle)) consider(180, 'in the notes');
      for (final link in node.links) {
        if (link.title.toLowerCase().contains(needle)) {
          consider(160, 'a link: ${link.title}');
        } else if (link.url.toLowerCase().contains(needle)) {
          consider(120, 'a link URL');
        } else if (link.group?.toLowerCase().contains(needle) ?? false) {
          consider(140, 'link group ${link.group}');
        }
      }

      if (best > 0) hits.add(MindMapSearchHit(node, best, reason));
    }

    hits.sort((a, b) {
      final byScore = b.score.compareTo(a.score);
      // Alphabetical rather than arbitrary among equals: a list that reorders
      // itself between two identical searches is unusable.
      return byScore != 0 ? byScore : a.node.title.toLowerCase().compareTo(b.node.title.toLowerCase());
    });
    return hits;
  }

  /// How well [needle] matches [haystack] — both already lowercased.
  ///
  /// Exact, prefix and substring beat a scattered match, and a scattered one
  /// ("wlk" finding "wave link") still beats nothing, which is what makes the
  /// box feel like it is guessing with you rather than at you.
  static int _score(String needle, String haystack) {
    if (needle.isEmpty || haystack.isEmpty) return 0;
    if (haystack == needle) return 900;
    if (haystack.startsWith(needle)) return 600;
    if (haystack.contains(needle)) return 400;

    // Subsequence: every letter of the needle appears in order. Scored down by
    // how far apart they were dragged, so a tight match ranks above a match
    // spread across a whole sentence.
    var index = 0;
    var span = 0;
    for (final rune in needle.runes) {
      final next = haystack.indexOf(String.fromCharCode(rune), index);
      if (next < 0) return 0;
      span += next - index;
      index = next + 1;
    }
    return (200 - span).clamp(40, 200);
  }

  // PERSISTENCE ///////////////////////////////////////////////////////////////

  /// Counted as well as timestamped: the clock's resolution is coarser than a
  /// microsecond on Windows, so two links added in the same breath — or a
  /// handful of suggested nodes accepted at once — would otherwise share an id,
  /// and deleting one of them would take its twin with it.
  int _idCounter = 0;

  String _newId(String prefix) => '$prefix:${DateTime.now().microsecondsSinceEpoch}:${_idCounter++}';

  /// Coalesces bursts of changes into at most one write per second.
  void requestSave() => _saveRequested = true;

  Future<void> _save() async {
    if (!_persists) return;
    final file = await _dataFile;
    if (!await file.exists()) await file.create(recursive: true);
    try {
      await file.writeAsString(
        JsonEncoder.withIndent(' ' * 4).convert({
          'schemaVersion': _schemaVersion,
          'focusedNodeId': focusedNodeId.value,
          'linksAsNodes': linksAsNodes.value,
          'nodes': nodes.list.map((n) => n.toJson()).toList(),
          'edges': edges.list.map((e) => e.toJson()).toList(),
        }),
      );
    } on Object catch (e) {
      loggy.error('mind_map.json could not be written to: $e');
    }
  }
}
