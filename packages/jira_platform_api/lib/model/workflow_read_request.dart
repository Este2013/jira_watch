//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowReadRequest {
  /// Returns a new [WorkflowReadRequest] instance.
  WorkflowReadRequest({
    this.projectAndIssueTypes = const [],
    this.workflowIds = const [],
    this.workflowNames = const [],
  });

  /// The list of projects and issue types to query.
  List<ProjectAndIssueTypePair> projectAndIssueTypes;

  /// The list of workflow IDs to query.
  List<String> workflowIds;

  /// The list of workflow names to query.
  List<String> workflowNames;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowReadRequest &&
    _deepEquality.equals(other.projectAndIssueTypes, projectAndIssueTypes) &&
    _deepEquality.equals(other.workflowIds, workflowIds) &&
    _deepEquality.equals(other.workflowNames, workflowNames);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (projectAndIssueTypes.hashCode) +
    (workflowIds.hashCode) +
    (workflowNames.hashCode);

  @override
  String toString() => 'WorkflowReadRequest[projectAndIssueTypes=$projectAndIssueTypes, workflowIds=$workflowIds, workflowNames=$workflowNames]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'projectAndIssueTypes'] = this.projectAndIssueTypes;
      json[r'workflowIds'] = this.workflowIds;
      json[r'workflowNames'] = this.workflowNames;
    return json;
  }

  /// Returns a new [WorkflowReadRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowReadRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return WorkflowReadRequest(
        projectAndIssueTypes: ProjectAndIssueTypePair.listFromJson(json[r'projectAndIssueTypes']),
        workflowIds: json[r'workflowIds'] is Iterable
            ? (json[r'workflowIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        workflowNames: json[r'workflowNames'] is Iterable
            ? (json[r'workflowNames'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<WorkflowReadRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowReadRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowReadRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowReadRequest> mapFromJson(dynamic json) {
    final map = <String, WorkflowReadRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowReadRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowReadRequest-objects as value to a dart map
  static Map<String, List<WorkflowReadRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowReadRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowReadRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

