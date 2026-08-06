//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowCreateRequest {
  /// Returns a new [WorkflowCreateRequest] instance.
  WorkflowCreateRequest({
    this.scope,
    this.statuses = const [],
    this.workflows = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  WorkflowScope? scope;

  /// The statuses to associate with the workflows.
  List<WorkflowStatusUpdate> statuses;

  /// The details of the workflows to create.
  List<WorkflowCreate> workflows;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowCreateRequest &&
    other.scope == scope &&
    _deepEquality.equals(other.statuses, statuses) &&
    _deepEquality.equals(other.workflows, workflows);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (scope == null ? 0 : scope!.hashCode) +
    (statuses.hashCode) +
    (workflows.hashCode);

  @override
  String toString() => 'WorkflowCreateRequest[scope=$scope, statuses=$statuses, workflows=$workflows]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.scope != null) {
      json[r'scope'] = this.scope;
    } else {
      json[r'scope'] = null;
    }
      json[r'statuses'] = this.statuses;
      json[r'workflows'] = this.workflows;
    return json;
  }

  /// Returns a new [WorkflowCreateRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowCreateRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return WorkflowCreateRequest(
        scope: WorkflowScope.fromJson(json[r'scope']),
        statuses: WorkflowStatusUpdate.listFromJson(json[r'statuses']),
        workflows: WorkflowCreate.listFromJson(json[r'workflows']),
      );
    }
    return null;
  }

  static List<WorkflowCreateRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowCreateRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowCreateRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowCreateRequest> mapFromJson(dynamic json) {
    final map = <String, WorkflowCreateRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowCreateRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowCreateRequest-objects as value to a dart map
  static Map<String, List<WorkflowCreateRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowCreateRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowCreateRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

