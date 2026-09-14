import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/models/details_layout_model.dart';

void main() {
  group('PinnedRows.pin', () {
    test('starts a row when nothing is pinned, then fills that row', () {
      var rows = PinnedRows.pin(const [], 'customfield_1');
      expect(rows, [
        ['customfield_1'],
      ]);

      rows = PinnedRows.pin(rows, 'customfield_2');
      expect(rows, [
        ['customfield_1', 'customfield_2'],
      ]);
    });

    test('pinning something already pinned changes nothing', () {
      const rows = [
        ['customfield_1', 'customfield_2'],
      ];
      expect(PinnedRows.pin(rows, 'customfield_1'), rows);
    });

    test('a new row moves the property out of the row it was in', () {
      const rows = [
        ['customfield_1', 'customfield_2'],
      ];
      expect(PinnedRows.pinToNewRow(rows, 'customfield_1'), [
        ['customfield_2'],
        ['customfield_1'],
      ]);
    });
  });

  group('PinnedRows.unpin', () {
    test('takes the row with it when it was the last one in it', () {
      const rows = [
        ['customfield_1'],
        ['customfield_2'],
      ];
      final result = PinnedRows.unpin(rows, 'customfield_1');

      expect(result, [
        ['customfield_2'],
      ]);
      expect(PinnedRows.contains(result, 'customfield_1'), isFalse);
    });
  });

  group('PinnedRows.move', () {
    const rows = [
      ['a', 'b', 'c'],
      ['d'],
    ];

    test('moves rightwards within a row accounting for its own removal', () {
      // Dropping "a" on the slot "c" occupies should land it before "c" —
      // index 2 as the row reads on screen, not index 2 of the row with "a"
      // already taken out of it.
      expect(PinnedRows.move(rows, 'a', toRow: 0, toIndex: 2), [
        ['b', 'a', 'c'],
        ['d'],
      ]);
    });

    test('moves leftwards within a row', () {
      expect(PinnedRows.move(rows, 'c', toRow: 0, toIndex: 0), [
        ['c', 'a', 'b'],
        ['d'],
      ]);
    });

    test('moves between rows', () {
      expect(PinnedRows.move(rows, 'b', toRow: 1, toIndex: 0), [
        ['a', 'c'],
        ['b', 'd'],
      ]);
    });

    test('a row index past the end means a row of its own', () {
      expect(PinnedRows.move(rows, 'b', toRow: 5, toIndex: 0), [
        ['a', 'c'],
        ['d'],
        ['b'],
      ]);
    });

    test('emptying a row by moving its last property out drops the row', () {
      expect(PinnedRows.move(rows, 'd', toRow: 0, toIndex: 0), [
        ['d', 'a', 'b', 'c'],
      ]);
    });

    test('an index past the end of the target row appends to it', () {
      expect(PinnedRows.move(rows, 'd', toRow: 0, toIndex: 99), [
        ['a', 'b', 'c', 'd'],
      ]);
    });

    test('moving something that is not pinned does nothing', () {
      expect(PinnedRows.move(rows, 'zzz', toRow: 0, toIndex: 0), rows);
    });

    test('moving a property onto its own slot leaves the row as it was', () {
      expect(PinnedRows.move(rows, 'b', toRow: 0, toIndex: 1), rows);
    });
  });
}
