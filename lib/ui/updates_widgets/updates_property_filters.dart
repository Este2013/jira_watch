import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:jira_platform_api/api.dart' as jira;
import 'package:jira_watcher/dao/jira/jira_api.dart';
import 'package:jira_watcher/models/jql_completion.dart';
import 'package:jira_watcher/models/updates_filters.dart';
import 'package:material_symbols_icons/symbols.dart';

/// One property filter in the updates bar: a chip saying what it narrows to,
/// which opens a searchable list of the values Jira suggests for that field.
class PropertyFilterButton extends StatefulWidget {
  const PropertyFilterButton({super.key, required this.filter, required this.onChanged, this.onRemove, this.openOnShow = false});

  final UpdatesPropertyFilter filter;

  /// Called with the picked values, which of them are excluded rather than
  /// kept, and the names to remember them by.
  final void Function(Set<String> values, Set<String> excludedValues, Map<String, String> valueLabels) onChanged;

  /// Drops the filter from the bar entirely — custom filters only; the defaults
  /// are furniture, and emptying them is how they are turned off.
  final VoidCallback? onRemove;

  /// Opens the value panel as soon as this chip appears, for a filter the user
  /// has just added and is obviously about to pick from.
  final bool openOnShow;

  @override
  State<PropertyFilterButton> createState() => _PropertyFilterButtonState();
}

class _PropertyFilterButtonState extends State<PropertyFilterButton> {
  final _menuController = MenuController();

  @override
  void initState() {
    super.initState();
    // After the frame: the anchor has no overlay to open into until it has been
    // laid out once.
    if (widget.openOnShow) SchedulerBinding.instance.addPostFrameCallback((_) => _menuController.open());
  }

  @override
  Widget build(BuildContext context) {
    final filter = widget.filter;
    final onChanged = widget.onChanged;
    return MenuAnchor(
      controller: _menuController,
      // A panel rather than a list of menu items: the value list has its own
      // search field, and is long often enough that it has to scroll.
      menuChildren: [_FilterValuePicker(filter: filter, onChanged: onChanged)],
      builder: (context, controller, child) => InputChip(
        label: Text(filter.isActive ? '${filter.label}: ${filter.summary}' : filter.label),
        tooltip: filter.isActive ? filter.values.map(filter.displayFor).join(', ') : 'Filter by ${filter.label}',
        avatar: Icon(filter.isActive ? Symbols.filter_alt : Symbols.arrow_drop_down, fill: filter.isActive ? 1 : 0),
        selected: filter.isActive,
        showCheckmark: false,
        onPressed: () => controller.isOpen ? controller.close() : controller.open(),
        // One affordance, whichever undo makes sense: clear what is picked, or —
        // once there is nothing left to clear — take the custom filter away.
        onDeleted: filter.isActive ? () => onChanged(const {}, const {}, const {}) : widget.onRemove,
        deleteIcon: const Icon(Symbols.close, size: 16),
        deleteButtonTooltipMessage: filter.isActive ? 'Clear' : 'Remove this filter',
      ),
    );
  }
}

/// The value list behind a [PropertyFilterButton].
class _FilterValuePicker extends StatefulWidget {
  const _FilterValuePicker({required this.filter, required this.onChanged});

  final UpdatesPropertyFilter filter;
  final void Function(Set<String> values, Set<String> excludedValues, Map<String, String> valueLabels) onChanged;

  @override
  State<_FilterValuePicker> createState() => _FilterValuePickerState();
}

class _FilterValuePickerState extends State<_FilterValuePicker> {
  final _searchController = TextEditingController();
  late final _searchFocusNode = FocusNode(debugLabel: 'Filter search')..onKeyEvent = _onSearchKey;

  /// One persistent [FocusNode] per value currently offered, so arrow-key
  /// navigation can move focus from tile to tile — and so a tile does not lose
  /// its node (and the highlight that comes with it) on every rebuild a search
  /// keystroke causes.
  final Map<String, FocusNode> _tileFocusNodes = {};

  /// The values in the exact order they are rendered, refreshed at the top of
  /// every [build] — arrow-key handling runs from a [FocusNode] callback, well
  /// outside `build`, so it reads this rather than recomputing the list.
  List<String> _visibleOrder = const [];

