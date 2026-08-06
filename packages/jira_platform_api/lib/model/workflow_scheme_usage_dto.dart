//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowSchemeUsageDTO {
  /// Returns a new [WorkflowSchemeUsageDTO] instance.
  WorkflowSchemeUsageDTO({
    this.workflowId,
    this.workflowSchemes,
  });

  /// The workflow ID.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? workflowId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  WorkflowSchemeUsagePage? workflowSchemes;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowSchemeUsageDTO &&
    other.workflowId == workflowId &&
    other.workflowSchemes == workflowSchemes;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (workflowId == null ? 0 : workflowId!.hashCode) +
    (workflowSchemes == null ? 0 : workflowSchemes!.hashCode);

  @override
  String toString() => 'WorkflowSchemeUsageDTO[workflowId=$workflowId, workflowSchemes=$workflowSchemes]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.workflowId != null) {
      json[r'workflowId'] = this.workflowId;
    } else {
      json[r'workflowId'] = null;
    }
    if (this.workflowSchemes != null) {
      json[r'workflowSchemes'] = this.workflowSchemes;
    } else {
      json[r'workflowSchemes'] = null;
    }
    return json;
  }

  /// Returns a new [WorkflowSchemeUsageDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowSchemeUsageDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return WorkflowSchemeUsageDTO(
        workflowId: mapValueOfType<String>(json, r'workflowId'),
        workflowSchemes: WorkflowSchemeUsagePage.fromJson(json[r'workflowSchemes']),
      );
    }
    return null;
  }

  static List<WorkflowSchemeUsageDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowSchemeUsageDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowSchemeUsageDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowSchemeUsageDTO> mapFromJson(dynamic json) {
    final map = <String, WorkflowSchemeUsageDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowSchemeUsageDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowSchemeUsageDTO-objects as value to a dart map
  static Map<String, List<WorkflowSchemeUsageDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowSchemeUsageDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowSchemeUsageDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

