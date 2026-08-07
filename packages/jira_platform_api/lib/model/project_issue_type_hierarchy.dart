//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProjectIssueTypeHierarchy {
  /// Returns a new [ProjectIssueTypeHierarchy] instance.
  ProjectIssueTypeHierarchy({
    this.hierarchy = const [],
    this.projectId,
  });

  /// Details of an issue type hierarchy level.
  List<ProjectIssueTypesHierarchyLevel> hierarchy;

  /// The ID of the project.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? projectId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProjectIssueTypeHierarchy &&
    _deepEquality.equals(other.hierarchy, hierarchy) &&
    other.projectId == projectId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (hierarchy.hashCode) +
    (projectId == null ? 0 : projectId!.hashCode);

  @override
  String toString() => 'ProjectIssueTypeHierarchy[hierarchy=$hierarchy, projectId=$projectId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'hierarchy'] = this.hierarchy;
    if (this.projectId != null) {
      json[r'projectId'] = this.projectId;
    } else {
      json[r'projectId'] = null;
    }
    return json;
  }

  /// Returns a new [ProjectIssueTypeHierarchy] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProjectIssueTypeHierarchy? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ProjectIssueTypeHierarchy(
        hierarchy: ProjectIssueTypesHierarchyLevel.listFromJson(json[r'hierarchy']),
        projectId: mapValueOfType<int>(json, r'projectId'),
      );
    }
    return null;
  }

  static List<ProjectIssueTypeHierarchy> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectIssueTypeHierarchy>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectIssueTypeHierarchy.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProjectIssueTypeHierarchy> mapFromJson(dynamic json) {
    final map = <String, ProjectIssueTypeHierarchy>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProjectIssueTypeHierarchy.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProjectIssueTypeHierarchy-objects as value to a dart map
  static Map<String, List<ProjectIssueTypeHierarchy>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProjectIssueTypeHierarchy>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProjectIssueTypeHierarchy.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

