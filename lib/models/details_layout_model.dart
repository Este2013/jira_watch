import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:loggy/loggy.dart';
import 'package:observable_datasets/observable_list.dart';
import 'package:path/path.dart' as path;

/// How much of the row a group takes, so groups can be tiled beside each
/// other rather than each owning a line.
///
/// Persisted by name, never by index — inserting a value would otherwise
/// silently reinterpret every saved layout.
enum GroupWidth {
  full('Full width', 1),
  half('Half', 2),
  third('Third', 3);

  const GroupWidth(this.label, this.columns);

  final String label;

  /// How many of these fit across one row.
  final int columns;

  static GroupWidth byName(String? name) => values.firstWhere((v) => v.name == name, orElse: () => GroupWidth.full);
}

/// A named box of properties in the arrangeable part of the Details tab.
///
/// A group of one with no name is how everything starts, and renders as
/// just the property — so a reader who never arranges anything sees the
/// plain list they always did, and grouping is something that appears only
/// once asked for.
class PropertyGroup {
  const PropertyGroup({required this.id, required this.propertyIds, this.name = '', this.width = GroupWidth.full});

  final String id;
  final String name;
  final List<String> propertyIds;
  final GroupWidth width;

  PropertyGroup copyWith({String? name, List<String>? propertyIds, GroupWidth? width}) => PropertyGroup(
    id: id,
    name: name ?? this.name,
    propertyIds: propertyIds ?? this.propertyIds,
    width: width ?? this.width,
  );

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'propertyIds': propertyIds, 'width': width.name};

  factory PropertyGroup.fromJson(Map<String, dynamic> json) => PropertyGroup(
    id: json['id']?.toString() ?? '',
    name: json['name']?.toString() ?? '',
    propertyIds: [for (final id in json['propertyIds'] as List? ?? const []) id.toString()],
    width: GroupWidth.byName(json['width'] as String?),
  );

  @override
  bool operator ==(Object other) => other is PropertyGroup && other.id == id && other.name == name && other.width == width && other.propertyIds.length == propertyIds.length && other.propertyIds.indexed.every((e) => propertyIds[e.$1] == e.$2);

  @override
  int get hashCode => Object.hash(id, name, width, Object.hashAll(propertyIds));

  @override
  String toString() => 'PropertyGroup($id, "$name", $width, $propertyIds)';
}

/// The arithmetic of [DetailsLayoutModel.groups], kept apart from the model
/// that stores them for the same reason [PinnedRows] is: it is where the
/// index bookkeeping lives, and none of it needs a file or a singleton to
/// be reasoned about.
///
/// Mutations take the *resolved* groups — what is on screen, implicit ones
/// included — and return the whole list to save. That way a property can be
/// dragged onto a group that had never been written down before without any
/// caller having to first materialise it.
abstract final class PropertyGroups {
  /// What to actually lay out, given what has been saved and which
  /// properties this issue shows.
  ///
  /// Saved groups come first, pruned to the properties present; anything
  /// unaccounted for follows in its own group, in the order the registry
  /// produced it. Saved ids that this issue has no property for are left
  /// alone rather than pruned from storage — the next issue may well have
  /// them.
  static List<PropertyGroup> resolve(List<PropertyGroup> saved, List<String> orderedPropertyIds) {
    final wanted = orderedPropertyIds.toSet();
    final placed = <String>{};
    final groups = <PropertyGroup>[];

    for (final group in saved) {
      final ids = [
        for (final id in group.propertyIds)
          if (wanted.contains(id) && placed.add(id)) id,
      ];
      if (ids.isEmpty) continue;
      groups.add(group.copyWith(propertyIds: ids));
    }

    for (final id in orderedPropertyIds) {
      if (placed.contains(id)) continue;
      groups.add(PropertyGroup(id: autoGroupId(id), propertyIds: [id]));
    }
    return groups;
  }

  /// The id a property's own implicit group gets. Stable, so a group that
  /// was never explicitly created still keeps its name and width once one
  /// is given to it.
  static String autoGroupId(String propertyId) => 'auto:$propertyId';

  static List<PropertyGroup> moveProperty(List<PropertyGroup> groups, String propertyId, {required String toGroupId, required int toIndex}) {
    var fromGroup = -1;
    var fromIndex = -1;
    for (var g = 0; g < groups.length; g++) {
      final index = groups[g].propertyIds.indexOf(propertyId);
      if (index == -1) continue;
      fromGroup = g;
      fromIndex = index;
      break;
    }
    if (fromGroup == -1) return _clean(groups);

    final next = [
      for (final group in groups) group.copyWith(propertyIds: [...group.propertyIds]),
    ];
    next[fromGroup] = next[fromGroup].copyWith(propertyIds: [...next[fromGroup].propertyIds]..removeAt(fromIndex));

    final target = next.indexWhere((group) => group.id == toGroupId);
    if (target == -1) return _clean(next);

    // Same off-by-one as a pinned row: the index was read before the
    // property was lifted out of the group it is moving within.
    var index = toIndex;
    if (groups[fromGroup].id == toGroupId && fromIndex < toIndex) index--;

    final ids = [...next[target].propertyIds];
    ids.insert(index.clamp(0, ids.length), propertyId);
    next[target] = next[target].copyWith(propertyIds: ids);
    return _clean(next);
  }

