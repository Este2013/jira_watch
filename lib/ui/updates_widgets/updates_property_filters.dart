import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:jira_platform_api/api.dart' as jira;
import 'package:jira_watcher/dao/jira/jira_api.dart';
import 'package:jira_watcher/models/updates_filters.dart';
import 'package:material_symbols_icons/symbols.dart';

/// One property filter in the updates bar: a chip saying what it narrows to,
/// which opens a searchable list of the values Jira suggests for that field.
class PropertyFilterButton extends StatelessWidget {
  const PropertyFilterButton({super.key, required this.filter, required this.onChanged, this.onRemove});

  final UpdatesPropertyFilter filter;

  /// Called with the picked values and the names to remember them by.
  final void Function(Set<String> values, Map<String, String> valueLabels) onChanged;

  /// Drops the filter from the bar entirely — custom filters only; the defaults
  /// are furniture, and emptying them is how they are turned off.
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) => MenuAnchor(
    // A panel rather than a list of menu items: the value list has its own
    // search field, and is long often enough that it has to scroll.
    menuChildren: [_FilterValuePicker(filter: filter, onChanged: onChanged)],
    builder: (context, controller, child) => InputChip(
      label: Text(filter.isActive ? '${filter.label}: ${filter.summary}' : filter.label),
      tooltip: filter.isActive ? filter.values.map(filter.labelFor).join(', ') : 'Filter by ${filter.label}',
      avatar: Icon(filter.isActive ? Symbols.filter_alt : Symbols.arrow_drop_down, fill: filter.isActive ? 1 : 0),
      selected: filter.isActive,
      showCheckmark: false,
      onPressed: () => controller.isOpen ? controller.close() : controller.open(),
      // One affordance, whichever undo makes sense: clear what is picked, or —
      // once there is nothing left to clear — take the custom filter away.
      onDeleted: filter.isActive ? () => onChanged(const {}, const {}) : onRemove,
      deleteIcon: const Icon(Symbols.close, size: 16),
      deleteButtonTooltipMessage: filter.isActive ? 'Clear' : 'Remove this filter',
    ),
  );
}

/// The value list behind a [PropertyFilterButton].
class _FilterValuePicker extends StatefulWidget {
  const _FilterValuePicker({required this.filter, required this.onChanged});

  final UpdatesPropertyFilter filter;
  final void Function(Set<String> values, Map<String, String> valueLabels) onChanged;

  @override
  State<_FilterValuePicker> createState() => _FilterValuePickerState();
}

class _FilterValuePickerState extends State<_FilterValuePicker> {
  final _searchController = TextEditingController();

  late Set<String> _values = {...widget.filter.values};
  late Map<String, String> _labels = {...widget.filter.valueLabels};

  /// Suggestions as `(value, display name)`.
  List<(String, String)> _suggestions = const [];
  bool _isLoading = true;

  Timer? _searchDebounce;

  /// Bumped per request so a slower earlier one cannot overwrite a newer one.
  int _requestSeq = 0;

  /// Whether a pick is still waiting to reach the list. Refetching the whole
  /// first page per checkbox would make picking three values three queries, so
  /// they are coalesced — and flushed if the menu closes first.
  bool _pendingApply = false;
  Timer? _applyDebounce;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    _applyDebounce?.cancel();
    if (_pendingApply) {
      // After the frame: this runs while the menu is being torn down, and the
      // list above would otherwise be asked to rebuild mid-teardown.
      final values = _values;
      final labels = _labels;
      final notify = widget.onChanged;
      SchedulerBinding.instance.addPostFrameCallback((_) => notify(values, labels));
    }
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    final seq = ++_requestSeq;
    setState(() => _isLoading = true);
    final results = await JiraApi().fieldSuggestions(widget.filter.field, query: _searchController.text.trim());
    if (!mounted || seq != _requestSeq) return;
    setState(() {
      _suggestions = [
        for (final result in results)
          if (result.value case final value?) (value, stripSuggestionMarkup(result.displayName ?? value)),
      ];
      _isLoading = false;
    });
  }

  void _onSearchChanged(String _) {
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 300), _load);
  }

  void _toggle(String value, String label, bool picked) {
    setState(() {
      if (picked) {
        _values = {..._values, value};
        _labels = {..._labels, value: label};
      } else {
        _values = {..._values}..remove(value);
        _labels = {..._labels}..remove(value);
      }
    });
    _pendingApply = true;
    _applyDebounce?.cancel();
    _applyDebounce = Timer(const Duration(milliseconds: 400), _apply);
  }

  void _apply() {
    _pendingApply = false;
    widget.onChanged(_values, _labels);
  }

  @override
  Widget build(BuildContext context) {
    // Values picked earlier but absent from the current suggestions — a search
    // that no longer matches them, or a value Jira has stopped offering. Shown
    // first, so nothing can be picked and then not unpicked.
    final suggested = {for (final (value, _) in _suggestions) value};
    final stranded = [
      for (final value in _values)
        if (!suggested.contains(value) && value != UpdatesPropertyFilter.emptyValue) (value, widget.filter.labelFor(value)),
    ];
    final isSearching = _searchController.text.trim().isNotEmpty;

    return SizedBox(
      width: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
            child: TextField(
              controller: _searchController,
              autofocus: true,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                isDense: true,
                border: const OutlineInputBorder(),
                hintText: 'Search ${widget.filter.label.toLowerCase()}',
                prefixIcon: const Icon(Symbols.search, size: 18),
                suffixIcon: _isLoading
                    ? const Padding(
                        padding: EdgeInsets.all(12),
                        child: SizedBox(width: 14, height: 14, child: CircularProgressIndicator(strokeWidth: 2)),
                      )
                    : null,
              ),
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 320),
            child: _isLoading && _suggestions.isEmpty
                ? const Padding(
                    padding: EdgeInsets.all(24),
                    child: Center(child: CircularProgressIndicator()),
                  )
                : ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(bottom: 8),
                    children: [
                      for (final (value, label) in stranded) _valueTile(value, label),
                      if (!isSearching) _valueTile(UpdatesPropertyFilter.emptyValue, 'No value', subtitle: 'Items where ${widget.filter.label.toLowerCase()} is not set'),
                      for (final (value, label) in _suggestions) _valueTile(value, label),
                      if (_suggestions.isEmpty && !_isLoading)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          child: Text(
                            isSearching ? 'Nothing matches' : 'Jira suggests no values for this field',
                            style: TextStyle(color: Theme.of(context).hintColor),
                          ),
                        ),
                    ],
                  ),
          ),
          if (_values.isNotEmpty)
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: TextButton.icon(
                  icon: const Icon(Symbols.close, size: 16),
                  label: const Text('Clear'),
                  onPressed: () {
                    setState(() {
                      _values = const {};
                      _labels = const {};
                    });
                    _applyDebounce?.cancel();
                    _apply();
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _valueTile(String value, String label, {String? subtitle}) => CheckboxListTile(
    dense: true,
    value: _values.contains(value),
    onChanged: (picked) => _toggle(value, label, picked ?? false),
    title: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis),
    subtitle: subtitle == null ? null : Text(subtitle, maxLines: 1, overflow: TextOverflow.ellipsis),
    controlAffinity: ListTileControlAffinity.leading,
  );
}

