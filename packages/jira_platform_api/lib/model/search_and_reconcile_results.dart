//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SearchAndReconcileResults {
  /// Returns a new [SearchAndReconcileResults] instance.
  SearchAndReconcileResults({
    this.isLast,
    this.issues = const [],
    this.names = const {},
    this.nextPageToken,
    this.schema = const {},
    this.warnings = const [],
  });

  /// Indicates whether this is the last page of the paginated response.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isLast;

  /// The list of issues found by the search or reconsiliation.
  List<IssueBean> issues;

  /// The ID and name of each field in the search results.
  Map<String, String> names;

  /// Continuation token to fetch the next page. If this result represents the last or the only page this token will be null. This token will expire in 7 days.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? nextPageToken;

  /// The schema describing the field types in the search results.
  Map<String, JsonTypeBean> schema;

  /// Experimental. Warnings generated during the search, e.g. when a JQL clause exceeded its argument limit or when the result set was truncated due to an ingestion limit. This field is currently rolling out behind a feature flag and may be absent, empty, or change shape without notice until generally available.
  List<SearchWarning> warnings;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SearchAndReconcileResults &&
    other.isLast == isLast &&
    _deepEquality.equals(other.issues, issues) &&
    _deepEquality.equals(other.names, names) &&
    other.nextPageToken == nextPageToken &&
    _deepEquality.equals(other.schema, schema) &&
    _deepEquality.equals(other.warnings, warnings);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (isLast == null ? 0 : isLast!.hashCode) +
    (issues.hashCode) +
    (names.hashCode) +
    (nextPageToken == null ? 0 : nextPageToken!.hashCode) +
    (schema.hashCode) +
    (warnings.hashCode);

  @override
  String toString() => 'SearchAndReconcileResults[isLast=$isLast, issues=$issues, names=$names, nextPageToken=$nextPageToken, schema=$schema, warnings=$warnings]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.isLast != null) {
      json[r'isLast'] = this.isLast;
    } else {
      json[r'isLast'] = null;
    }
      json[r'issues'] = this.issues;
      json[r'names'] = this.names;
    if (this.nextPageToken != null) {
      json[r'nextPageToken'] = this.nextPageToken;
    } else {
      json[r'nextPageToken'] = null;
    }
      json[r'schema'] = this.schema;
      json[r'warnings'] = this.warnings;
    return json;
  }

  /// Returns a new [SearchAndReconcileResults] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SearchAndReconcileResults? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return SearchAndReconcileResults(
        isLast: mapValueOfType<bool>(json, r'isLast'),
        issues: IssueBean.listFromJson(json[r'issues']),
        names: mapCastOfType<String, String>(json, r'names') ?? const {},
        nextPageToken: mapValueOfType<String>(json, r'nextPageToken'),
        schema: JsonTypeBean.mapFromJson(json[r'schema']),
        warnings: SearchWarning.listFromJson(json[r'warnings']),
      );
    }
    return null;
  }

  static List<SearchAndReconcileResults> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SearchAndReconcileResults>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SearchAndReconcileResults.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SearchAndReconcileResults> mapFromJson(dynamic json) {
    final map = <String, SearchAndReconcileResults>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SearchAndReconcileResults.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SearchAndReconcileResults-objects as value to a dart map
  static Map<String, List<SearchAndReconcileResults>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SearchAndReconcileResults>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SearchAndReconcileResults.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

