//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProjectUsagePage {
  /// Returns a new [ProjectUsagePage] instance.
  ProjectUsagePage({
    this.nextPageToken,
    this.values = const [],
  });

  /// Page token for the next page of project usages.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? nextPageToken;

  /// The list of projects.
  List<ProjectUsage> values;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProjectUsagePage &&
    other.nextPageToken == nextPageToken &&
    _deepEquality.equals(other.values, values);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (nextPageToken == null ? 0 : nextPageToken!.hashCode) +
    (values.hashCode);

  @override
  String toString() => 'ProjectUsagePage[nextPageToken=$nextPageToken, values=$values]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.nextPageToken != null) {
      json[r'nextPageToken'] = this.nextPageToken;
    } else {
      json[r'nextPageToken'] = null;
    }
      json[r'values'] = this.values;
    return json;
  }

  /// Returns a new [ProjectUsagePage] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProjectUsagePage? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ProjectUsagePage(
        nextPageToken: mapValueOfType<String>(json, r'nextPageToken'),
        values: ProjectUsage.listFromJson(json[r'values']),
      );
    }
    return null;
  }

  static List<ProjectUsagePage> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectUsagePage>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectUsagePage.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProjectUsagePage> mapFromJson(dynamic json) {
    final map = <String, ProjectUsagePage>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProjectUsagePage.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProjectUsagePage-objects as value to a dart map
  static Map<String, List<ProjectUsagePage>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProjectUsagePage>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProjectUsagePage.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

