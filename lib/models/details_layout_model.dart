import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:loggy/loggy.dart';
import 'package:observable_datasets/observable_list.dart';
import 'package:path/path.dart' as path;

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

  /// Everything a view of this layout has to rebuild for.
  Listenable get listenable => Listenable.merge([hiddenPropertyIds, showEmptyProperties]);

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
        }),
      );
    } on Object catch (e) {
      loggy.error('details_layout.json could not be written to: $e');
    }
  }
}
