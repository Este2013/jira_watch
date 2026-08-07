//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SearchResults {
  /// Returns a new [SearchResults] instance.
  SearchResults({
    this.expand,
    this.issues = const [],
    this.maxResults,
    this.names = const {},
    this.schema = const {},
    this.startAt,
    this.total,
    this.warningMessages = const [],
  });

  /// Expand options that include additional search result details in the response.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? expand;

  /// The list of issues found by the search.
  List<IssueBean> issues;

  /// The maximum number of results that could be on the page.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? maxResults;

  /// The ID and name of each field in the search results.
  Map<String, String> names;

  /// The schema describing the field types in the search results.
  Map<String, IssueBeanSchemaValue> schema;

  /// The index of the first item returned on the page.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? startAt;

  /// The number of results on the page.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? total;

  /// Any warnings related to the JQL query.
  List<String> warningMessages;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SearchResults &&
    other.expand == expand &&
    _deepEquality.equals(other.issues, issues) &&
    other.maxResults == maxResults &&
    _deepEquality.equals(other.names, names) &&
    _deepEquality.equals(other.schema, schema) &&
    other.startAt == startAt &&
    other.total == total &&
    _deepEquality.equals(other.warningMessages, warningMessages);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (expand == null ? 0 : expand!.hashCode) +
    (issues.hashCode) +
    (maxResults == null ? 0 : maxResults!.hashCode) +
    (names.hashCode) +
    (schema.hashCode) +
    (startAt == null ? 0 : startAt!.hashCode) +
    (total == null ? 0 : total!.hashCode) +
    (warningMessages.hashCode);

  @override
  String toString() => 'SearchResults[expand=$expand, issues=$issues, maxResults=$maxResults, names=$names, schema=$schema, startAt=$startAt, total=$total, warningMessages=$warningMessages]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.expand != null) {
      json[r'expand'] = this.expand;
    } else {
      json[r'expand'] = null;
    }
      json[r'issues'] = this.issues;
    if (this.maxResults != null) {
      json[r'maxResults'] = this.maxResults;
    } else {
      json[r'maxResults'] = null;
    }
      json[r'names'] = this.names;
      json[r'schema'] = this.schema;
    if (this.startAt != null) {
      json[r'startAt'] = this.startAt;
    } else {
      json[r'startAt'] = null;
    }
    if (this.total != null) {
      json[r'total'] = this.total;
    } else {
      json[r'total'] = null;
    }
      json[r'warningMessages'] = this.warningMessages;
    return json;
  }

  /// Returns a new [SearchResults] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SearchResults? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return SearchResults(
        expand: mapValueOfType<String>(json, r'expand'),
        issues: IssueBean.listFromJson(json[r'issues']),
        maxResults: mapValueOfType<int>(json, r'maxResults'),
        names: mapCastOfType<String, String>(json, r'names') ?? const {},
        schema: IssueBeanSchemaValue.mapFromJson(json[r'schema']),
        startAt: mapValueOfType<int>(json, r'startAt'),
        total: mapValueOfType<int>(json, r'total'),
        warningMessages: json[r'warningMessages'] is Iterable
            ? (json[r'warningMessages'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<SearchResults> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SearchResults>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SearchResults.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SearchResults> mapFromJson(dynamic json) {
    final map = <String, SearchResults>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SearchResults.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SearchResults-objects as value to a dart map
  static Map<String, List<SearchResults>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SearchResults>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SearchResults.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

