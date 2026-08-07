//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SoftwareIssueResults {
  /// Returns a new [SoftwareIssueResults] instance.
  SoftwareIssueResults({
    this.expand,
    this.isLast,
    this.issues = const [],
    this.names = const {},
    this.nextPageToken,
    this.schema = const {},
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

  /// Indicates whether this is the last page of the paginated response.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isLast;

  /// The list of issues found by the search.
  List<IssueBean> issues;

  /// The ID and name of each field in the search results.
  Map<String, String> names;

  /// Continuation token to fetch the next page. If this result represents the last or only page, this token will be null.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? nextPageToken;

  /// The schema describing the field types in the search results.
  Map<String, JsonTypeBean> schema;

  /// Any warnings related to the JQL query.
  List<String> warningMessages;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SoftwareIssueResults &&
    other.expand == expand &&
    other.isLast == isLast &&
    _deepEquality.equals(other.issues, issues) &&
    _deepEquality.equals(other.names, names) &&
    other.nextPageToken == nextPageToken &&
    _deepEquality.equals(other.schema, schema) &&
    _deepEquality.equals(other.warningMessages, warningMessages);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (expand == null ? 0 : expand!.hashCode) +
    (isLast == null ? 0 : isLast!.hashCode) +
    (issues.hashCode) +
    (names.hashCode) +
    (nextPageToken == null ? 0 : nextPageToken!.hashCode) +
    (schema.hashCode) +
    (warningMessages.hashCode);

  @override
  String toString() => 'SoftwareIssueResults[expand=$expand, isLast=$isLast, issues=$issues, names=$names, nextPageToken=$nextPageToken, schema=$schema, warningMessages=$warningMessages]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.expand != null) {
      json[r'expand'] = this.expand;
    } else {
      json[r'expand'] = null;
    }
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
      json[r'warningMessages'] = this.warningMessages;
    return json;
  }

  /// Returns a new [SoftwareIssueResults] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SoftwareIssueResults? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return SoftwareIssueResults(
        expand: mapValueOfType<String>(json, r'expand'),
        isLast: mapValueOfType<bool>(json, r'isLast'),
        issues: IssueBean.listFromJson(json[r'issues']),
        names: mapCastOfType<String, String>(json, r'names') ?? const {},
        nextPageToken: mapValueOfType<String>(json, r'nextPageToken'),
        schema: JsonTypeBean.mapFromJson(json[r'schema']),
        warningMessages: json[r'warningMessages'] is Iterable
            ? (json[r'warningMessages'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<SoftwareIssueResults> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SoftwareIssueResults>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SoftwareIssueResults.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SoftwareIssueResults> mapFromJson(dynamic json) {
    final map = <String, SoftwareIssueResults>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SoftwareIssueResults.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SoftwareIssueResults-objects as value to a dart map
  static Map<String, List<SoftwareIssueResults>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SoftwareIssueResults>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SoftwareIssueResults.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

