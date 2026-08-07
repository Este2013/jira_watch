import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/dao/confluence/confluence_api.dart';

ConfluenceListedPage page(String id, {String? title, String? parentId, int? position}) =>
    (id: id, title: title ?? 'Page $id', parentId: parentId, position: position);

/// `id(children)` — compact enough to compare a whole tree in one expectation.
String shape(List<ConfluencePageNode> nodes) =>
    nodes.map((n) => n.hasChildren ? '${n.id}(${shape(n.children)})' : n.id).join(',');

void main() {
  group('assembleConfluenceTree', () {
    test('nests children under their parent', () {
      final roots = assembleConfluenceTree([
        page('1'),
        page('2', parentId: '1'),
        page('3', parentId: '2'),
        page('4'),
      ]);

      expect(shape(roots), '1(2(3)),4');
    });

    test('orders siblings by position, and unpositioned ones last by title', () {
      final roots = assembleConfluenceTree([
        page('a', title: 'Zebra', position: 2),
        page('b', title: 'Apple', position: 1),
        page('c', title: 'Yak'),
        page('d', title: 'Beetle'),
      ]);

      expect(shape(roots), 'b,a,d,c');
    });

    test('sorts titles case-insensitively', () {
      final roots = assembleConfluenceTree([
        page('a', title: 'banana'),
        page('b', title: 'Apple'),
      ]);

      expect(shape(roots), 'b,a');
    });

    test('promotes a page whose parent is missing to a root', () {
      // What a truncated fetch looks like: the parent was never listed. Dropping
      // the page would take its whole subtree with it.
      final roots = assembleConfluenceTree([
        page('orphan', parentId: 'never-fetched'),
        page('child', parentId: 'orphan'),
      ]);

      expect(shape(roots), 'orphan(child)');
    });

    test('survives a cycle rather than recursing until the stack gives out', () {
      final roots = assembleConfluenceTree([
        page('1', parentId: '2'),
        page('2', parentId: '1'),
      ]);

      // Both parents exist, so neither is a root and the tree is empty — the
      // point is that it returns at all.
      expect(roots, isEmpty);
    });

    test('breaks a cycle that hangs off a real root', () {
      final roots = assembleConfluenceTree([
        page('root'),
        page('a', parentId: 'root'),
        page('b', parentId: 'a'),
        page('a2', parentId: 'b'),
      ]);

      expect(shape(roots), 'root(a(b(a2)))');
    });

    test('falls back to a placeholder for an untitled page', () {
      final roots = assembleConfluenceTree([(id: '1', title: null, parentId: null, position: null)]);

      expect(roots.single.title, '(untitled)');
    });

    test('returns nothing for an empty space', () {
      expect(assembleConfluenceTree([]), isEmpty);
    });
  });
}
