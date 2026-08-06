//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ArchivedIssuesFilterRequest {
  /// Returns a new [ArchivedIssuesFilterRequest] instance.
  ArchivedIssuesFilterRequest({
    this.archivedBy = const [],
    this.archivedDateRange,
    this.issueTypes = const [],
    this.projects = const [],
    this.reporters = const [],
  });

  /// List archived issues archived by a specified account ID.
  List<String> archivedBy;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateRangeFilterRequest? archivedDateRange;

  /// List archived issues with a specified issue type ID.
  List<String> issueTypes;

  /// List archived issues with a specified project key.
  List<String> projects;

  /// List archived issues where the reporter is a specified account ID.
  List<String> reporters;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ArchivedIssuesFilterRequest &&
    _deepEquality.equals(other.archivedBy, archivedBy) &&
    other.archivedDateRange == archivedDateRange &&
    _deepEquality.equals(other.issueTypes, issueTypes) &&
    _deepEquality.equals(other.projects, projects) &&
    _deepEquality.equals(other.reporters, reporters);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (archivedBy.hashCode) +
    (archivedDateRange == null ? 0 : archivedDateRange!.hashCode) +
    (issueTypes.hashCode) +
    (projects.hashCode) +
    (reporters.hashCode);

  @override
  String toString() => 'ArchivedIssuesFilterRequest[archivedBy=$archivedBy, archivedDateRange=$archivedDateRange, issueTypes=$issueTypes, projects=$projects, reporters=$reporters]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'archivedBy'] = this.archivedBy;
    if (this.archivedDateRange != null) {
      json[r'archivedDateRange'] = this.archivedDateRange;
    } else {
      json[r'archivedDateRange'] = null;
    }
      json[r'issueTypes'] = this.issueTypes;
      json[r'projects'] = this.projects;
      json[r'reporters'] = this.reporters;
    return json;
  }

  /// Returns a new [ArchivedIssuesFilterRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ArchivedIssuesFilterRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ArchivedIssuesFilterRequest(
        archivedBy: json[r'archivedBy'] is Iterable
            ? (json[r'archivedBy'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        archivedDateRange: DateRangeFilterRequest.fromJson(json[r'archivedDateRange']),
        issueTypes: json[r'issueTypes'] is Iterable
            ? (json[r'issueTypes'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        projects: json[r'projects'] is Iterable
            ? (json[r'projects'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        reporters: json[r'reporters'] is Iterable
            ? (json[r'reporters'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<ArchivedIssuesFilterRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ArchivedIssuesFilterRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ArchivedIssuesFilterRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ArchivedIssuesFilterRequest> mapFromJson(dynamic json) {
    final map = <String, ArchivedIssuesFilterRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ArchivedIssuesFilterRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ArchivedIssuesFilterRequest-objects as value to a dart map
  static Map<String, List<ArchivedIssuesFilterRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ArchivedIssuesFilterRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ArchivedIssuesFilterRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

