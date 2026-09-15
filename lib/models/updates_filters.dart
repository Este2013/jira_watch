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

/// A JQL function call as a person would say it: `currentUser()` reads
/// "Current user", `endOfDay()` reads "End of day".
///
/// The call itself stays visible next to it — this is a label, not a
/// replacement, and the query is still written in Jira's words.
String jqlFunctionLabel(String call) {
  final name = call.replaceFirst(_callArguments, '').replaceAll('_', ' ').replaceAllMapped(_camelHump, (match) => ' ${match[1]!.toLowerCase()}');
  final words = name.replaceAll(RegExp(r'\s+'), ' ').trim();
  if (words.isEmpty) return call;
  return words[0].toUpperCase() + words.substring(1);
}

final _callArguments = RegExp(r'\(.*\)$');
final _camelHump = RegExp(r'(?<=[a-z0-9])([A-Z])');

/// Whether a JQL function can stand in for a value of a field.
///
/// Two conditions. It has to take no arguments — Jira reports the ones that do
/// with their empty argument list in place (`membersOf("")`), and there is no
/// sensible way to ask for that argument inside a checkbox list. And it has to
/// return something the field can be compared against: `currentUser()` returns
/// a user, which suits `assignee` and suits `status` not at all.
bool jqlFunctionFits({required String call, required List<String> functionTypes, required List<String> fieldTypes}) => call.endsWith('()') && functionTypes.any(fieldTypes.contains);

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

  /// Marks a picked value as one of Jira's own JQL functions — `currentUser()`,
  /// `openSprints()` — rather than a literal. A function has to reach the query
  /// unquoted to be called at all, and the two are told apart here rather than
  /// by guessing from a value's shape (a status really can be named
  /// `currentUser()`).
  static const functionPrefix = '__FN__';

  /// A picked value standing for the JQL function [call], e.g. `currentUser()`.
  static String function(String call) => '$functionPrefix$call';

  static bool isFunction(String value) => value.startsWith(functionPrefix);

  /// The JQL [value] stands for: a function call as-is, anything else quoted.
  static String jqlFor(String value) => isFunction(value) ? value.substring(functionPrefix.length) : jqlLiteral(value);

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
  String labelFor(String value) => switch (value) {
    emptyValue => 'No value',
    _ when isFunction(value) => valueLabels[value] ?? value.substring(functionPrefix.length),
    _ => valueLabels[value] ?? value,
  };

  /// What the bar shows once something is picked: the lone value's name, or how
  /// many there are.
  String get summary => values.length == 1 ? labelFor(values.single) : '${values.length} selected';

  /// This filter as a JQL clause, or null while nothing is picked.
  String? get clause {
    final picked = [
      for (final value in values)
        if (value != emptyValue) jqlFor(value),
    ];
    final wantsEmpty = values.contains(emptyValue);
    if (picked.isEmpty) return wantsEmpty ? '$field is EMPTY' : null;

    // `in` for anything involving a function: some of them return a list, and
    // `=` against a list is not a query Jira will run. A lone literal keeps the
    // plain comparison, which is what a person would have typed.
    final isPlainSingle = picked.length == 1 && !values.any(isFunction);
    final match = isPlainSingle ? '$field = ${picked.single}' : '$field in (${picked.join(', ')})';
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

/// The project a saved filter map narrows to, or null for the combined feed.
///
/// Migrates the pre-tabs `active_projects` set: a lone selected project becomes
/// that project's tab, while none or several of them land on the home tab — no
/// single tab can stand for an arbitrary subset.
String? activeProjectFromFilters(Map filters) {
  if (filters.containsKey('active_project')) return filters['active_project'] as String?;
  final legacy = ((filters['active_projects'] ?? const []) as List).cast<String>();
  return legacy.length == 1 ? legacy.single : null;
}

/// Everything the updates bar narrows the list by, and the one thing that gets
/// saved between sessions.
class UpdatesQuery {
  const UpdatesQuery({
    this.activeProject,
    this.timeFilter,
    this.filters = UpdatesFilters.empty,
    this.jqlMode = false,
    this.rawJql = '',
  });

  /// The project tab, or null on the home tab.
  final String? activeProject;

  /// Either a named range (`today`, `week`, `all time`) or a two-date list, as
  /// the time dropdown has always kept it.
  final Object? timeFilter;

  /// The filter chips, whether or not they are the ones being used.
  final UpdatesFilters filters;

  /// Whether the query is being written by hand rather than picked from chips.
  final bool jqlMode;

  /// The hand-written query. Kept while the chips are showing, so switching
  /// back and forth does not lose it.
  final String rawJql;

  /// What gets ANDed into the updates query: the hand-written JQL while that
  /// mode is on and holds something, the chips' own clauses otherwise.
  ///
  /// Parenthesised, since a hand-written query is free to contain an `OR` and
  /// would otherwise reach further than it reads.
  List<String> get clauses => jqlMode && rawJql.trim().isNotEmpty ? ['(${rawJql.trim()})'] : filters.clauses;

  UpdatesQuery copyWith({
    String? activeProject,
    bool clearActiveProject = false,
    Object? timeFilter,
    UpdatesFilters? filters,
    bool? jqlMode,
    String? rawJql,
  }) => UpdatesQuery(
    activeProject: clearActiveProject ? null : (activeProject ?? this.activeProject),
    timeFilter: timeFilter ?? this.timeFilter,
    filters: filters ?? this.filters,
    jqlMode: jqlMode ?? this.jqlMode,
    rawJql: rawJql ?? this.rawJql,
  );

  Map<String, dynamic> toJson() => {
    'active_project': activeProject,
    'property_filters': filters.toJson(),
    'jql_mode': jqlMode,
    'raw_jql': rawJql,
    'time_filter': timeFilter is List
        ? [
            for (final date in timeFilter as List)
              if (date is DateTime) date.toIso8601String(),
          ]
        : timeFilter,
  };

  static UpdatesQuery fromJson(Map json) => UpdatesQuery(
    activeProject: activeProjectFromFilters(json),
    timeFilter: _timeFilterFromJson(json['time_filter']),
    filters: UpdatesFilters.fromJson(json['property_filters']),
    jqlMode: json['jql_mode'] == true,
    rawJql: json['raw_jql'] as String? ?? '',
  );

  /// A saved custom range comes back as ISO strings; anything unreadable is
  /// dropped rather than allowed to throw on startup.
  static Object? _timeFilterFromJson(Object? saved) {
    if (saved is! List) return saved;
    final dates = <DateTime>[];
    for (final entry in saved) {
      final date = entry is String ? DateTime.tryParse(entry) : null;
      if (date == null) return null;
      dates.add(date);
    }
    return dates;
  }
}
