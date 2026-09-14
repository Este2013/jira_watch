import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:loggy/loggy.dart';
import 'package:observable_datasets/observable_list.dart';
import 'package:path/path.dart' as path;

/// The arithmetic of [DetailsLayoutModel.pinnedRows], kept apart from the
/// model that stores them: rows in, rows out, no singleton and no file, so
/// the fiddly part — which index means what once a property has been lifted
/// out of the row it is moving within — can be reasoned about and tested on
/// its own.
///
/// Every operation returns a fresh structure and drops rows left empty; a
/// row nobody is in is not a row, and settling that here means no caller
/// has to wonder whether its removal emptied something.
abstract final class PinnedRows {
  static bool contains(List<List<String>> rows, String propertyId) => rows.any((row) => row.contains(propertyId));

  /// Pins to the end of the last row, starting one if nothing is pinned yet
  /// — where a reader watching the top of the page would expect a newly
  /// pinned field to land.
  static List<List<String>> pin(List<List<String>> rows, String propertyId) {
    if (contains(rows, propertyId)) return _clean(rows);
    final next = _mutable(rows);
    if (next.isEmpty) {
      next.add([propertyId]);
    } else {
      next.last.add(propertyId);
    }
    return _clean(next);
  }

  static List<List<String>> pinToNewRow(List<List<String>> rows, String propertyId) {
    final next = _withoutProperty(rows, propertyId)..add([propertyId]);
    return _clean(next);
  }

  static List<List<String>> unpin(List<List<String>> rows, String propertyId) => _clean(_withoutProperty(rows, propertyId));

  /// Moves an already-pinned property to [toIndex] of [toRow], or to a row
  /// of its own when [toRow] is past the last one. Anything not already
  /// pinned is left alone.
  ///
  /// [toIndex] is read against the rows as they look on screen, before the
  /// property is lifted out of them — so a move rightwards within one row
  /// has to account for its own removal, which is the off-by-one every
  /// reorder gets wrong once.
  static List<List<String>> move(List<List<String>> rows, String propertyId, {required int toRow, required int toIndex}) {
    final next = _mutable(rows);

    var fromRow = -1;
    var fromIndex = -1;
    for (var row = 0; row < next.length; row++) {
      final index = next[row].indexOf(propertyId);
      if (index == -1) continue;
      fromRow = row;
      fromIndex = index;
      break;
    }
    if (fromRow == -1) return _clean(next);

    next[fromRow].removeAt(fromIndex);
    var targetIndex = toIndex;
    if (fromRow == toRow && fromIndex < toIndex) targetIndex--;

    if (toRow < 0 || toRow >= next.length) {
      next.add([propertyId]);
    } else {
      next[toRow].insert(targetIndex.clamp(0, next[toRow].length), propertyId);
    }
    return _clean(next);
  }

  static List<List<String>> _mutable(List<List<String>> rows) => [
    for (final row in rows) [...row],
  ];

  static List<List<String>> _withoutProperty(List<List<String>> rows, String propertyId) => _mutable(rows)..forEach((row) => row.remove(propertyId));

  static List<List<String>> _clean(List<List<String>> rows) => [
    for (final row in rows)
      if (row.isNotEmpty) List<String>.from(row),
  ];
}

/// How the reader has arranged the issue Details tab.
///
/// One layout, shared by every issue — the fields a given project happens to
/// use vary, but the way someone wants to read an issue generally does not.
/// A property missing from the issue on screen is simply not rendered; its
/// place in the layout is remembered for the next issue that does have it.
///
/// Persisted to its own file rather than SharedPreferences: this grows into
/// a nested structure (rows of pinned properties, named groups), which is
/// exactly what the app's other user-arranged state — open GitLab tabs,
/// to-do tasks — keeps in JSON files beside the settings, and for the same
/// reason.
class DetailsLayoutModel with GlobalLoggy {
  static final DetailsLayoutModel _instance = DetailsLayoutModel._internal();

  factory DetailsLayoutModel() => _instance;

  DetailsLayoutModel._internal() {
    isReady = _load();
    // Coalesces bursts of changes into at most one write per second — a drag
    // or a run of hide-taps would otherwise be one write per frame.
    Timer.periodic(const Duration(seconds: 1), (_) {
      if (!_saveRequested) return;
      _saveRequested = false;
      _save();
    });
  }

  /// Bumped only for a change this code cannot read as though it were the
  /// previous shape. Keys added since a saved file was written simply fall
  /// back to their defaults, so adding to the layout does not need a bump.
  static const int _schemaVersion = 1;

