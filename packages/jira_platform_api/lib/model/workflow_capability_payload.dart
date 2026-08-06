//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowCapabilityPayload {
  /// Returns a new [WorkflowCapabilityPayload] instance.
  WorkflowCapabilityPayload({
    this.statuses = const [],
    this.workflowScheme,
    this.workflows = const [],
  });

  /// The statuses for the workflow
  List<StatusPayload> statuses;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  WorkflowSchemePayload? workflowScheme;

  /// The transitions for the workflow
  List<WorkflowPayload> workflows;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowCapabilityPayload &&
    _deepEquality.equals(other.statuses, statuses) &&
    other.workflowScheme == workflowScheme &&
    _deepEquality.equals(other.workflows, workflows);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (statuses.hashCode) +
    (workflowScheme == null ? 0 : workflowScheme!.hashCode) +
    (workflows.hashCode);

  @override
  String toString() => 'WorkflowCapabilityPayload[statuses=$statuses, workflowScheme=$workflowScheme, workflows=$workflows]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'statuses'] = this.statuses;
    if (this.workflowScheme != null) {
      json[r'workflowScheme'] = this.workflowScheme;
    } else {
      json[r'workflowScheme'] = null;
    }
      json[r'workflows'] = this.workflows;
    return json;
  }

  /// Returns a new [WorkflowCapabilityPayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowCapabilityPayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return WorkflowCapabilityPayload(
        statuses: StatusPayload.listFromJson(json[r'statuses']),
        workflowScheme: WorkflowSchemePayload.fromJson(json[r'workflowScheme']),
        workflows: WorkflowPayload.listFromJson(json[r'workflows']),
      );
    }
    return null;
  }

  static List<WorkflowCapabilityPayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowCapabilityPayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowCapabilityPayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowCapabilityPayload> mapFromJson(dynamic json) {
    final map = <String, WorkflowCapabilityPayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowCapabilityPayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowCapabilityPayload-objects as value to a dart map
  static Map<String, List<WorkflowCapabilityPayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowCapabilityPayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowCapabilityPayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

