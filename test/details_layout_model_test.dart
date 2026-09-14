import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/models/details_layout_model.dart';

void main() {
  groupTests();

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

PropertyGroup aGroup(String id, List<String> ids, {String name = '', GroupWidth width = GroupWidth.full}) => PropertyGroup(id: id, propertyIds: ids, name: name, width: width);

void groupTests() {
  group('PropertyGroups.resolve', () {
    test('gives anything unarranged a group of its own, in registry order', () {
      final resolved = PropertyGroups.resolve(const [], ['a', 'b']);

      expect(resolved.map((g) => g.propertyIds), [
        ['a'],
        ['b'],
      ]);
      expect(resolved.map((g) => g.id), ['auto:a', 'auto:b']);
    });

    test('keeps saved groups first, then fills in the rest', () {
      final resolved = PropertyGroups.resolve(
        [
          aGroup('g1', ['b'], name: 'Mine'),
        ],
        ['a', 'b', 'c'],
      );

      expect(resolved.map((g) => g.propertyIds), [
        ['b'],
        ['a'],
        ['c'],
      ]);
      expect(resolved.first.name, 'Mine');
    });

    test('prunes properties this issue does not have, and empty groups with them', () {
      final resolved = PropertyGroups.resolve(
        [
          aGroup('g1', ['a', 'missing']),
          aGroup('g2', ['gone']),
        ],
        ['a'],
      );

      expect(resolved, [
        aGroup('g1', ['a']),
      ]);
    });

    test('places a property once even if two saved groups claim it', () {
      final resolved = PropertyGroups.resolve(
        [
          aGroup('g1', ['a']),
          aGroup('g2', ['a', 'b']),
        ],
        ['a', 'b'],
      );

      expect(resolved.map((g) => g.propertyIds), [
        ['a'],
        ['b'],
      ]);
    });
  });

  group('PropertyGroups.moveProperty', () {
    final groups = [
      aGroup('g1', ['a', 'b', 'c']),
      aGroup('g2', ['d']),
    ];

    test('joins another group at the position dropped on', () {
      expect(PropertyGroups.moveProperty(groups, 'a', toGroupId: 'g2', toIndex: 0), [
        aGroup('g1', ['b', 'c']),
        aGroup('g2', ['a', 'd']),
      ]);
    });

    test('moves within its own group accounting for its own removal', () {
      expect(PropertyGroups.moveProperty(groups, 'a', toGroupId: 'g1', toIndex: 2), [
        aGroup('g1', ['b', 'a', 'c']),
        aGroup('g2', ['d']),
      ]);
    });

    test('emptying a group by moving its last property out drops the group', () {
      expect(PropertyGroups.moveProperty(groups, 'd', toGroupId: 'g1', toIndex: 0), [
        aGroup('g1', ['d', 'a', 'b', 'c']),
      ]);
    });

    test('leaves things alone when the property or the target is unknown', () {
      expect(PropertyGroups.moveProperty(groups, 'zzz', toGroupId: 'g1', toIndex: 0), groups);
      expect(PropertyGroups.moveProperty(groups, 'a', toGroupId: 'nope', toIndex: 0), [
        aGroup('g1', ['b', 'c']),
        aGroup('g2', ['d']),
      ]);
    });
  });

  group('PropertyGroups.moveToOwnGroup', () {
    test('lands right after the group it left, not at the end', () {
      final groups = [
        aGroup('g1', ['a', 'b']),
        aGroup('g2', ['c']),
      ];

      expect(PropertyGroups.moveToOwnGroup(groups, 'b', newGroupId: 'new'), [
        aGroup('g1', ['a']),
        aGroup('new', ['b']),
        aGroup('g2', ['c']),
      ]);
    });

    test('does nothing for a property already alone in its group', () {
      final groups = [
        aGroup('g1', ['a']),
      ];
      expect(PropertyGroups.moveToOwnGroup(groups, 'a', newGroupId: 'new'), groups);
    });
  });

  group('PropertyGroups.reorder', () {
    final groups = [
      aGroup('g1', ['a']),
      aGroup('g2', ['b']),
      aGroup('g3', ['c']),
    ];

    test('moves a group later, accounting for its own removal', () {
      expect(PropertyGroups.reorder(groups, 'g1', toIndex: 2).map((g) => g.id), ['g2', 'g1', 'g3']);
    });

    test('moves a group earlier', () {
      expect(PropertyGroups.reorder(groups, 'g3', toIndex: 0).map((g) => g.id), ['g3', 'g1', 'g2']);
    });

    test('an index past the end puts it last', () {
      expect(PropertyGroups.reorder(groups, 'g1', toIndex: 99).map((g) => g.id), ['g2', 'g3', 'g1']);
    });
  });

  group('PropertyGroups naming and width', () {
    final groups = [
      aGroup('g1', ['a']),
    ];

    test('renames, trimming what was typed', () {
      expect(PropertyGroups.rename(groups, 'g1', '  Planning  ').single.name, 'Planning');
    });

    test('sets width', () {
      expect(PropertyGroups.setWidth(groups, 'g1', GroupWidth.half).single.width, GroupWidth.half);
    });

    test('survives a round trip through JSON, width by name', () {
      final original = aGroup('g1', ['a', 'b'], name: 'Planning', width: GroupWidth.third);
      expect(PropertyGroup.fromJson(original.toJson()), original);
      expect(original.toJson()['width'], 'third');
    });

    test('an unknown saved width falls back to full rather than throwing', () {
      expect(
        PropertyGroup.fromJson({
          'id': 'g1',
          'propertyIds': ['a'],
          'width': 'quarter',
        }).width,
        GroupWidth.full,
      );
    });
  });
}
