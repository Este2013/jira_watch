import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/dao/confluence/confluence_api.dart';

ConfluenceListedPage page(String id, {String? title, String? parentId, int? position, bool openable = true}) =>
    (id: id, title: title ?? 'Page $id', parentId: parentId, position: position, openable: openable);

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
      final roots = assembleConfluenceTree([(id: '1', title: null, parentId: null, position: null, openable: true)]);

      expect(roots.single.title, '(untitled)');
    });

    test('returns nothing for an empty space', () {
      expect(assembleConfluenceTree([]), isEmpty);
    });

    test('nests pages under a folder once the folder has been resolved', () {
      // The bug this guards: a page's parent can be a folder, and a folder is
      // not a page, so it never appears in a listing of the space's pages.
      // Without the folder present, both children looked parentless and sat at
      // the top of the tree beside the space's real roots.
      final roots = assembleConfluenceTree([
        page('home'),
        page('folder', title: 'Guides', parentId: 'home', openable: false),
        page('deep1', parentId: 'folder'),
        page('deep2', parentId: 'folder'),
      ]);

      expect(shape(roots), 'home(folder(deep1,deep2))');
    });

    test('carries openable through, so a folder is not clicked like an article', () {
      final roots = assembleConfluenceTree([
        page('folder', parentId: null, openable: false),
        page('child', parentId: 'folder'),
      ]);

      expect(roots.single.openable, isFalse);
      expect(roots.single.children.single.openable, isTrue);
    });
  });
}
