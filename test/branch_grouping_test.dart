import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/ui/gitlab_widgets/views/gitlab_branches_view.dart';
import 'package:material_symbols_icons/symbols.dart';

Map<String, dynamic> branch(String name, {int? daysAgo, bool isDefault = false}) => {
  'name': name,
  'default': isDefault,
  if (daysAgo != null)
    'commit': {
      'committed_date': DateTime.now().subtract(Duration(days: daysAgo)).toIso8601String(),
      'title': 'a commit',
    },
};

List<String> names(List<Map<String, dynamic>> branches) => branches.map((b) => b['name'] as String).toList();

void main() {
  group('splitBranches', () {
    test('puts recent branches in active and old ones in stale', () {
      final split = splitBranches([
        branch('fresh', daysAgo: 1),
        branch('ancient', daysAgo: 400),
        branch('recent-ish', daysAgo: 60),
      ]);

      expect(names(split.active), containsAll(['fresh', 'recent-ish']));
      expect(names(split.stale), ['ancient']);
    });

    test('treats the three month mark as the boundary', () {
      // Matches what GitLab's own branches page calls stale.
      final split = splitBranches([branch('just-inside', daysAgo: 89), branch('just-outside', daysAgo: 91)]);
      expect(names(split.active), ['just-inside']);
      expect(names(split.stale), ['just-outside']);
    });

    test('treats a branch with no usable date as stale', () {
      // Better than letting it clutter the section you actually work from.
      final split = splitBranches([branch('dateless')]);
      expect(split.active, isEmpty);
      expect(names(split.stale), ['dateless']);
    });

    test('returns both groups even when one is empty', () {
      final split = splitBranches([branch('only', daysAgo: 2)]);
      expect(names(split.active), ['only']);
      expect(split.stale, isEmpty);
    });

    test('handles an empty repository', () {
      final split = splitBranches([]);
      expect(split.active, isEmpty);
      expect(split.stale, isEmpty);
    });
  });

  group('sortBranches', () {
    test('orders newest first by default', () {
      final list = [branch('old', daysAgo: 30), branch('new', daysAgo: 1), branch('middle', daysAgo: 10)];
      sortBranches(list, BranchSort.recent);
      expect(names(list), ['new', 'middle', 'old']);
    });

    test('orders oldest first when asked', () {
      final list = [branch('old', daysAgo: 30), branch('new', daysAgo: 1), branch('middle', daysAgo: 10)];
      sortBranches(list, BranchSort.oldest);
      expect(names(list), ['old', 'middle', 'new']);
    });

    test('orders by name case-insensitively', () {
      final list = [branch('Zebra', daysAgo: 1), branch('apple', daysAgo: 2), branch('Mango', daysAgo: 3)];
      sortBranches(list, BranchSort.name);
      expect(names(list), ['apple', 'Mango', 'Zebra']);
    });

    test('keeps the default branch first whatever the sort', () {
      // It is the one branch you are always looking for.
      for (final sort in BranchSort.values) {
        final list = [
          branch('aaa-first-alphabetically', daysAgo: 1),
          branch('main', daysAgo: 20, isDefault: true),
          branch('zzz', daysAgo: 50),
        ];
        sortBranches(list, sort);
        expect(names(list).first, 'main', reason: 'default branch should lead for $sort');
      }
    });

    test('sinks dateless branches to the bottom in both directions', () {
      // Not to the top when sorting oldest-first, which a naive null-as-epoch
      // comparison would do.
      for (final sort in [BranchSort.recent, BranchSort.oldest]) {
        final list = [branch('dateless'), branch('dated', daysAgo: 5)];
        sortBranches(list, sort);
        expect(names(list).last, 'dateless', reason: 'dateless should sink for $sort');
      }
    });

    test('is stable enough to leave equal dates alone', () {
      final same = DateTime.now().subtract(const Duration(days: 3)).toIso8601String();
      final list = [
        {'name': 'a', 'commit': {'committed_date': same}},
        {'name': 'b', 'commit': {'committed_date': same}},
      ];
      sortBranches(list, BranchSort.recent);
      expect(names(list), hasLength(2));
    });
  });

  group('sticky section headers', () {
    /// The two sections as the view arranges them: each header pinned inside its
    /// own group, which is what keeps them from stacking.
    Widget harness() => MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            for (final label in ['Active branches', 'Stale branches'])
              SliverMainAxisGroup(
                slivers: [
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: BranchSectionHeaderDelegate(label: label, count: 30, icon: Symbols.check_circle),
                  ),
                  SliverList.builder(
                    itemCount: 30,
                    itemBuilder: (context, index) => SizedBox(height: 56, child: Text('$label row $index')),
                  ),
                ],
              ),
          ],
        ),
      ),
    );

    testWidgets('lay out without tripping the sliver geometry assertion', (tester) async {
      // Regression: the header's Container shrink-wrapped its Row to 21px while
      // the delegate claimed 40, and a pinned sliver asserts when its paintExtent
      // (the child's measured height) is under its layoutExtent.
      await tester.pumpWidget(harness());
      expect(tester.takeException(), isNull);
    });

    testWidgets('the header is exactly as tall as the delegate claims', (tester) async {
      await tester.pumpWidget(harness());
      final size = tester.getSize(find.byType(BranchSectionHeader).first);
      expect(size.height, BranchSectionHeader.height);
    });

    testWidgets('the first header stays put while its own rows scroll past', (tester) async {
      await tester.pumpWidget(harness());
      expect(find.text('Active branches'), findsOne);

      await tester.drag(find.byType(CustomScrollView), const Offset(0, -400));
      await tester.pumpAndSettle();

      // Pinned: still on screen even though the rows above it have gone.
      expect(find.text('Active branches'), findsOne);
      expect(tester.getTopLeft(find.byType(BranchSectionHeader).first).dy, 0);
      expect(tester.takeException(), isNull);
    });

    testWidgets('the second header takes over once it reaches the top', (tester) async {
      await tester.pumpWidget(harness());

      // Past the whole of the first section.
      await tester.drag(find.byType(CustomScrollView), const Offset(0, -30 * 56 - 100));
      await tester.pumpAndSettle();

      // At the very top, not stacked below a still-pinned "Active branches".
      // Grouping is what guarantees this: two bare pinned headers would both
      // stay, putting this one at y=40 with a misleading label above it.
      final staleHeader = find.ancestor(
        of: find.text('Stale branches'),
        matching: find.byType(BranchSectionHeader),
      );
      expect(staleHeader, findsOne);
      expect(tester.getTopLeft(staleHeader).dy, 0);
      expect(tester.takeException(), isNull);
    });

    testWidgets('only one header is on screen at a time', (tester) async {
      await tester.pumpWidget(harness());
      await tester.drag(find.byType(CustomScrollView), const Offset(0, -30 * 56 - 100));
      await tester.pumpAndSettle();

      // Anything still pinned but pushed off sits above the viewport.
      final onScreen = tester
          .widgetList<BranchSectionHeader>(find.byType(BranchSectionHeader))
          .where((header) {
            final box = tester.renderObject<RenderBox>(find.byWidget(header));
            final top = box.localToGlobal(Offset.zero).dy;
            return top >= 0 && top < tester.view.physicalSize.height;
          });
      expect(onScreen.map((h) => h.label), ['Stale branches']);
    });
  });
}
