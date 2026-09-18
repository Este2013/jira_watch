/// Dashboards: named, saved views the user comes back to, each rendered by
/// whatever its [BoardConfig] says it is.
///
/// A [JqlBoardConfig] — the property chips and JQL toggle from the updates
/// bar, saved instead of applied to the live feed — is the only board type
/// today. [BoardConfig] is a sealed class so that adding another one (a
/// project's own Kanban board, an agile sprint board, ...) is a
/// compiler-enforced checklist: a new subclass here, a case in
/// [BoardConfig.fromJson], and a case in `DashboardsView`'s switch over a
/// board's config — nothing about this file has to change to make room for
/// one.
library;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:jira_watcher/models/updates_filters.dart';
import 'package:loggy/loggy.dart';
import 'package:observable_datasets/observable_list.dart';
import 'package:path/path.dart' as path;

/// What a board shows and how it is configured — the part of a [Board] that
/// depends on its type.
sealed class BoardConfig {
  const BoardConfig();

  Map<String, dynamic> toJson();

  /// Reads back whichever subclass [toJson] wrote, keyed by its own `type`
  /// tag.
  static BoardConfig fromJson(Map json) {
    // The only board type today. A new one adds a case above this line,
    // keyed by its own `type` tag; anything unrecognized — a tag this build
    // predates, most likely — still has to resolve to *something* rather
    // than lose the board outright, so it falls through to this one.
    return switch (json['type']) {
      _ => JqlBoardConfig.fromJson(json),
    };
  }
}

/// A board that is exactly a saved [UpdatesQuery]: the same property chips
/// and JQL toggle the updates bar and the work item search use, kept here
/// instead of applied to the live feed.
class JqlBoardConfig extends BoardConfig {
  const JqlBoardConfig({this.query = const UpdatesQuery()});

  final UpdatesQuery query;

  JqlBoardConfig copyWith({UpdatesQuery? query}) => JqlBoardConfig(query: query ?? this.query);

  @override
  Map<String, dynamic> toJson() => {'type': 'jql', 'query': query.toJson()};

  static JqlBoardConfig fromJson(Map json) => JqlBoardConfig(query: UpdatesQuery.fromJson((json['query'] as Map?) ?? const {}));
}

/// One saved dashboard: the name its chip in the strip shows, and the
/// [BoardConfig] behind it.
class Board {
  const Board({required this.id, required this.name, required this.config});

  final String id;
  final String name;
  final BoardConfig config;

  Board copyWith({String? name, BoardConfig? config}) => Board(id: id, name: name ?? this.name, config: config ?? this.config);

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'config': config.toJson()};

  static Board? fromJson(Map json) {
    final id = json['id'];
    if (id is! String || id.isEmpty) return null;
    return Board(id: id, name: json['name'] as String? ?? 'Board', config: BoardConfig.fromJson((json['config'] as Map?) ?? const {}));
  }
}

/// The saved dashboards: persisted the same way [WorkItemTabsModel] persists
/// its own tabs — a singleton, an [ObservableList], a coalesced save.
class DashboardsModel with GlobalLoggy {
  static final DashboardsModel _instance = DashboardsModel._internal();

  factory DashboardsModel() => _instance;

  DashboardsModel._internal() {
    isReady = _getReady();
    _saveTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_saveRequested) {
        _saveRequested = false;
        _save();
      }
    });
  }

  static const int _schemaVersion = 1;

  final Future<File> _dataFile = SettingsModel().settingsFolder.then(
    (dir) => File(path.join(dir.path, 'dashboards.json').replaceFirst(RegExp(r'^\\?/?'), '')),
  );

  late final ObservableList<Board> boards;

  /// The board the Dashboards tab is showing, or null with none created yet.
  final ValueNotifier<String?> selectedBoardId = ValueNotifier(null);

  late Future<bool> isReady;
  bool _saveRequested = false;
  // ignore: unused_field
  Timer? _saveTimer;

  Future<bool> _getReady() async {
    final file = await _dataFile;
    if (!await file.exists()) {
      boards = ObservableList();
      return true;
    }
    // A hand-edited or truncated file must degrade to no boards, not take the page down.
    try {
      final raw = await file.readAsString();
      if (raw.trim().isEmpty) {
        boards = ObservableList();
        return true;
      }
      final data = jsonDecode(raw) as Map<String, dynamic>;
      final list = [
        for (final entry in (data['boards'] as List? ?? []))
          if (entry is Map) ?Board.fromJson(entry),
      ];
      boards = ObservableList(initialData: list);
      final savedSelection = data['selectedBoardId'] as String?;
      selectedBoardId.value = list.any((b) => b.id == savedSelection) ? savedSelection : list.firstOrNull?.id;
    } on Object catch (e) {
      loggy.error('dashboards.json could not be read ($e). Starting with no boards.');
      boards = ObservableList();
    }
    return true;
  }

  Board? get selectedBoard {
    final id = selectedBoardId.value;
    if (id == null) return null;
    return boards.list.where((b) => b.id == id).firstOrNull;
  }

  void selectBoard(String? id) {
    selectedBoardId.value = id;
    requestSave();
  }

  /// Creates a new JQL board and selects it. [query] seeds its saved filters
  /// — typically the same safe default the work item search opens on
  /// ([UpdatesFilters.forSearch]), so a fresh board shows something rather
  /// than the "unbounded query" error an empty one would ask Jira for.
  Board createJqlBoard({required String name, UpdatesQuery query = const UpdatesQuery()}) {
    final board = Board(id: _newId(), name: name, config: JqlBoardConfig(query: query));
    boards.add(board);
    selectBoard(board.id);
    return board;
  }

  void renameBoard(Board board, String name) => _replace(board, board.copyWith(name: name));

  void updateBoardConfig(Board board, BoardConfig config) => _replace(board, board.copyWith(config: config));

  void _replace(Board board, Board updated) {
    final index = boards.list.indexWhere((b) => b.id == board.id);
    if (index < 0) return;
    boards[index] = updated;
    requestSave();
  }

  /// Deletes [board]. If it was selected, the next remaining one takes its
  /// place — or none, once the last board is gone.
  void deleteBoard(Board board) {
    final index = boards.list.indexWhere((b) => b.id == board.id);
    if (index < 0) return;
    boards.removeAt(index);
    if (selectedBoardId.value == board.id) {
      final remaining = boards.list;
      selectBoard(remaining.isEmpty ? null : remaining[index.clamp(0, remaining.length - 1)].id);
    }
    requestSave();
  }

  String _newId() => 'board:${DateTime.now().microsecondsSinceEpoch}';

  /// Coalesces bursts of changes into at most one write per second.
  void requestSave() => _saveRequested = true;

  Future<void> _save() async {
    final file = await _dataFile;
    if (!await file.exists()) await file.create(recursive: true);
    try {
      await file.writeAsString(
        JsonEncoder.withIndent(' ' * 4).convert({
          'schemaVersion': _schemaVersion,
          'selectedBoardId': selectedBoardId.value,
          'boards': boards.list.map((b) => b.toJson()).toList(),
        }),
      );
    } on Object catch (e) {
      loggy.error('dashboards.json could not be written to: $e');
    }
  }
}
