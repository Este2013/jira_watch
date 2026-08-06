//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProjectIssueTypeMappings {
  /// Returns a new [ProjectIssueTypeMappings] instance.
  ProjectIssueTypeMappings({
    this.mappings = const [],
  });

  /// The project and issue type mappings.
  List<ProjectIssueTypeMapping> mappings;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProjectIssueTypeMappings &&
    _deepEquality.equals(other.mappings, mappings);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (mappings.hashCode);

  @override
  String toString() => 'ProjectIssueTypeMappings[mappings=$mappings]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'mappings'] = this.mappings;
    return json;
  }

  /// Returns a new [ProjectIssueTypeMappings] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProjectIssueTypeMappings? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'mappings'), 'Required key "ProjectIssueTypeMappings[mappings]" is missing from JSON.');
        assert(json[r'mappings'] != null, 'Required key "ProjectIssueTypeMappings[mappings]" has a null value in JSON.');
        return true;
      }());

      return ProjectIssueTypeMappings(
        mappings: ProjectIssueTypeMapping.listFromJson(json[r'mappings']),
      );
    }
    return null;
  }

  static List<ProjectIssueTypeMappings> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectIssueTypeMappings>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectIssueTypeMappings.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProjectIssueTypeMappings> mapFromJson(dynamic json) {
    final map = <String, ProjectIssueTypeMappings>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProjectIssueTypeMappings.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProjectIssueTypeMappings-objects as value to a dart map
  static Map<String, List<ProjectIssueTypeMappings>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProjectIssueTypeMappings>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProjectIssueTypeMappings.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'mappings',
  };
}