  late Set<String> _values = {...widget.filter.values};
  late Set<String> _excludedValues = {...widget.filter.excludedValues};
  late Map<String, String> _labels = {...widget.filter.valueLabels};

  /// Suggestions as `(value, display name)`.
  List<(String, String)> _suggestions = const [];
  bool _isLoading = true;

  /// Jira's own JQL functions that fit this field — `currentUser()` for an
  /// assignee, `openSprints()` for a sprint. They answer the questions a list
  /// of literal values cannot ("mine", "the sprint we are in"), and they stay
  /// right when the answer changes under them.
  List<(String, String)> _functions = const [];

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
    _loadFunctions();
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    _applyDebounce?.cancel();
    if (_pendingApply) {
      // After the frame: this runs while the menu is being torn down, and the
      // list above would otherwise be asked to rebuild mid-teardown.
      final values = _values;
      final excluded = _excludedValues;
      final labels = _labels;
      final notify = widget.onChanged;
      SchedulerBinding.instance.addPostFrameCallback((_) => notify(values, excluded, labels));
    }
    _searchController.dispose();
    _searchFocusNode.dispose();
    for (final node in _tileFocusNodes.values) {
      node.dispose();
    }
    super.dispose();
  }

  FocusNode _focusNodeFor(String value) => _tileFocusNodes.putIfAbsent(value, () {
    final node = FocusNode(debugLabel: value);
    node.onKeyEvent = (node, event) => _onTileKey(value, event);
    return node;
  });

  KeyEventResult _onSearchKey(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent || event.logicalKey != LogicalKeyboardKey.arrowDown) return KeyEventResult.ignored;
    if (_visibleOrder.isEmpty) return KeyEventResult.ignored;
    _focusNodeFor(_visibleOrder.first).requestFocus();
    return KeyEventResult.handled;
  }

  KeyEventResult _onTileKey(String value, KeyEvent event) {
    if (event is! KeyDownEvent) return KeyEventResult.ignored;
    final index = _visibleOrder.indexOf(value);
    if (index < 0) return KeyEventResult.ignored;

    if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
      if (index + 1 < _visibleOrder.length) _focusNodeFor(_visibleOrder[index + 1]).requestFocus();
      return KeyEventResult.handled;
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
      if (index == 0) {
        _searchFocusNode.requestFocus();
      } else {
        _focusNodeFor(_visibleOrder[index - 1]).requestFocus();
      }
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  Future<void> _load() async {
    final seq = ++_requestSeq;
    setState(() => _isLoading = true);
    final results = await JiraApi().fieldSuggestions(widget.filter.field, query: _searchController.text.trim());
    if (!mounted || seq != _requestSeq) return;
    setState(() {
      _suggestions = [
        for (final result in results)
          if (result.value case final value?) (unwrapJqlSuggestionValue(value), stripSuggestionMarkup(result.displayName ?? value)),
      ];
      _isLoading = false;
    });
  }

  Future<void> _loadFunctions() async {
    final reference = await JiraApi().jqlReferenceData();
    if (!mounted || reference == null) return;

    var fieldTypes = const <String>[];
    for (final field in reference.visibleFieldNames) {
      if (field.value == widget.filter.field) {
        fieldTypes = field.types;
        break;
      }
    }
    setState(() {
      _functions = [
        for (final function in reference.visibleFunctionNames)
          if (function.value case final call?)
            if (jqlFunctionFits(call: call, functionTypes: function.types, fieldTypes: fieldTypes)) (UpdatesPropertyFilter.function(call), jqlFunctionLabel(call)),
      ];
    });
  }

  void _onSearchChanged(String _) {
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 300), _load);
  }

  /// A tristate tile cycles false → true → null → false: unpicked, kept,
  /// excluded.
  void _toggle(String value, String label, bool? state) {
    setState(() {
      switch (state) {
        case true:
          _values = {..._values, value};
          _excludedValues = {..._excludedValues}..remove(value);
          _labels = {..._labels, value: label};
        case false:
          _values = {..._values}..remove(value);
          _excludedValues = {..._excludedValues}..remove(value);
          _labels = {..._labels}..remove(value);
        case null:
          _values = {..._values, value};
          _excludedValues = {..._excludedValues, value};
          _labels = {..._labels, value: label};
      }
    });
    _pendingApply = true;
    _applyDebounce?.cancel();
    _applyDebounce = Timer(const Duration(milliseconds: 400), _apply);
  }

  void _apply() {
    _pendingApply = false;
    widget.onChanged(_values, _excludedValues, _labels);
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
    final query = _searchController.text.trim().toLowerCase();
    final isSearching = query.isNotEmpty;
    // Matched here rather than at the server: these come from the site's JQL
    // vocabulary, not from the field's values, so the suggestion endpoint knows
    // nothing about them.
    final functions = [
      for (final (value, label) in _functions)
        if (!isSearching || label.toLowerCase().contains(query)) (value, label),
    ];

    // Mirrors the tile order built below exactly, so arrow-key handling (which
    // runs outside `build`, from a FocusNode callback) always steps to the tile
    // that is actually next on screen.
    _visibleOrder = [
      for (final (value, _) in stranded) value,
      for (final (value, _) in functions) value,
      if (!isSearching) UpdatesPropertyFilter.emptyValue,
      for (final (value, _) in _suggestions) value,
    ];

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
              focusNode: _searchFocusNode,
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
                // A scrolling Column rather than a ListView: a menu asks its
                // children for their intrinsic size, and a lazy viewport
                // throws rather than answer — it would have to build every
                // child to know, which is the one thing it exists to avoid.
                : SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        for (final (value, label) in stranded) _valueTile(value, label),
                        if (functions.isNotEmpty) ...[
                          _sectionHeader(context, 'Jira values'),
                          for (final (value, label) in functions) _valueTile(value, label),
                          const Divider(height: 1),
                        ],
                        if (!isSearching)
                          _valueTile(
                            UpdatesPropertyFilter.emptyValue,
                            'No value',
                            subtitle: 'Items where ${widget.filter.label.toLowerCase()} is not set',
                            excludedLabel: 'Has a value',
                          ),
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
                      _excludedValues = const {};
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

  Widget _sectionHeader(BuildContext context, String text) => Padding(
    padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
    child: Text(text, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: Theme.of(context).hintColor)),
  );

  Widget _valueTile(String value, String label, {String? subtitle, String? excludedLabel}) {
    final excluded = _excludedValues.contains(value);
    return CheckboxListTile(
      dense: true,
      focusNode: _focusNodeFor(value),
      // The cycle a tap steps through is Flutter's own: false → true → null,
      // i.e. unpicked → kept → excluded — exactly the three states a filter
      // value can be in, with the dash reading as "not this" for free.
      tristate: true,
      value: !_values.contains(value) ? false : (excluded ? null : true),
      onChanged: (state) => _toggle(value, label, state),
      title: Text(
        excluded ? (excludedLabel ?? 'Not $label') : label,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: excluded ? const TextStyle(fontStyle: FontStyle.italic) : null,
      ),
      subtitle: subtitle == null ? null : Text(subtitle, maxLines: 1, overflow: TextOverflow.ellipsis),
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
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

/// The filter row, written by hand: the query as JQL rather than as chips.
///
/// It is checked against Jira's own parser before it is allowed to reach the
/// list, so a typo reads as a message under the field rather than as an empty
/// list with no explanation.
class JqlFilterField extends StatefulWidget {
  const JqlFilterField({super.key, required this.initialJql, required this.onChanged, this.onSeedFromFilters});

  final String initialJql;

  /// Called with a query Jira is happy to parse.
  final void Function(String jql) onChanged;

  /// Replaces what is typed with the chips' own query, where there is one.
  final VoidCallback? onSeedFromFilters;

  @override
  State<JqlFilterField> createState() => _JqlFilterFieldState();
}

/// One row in the JQL field's own autocomplete — what to insert, and where.
class _JqlSuggestion {
  const _JqlSuggestion({required this.label, required this.insertText, required this.mode, this.subtitle});

  final String label;
  final String insertText;
  final JqlCompletionMode mode;
  final String? subtitle;
}

/// A value fit to sit in JQL unquoted — a bare number — quoted otherwise.
/// Mirrors [jqlLiteral]'s job for the chip filters, for the same reason: any
/// value could be a reserved word or contain a space.
String _jqlValueLiteral(String value) => RegExp(r'^-?\d+(\.\d+)?$').hasMatch(value) ? value : jqlLiteral(value);

class _JqlFilterFieldState extends State<JqlFilterField> {
  late final _controller = TextEditingController(text: widget.initialJql);
  late final _focusNode = FocusNode(debugLabel: 'JQL field')
    ..onKeyEvent = _onKey
    ..addListener(_onFocusChange);
  final _layerLink = LayerLink();

  String? _error;
  bool _isChecking = false;

  /// True once the text differs from what the list is actually showing, so the
  /// apply button says there is something to apply.
  bool _isDirty = false;

  // --- Autocomplete, driven by classifyJqlCursor -----------------------------

  OverlayEntry? _overlayEntry;
  List<_JqlSuggestion> _suggestions = const [];

  /// Which suggestion arrow-down selection has reached, or -1 for "none" —
  /// the dropdown's own default, so Enter runs the query rather than fighting
  /// over what it means until the user actually asks to navigate the list.
  int _highlighted = -1;
  bool _suggestionsLoading = false;

  /// The context the current [_suggestions] answer — accepting one needs to
  /// know what span of text it replaces.
  JqlCompletionContext? _suggestionContext;

  Timer? _suggestDebounce;

  /// Bumped per request so a slower earlier one cannot overwrite a newer one.
  int _requestSeq = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_scheduleSuggest);
  }

  @override
  void dispose() {
    _controller.removeListener(_scheduleSuggest);
    _suggestDebounce?.cancel();
    _hideOverlay();
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (!_focusNode.hasFocus) _hideOverlay();
  }

  void _scheduleSuggest() {
    _suggestDebounce?.cancel();
    _suggestDebounce = Timer(const Duration(milliseconds: 200), _suggest);
  }

  Future<void> _suggest() async {
    final selection = _controller.selection;
    if (!_focusNode.hasFocus || !selection.isValid || !selection.isCollapsed) {
      _hideOverlay();
      return;
    }

    final seq = ++_requestSeq;
    final ctx = classifyJqlCursor(_controller.text, selection.baseOffset);
    setState(() => _suggestionsLoading = true);
    final suggestions = await _suggestionsFor(ctx);
    if (!mounted || seq != _requestSeq) return;

    setState(() {
      _suggestionsLoading = false;
      _suggestions = suggestions;
      _suggestionContext = ctx;
      _highlighted = -1;
    });
    if (suggestions.isEmpty) {
      _hideOverlay();
    } else {
      _refreshOverlay();
    }
  }

  Future<List<_JqlSuggestion>> _suggestionsFor(JqlCompletionContext ctx) async {
    final prefix = ctx.prefix.toLowerCase();
    switch (ctx.mode) {
      case JqlCompletionMode.field:
        final fields = await JiraApi().jqlFields();
        final seen = <String>{};
        final out = <_JqlSuggestion>[];
        for (final field in fields) {
          final value = field.value;
          if (value == null || field.deprecated == jira.FieldReferenceDataDeprecatedEnum.true_ || !seen.add(value)) continue;
          final label = jqlFieldLabel(field.displayName ?? value);
          if (prefix.isNotEmpty && !label.toLowerCase().contains(prefix) && !value.toLowerCase().contains(prefix)) continue;
          out.add(_JqlSuggestion(label: label, insertText: value, mode: ctx.mode, subtitle: label == value ? null : value));
        }
        out.sort((a, b) => a.label.toLowerCase().compareTo(b.label.toLowerCase()));
        return out;

      case JqlCompletionMode.op:
        final field = ctx.field;
        if (field == null) return const [];
        final fields = await JiraApi().jqlFields();
        var operators = const <String>[];
        for (final f in fields) {
          if (f.value == field) {
            operators = f.operators;
            break;
          }
        }
        return [
          for (final op in operators)
            if (prefix.isEmpty || op.toLowerCase().startsWith(prefix)) _JqlSuggestion(label: op, insertText: op, mode: ctx.mode),
        ];

      case JqlCompletionMode.value:
        final field = ctx.field;
        if (field == null) return const [];
        final results = await JiraApi().fieldSuggestions(field, query: ctx.prefix.isEmpty ? null : ctx.prefix);
        final out = <_JqlSuggestion>[
          for (final result in results)
            if (result.value case final value?)
              _JqlSuggestion(label: stripSuggestionMarkup(result.displayName ?? value), insertText: _jqlValueLiteral(unwrapJqlSuggestionValue(value)), mode: ctx.mode),
        ];

        // The same smart values the chip filters offer, so the two pickers
        // agree on what "mine" or "the sprint we are in" means.
        final reference = await JiraApi().jqlReferenceData();
        if (reference != null) {
          var fieldTypes = const <String>[];
          for (final f in reference.visibleFieldNames) {
            if (f.value == field) {
              fieldTypes = f.types;
              break;
            }
          }
          for (final function in reference.visibleFunctionNames) {
            final call = function.value;
            if (call == null || !jqlFunctionFits(call: call, functionTypes: function.types, fieldTypes: fieldTypes)) continue;
            final label = jqlFunctionLabel(call);
            if (prefix.isNotEmpty && !label.toLowerCase().contains(prefix)) continue;
            out.add(_JqlSuggestion(label: label, insertText: call, mode: ctx.mode, subtitle: call));
          }
        }
        return out;

      case JqlCompletionMode.keyword:
        final reference = await JiraApi().jqlReferenceData();
        const priority = {'AND': 0, 'OR': 1, 'ORDER BY': 2};
        final words = <String>{'AND', 'OR', 'ORDER BY', ...?reference?.jqlReservedWords};
        final out =
            [
              for (final word in words)
                if (prefix.isEmpty || word.toLowerCase().startsWith(prefix)) word,
            ]..sort((a, b) {
              final pa = priority[a] ?? 3, pb = priority[b] ?? 3;
              return pa != pb ? pa.compareTo(pb) : a.compareTo(b);
            });
        return [for (final word in out) _JqlSuggestion(label: word, insertText: word, mode: ctx.mode)];
    }
  }

  void _accept(_JqlSuggestion suggestion) {
    final ctx = _suggestionContext;
    if (ctx == null) return;

    final insertion = switch (suggestion.mode) {
      // "in"/"not in" open their value list right away, so the very next
      // keystroke already lands in value mode instead of needing its own '('.
      JqlCompletionMode.op when suggestion.insertText == 'in' || suggestion.insertText == 'not in' => '${suggestion.insertText} (',
      _ => '${suggestion.insertText} ',
    };

    final text = _controller.text;
    final newText = text.replaceRange(ctx.replaceStart, ctx.replaceEnd, insertion);
    _controller.value = TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: ctx.replaceStart + insertion.length),
    );
    setState(() => _isDirty = true);
    // Accepted — this exact list no longer describes what's under the cursor,
    // and leaving it up (or leaving _suggestions non-empty with the overlay
    // gone) is what let a second, immediate Enter re-accept a suggestion that
    // was no longer showing instead of running the query. The controller
    // listener above schedules a fresh suggestion pass on its own — picking a
    // field cascades straight into its operators — so this is only ever a gap
    // until that lands, not a dead end.
    _hideOverlay();

    // Accepting can be a tap on the overlay, which would otherwise leave
    // Material's own tap-to-focus behavior claiming it — after the frame, so
    // that settles first, put focus back on the field, cursor already where
    // the insertion left it.
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (mounted) _focusNode.requestFocus();
    });
  }

  void _refreshOverlay() {
    if (_overlayEntry == null) {
      _overlayEntry = OverlayEntry(builder: _buildOverlay);
      Overlay.of(context).insert(_overlayEntry!);
    } else {
      _overlayEntry!.markNeedsBuild();
    }
  }

  /// Removes the overlay and forgets its suggestions — the two always change
  /// together, so nothing (Enter included) can mistake stale suggestions left
  /// over from a moment ago for a dropdown that is still actually showing.
  ///
  /// A plain field write rather than `setState`: nothing in this widget's own
  /// `build` reads `_suggestions` (only `onSubmitted`'s closure, at call time,
  /// and the overlay's own builder, refreshed separately) — which also keeps
  /// this callable from `dispose`, after `setState` would throw.
  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    _suggestions = const [];
    _highlighted = -1;
  }

  /// Moves the arrow-down selection. `-1` (nothing highlighted, the default)
  /// is a real stop on the way up as well as down, not just a starting point
  /// — arrowing up off the first suggestion backs all the way out of
  /// selecting one, the same as never having pressed the arrow at all.
  void _move(int delta) {
    if (_suggestions.isEmpty) return;
    setState(() => _highlighted = (_highlighted + delta).clamp(-1, _suggestions.length - 1));
    _refreshOverlay();
  }

  KeyEventResult _onKey(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent) return KeyEventResult.ignored;
    if (event.logicalKey == LogicalKeyboardKey.escape && _overlayEntry != null) {
      _hideOverlay();
      return KeyEventResult.handled;
    }
    if (_suggestions.isEmpty) return KeyEventResult.ignored;
    if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
      _move(1);
      return KeyEventResult.handled;
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
      _move(-1);
      return KeyEventResult.handled;
    }
    if (event.logicalKey == LogicalKeyboardKey.tab) {
      // Always the first suggestion, regardless of arrow-key selection — a
      // quick "complete what I'm typing" that does not require navigating.
      _accept(_suggestions.first);
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  Widget _buildOverlay(BuildContext context) => CompositedTransformFollower(
    link: _layerLink,
    showWhenUnlinked: false,
    targetAnchor: Alignment.bottomLeft,
    followerAnchor: Alignment.topLeft,
    offset: const Offset(0, 4),
    child: Align(
      alignment: Alignment.topLeft,
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(8),
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          width: 320,
          child: _suggestions.isEmpty
              ? Padding(
                  padding: const EdgeInsets.all(16),
                  child: _suggestionsLoading ? const Center(child: SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))) : const SizedBox.shrink(),
                )
              : ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 240),
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    itemCount: _suggestions.length,
                    itemBuilder: (context, index) {
                      final suggestion = _suggestions[index];
                      return Material(
                        color: index == _highlighted ? Theme.of(context).colorScheme.surfaceContainerHighest : Colors.transparent,
                        child: ListTile(
                          dense: true,
                          title: Text(suggestion.label, maxLines: 1, overflow: TextOverflow.ellipsis),
                          subtitle: suggestion.subtitle == null ? null : Text(suggestion.subtitle!, maxLines: 1, overflow: TextOverflow.ellipsis),
                          onTap: () => _accept(suggestion),
                        ),
                      );
                    },
                  ),
                ),
        ),
      ),
    ),
  );

  Future<void> _apply() async {
    final query = _controller.text.trim();
    if (query.isEmpty) {
      setState(() {
        _error = null;
        _isDirty = false;
      });
      widget.onChanged('');
      return;
    }

    setState(() => _isChecking = true);
    final errors = await JiraApi().jqlErrors(query);
    if (!mounted) return;
    setState(() {
      _isChecking = false;
      _error = errors.isEmpty ? null : errors.join('\n');
      if (errors.isEmpty) _isDirty = false;
    });
    if (errors.isEmpty) widget.onChanged(query);
  }

  @override
  Widget build(BuildContext context) => CompositedTransformTarget(
    link: _layerLink,
    child: TextField(
      controller: _controller,
      focusNode: _focusNode,
      autofocus: true,
      // Desktop's default: regaining focus selects everything, which fought
      // with accepting a suggestion — the cursor `_accept` places right after
      // the insertion would vanish under a full-query selection the instant
      // focus was restored, so the next keystroke replaced the query outright.
      selectAllOnFocus: false,
      style: const TextStyle(fontFamily: 'monospace'),
      onChanged: (_) => setState(() => _isDirty = true),
      onSubmitted: (_) {
        // Only once arrow-down has actually picked a suggestion — otherwise
        // Enter's plain, expected job is running the query.
        if (_highlighted >= 0 && _highlighted < _suggestions.length) {
          _accept(_suggestions[_highlighted]);
        } else {
          _apply();
        }
      },
      decoration: InputDecoration(
        isDense: true,
        border: const OutlineInputBorder(),
        hintText: 'status = "In Progress" AND assignee = currentUser()',
        errorText: _error,
        errorMaxLines: 3,
        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 8, right: 4),
          child: Icon(Symbols.terminal, size: 18),
        ),
        prefixIconConstraints: const BoxConstraints(),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.onSeedFromFilters != null)
              IconButton(
                tooltip: 'Write out the filter chips instead',
                icon: const Icon(Symbols.filter_alt, size: 18),
                onPressed: widget.onSeedFromFilters,
              ),
            IconButton(
              tooltip: 'Run this query',
              icon: _isChecking ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)) : Icon(Symbols.play_arrow, fill: _isDirty ? 1 : 0, size: 18),
              onPressed: _isChecking ? null : _apply,
            ),
          ],
        ),
      ),
    ),
  );
}
