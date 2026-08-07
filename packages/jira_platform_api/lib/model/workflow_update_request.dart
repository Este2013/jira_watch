//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowUpdateRequest {
  /// Returns a new [WorkflowUpdateRequest] instance.
  WorkflowUpdateRequest({
    this.statuses = const [],
    this.workflows = const [],
  });

  /// The statuses to associate with the workflows.
  List<WorkflowStatusUpdate> statuses;

  /// The details of the workflows to update.
  List<WorkflowUpdate> workflows;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowUpdateRequest &&
    _deepEquality.equals(other.statuses, statuses) &&
    _deepEquality.equals(other.workflows, workflows);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (statuses.hashCode) +
    (workflows.hashCode);

  @override
  String toString() => 'WorkflowUpdateRequest[statuses=$statuses, workflows=$workflows]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'statuses'] = this.statuses;
      json[r'workflows'] = this.workflows;
    return json;
  }

  /// Returns a new [WorkflowUpdateRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowUpdateRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return WorkflowUpdateRequest(
        statuses: WorkflowStatusUpdate.listFromJson(json[r'statuses']),
        workflows: WorkflowUpdate.listFromJson(json[r'workflows']),
      );
    }
    return null;
  }

  static List<WorkflowUpdateRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowUpdateRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowUpdateRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowUpdateRequest> mapFromJson(dynamic json) {
    final map = <String, WorkflowUpdateRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowUpdateRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowUpdateRequest-objects as value to a dart map
  static Map<String, List<WorkflowUpdateRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowUpdateRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowUpdateRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

