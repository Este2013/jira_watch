import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/models/mind_map_model.dart';
import 'package:jira_watcher/models/mind_map_suggestions.dart';

/// A raw Jira issue, shaped the way `/rest/api/3/issue/{key}` returns one.
Map<String, dynamic> issue({
  required String key,
  String summary = 'A work item',
  String? project,
  List<String> components = const [],
  List<String> labels = const [],
  Map<String, dynamic>? parent,
  List<Map<String, dynamic>> subtasks = const [],
  List<Map<String, dynamic>> links = const [],
}) => {
  'key': key,
  'fields': {
    'summary': summary,
    if (project != null) 'project': {'key': project},
    'components': [
      for (final c in components) {'name': c},
    ],
    'labels': labels,
    'parent': ?parent,
    'subtasks': subtasks,
    'issuelinks': links,
  },
};

/// One entry of `fields.issuelinks`. [inward] decides which side of the link
/// this issue is on, which is what makes it read "blocks" or "is blocked by".
Map<String, dynamic> link({required String other, required String type, required String inwardName, required String outwardName, bool inward = false}) => {
  'type': {'name': type, 'inward': inwardName, 'outward': outwardName},
  if (inward) 'inwardIssue': {'key': other, 'fields': {'summary': 'Other'}} else 'outwardIssue': {'key': other, 'fields': {'summary': 'Other'}},
};

/// A suggester backed by a fixed set of issues rather than a Jira.
MindMapSuggestions suggesterFor(MindMapModel model, Map<String, Map<String, dynamic>> issues) =>
    MindMapSuggestions(model, fetch: (key) async => issues[key.toUpperCase()]);

