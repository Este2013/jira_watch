/// Reading Jira's own idea of how work items relate, and turning it into
/// advice about the mind map.
///
/// The map is the reader's own vocabulary — topics they invented, in words Jira
/// has never heard of. Jira, meanwhile, knows exactly which tickets block which
/// and what belongs to which epic, and knows nothing about the topics. Each is
/// useless to the other on its own; this is the join.
///
/// Three questions get answered, all from the same fetched relations:
///
///  - **Where does this ticket go?** ([placementsFor]) Its linked tickets are
///    already filed somewhere; that somewhere is almost always the answer.
///  - **What else belongs near this one?** ([ghostsFor]) Tickets Jira links to
///    this one that the map has never been told about, offered as one click.
///  - **What should be connected?** ([connectionsFor]) Two nodes that are both
///    on the map and linked in Jira, but not yet connected here.
///
/// Nothing here writes to the map. Every suggestion is something the reader
/// accepts or ignores — a map that rearranged itself behind their back would be
/// exactly the burden this feature exists to avoid.
library;

import 'package:jira_watcher/dao/jira/jira_api.dart';
import 'package:jira_watcher/models/mind_map_model.dart';

/// How much one kind of Jira relation counts as evidence that two tickets
/// belong in the same place.
///
/// A parent and its subtasks are all but the same piece of work, so those lead.
/// "Relates to" is the link type people reach for when they mean "vaguely
/// adjacent", so it trails — still worth something, but it should never
/// outvote a real dependency.
const _relationWeights = <String, int>{
  'parent': 70,
  'subtask': 70,
  'epic': 60,
  'blocks': 45,
  'is blocked by': 45,
  'duplicates': 40,
  'is duplicated by': 40,
  'causes': 35,
  'is caused by': 35,
  'clones': 30,
  'is cloned by': 30,
  'relates to': 25,
};

int _weightFor(String relation) => _relationWeights[relation.toLowerCase()] ?? 25;

/// One work item Jira says is related to another.
class JiraRelation {
  const JiraRelation({required this.key, required this.relation, this.summary});

  final String key;

  /// How it relates, in Jira's own words — "blocks", "is blocked by",
  /// "parent" — so the reason shown to the reader is the wording they already
  /// know from the ticket itself.
  final String relation;

  final String? summary;

  int get weight => _weightFor(relation);
}

/// What Jira knows about one work item, reduced to the parts the map cares
/// about.
class JiraRelations {
  const JiraRelations({
    required this.key,
    this.summary,
    this.status,
    this.projectKey,
    this.components = const [],
    this.labels = const [],
    this.related = const [],
  });

  final String key;
  final String? summary;

  /// The status name, for the chip the inspector shows beside a work item.
  ///
  /// Not a relation, but it comes free with the same fetch — and asking Jira
  /// twice for one issue so that two panels can each have half of it would be
  /// the only alternative.
  final String? status;

  final String? projectKey;
  final List<String> components;
  final List<String> labels;
  final List<JiraRelation> related;

  /// An empty answer, for a key Jira would not return. Used rather than null so
  /// a failed fetch degrades to "no suggestions" instead of an error panel —
  /// the map is perfectly usable without them.
  static JiraRelations empty(String key) => JiraRelations(key: key);

  /// The words a topic's title or tags could plausibly match: the project key,
  /// the components, the labels. Weaker evidence than a link, but it is how a
  /// topic called "Audio" claims a ticket with the "audio" component on a map
  /// that has nothing else to go on.
  List<String> get vocabulary => [
    ?projectKey,
    ...components,
    ...labels,
  ].map((w) => w.trim().toLowerCase()).where((w) => w.isNotEmpty).toList();