  /// Lifts a property into a group of its own, placed right after the one
  /// it came from rather than at the end — it should land where the reader
  /// was looking.
  static List<PropertyGroup> moveToOwnGroup(List<PropertyGroup> groups, String propertyId, {required String newGroupId}) {
    final fromGroup = groups.indexWhere((group) => group.propertyIds.contains(propertyId));
    if (fromGroup == -1) return _clean(groups);
    if (groups[fromGroup].propertyIds.length == 1) return _clean(groups);

    final next = [
      for (final group in groups) group.copyWith(propertyIds: [...group.propertyIds]),
    ];
    next[fromGroup] = next[fromGroup].copyWith(propertyIds: [...next[fromGroup].propertyIds]..remove(propertyId));
    next.insert(fromGroup + 1, PropertyGroup(id: newGroupId, propertyIds: [propertyId]));
    return _clean(next);
  }

  /// Puts a property in a group of its own at [toIndex] of the flat list —
  /// what dropping it between two rows means.
  ///
  /// A property that was already alone is not torn out and put back; that
  /// is just its group moving, which keeps whatever name and width it had.
  static List<PropertyGroup> moveToNewGroupAt(List<PropertyGroup> groups, String propertyId, {required String newGroupId, required int toIndex}) {
    final fromGroup = groups.indexWhere((group) => group.propertyIds.contains(propertyId));
    if (fromGroup == -1) return _clean(groups);
    if (groups[fromGroup].propertyIds.length == 1) return reorder(groups, groups[fromGroup].id, toIndex: toIndex);

    final next = [
      for (final group in groups) group.copyWith(propertyIds: [...group.propertyIds]),
    ];
    next[fromGroup] = next[fromGroup].copyWith(propertyIds: [...next[fromGroup].propertyIds]..remove(propertyId));
    next.insert(toIndex.clamp(0, next.length), PropertyGroup(id: newGroupId, propertyIds: [propertyId]));
    return _clean(next);
  }

  static List<PropertyGroup> reorder(List<PropertyGroup> groups, String groupId, {required int toIndex}) {
    final from = groups.indexWhere((group) => group.id == groupId);
    if (from == -1) return _clean(groups);

    final next = [...groups];
    final group = next.removeAt(from);
    var index = toIndex;
    if (from < toIndex) index--;
    next.insert(index.clamp(0, next.length), group);
    return _clean(next);
  }

  static List<PropertyGroup> rename(List<PropertyGroup> groups, String groupId, String name) => _clean([
    for (final group in groups)
      if (group.id == groupId) group.copyWith(name: name.trim()) else group,
  ]);

  static List<PropertyGroup> setWidth(List<PropertyGroup> groups, String groupId, GroupWidth width) => _clean([
    for (final group in groups)
      if (group.id == groupId) group.copyWith(width: width) else group,
  ]);

  static List<PropertyGroup> _clean(List<PropertyGroup> groups) => [
    for (final group in groups)
      if (group.propertyIds.isNotEmpty) group,
  ];
}

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

  /// How the arrangeable properties are boxed up, below Description. Held
  /// and replaced whole, for the same reason [pinnedRows] is.
  ///
  /// Only what the reader has actually arranged is stored; everything else
  /// is implied, and [PropertyGroups.resolve] fills it in per issue.
  final ValueNotifier<List<PropertyGroup>> groups = ValueNotifier(const []);

  /// Everything a view of this layout has to rebuild for.
  Listenable get listenable => Listenable.merge([hiddenPropertyIds, showEmptyProperties, pinnedRows, groups]);

  /// The groups to lay out for an issue showing [orderedPropertyIds].
  List<PropertyGroup> resolvedGroups(List<String> orderedPropertyIds) => PropertyGroups.resolve(groups.value, orderedPropertyIds);

  void moveProperty(List<PropertyGroup> resolved, String propertyId, {required String toGroupId, required int toIndex}) => _setGroups(PropertyGroups.moveProperty(resolved, propertyId, toGroupId: toGroupId, toIndex: toIndex));

  void movePropertyToOwnGroup(List<PropertyGroup> resolved, String propertyId) => _setGroups(PropertyGroups.moveToOwnGroup(resolved, propertyId, newGroupId: _newGroupId()));

  void movePropertyToNewGroupAt(List<PropertyGroup> resolved, String propertyId, {required int toIndex}) => _setGroups(PropertyGroups.moveToNewGroupAt(resolved, propertyId, newGroupId: _newGroupId(), toIndex: toIndex));

  void reorderGroup(List<PropertyGroup> resolved, String groupId, {required int toIndex}) => _setGroups(PropertyGroups.reorder(resolved, groupId, toIndex: toIndex));

  void renameGroup(List<PropertyGroup> resolved, String groupId, String name) => _setGroups(PropertyGroups.rename(resolved, groupId, name));

  void setGroupWidth(List<PropertyGroup> resolved, String groupId, GroupWidth width) => _setGroups(PropertyGroups.setWidth(resolved, groupId, width));

  void _setGroups(List<PropertyGroup> next) {
    groups.value = next;
    requestSave();
  }

  /// Unique enough for a layout file: one group per millisecond is more
  /// than a reader dragging things around will ever manage.
  String _newGroupId() => 'group:${DateTime.now().microsecondsSinceEpoch}';

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
      groups.value = [
        for (final group in data['groups'] as List? ?? const [])
          if (group is Map) PropertyGroup.fromJson(group.cast<String, dynamic>()),
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
          'groups': [for (final group in groups.value) group.toJson()],
        }),
      );
    } on Object catch (e) {
      loggy.error('details_layout.json could not be written to: $e');
    }
  }
}
