//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowProjectIssueTypeUsageDTO {
  /// Returns a new [WorkflowProjectIssueTypeUsageDTO] instance.
  WorkflowProjectIssueTypeUsageDTO({
    this.issueTypes,
    this.projectId,
    this.workflowId,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  WorkflowProjectIssueTypeUsagePage? issueTypes;

  /// The ID of the project.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? projectId;

  /// The ID of the workflow.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? workflowId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowProjectIssueTypeUsageDTO &&
    other.issueTypes == issueTypes &&
    other.projectId == projectId &&
    other.workflowId == workflowId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (issueTypes == null ? 0 : issueTypes!.hashCode) +
    (projectId == null ? 0 : projectId!.hashCode) +
    (workflowId == null ? 0 : workflowId!.hashCode);

  @override
  String toString() => 'WorkflowProjectIssueTypeUsageDTO[issueTypes=$issueTypes, projectId=$projectId, workflowId=$workflowId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.issueTypes != null) {
      json[r'issueTypes'] = this.issueTypes;
    } else {
      json[r'issueTypes'] = null;
    }
    if (this.projectId != null) {
      json[r'projectId'] = this.projectId;
    } else {
      json[r'projectId'] = null;
    }
    if (this.workflowId != null) {
      json[r'workflowId'] = this.workflowId;
    } else {
      json[r'workflowId'] = null;
    }
    return json;
  }

  /// Returns a new [WorkflowProjectIssueTypeUsageDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowProjectIssueTypeUsageDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return WorkflowProjectIssueTypeUsageDTO(
        issueTypes: WorkflowProjectIssueTypeUsagePage.fromJson(json[r'issueTypes']),
        projectId: mapValueOfType<String>(json, r'projectId'),
        workflowId: mapValueOfType<String>(json, r'workflowId'),
      );
    }
    return null;
  }

  static List<WorkflowProjectIssueTypeUsageDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowProjectIssueTypeUsageDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowProjectIssueTypeUsageDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowProjectIssueTypeUsageDTO> mapFromJson(dynamic json) {
    final map = <String, WorkflowProjectIssueTypeUsageDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowProjectIssueTypeUsageDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowProjectIssueTypeUsageDTO-objects as value to a dart map
  static Map<String, List<WorkflowProjectIssueTypeUsageDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowProjectIssueTypeUsageDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowProjectIssueTypeUsageDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