  /// Reads the parts of a raw Jira issue this needs.
  ///
  /// Defensive throughout: these are fields off the wire, and a Jira instance
  /// with an unusual configuration should cost a suggestion, not throw.
  static JiraRelations fromIssue(String key, Map<String, dynamic>? issue) {
    if (issue == null) return JiraRelations.empty(key);
    final fields = (issue['fields'] as Map?) ?? const {};

    final related = <JiraRelation>[];

    // The epic or parent issue. Jira calls it `parent` on both a subtask and a
    // story under an epic, which suits the map fine: either way it is the thing
    // this ticket is part of.
    if ((fields['parent'] as Map?) case final parent?) {
      final parentKey = parent['key']?.toString();
      if (parentKey != null) {
        related.add(
          JiraRelation(
            key: parentKey,
            relation: 'parent',
            summary: ((parent['fields'] as Map?)?['summary'])?.toString(),
          ),
        );
      }
    }

    for (final sub in (fields['subtasks'] as List?) ?? const []) {
      if (sub is! Map) continue;
      final subKey = sub['key']?.toString();
      if (subKey == null) continue;
      related.add(JiraRelation(key: subKey, relation: 'subtask', summary: ((sub['fields'] as Map?)?['summary'])?.toString()));
    }

    for (final link in (fields['issuelinks'] as List?) ?? const []) {
      if (link is! Map) continue;
      final type = (link['type'] as Map?) ?? const {};
      // A link carries exactly one of these, and which one it is decides
      // whether the relation reads outward ("blocks") or inward ("is blocked
      // by") from this issue's side.
      final inward = link['inwardIssue'] as Map?;
      final outward = link['outwardIssue'] as Map?;
      final other = inward ?? outward;
      if (other == null) continue;
      final otherKey = other['key']?.toString();
      if (otherKey == null) continue;

      related.add(
        JiraRelation(
          key: otherKey,
          relation: (inward != null ? type['inward'] : type['outward'])?.toString() ?? 'relates to',
          summary: ((other['fields'] as Map?)?['summary'])?.toString(),
        ),
      );
    }

    return JiraRelations(
      key: key,
      summary: fields['summary']?.toString(),
      status: ((fields['status'] as Map?)?['name'])?.toString(),
      projectKey: ((fields['project'] as Map?)?['key'])?.toString(),
      components: ((fields['components'] as List?) ?? const []).map((c) => (c as Map?)?['name']?.toString()).whereType<String>().toList(),
      labels: ((fields['labels'] as List?) ?? const []).whereType<String>().toList(),
      related: related,
    );
  }
}

/// A suggested home for a work item.
class MindMapPlacement {
  const MindMapPlacement({required this.topic, required this.score, required this.reason, this.evidence = const []});

  /// Where to file it — null means the home constellation, which is what gets
  /// offered when the map has nothing to go on yet.
  final MindMapNode? topic;

  final int score;

  /// One line a reader can agree or disagree with: "3 linked work items are
  /// already here". A suggestion that cannot explain itself is a suggestion
  /// nobody trusts twice.
  final String reason;

  /// The keys that argued for this topic, for the detail under the reason.
  final List<String> evidence;

  String get label => topic?.title ?? 'Top level';
}

/// A work item Jira links to one already on the map, that the map has never
/// heard of — drawn around the focused node as something not yet real, ready to
/// be pulled in.
class MindMapGhost {
  const MindMapGhost({required this.workItemKey, required this.relation, this.summary});

  final String workItemKey;
  final String relation;
  final String? summary;

  String get title => summary?.trim().isNotEmpty == true ? summary!.trim() : workItemKey;
}

/// Two nodes already on the map that Jira links, but this map does not.
class MindMapConnectionSuggestion {
  const MindMapConnectionSuggestion({required this.from, required this.to, required this.relation});

  final MindMapNode from;
  final MindMapNode to;
  final String relation;
}

/// Everything worth offering around one focused node.
class MindMapNodeSuggestions {
  const MindMapNodeSuggestions({this.ghosts = const [], this.connections = const []});

  final List<MindMapGhost> ghosts;
  final List<MindMapConnectionSuggestion> connections;

  bool get isEmpty => ghosts.isEmpty && connections.isEmpty;

  static const empty = MindMapNodeSuggestions();
}

