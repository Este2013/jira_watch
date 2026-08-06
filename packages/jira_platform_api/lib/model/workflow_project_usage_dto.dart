//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowProjectUsageDTO {
  /// Returns a new [WorkflowProjectUsageDTO] instance.
  WorkflowProjectUsageDTO({
    this.projects,
    this.workflowId,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectUsagePage? projects;

  /// The workflow ID.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? workflowId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowProjectUsageDTO &&
    other.projects == projects &&
    other.workflowId == workflowId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (projects == null ? 0 : projects!.hashCode) +
    (workflowId == null ? 0 : workflowId!.hashCode);

  @override
  String toString() => 'WorkflowProjectUsageDTO[projects=$projects, workflowId=$workflowId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.projects != null) {
      json[r'projects'] = this.projects;
    } else {
      json[r'projects'] = null;
    }
    if (this.workflowId != null) {
      json[r'workflowId'] = this.workflowId;
    } else {
      json[r'workflowId'] = null;
    }
    return json;
  }

  /// Returns a new [WorkflowProjectUsageDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowProjectUsageDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return WorkflowProjectUsageDTO(
        projects: ProjectUsagePage.fromJson(json[r'projects']),
        workflowId: mapValueOfType<String>(json, r'workflowId'),
      );
    }
    return null;
  }

  static List<WorkflowProjectUsageDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowProjectUsageDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowProjectUsageDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowProjectUsageDTO> mapFromJson(dynamic json) {
    final map = <String, WorkflowProjectUsageDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowProjectUsageDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowProjectUsageDTO-objects as value to a dart map
  static Map<String, List<WorkflowProjectUsageDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowProjectUsageDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowProjectUsageDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