/// Adds a filter on any other field this site can be queried by.
class AddPropertyFilterButton extends StatelessWidget {
  const AddPropertyFilterButton({super.key, required this.existingFields, required this.onAdd});

  /// Fields already in the bar, which the picker leaves out.
  final Set<String> existingFields;
  final void Function(UpdatesPropertyFilter filter) onAdd;

  @override
  Widget build(BuildContext context) => ActionChip(
    tooltip: 'Narrow the list by any other field, custom ones included',
    avatar: const Icon(Symbols.add, size: 18),
    label: const Text('Add filter'),
    onPressed: () async {
      final picked = await showDialog<UpdatesPropertyFilter>(
        context: context,
        builder: (context) => _FieldPickerDialog(existingFields: existingFields),
      );
      if (picked != null) onAdd(picked);
    },
  );
}

class _FieldPickerDialog extends StatefulWidget {
  const _FieldPickerDialog({required this.existingFields});

  final Set<String> existingFields;

  @override
  State<_FieldPickerDialog> createState() => _FieldPickerDialogState();
}

class _FieldPickerDialogState extends State<_FieldPickerDialog> {
  final _searchController = TextEditingController();

  late final Future<List<jira.FieldReferenceData>> _fields = JiraApi().jqlFields();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  /// Fields worth offering: searchable, not deprecated, not already in the bar,
  /// and answering autocomplete — a field with no suggestions would open an
  /// empty picker, which is worse than not offering it.
  List<(String, String)> _pickable(List<jira.FieldReferenceData> fields) {
    final query = _searchController.text.trim().toLowerCase();
    final seen = <String>{};
    final pickable = <(String, String)>[];
    for (final field in fields) {
      final value = field.value;
      if (value == null || widget.existingFields.contains(value) || !seen.add(value)) continue;
      if (field.searchable == jira.FieldReferenceDataSearchableEnum.false_) continue;
      if (field.auto == jira.FieldReferenceDataAutoEnum.false_) continue;
      if (field.deprecated == jira.FieldReferenceDataDeprecatedEnum.true_) continue;
      final label = jqlFieldLabel(field.displayName ?? value);
      if (query.isNotEmpty && !label.toLowerCase().contains(query) && !value.toLowerCase().contains(query)) continue;
      pickable.add((value, label));
    }
    pickable.sort((a, b) => a.$2.toLowerCase().compareTo(b.$2.toLowerCase()));
    return pickable;
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: const Text('Filter by another property'),
    content: SizedBox(
      width: 420,
      height: 480,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _searchController,
            autofocus: true,
            onChanged: (_) => setState(() {}),
            decoration: const InputDecoration(
              isDense: true,
              border: OutlineInputBorder(),
              hintText: 'Search properties',
              prefixIcon: Icon(Symbols.search, size: 18),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: FutureBuilder<List<jira.FieldReferenceData>>(
              future: _fields,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(child: CircularProgressIndicator());
                }
                final pickable = _pickable(snapshot.data ?? const []);
                if (pickable.isEmpty) {
                  return Center(
                    child: Text(
                      'No property left to filter by',
                      style: TextStyle(color: Theme.of(context).hintColor),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: pickable.length,
                  itemBuilder: (context, index) {
                    final (value, label) = pickable[index];
                    return ListTile(
                      dense: true,
                      title: Text(label),
                      subtitle: label == value ? null : Text(value),
                      onTap: () => Navigator.of(context).pop(UpdatesPropertyFilter(field: value, label: label)),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    ),
    actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel'))],
  );
}