/// Takes a ghost up on its offer: puts it on the map beside whatever pointed
/// at it, and joins the two.
///
/// Where "beside" means depends on what was focused. A ghost offered from a
/// topic belongs *inside* that topic — that is what the topic is for. One
/// offered from a work item belongs alongside it, under the same parent,
/// because a ticket is not a container for other tickets.
///
/// Shared by the navigator and the inspector, which both offer ghosts and must
/// not place them differently.
MindMapNode acceptMindMapGhost(MindMapModel model, {required MindMapNode near, required MindMapGhost ghost}) {
  final parentId = near.workItemKey == null ? near.id : near.parentId;
  final added = model.attachWorkItem(key: ghost.workItemKey, title: ghost.title, parentId: parentId);
  // Only between two work items: an edge from a topic to something already
  // filed inside it would say nothing the containment does not.
  if (near.workItemKey != null) {
    model.connect(near.id, added.id, label: ghost.relation, fromJiraLinkType: ghost.relation);
  }
  return added;
}

/// Answers the map's questions about Jira. One per map; the UI holds a single
/// instance so the cache is shared across every panel that asks.
class MindMapSuggestions {
  MindMapSuggestions(this.model, {Future<Map<String, dynamic>?> Function(String key)? fetch}) : _fetch = fetch ?? ((key) => JiraApi().workItem(key));

  /// The one the app shares.
  ///
  /// Lazy, like every static in Dart, so nothing is fetched or even
  /// constructed until something actually asks. One instance means a question
  /// asked from the tab strip is still answered from cache when the map asks
  /// the same one a moment later.
  static final MindMapSuggestions shared = MindMapSuggestions(MindMapModel());

  final MindMapModel model;

  /// Injectable so the suggestion logic can be tested without a Jira to talk
  /// to — everything interesting here is in the scoring, not the HTTP.
  final Future<Map<String, dynamic>?> Function(String key) _fetch;

  /// Relations by key, so that focusing the same node twice — or a panel and
  /// the navigator both asking at once — costs one request.
  final Map<String, Future<JiraRelations>> _cache = {};

  Future<JiraRelations> relationsFor(String key) {
    final wanted = key.trim().toUpperCase();
    return _cache.putIfAbsent(wanted, () async {
      try {
        return JiraRelations.fromIssue(wanted, await _fetch(wanted));
      } on Object {
        // Jira being unreachable costs the suggestions, not the map.
        return JiraRelations.empty(wanted);
      }
    });
  }

  /// Forgets what Jira said, so a ticket whose links have since changed is
  /// asked about again.
  void forget(String key) => _cache.remove(key.trim().toUpperCase());

  /// Where [key] should go, best first.
  ///
  /// Always returns at least one option — the top level — so the caller never
  /// has to handle "no idea" as a special case.
  Future<List<MindMapPlacement>> placementsFor(String key) async {
    final relations = await relationsFor(key);
    final existing = model.nodeForWorkItem(key);

    // Topic id (or '' for the top level) -> running score and evidence.
    final scores = <String, int>{};
    final evidence = <String, List<String>>{};
    final reasons = <String, Set<String>>{};

    void add(String? topicId, int score, String evidenceKey, String reason) {
      final id = topicId ?? '';
      scores[id] = (scores[id] ?? 0) + score;
      (evidence[id] ??= []).add(evidenceKey);
      (reasons[id] ??= {}).add(reason);
    }

    // The strongest signal by far: a linked ticket already filed somewhere.
    for (final relation in relations.related) {
      final node = model.nodeForWorkItem(relation.key);
      if (node == null || node.id == existing?.id) continue;
      // Where that ticket lives is where this one is being proposed — a work
      // item node's own parent, or the top level if it sits there.
      add(node.parentId, relation.weight, relation.key, '${relation.key} ${relation.relation} it');
    }

    // Weaker: a topic whose name or tags are the project, a component or a
    // label. Only consulted for topics, and only once per topic per word.
    for (final topic in model.nodes.list.where((n) => n.kind == MindMapNodeKind.topic)) {
      final haystack = [topic.title.toLowerCase(), ...topic.tags];
      for (final word in relations.vocabulary) {
        if (haystack.any((h) => h == word || h.contains(word) || word.contains(h))) {
          add(topic.id, 18, word, 'its $word');
          break;
        }
      }
    }

    // And weakest: a topic that is already where this project's tickets go.
    if (relations.projectKey case final project?) {
      for (final topic in model.nodes.list.where((n) => n.kind == MindMapNodeKind.topic)) {
        final siblings = model.childrenOf(topic.id).where((n) => n.workItemKey?.startsWith('$project-') ?? false).length;
        if (siblings >= 2) add(topic.id, 8 + siblings, project, '$siblings other $project items live here');
      }
    }

    final placements = <MindMapPlacement>[];
    for (final entry in scores.entries) {
      final topic = entry.key.isEmpty ? null : model.nodeById(entry.key);
      // A topic deleted between the fetch and now, or the id of a node that is
      // not a topic at all.
      if (entry.key.isNotEmpty && topic == null) continue;
      final keys = (evidence[entry.key] ?? const <String>[]).toSet().toList();
      placements.add(
        MindMapPlacement(
          topic: topic,
          score: entry.value,
          reason: _reasonLine(reasons[entry.key] ?? const {}, keys.length),
          evidence: keys,
        ),
      );
    }

    placements.sort((a, b) => b.score.compareTo(a.score));

    // The top level is always an option, even when nothing argued for it:
    // a reader who disagrees with every suggestion still needs somewhere to
    // put the thing.
    if (!placements.any((p) => p.topic == null)) {
      placements.add(const MindMapPlacement(topic: null, score: 0, reason: 'Somewhere of its own, for now'));
    }
    return placements;
  }

