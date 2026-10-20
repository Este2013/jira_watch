import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/models/mind_map_model.dart';

/// Every test gets its own map with nothing on disk behind it.
MindMapModel map() => MindMapModel.inMemory();

void main() {
  group('containment', () {
    test('a node with no parent is a root', () {
      final m = map();
      final audio = m.createTopic(title: 'Audio');
      final nested = m.createTopic(title: 'Wave Link', parentId: audio.id);

      expect(m.rootNodes.map((n) => n.id), [audio.id]);
      expect(m.childrenOf(audio.id).map((n) => n.id), [nested.id]);
    });

    test('the breadcrumb runs from the root down to the node', () {
      final m = map();
      final audio = m.createTopic(title: 'Audio');
      final wave = m.createTopic(title: 'Wave Link', parentId: audio.id);
      final mixer = m.createTopic(title: 'Mixer', parentId: wave.id);

      expect(m.pathTo(mixer.id).map((n) => n.title), ['Audio', 'Wave Link', 'Mixer']);
    });

    test('a node cannot be filed inside its own subtree', () {
      final m = map();
      final audio = m.createTopic(title: 'Audio');
      final wave = m.createTopic(title: 'Wave Link', parentId: audio.id);

      m.moveNode(audio.id, wave.id);

      // Unchanged: allowing it would cut both nodes off from every root.
      expect(m.nodeById(audio.id)!.parentId, isNull);
      expect(m.nodeById(wave.id)!.parentId, audio.id);
    });

    test('a node cannot become its own parent', () {
      final m = map();
      final audio = m.createTopic(title: 'Audio');

      m.moveNode(audio.id, audio.id);

      expect(m.nodeById(audio.id)!.parentId, isNull);
    });

    test('moving a node to the top level clears its parent', () {
      final m = map();
      final audio = m.createTopic(title: 'Audio');
      final wave = m.createTopic(title: 'Wave Link', parentId: audio.id);

      m.moveNode(wave.id, null);

      expect(m.nodeById(wave.id)!.parentId, isNull);
      expect(m.rootNodes.length, 2);
    });

    test('a breadcrumb survives a parent chain that loops back on itself', () {
      // Not reachable through moveNode, but a hand-edited file could hold it,
      // and walking it must terminate rather than hang the page.
      final m = map();
      final a = m.createTopic(title: 'A');
      final b = m.createTopic(title: 'B', parentId: a.id);
      m.update(a.id, (n) => n.copyWith(parentId: b.id));

      expect(m.pathTo(b.id).length, lessThanOrEqualTo(2));
    });
  });

  group('deleting a node', () {
    test('hands its children to its own parent rather than taking them with it', () {
      final m = map();
      final audio = m.createTopic(title: 'Audio');
      final wave = m.createTopic(title: 'Wave Link', parentId: audio.id);
      final mixer = m.createTopic(title: 'Mixer', parentId: wave.id);

      m.deleteNode(wave.id);

      expect(m.nodeById(wave.id), isNull);
      expect(m.nodeById(mixer.id)!.parentId, audio.id);
    });

    test('promotes the children of a deleted root to roots', () {
      final m = map();
      final audio = m.createTopic(title: 'Audio');
      final wave = m.createTopic(title: 'Wave Link', parentId: audio.id);

      m.deleteNode(audio.id);

      expect(m.nodeById(wave.id)!.parentId, isNull);
    });

    test('takes its edges with it', () {
      final m = map();
      final a = m.createTopic(title: 'A');
      final b = m.createTopic(title: 'B');
      m.connect(a.id, b.id);

      m.deleteNode(a.id);

      expect(m.edges.list, isEmpty);
    });

    test('moves the focus up to its parent', () {
      final m = map();
      final audio = m.createTopic(title: 'Audio');
      final wave = m.createTopic(title: 'Wave Link', parentId: audio.id);
      m.focus(wave.id);

      m.deleteNode(wave.id);

      expect(m.focusedNodeId.value, audio.id);
    });
  });

  group('connections', () {
    test('a node cannot be connected to itself', () {
      final m = map();
      final a = m.createTopic(title: 'A');

      expect(m.connect(a.id, a.id), isNull);
      expect(m.edges.list, isEmpty);
    });

    test('connecting twice reuses the edge, whichever way round', () {
      final m = map();
      final a = m.createTopic(title: 'A');
      final b = m.createTopic(title: 'B');

      final first = m.connect(a.id, b.id)!;
      final second = m.connect(b.id, a.id)!;

      expect(second.id, first.id);
      expect(m.edges.list.length, 1);
    });

    test('an edge to a node that is not on the map is refused', () {
      final m = map();
      final a = m.createTopic(title: 'A');

      expect(m.connect(a.id, 'node:nowhere'), isNull);
    });
  });

  group('the ring around a node', () {
    test('holds its parent, its children and everything connected to it', () {
      final m = map();
      final audio = m.createTopic(title: 'Audio');
      final wave = m.createTopic(title: 'Wave Link', parentId: audio.id);
      final mixer = m.createTopic(title: 'Mixer', parentId: wave.id);
      final unrelated = m.createTopic(title: 'Camera Hub');
      m.connect(wave.id, unrelated.id);

      final ring = m.neighboursOf(wave.id);

      expect(ring.map((n) => n.node.id), containsAll([audio.id, mixer.id, unrelated.id]));
      expect(ring.firstWhere((n) => n.node.id == audio.id).relation, MindMapRelation.parent);
      expect(ring.firstWhere((n) => n.node.id == mixer.id).relation, MindMapRelation.child);
      expect(ring.firstWhere((n) => n.node.id == unrelated.id).relation, MindMapRelation.connected);
    });

    test('shows a node once even when it is both a child and connected', () {
      final m = map();
      final audio = m.createTopic(title: 'Audio');
      final wave = m.createTopic(title: 'Wave Link', parentId: audio.id);
      m.connect(audio.id, wave.id);

      final ring = m.neighboursOf(audio.id);

      expect(ring.where((n) => n.node.id == wave.id).length, 1);
      // Containment wins: it is the stronger statement of the two.
      expect(ring.first.relation, MindMapRelation.child);
    });

    test('is empty for a node that is not on the map', () {
      expect(map().neighboursOf('node:nowhere'), isEmpty);
    });
  });

  group('work items', () {
    test('the same key is never placed twice', () {
      final m = map();
      final audio = m.createTopic(title: 'Audio');

      final first = m.attachWorkItem(key: 'WL-1', title: 'Crackle', parentId: audio.id);
      final second = m.attachWorkItem(key: 'WL-1', title: 'Crackle again', parentId: audio.id);

      expect(second.id, first.id);
      expect(m.nodes.list.where((n) => n.workItemKey == 'WL-1').length, 1);
    });

    test('attaching an already-placed key somewhere else re-files it', () {
      final m = map();
      final audio = m.createTopic(title: 'Audio');
      final video = m.createTopic(title: 'Video');
      final node = m.attachWorkItem(key: 'WL-1', title: 'Crackle', parentId: audio.id);

      m.attachWorkItem(key: 'WL-1', title: 'Crackle', parentId: video.id);

      expect(m.nodeById(node.id)!.parentId, video.id);
    });

    test('a key is matched whatever its casing', () {
      final m = map();
      m.attachWorkItem(key: 'wl-1', title: 'Crackle');

      expect(m.nodeForWorkItem('WL-1'), isNotNull);
      expect(m.workItemKeys, {'WL-1'});
    });

    test('a work item takes the colour of the topic it lands in', () {
      final m = map();
      final audio = m.createTopic(title: 'Audio', accent: 3);

      expect(m.attachWorkItem(key: 'WL-1', title: 'Crackle', parentId: audio.id).accent, 3);
    });
  });

  group('tags', () {
    test('are lowercased and never duplicated', () {
      final m = map();
      final a = m.createTopic(title: 'A');

      m.addTag(a.id, 'Regression');
      m.addTag(a.id, 'regression');
      m.addTag(a.id, '  ');

      expect(m.nodeById(a.id)!.tags, ['regression']);
    });

    test('the whole map reports its tags once, sorted', () {
      final m = map();
      final a = m.createTopic(title: 'A');
      final b = m.createTopic(title: 'B');
      m.addTag(a.id, 'zeta');
      m.addTag(a.id, 'alpha');
      m.addTag(b.id, 'alpha');

      expect(m.allTags, ['alpha', 'zeta']);
    });
  });

  group('links', () {
    test('a pasted URL with no title is named after its last path segment', () {
      final m = map();
      final a = m.createTopic(title: 'A');

      final link = m.addLink(a.id, url: 'https://app.qase.io/project/WL/suite/smoke-run_2');

      expect(link.title, 'smoke run 2');
    });

    test('a URL with no path at all falls back to its host', () {
      final m = map();
      final a = m.createTopic(title: 'A');

      expect(m.addLink(a.id, url: 'https://example.com').title, 'example.com');
    });

    test('links are grouped by the name given to them', () {
      final m = map();
      final a = m.createTopic(title: 'A');

      m.addLink(a.id, url: 'https://x/1', group: 'Test runs');
      m.addLink(a.id, url: 'https://x/2', group: 'Test runs');
      m.addLink(a.id, url: 'https://x/3');

      final links = m.nodeById(a.id)!.links;
      expect(links.where((l) => l.group == 'Test runs').length, 2);
      expect(links.where((l) => l.group == null).length, 1);
    });

    test('removing a link leaves the others alone', () {
      final m = map();
      final a = m.createTopic(title: 'A');
      final first = m.addLink(a.id, url: 'https://x/1');
      m.addLink(a.id, url: 'https://x/2');

      m.removeLink(a.id, first.id);

      expect(m.nodeById(a.id)!.links.map((l) => l.url), ['https://x/2']);
    });

    test('a known host gets its own icon, an unknown one the generic link', () {
      const qase = MindMapLink(id: 'l', url: 'https://app.qase.io/run/WL/1', title: 'Run');
      const other = MindMapLink(id: 'l', url: 'https://example.com/thing', title: 'Thing');

      expect(qase.icon, isNot(other.icon));
    });
  });

  group('tasks', () {
    test('are adopted once and let go cleanly', () {
      final m = map();
      final a = m.createTopic(title: 'A');

      m.attachTask(a.id, 7);
      m.attachTask(a.id, 7);
      m.attachTask(a.id, 8);
      m.detachTask(a.id, 7);

      expect(m.nodeById(a.id)!.taskIds, [8]);
    });
  });

  group('search', () {
    test('an exact work item key beats everything else', () {
      final m = map();
      m.createTopic(title: 'WL-1 notes');
      m.attachWorkItem(key: 'WL-1', title: 'Crackle on launch');

      expect(m.search('WL-1').first.node.workItemKey, 'WL-1');
    });

    test('finds a node by a tag, and says so', () {
      final m = map();
      final a = m.createTopic(title: 'Something unrelated');
      m.addTag(a.id, 'regression');

      final hit = m.search('regression').first;
      expect(hit.node.id, a.id);
      expect(hit.reason, contains('regression'));
    });

    test('finds a node by words only in its notes', () {
      final m = map();
      final a = m.createTopic(title: 'Audio');
      m.setNotes(a.id, 'The flaky one is the USB enumeration on Windows 11.');

      final hit = m.search('enumeration').first;
      expect(hit.node.id, a.id);
      expect(hit.reason, 'in the notes');
    });

    test('finds a node by one of its links', () {
      final m = map();
      final a = m.createTopic(title: 'Audio');
      m.addLink(a.id, url: 'https://app.qase.io/run/42', title: 'Smoke run 42');

      final hit = m.search('smoke').first;
      expect(hit.node.id, a.id);
      expect(hit.reason, contains('Smoke run 42'));
    });

    test('matches scattered letters, below a real substring match', () {
      final m = map();
      final loose = m.createTopic(title: 'Wave Link');
      final exact = m.createTopic(title: 'wlk shortcut');

      final hits = m.search('wlk');
      expect(hits.map((h) => h.node.id), containsAll([loose.id, exact.id]));
      expect(hits.first.node.id, exact.id);
    });

    test('a query that matches nothing returns nothing', () {
      final m = map();
      m.createTopic(title: 'Audio');

      expect(m.search('zzzzz'), isEmpty);
    });

    test('an empty query with a tag browses that tag', () {
      final m = map();
      final a = m.createTopic(title: 'Audio');
      m.createTopic(title: 'Video');
      m.addTag(a.id, 'regression');

      final hits = m.search('', tags: {'regression'});
      expect(hits.map((h) => h.node.id), [a.id]);
    });

    test('several tags narrow to nodes carrying all of them', () {
      final m = map();
      final both = m.createTopic(title: 'Both');
      final one = m.createTopic(title: 'One');
      m.addTag(both.id, 'a');
      m.addTag(both.id, 'b');
      m.addTag(one.id, 'a');

      expect(m.search('', tags: {'a', 'b'}).map((h) => h.node.id), [both.id]);
    });

    test('equal scores come back in a stable order', () {
      final m = map();
      m.createTopic(title: 'Beta thing');
      m.createTopic(title: 'Alpha thing');

      expect(m.search('thing').map((h) => h.node.title), ['Alpha thing', 'Beta thing']);
    });
  });

  group('reading a saved map', () {
    test('keeps a well-formed node', () {
      final node = MindMapNode.fromJson({
        'id': 'node:1',
        'kind': 'workItem',
        'title': 'Crackle',
        'workItemKey': 'WL-1',
        'tags': ['audio'],
        'links': [
          {'id': 'l1', 'url': 'https://x/1', 'title': 'One'},
        ],
      });

      expect(node, isNotNull);
      expect(node!.kind, MindMapNodeKind.workItem);
      expect(node.links.single.title, 'One');
    });

    test('drops a node with no id and one with nothing to call it', () {
      expect(MindMapNode.fromJson({'title': 'No id'}), isNull);
      expect(MindMapNode.fromJson({'id': 'node:1'}), isNull);
    });

    test('names a titleless work item node after its key', () {
      expect(MindMapNode.fromJson({'id': 'node:1', 'kind': 'workItem', 'workItemKey': 'WL-1'})!.title, 'WL-1');
    });

    test('falls back to a topic for a kind this build has never heard of', () {
      expect(MindMapNode.fromJson({'id': 'node:1', 'title': 'X', 'kind': 'hologram'})!.kind, MindMapNodeKind.topic);
    });

    test('drops a link with no URL', () {
      expect(MindMapLink.fromJson({'id': 'l1', 'title': 'No URL'}), isNull);
    });

    test('drops an edge that loops a node to itself', () {
      expect(MindMapEdge.fromJson({'id': 'e1', 'from': 'n1', 'to': 'n1'}), isNull);
    });

    test('a node round-trips through JSON', () {
      final m = map();
      final a = m.createTopic(title: 'Audio', tags: ['regression'], accent: 2);
      m.setNotes(a.id, 'notes');
      m.addLink(a.id, url: 'https://x/1', group: 'Runs');

      final restored = MindMapNode.fromJson(m.nodeById(a.id)!.toJson())!;

      expect(restored.title, 'Audio');
      expect(restored.tags, ['regression']);
      expect(restored.accent, 2);
      expect(restored.notes, 'notes');
      expect(restored.links.single.group, 'Runs');
    });
  });

  group('the same link in two places', () {
    test('is one link whatever the casing of its host', () {
      expect(canonicalLinkUrl('https://App.Qase.IO/run/42'), canonicalLinkUrl('https://app.qase.io/run/42'));
    });

    test('is one link with or without a trailing slash', () {
      expect(canonicalLinkUrl('https://app.qase.io/run/42/'), canonicalLinkUrl('https://app.qase.io/run/42'));
    });

    test('keeps a query and a fragment apart, since those are the destination', () {
      expect(canonicalLinkUrl('https://x.com/p?a=1'), isNot(canonicalLinkUrl('https://x.com/p?a=2')));
      expect(canonicalLinkUrl('https://x.com/p#one'), isNot(canonicalLinkUrl('https://x.com/p#two')));
    });

    test('does not confuse a path with the same letters in a different case', () {
      expect(canonicalLinkUrl('https://x.com/Page'), isNot(canonicalLinkUrl('https://x.com/page')));
    });

    test('survives something that is not a URL at all', () {
      expect(canonicalLinkUrl('  not a url  '), 'not a url');
    });

    test('is found on every node holding it', () {
      final m = map();
      final audio = m.createTopic(title: 'Audio');
      final video = m.createTopic(title: 'Video');
      m.createTopic(title: 'Unrelated');
      m.addLink(audio.id, url: 'https://app.qase.io/run/42');
      m.addLink(video.id, url: 'https://APP.qase.io/run/42/');

      final holders = m.nodesLinking('https://app.qase.io/run/42');

      expect(holders.map((n) => n.id), containsAll([audio.id, video.id]));
      expect(holders, hasLength(2));
    });

    test('reports the node own copy of it, group and all', () {
      final m = map();
      final audio = m.createTopic(title: 'Audio');
      m.addLink(audio.id, url: 'https://app.qase.io/run/42', group: 'Test runs');

      expect(m.linkOn(m.nodeById(audio.id)!, 'https://app.qase.io/run/42/')?.group, 'Test runs');
    });

    test('is nothing when no node holds it', () {
      final m = map();
      m.createTopic(title: 'Audio');

      expect(m.nodesLinking('https://nowhere.example/x'), isEmpty);
    });
  });

  group('drawing links as nodes', () {
    test('is off until it is turned on', () {
      final m = map();

      expect(m.linksAsNodes.value, isFalse);
      m.setLinksAsNodes(true);
      expect(m.linksAsNodes.value, isTrue);
    });
  });
}