  late final Future<bool> isReady;
  bool _saveRequested = false;

  final Future<File> _dataFile = SettingsModel().settingsFolder.then(
    (dir) => File(path.join(dir.path, 'details_layout.json').replaceFirst(RegExp(r'^\\?/?'), '')),
  );

  /// Properties the reader has hidden, by property id (a Jira field key, so
  /// `attachment` or `customfield_10056`). Hidden means "never show this on
  /// any issue", and is undone from the Details tab's own footer.
  final ObservableList<String> hiddenPropertyIds = ObservableList(initialData: []);

  /// Whether to show properties this issue has no value for. Off by default
  /// — on, it's how a reader arranges a group around a field that this
  /// particular ticket happens to have left blank.
  final ValueNotifier<bool> showEmptyProperties = ValueNotifier(false);

  /// Properties lifted out of the list below and up to the top of the tab,
  /// as rows of ids laid side by side — the row is the unit, because that
  /// is what the existing assignee/priority row looks like and what someone
  /// pinning a field is asking for more of.
  ///
  /// Held whole and replaced whole: a notifier only fires when its value
  /// changes identity, and nesting observable lists to catch edits inside a
  /// row would cost more than rebuilding a handful of string lists.
  final ValueNotifier<List<List<String>>> pinnedRows = ValueNotifier(const []);

  /// Everything a view of this layout has to rebuild for.
  Listenable get listenable => Listenable.merge([hiddenPropertyIds, showEmptyProperties, pinnedRows]);

  bool isPinned(String propertyId) => PinnedRows.contains(pinnedRows.value, propertyId);

  void pin(String propertyId) => _setPinnedRows(PinnedRows.pin(pinnedRows.value, propertyId));

  void pinToNewRow(String propertyId) => _setPinnedRows(PinnedRows.pinToNewRow(pinnedRows.value, propertyId));

  void unpin(String propertyId) => _setPinnedRows(PinnedRows.unpin(pinnedRows.value, propertyId));

  void movePinned(String propertyId, {required int toRow, required int toIndex}) => _setPinnedRows(PinnedRows.move(pinnedRows.value, propertyId, toRow: toRow, toIndex: toIndex));

  void _setPinnedRows(List<List<String>> rows) {
    pinnedRows.value = rows;
    requestSave();
  }

  // ObservableList's own contains/remove are typed to int whatever the
  // list holds — a quirk of that package. `.list` is a plain List<String>
  // and behaves, which is how the rest of the app works around it too.
  bool isHidden(String propertyId) => hiddenPropertyIds.list.contains(propertyId);

  void hide(String propertyId) {
    if (isHidden(propertyId)) return;
    hiddenPropertyIds.add(propertyId);
    requestSave();
  }

  void restore(String propertyId) {
    if (!isHidden(propertyId)) return;
    hiddenPropertyIds.removeWhere((id, _) => id == propertyId);
    requestSave();
  }

  void setShowEmptyProperties({required bool show}) {
    if (showEmptyProperties.value == show) return;
    showEmptyProperties.value = show;
    requestSave();
  }

  void requestSave() => _saveRequested = true;

  /// A missing, empty or corrupt file all mean the same thing — no layout
  /// saved yet — and none of them are worth failing to open an issue over.
  Future<bool> _load() async {
    final file = await _dataFile;
    if (!await file.exists()) return true;
    try {
      final raw = await file.readAsString();
      if (raw.trim().isEmpty) return true;
      final data = jsonDecode(raw) as Map<String, dynamic>;
      hiddenPropertyIds.addAll((data['hiddenPropertyIds'] as List? ?? const []).map((e) => e.toString()));
      showEmptyProperties.value = data['showEmptyProperties'] as bool? ?? false;
      pinnedRows.value = [
        for (final row in data['pinnedRows'] as List? ?? const [])
          if (row is List && row.isNotEmpty) [for (final id in row) id.toString()],
      ];
    } on Object catch (e) {
      loggy.error('details_layout.json could not be read ($e). Starting from the default layout.');
    }
    return true;
  }

  Future<void> _save() async {
    final file = await _dataFile;
    if (!await file.exists()) await file.create(recursive: true);
    try {
      await file.writeAsString(
        JsonEncoder.withIndent(' ' * 4).convert({
          'schemaVersion': _schemaVersion,
          'showEmptyProperties': showEmptyProperties.value,
          'hiddenPropertyIds': hiddenPropertyIds.list,
          'pinnedRows': pinnedRows.value,
        }),
      );
    } on Object catch (e) {
      loggy.error('details_layout.json could not be written to: $e');
    }
  }
}