  /// Turns the collected reasons into one readable line.
  static String _reasonLine(Set<String> reasons, int count) {
    if (reasons.isEmpty) return 'A reasonable home';
    if (reasons.length == 1) return reasons.first.substring(0, 1).toUpperCase() + reasons.first.substring(1);
    return '${reasons.first.substring(0, 1).toUpperCase()}${reasons.first.substring(1)}, and ${count - 1} more';
  }

  /// What to offer around [node]: tickets Jira links that are missing from the
  /// map, and nodes that ought to be connected to it.
  ///
  /// A topic has no Jira identity of its own, so it answers through its work
  /// item children — focusing "Audio" offers what the tickets filed under it
  /// are linked to, which is exactly how a topic grows.
  Future<MindMapNodeSuggestions> forNode(MindMapNode node) async {
    final keys = node.workItemKey != null ? [node.workItemKey!] : model.childrenOf(node.id).map((n) => n.workItemKey).whereType<String>().toList();
    if (keys.isEmpty) return MindMapNodeSuggestions.empty;

    final ghosts = <String, MindMapGhost>{};
    final connections = <String, MindMapConnectionSuggestion>{};
    final onMap = model.workItemKeys;

    for (final key in keys) {
      final anchor = model.nodeForWorkItem(key);
      final relations = await relationsFor(key);

      for (final relation in relations.related) {
        final relatedKey = relation.key.toUpperCase();
        if (relatedKey == key.toUpperCase()) continue;

        if (!onMap.contains(relatedKey)) {
          // Not on the map at all: offer to bring it in. First mention wins, so
          // the relation shown is the closest one found.
          ghosts.putIfAbsent(relatedKey, () => MindMapGhost(workItemKey: relatedKey, relation: relation.relation, summary: relation.summary));
          continue;
        }

        // On the map, so the question is whether the two are joined here.
        final other = model.nodeForWorkItem(relatedKey);
        if (other == null || anchor == null || other.id == anchor.id) continue;
        if (model.areConnected(anchor.id, other.id)) continue;
        // Containment already says these belong together; drawing an edge on
        // top of it would be noise.
        if (other.parentId == anchor.id || anchor.parentId == other.id) continue;

        final pairId = ([anchor.id, other.id]..sort()).join('|');
        connections.putIfAbsent(pairId, () => MindMapConnectionSuggestion(from: anchor, to: other, relation: relation.relation));
      }
    }

    return MindMapNodeSuggestions(
      ghosts: ghosts.values.toList(),
      connections: connections.values.toList(),
    );
  }
}