void main() {
  group('reading what Jira knows', () {
    test('turns issue links into relations worded from this issue is side', () {
      final relations = JiraRelations.fromIssue(
        'WL-1',
        issue(
          key: 'WL-1',
          links: [
            link(other: 'WL-2', type: 'Blocks', inwardName: 'is blocked by', outwardName: 'blocks'),
            link(other: 'WL-3', type: 'Blocks', inwardName: 'is blocked by', outwardName: 'blocks', inward: true),
          ],
        ),
      );

      expect(relations.related.firstWhere((r) => r.key == 'WL-2').relation, 'blocks');
      expect(relations.related.firstWhere((r) => r.key == 'WL-3').relation, 'is blocked by');
    });

    test('counts a parent and the subtasks as relations too', () {
      final relations = JiraRelations.fromIssue(
        'WL-1',
        issue(
          key: 'WL-1',
          parent: {'key': 'WL-EPIC', 'fields': {'summary': 'The epic'}},
          subtasks: [
            {'key': 'WL-9', 'fields': {'summary': 'A subtask'}},
          ],
        ),
      );

      expect(relations.related.map((r) => r.key), containsAll(['WL-EPIC', 'WL-9']));
      expect(relations.related.firstWhere((r) => r.key == 'WL-EPIC').relation, 'parent');
    });

    test('collects the project, components and labels as vocabulary', () {
      final relations = JiraRelations.fromIssue('WL-1', issue(key: 'WL-1', project: 'WL', components: ['Audio Engine'], labels: ['Regression']));

      expect(relations.vocabulary, containsAll(['wl', 'audio engine', 'regression']));
    });

    test('survives an issue with none of the fields it wants', () {
      final relations = JiraRelations.fromIssue('WL-1', {'key': 'WL-1'});

      expect(relations.related, isEmpty);
      expect(relations.vocabulary, isEmpty);
    });

    test('survives a null issue, which is what a failed fetch gives', () {
      expect(JiraRelations.fromIssue('WL-1', null).related, isEmpty);
    });

    test('ignores a link with neither end filled in', () {
      final relations = JiraRelations.fromIssue('WL-1', {
        'fields': {
          'issuelinks': [
            {'type': {'name': 'Blocks'}},
          ],
        },
      });

      expect(relations.related, isEmpty);
    });
  });

  group('where a ticket should go', () {
    test('follows a linked ticket to the topic it already lives in', () async {
      final map = MindMapModel.inMemory();
      final audio = map.createTopic(title: 'Audio');
      map.createTopic(title: 'Video');
      map.attachWorkItem(key: 'WL-2', title: 'The other one', parentId: audio.id);

      final suggester = suggesterFor(map, {
        'WL-1': issue(key: 'WL-1', links: [link(other: 'WL-2', type: 'Blocks', inwardName: 'is blocked by', outwardName: 'blocks')]),
      });

      final placements = await suggester.placementsFor('WL-1');

      expect(placements.first.topic!.id, audio.id);
      expect(placements.first.evidence, contains('WL-2'));
      expect(placements.first.reason, contains('WL-2'));
    });

    test('a parent outweighs a vague relates-to somewhere else', () async {
      final map = MindMapModel.inMemory();
      final epicHome = map.createTopic(title: 'Where the epic lives');
      final elsewhere = map.createTopic(title: 'Elsewhere');
      map.attachWorkItem(key: 'WL-EPIC', title: 'The epic', parentId: epicHome.id);
      map.attachWorkItem(key: 'WL-7', title: 'Vaguely related', parentId: elsewhere.id);

      final suggester = suggesterFor(map, {
        'WL-1': issue(
          key: 'WL-1',
          parent: {'key': 'WL-EPIC'},
          links: [link(other: 'WL-7', type: 'Relates', inwardName: 'relates to', outwardName: 'relates to')],
        ),
      });

      expect((await suggester.placementsFor('WL-1')).first.topic!.id, epicHome.id);
    });

    test('several linked tickets in one topic add up', () async {
      final map = MindMapModel.inMemory();
      final crowded = map.createTopic(title: 'Crowded');
      final lonely = map.createTopic(title: 'Lonely');
      map.attachWorkItem(key: 'WL-2', title: 'Two', parentId: crowded.id);
      map.attachWorkItem(key: 'WL-3', title: 'Three', parentId: crowded.id);
      map.attachWorkItem(key: 'WL-4', title: 'Four', parentId: lonely.id);

      final suggester = suggesterFor(map, {
        'WL-1': issue(
          key: 'WL-1',
          links: [
            link(other: 'WL-2', type: 'Relates', inwardName: 'relates to', outwardName: 'relates to'),
            link(other: 'WL-3', type: 'Relates', inwardName: 'relates to', outwardName: 'relates to'),
            link(other: 'WL-4', type: 'Relates', inwardName: 'relates to', outwardName: 'relates to'),
          ],
        ),
      });

      final placements = await suggester.placementsFor('WL-1');
      expect(placements.first.topic!.id, crowded.id);
      expect(placements.first.evidence.length, 2);
    });

    test('matches a topic by name when there are no links to go on', () async {
      final map = MindMapModel.inMemory();
      map.createTopic(title: 'Camera');
      final audio = map.createTopic(title: 'Audio');

      final suggester = suggesterFor(map, {'WL-1': issue(key: 'WL-1', components: ['Audio'])});

      expect((await suggester.placementsFor('WL-1')).first.topic!.id, audio.id);
    });

    test('matches a topic by one of its tags', () async {
      final map = MindMapModel.inMemory();
      final tagged = map.createTopic(title: 'Nothing obvious');
      map.addTag(tagged.id, 'regression');

      final suggester = suggesterFor(map, {'WL-1': issue(key: 'WL-1', labels: ['regression'])});

      expect((await suggester.placementsFor('WL-1')).first.topic!.id, tagged.id);
    });

    test('offers the top level even when nothing argues for anywhere', () async {
      final map = MindMapModel.inMemory();
      final suggester = suggesterFor(map, {'WL-1': issue(key: 'WL-1')});

      final placements = await suggester.placementsFor('WL-1');

      expect(placements, hasLength(1));
      expect(placements.single.topic, isNull);
    });

    test('a ticket whose links live at the top level is offered the top level', () async {
      final map = MindMapModel.inMemory();
      map.attachWorkItem(key: 'WL-2', title: 'A loose one');

      final suggester = suggesterFor(map, {
        'WL-1': issue(key: 'WL-1', links: [link(other: 'WL-2', type: 'Blocks', inwardName: 'is blocked by', outwardName: 'blocks')]),
      });

      final placements = await suggester.placementsFor('WL-1');
      expect(placements.first.topic, isNull);
      expect(placements.first.evidence, contains('WL-2'));
    });

    test('a ticket already on the map is not told to follow itself', () async {
      final map = MindMapModel.inMemory();
      final audio = map.createTopic(title: 'Audio');
      map.attachWorkItem(key: 'WL-1', title: 'Itself', parentId: audio.id);

      final suggester = suggesterFor(map, {
        'WL-1': issue(key: 'WL-1', links: [link(other: 'WL-1', type: 'Relates', inwardName: 'relates to', outwardName: 'relates to')]),
      });

      expect((await suggester.placementsFor('WL-1')).single.topic, isNull);
    });

    test('a Jira that cannot be reached costs the suggestions, not the call', () async {
      final map = MindMapModel.inMemory();
      final suggester = MindMapSuggestions(map, fetch: (key) async => throw Exception('no network'));

      expect((await suggester.placementsFor('WL-1')).single.topic, isNull);
    });
  });

  group('what else belongs near a node', () {
    test('offers a linked ticket the map has never heard of', () async {
      final map = MindMapModel.inMemory();
      final audio = map.createTopic(title: 'Audio');
      final node = map.attachWorkItem(key: 'WL-1', title: 'One', parentId: audio.id);

      final suggester = suggesterFor(map, {
        'WL-1': issue(key: 'WL-1', links: [link(other: 'WL-2', type: 'Blocks', inwardName: 'is blocked by', outwardName: 'blocks')]),
      });

      final ghosts = (await suggester.forNode(node)).ghosts;
      expect(ghosts.single.workItemKey, 'WL-2');
      expect(ghosts.single.relation, 'blocks');
    });

    test('does not offer a ticket that is already on the map', () async {
      final map = MindMapModel.inMemory();
      final node = map.attachWorkItem(key: 'WL-1', title: 'One');
      map.attachWorkItem(key: 'WL-2', title: 'Two');

      final suggester = suggesterFor(map, {
        'WL-1': issue(key: 'WL-1', links: [link(other: 'WL-2', type: 'Blocks', inwardName: 'is blocked by', outwardName: 'blocks')]),
      });

      expect((await suggester.forNode(node)).ghosts, isEmpty);
    });

    test('offers a connection between two nodes Jira links but the map does not', () async {
      final map = MindMapModel.inMemory();
      final one = map.attachWorkItem(key: 'WL-1', title: 'One');
      final two = map.attachWorkItem(key: 'WL-2', title: 'Two');

      final suggester = suggesterFor(map, {
        'WL-1': issue(key: 'WL-1', links: [link(other: 'WL-2', type: 'Blocks', inwardName: 'is blocked by', outwardName: 'blocks')]),
      });

      final connections = (await suggester.forNode(one)).connections;
      expect(connections.single.to.id, two.id);
      expect(connections.single.relation, 'blocks');
    });

    test('stays quiet about a connection that already exists', () async {
      final map = MindMapModel.inMemory();
      final one = map.attachWorkItem(key: 'WL-1', title: 'One');
      final two = map.attachWorkItem(key: 'WL-2', title: 'Two');
      map.connect(one.id, two.id);

      final suggester = suggesterFor(map, {
        'WL-1': issue(key: 'WL-1', links: [link(other: 'WL-2', type: 'Blocks', inwardName: 'is blocked by', outwardName: 'blocks')]),
      });

      expect((await suggester.forNode(one)).connections, isEmpty);
    });

    test('stays quiet when containment already says the two belong together', () async {
      final map = MindMapModel.inMemory();
      final parent = map.attachWorkItem(key: 'WL-1', title: 'One');
      map.attachWorkItem(key: 'WL-2', title: 'Two', parentId: parent.id);

      final suggester = suggesterFor(map, {
        'WL-1': issue(key: 'WL-1', links: [link(other: 'WL-2', type: 'Blocks', inwardName: 'is blocked by', outwardName: 'blocks')]),
      });

      expect((await suggester.forNode(parent)).connections, isEmpty);
    });

    test('a topic answers through the work items filed under it', () async {
      final map = MindMapModel.inMemory();
      final audio = map.createTopic(title: 'Audio');
      map.attachWorkItem(key: 'WL-1', title: 'One', parentId: audio.id);

      final suggester = suggesterFor(map, {
        'WL-1': issue(key: 'WL-1', links: [link(other: 'WL-2', type: 'Blocks', inwardName: 'is blocked by', outwardName: 'blocks')]),
      });

      expect((await suggester.forNode(audio)).ghosts.single.workItemKey, 'WL-2');
    });

    test('a topic with no work items under it has nothing to offer', () async {
      final map = MindMapModel.inMemory();
      final empty = map.createTopic(title: 'Empty');

      expect((await suggesterFor(map, {}).forNode(empty)).isEmpty, isTrue);
    });

    test('the same ticket linked from two places is offered once', () async {
      final map = MindMapModel.inMemory();
      final audio = map.createTopic(title: 'Audio');
      map.attachWorkItem(key: 'WL-1', title: 'One', parentId: audio.id);
      map.attachWorkItem(key: 'WL-3', title: 'Three', parentId: audio.id);

      final suggester = suggesterFor(map, {
        'WL-1': issue(key: 'WL-1', links: [link(other: 'WL-2', type: 'Blocks', inwardName: 'is blocked by', outwardName: 'blocks')]),
        'WL-3': issue(key: 'WL-3', links: [link(other: 'WL-2', type: 'Relates', inwardName: 'relates to', outwardName: 'relates to')]),
      });

      expect((await suggester.forNode(audio)).ghosts, hasLength(1));
    });
  });

  group('caching', () {
    test('asks Jira once per key, however many times it is consulted', () async {
      final map = MindMapModel.inMemory();
      final node = map.attachWorkItem(key: 'WL-1', title: 'One');
      var calls = 0;
      final suggester = MindMapSuggestions(map, fetch: (key) async {
        calls++;
        return issue(key: key);
      });

      await suggester.placementsFor('WL-1');
      await suggester.forNode(node);
      await suggester.relationsFor('wl-1');

      expect(calls, 1);
    });

    test('forgetting a key asks again', () async {
      final map = MindMapModel.inMemory();
      var calls = 0;
      final suggester = MindMapSuggestions(map, fetch: (key) async {
        calls++;
        return issue(key: key);
      });

      await suggester.relationsFor('WL-1');
      suggester.forget('WL-1');
      await suggester.relationsFor('WL-1');

      expect(calls, 2);
    });
  });
}
