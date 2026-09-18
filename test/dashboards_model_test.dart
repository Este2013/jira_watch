import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/models/dashboards_model.dart';
import 'package:jira_watcher/models/updates_filters.dart';

void main() {
  group('JqlBoardConfig JSON', () {
    test('round-trips a saved query', () {
      const config = JqlBoardConfig(query: UpdatesQuery(textSearch: 'login bug', jqlMode: true, rawJql: 'status = "Open"'));
      final restored = BoardConfig.fromJson(config.toJson());
      expect(restored, isA<JqlBoardConfig>());
      final query = (restored as JqlBoardConfig).query;
      expect(query.textSearch, 'login bug');
      expect(query.jqlMode, isTrue);
      expect(query.rawJql, 'status = "Open"');
    });

    test('an empty default query round-trips too', () {
      final restored = BoardConfig.fromJson(const JqlBoardConfig().toJson());
      expect((restored as JqlBoardConfig).query.clauses, isEmpty);
    });

    test('falls back to an empty JQL config for junk, rather than throwing', () {
      expect(BoardConfig.fromJson(const {}), isA<JqlBoardConfig>());
      expect(BoardConfig.fromJson(const {'type': 'kanban'}), isA<JqlBoardConfig>());
    });
  });

  group('Board JSON', () {
    test('round-trips a board', () {
      const board = Board(id: 'board:1', name: 'My bugs', config: JqlBoardConfig(query: UpdatesQuery(textSearch: 'crash')));
      final restored = Board.fromJson(board.toJson())!;
      expect(restored.id, 'board:1');
      expect(restored.name, 'My bugs');
      expect((restored.config as JqlBoardConfig).query.textSearch, 'crash');
    });

    test('rejects an entry with no id', () {
      expect(Board.fromJson(const {'name': 'Untitled'}), isNull);
      expect(Board.fromJson(const {'id': ''}), isNull);
    });

    test('falls back to a placeholder name when the saved one is missing', () {
      expect(Board.fromJson(const {'id': 'board:1'})!.name, 'Board');
    });

    test('copyWith replaces only what is given', () {
      const board = Board(id: 'board:1', name: 'Original', config: JqlBoardConfig());
      final renamed = board.copyWith(name: 'Renamed');
      expect(renamed.id, 'board:1');
      expect(renamed.name, 'Renamed');
      expect(renamed.config, board.config);

      const newConfig = JqlBoardConfig(query: UpdatesQuery(textSearch: 'x'));
      final reconfigured = board.copyWith(config: newConfig);
      expect(reconfigured.name, 'Original');
      expect(reconfigured.config, newConfig);
    });
  });
}
