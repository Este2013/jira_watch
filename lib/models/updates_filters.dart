/// The property filters of the updates list: which JQL field each one narrows,
/// the values picked for it, and how they turn into JQL.
///
/// Pure data and arithmetic — no Jira calls, no widgets, no singletons — so the
/// query this produces can be tested without a site to talk to.
library;

/// A JQL literal for [value], always quoted.
///
/// Quoting unconditionally is what makes the rest of this file safe: it covers
/// reserved words (`Open`, `and`), values with spaces (`In Progress`), and the
/// accountIds and option ids Jira hands back for pickable fields, none of which
/// can be told apart from one another by looking at them.
String jqlLiteral(String value) {
  final escaped = value.replaceAll(r'\', r'\\').replaceAll('"', r'\"');
  return '"$escaped"';
}

/// Jira marks the matching part of an autocomplete suggestion with HTML bold
/// tags, and escapes the rest — neither belongs in a checkbox label.
String stripSuggestionMarkup(String text) => text.replaceAll(_htmlTag, '').replaceAll('&quot;', '"').replaceAll('&#39;', "'").replaceAll('&lt;', '<').replaceAll('&gt;', '>').replaceAll('&amp;', '&');

final _htmlTag = RegExp(r'<[^>]*>');

/// What to call a JQL field in the bar.
///
/// Jira disambiguates fields that share a name by appending the custom field id
/// or its type — `Team - cf[10061]`, `Component - Component[Dropdown]` — which
/// is noise on a filter button. Only that exact shape is trimmed, so a field
/// genuinely named `Before - After` keeps its name.
String jqlFieldLabel(String displayName) => displayName.replaceFirst(_fieldDisambiguator, '').trim();

final _fieldDisambiguator = RegExp(r'\s+-\s+(cf\[\d+\]|[^\[\]]+\[[^\[\]]+\])$');

/// One property the updates list can be narrowed by.
class UpdatesPropertyFilter {
  const UpdatesPropertyFilter({
    required this.field,
    required this.label,
    this.values = const {},
    this.valueLabels = const {},
    this.isDefault = false,
  });

  /// Value standing for "this field has no value at all" — `assignee is EMPTY`
  /// rather than `assignee in (...)`. Not a value Jira ever suggests, so it
  /// cannot collide with a real one.
  static const emptyValue = '__EMPTY__';

  /// The JQL field this narrows: `status`, `assignee`, `cf[10061]`…
  final String field;

  /// What the bar calls it.
  final String label;

  /// The picked values, as Jira's own autocomplete reports them — an id where
  /// the field has one, so a rename doesn't silently empty the list. Empty
  /// means "any", and the filter contributes nothing to the query.
  final Set<String> values;

  /// What to call each picked value, remembered from the suggestion it was
  /// picked from. Without it an id-backed field reads back as an accountId or
  /// an option id after a restart, since that is all the query needs.
  final Map<String, String> valueLabels;

  /// Whether this one is part of the bar out of the box (and so cannot be
  /// removed from it, only emptied).
  final bool isDefault;

  bool get isActive => values.isNotEmpty;

  /// What to show for [value] — its remembered name, or the value itself.
  String labelFor(String value) => value == emptyValue ? 'No value' : (valueLabels[value] ?? value);

  /// What the bar shows once something is picked: the lone value's name, or how
  /// many there are.
  String get summary => values.length == 1 ? labelFor(values.single) : '${values.length} selected';

  /// This filter as a JQL clause, or null while nothing is picked.
  String? get clause {
    final picked = [
      for (final value in values)
        if (value != emptyValue) jqlLiteral(value),
    ];
    final wantsEmpty = values.contains(emptyValue);
    if (picked.isEmpty) return wantsEmpty ? '$field is EMPTY' : null;

    final match = picked.length == 1 ? '$field = ${picked.single}' : '$field in (${picked.join(', ')})';
    return wantsEmpty ? '($match OR $field is EMPTY)' : match;
  }

  UpdatesPropertyFilter copyWith({String? label, Set<String>? values, Map<String, String>? valueLabels}) => UpdatesPropertyFilter(
    field: field,
    label: label ?? this.label,
    values: values ?? this.values,
    // Names are only meaningful for values that are still picked, so a narrowed
    // selection drops the rest rather than hoarding them.
    valueLabels: {
      for (final entry in (valueLabels ?? this.valueLabels).entries)
        if ((values ?? this.values).contains(entry.key)) entry.key: entry.value,
    },
    isDefault: isDefault,
  );

  Map<String, dynamic> toJson() => {'field': field, 'label': label, 'values': values.toList(), 'valueLabels': valueLabels};

  static UpdatesPropertyFilter? fromJson(Map json) {
    final field = json['field'];
    if (field is! String || field.isEmpty) return null;
    final values = json['values'];
    final valueLabels = json['valueLabels'];
    return UpdatesPropertyFilter(
      field: field,
      label: json['label'] as String? ?? field,
      values: values is List ? values.whereType<String>().toSet() : const {},
      valueLabels: valueLabels is Map
          ? {
              for (final entry in valueLabels.entries)
                if (entry.key is String && entry.value is String) entry.key as String: entry.value as String,
            }
          : const {},
    );
  }

  @override
  bool operator ==(Object other) =>
      other is UpdatesPropertyFilter &&
      other.field == field &&
      other.label == label &&
      other.isDefault == isDefault &&
      other.values.length == values.length &&
      other.values.containsAll(values) &&
      other.valueLabels.length == valueLabels.length &&
      other.valueLabels.entries.every((e) => valueLabels[e.key] == e.value);

  @override
  int get hashCode => Object.hash(field, label, isDefault, Object.hashAllUnordered(values), Object.hashAllUnordered(valueLabels.values));

  @override
  String toString() => 'UpdatesPropertyFilter($field: ${values.join(', ')})';
}

/// Every property filter shown in the updates bar, in the order it is shown.
class UpdatesFilters {
  const UpdatesFilters(this.filters);

  final List<UpdatesPropertyFilter> filters;

  /// The filters every site gets. Status, type and priority are categorical
  /// everywhere; assignee and labels are the two the list is most often read
  /// through ("what's mine", "what's blocked").
  static const List<UpdatesPropertyFilter> defaults = [
    UpdatesPropertyFilter(field: 'status', label: 'Status', isDefault: true),
    UpdatesPropertyFilter(field: 'assignee', label: 'Assignee', isDefault: true),
    UpdatesPropertyFilter(field: 'issuetype', label: 'Type', isDefault: true),
    UpdatesPropertyFilter(field: 'priority', label: 'Priority', isDefault: true),
    UpdatesPropertyFilter(field: 'labels', label: 'Labels', isDefault: true),
  ];

  static const UpdatesFilters empty = UpdatesFilters(defaults);

  /// The JQL these filters add to the updates query, one clause per active
  /// filter (they are ANDed together by the caller).
  List<String> get clauses => [for (final filter in filters) ?filter.clause];

  int get activeCount => filters.where((f) => f.isActive).length;

  UpdatesPropertyFilter? byField(String field) {
    for (final filter in filters) {
      if (filter.field == field) return filter;
    }
    return null;
  }

  /// The filters, with [field]'s picked values replaced.
  UpdatesFilters withValues(String field, Set<String> values, {Map<String, String>? valueLabels}) => UpdatesFilters([
    for (final filter in filters)
      if (filter.field == field) filter.copyWith(values: values, valueLabels: valueLabels) else filter,
  ]);

  /// The filters, plus a custom one — or unchanged if that field already has a
  /// filter, since two of them would only ever fight over the same clause.
  UpdatesFilters add(UpdatesPropertyFilter filter) => byField(filter.field) != null ? this : UpdatesFilters([...filters, filter]);

  /// The filters, without the custom one on [field]. Defaults stay: they are
  /// the bar's furniture, and emptying them is how they are turned off.
  UpdatesFilters remove(String field) => UpdatesFilters([
    for (final filter in filters)
      if (filter.isDefault || filter.field != field) filter,
  ]);

  /// The filters with nothing picked anywhere, custom ones included — the bar's
  /// "clear all".
  UpdatesFilters cleared() => UpdatesFilters([for (final filter in filters) filter.copyWith(values: const {})]);

  /// The saved filters, reconciled with [defaults]: every default is present
  /// and in its usual place, keeping whatever was picked for it last session,
  /// and the custom ones follow in their saved order.
  ///
  /// This is what lets the default set grow later without stranding a saved
  /// list — a filter added here just appears, and one dropped from here stops
  /// being a default while staying a perfectly good custom filter.
  static UpdatesFilters resolve(List<UpdatesPropertyFilter> saved) {
    final savedByField = {for (final filter in saved) filter.field: filter};
    return UpdatesFilters([
      for (final base in defaults) base.copyWith(values: savedByField[base.field]?.values ?? const {}, valueLabels: savedByField[base.field]?.valueLabels ?? const {}),
      for (final filter in saved)
        if (!defaults.any((d) => d.field == filter.field)) filter,
    ]);
  }

  List<Map<String, dynamic>> toJson() => [
    for (final filter in filters)
      if (filter.isActive || !filter.isDefault) filter.toJson(),
  ];

  static UpdatesFilters fromJson(Object? json) {
    if (json is! List) return resolve(const []);
    return resolve([
      for (final entry in json)
        if (entry is Map) ?UpdatesPropertyFilter.fromJson(entry),
    ]);
  }

  @override
  String toString() => 'UpdatesFilters(${clauses.join(' AND ')})';
}
