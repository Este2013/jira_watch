//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowSchemeProjectAssociation {
  /// Returns a new [WorkflowSchemeProjectAssociation] instance.
  WorkflowSchemeProjectAssociation({
    required this.projectId,
    this.workflowSchemeId,
  });

  /// The ID of the project.
  String projectId;

  /// The ID of the workflow scheme. If the workflow scheme ID is `null`, the operation assigns the default workflow scheme.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? workflowSchemeId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowSchemeProjectAssociation &&
    other.projectId == projectId &&
    other.workflowSchemeId == workflowSchemeId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (projectId.hashCode) +
    (workflowSchemeId == null ? 0 : workflowSchemeId!.hashCode);

  @override
  String toString() => 'WorkflowSchemeProjectAssociation[projectId=$projectId, workflowSchemeId=$workflowSchemeId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'projectId'] = this.projectId;
    if (this.workflowSchemeId != null) {
      json[r'workflowSchemeId'] = this.workflowSchemeId;
    } else {
      json[r'workflowSchemeId'] = null;
    }
    return json;
  }

  /// Returns a new [WorkflowSchemeProjectAssociation] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowSchemeProjectAssociation? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'projectId'), 'Required key "WorkflowSchemeProjectAssociation[projectId]" is missing from JSON.');
        assert(json[r'projectId'] != null, 'Required key "WorkflowSchemeProjectAssociation[projectId]" has a null value in JSON.');
        return true;
      }());

      return WorkflowSchemeProjectAssociation(
        projectId: mapValueOfType<String>(json, r'projectId')!,
        workflowSchemeId: mapValueOfType<String>(json, r'workflowSchemeId'),
      );
    }
    return null;
  }

  static List<WorkflowSchemeProjectAssociation> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowSchemeProjectAssociation>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowSchemeProjectAssociation.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowSchemeProjectAssociation> mapFromJson(dynamic json) {
    final map = <String, WorkflowSchemeProjectAssociation>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowSchemeProjectAssociation.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowSchemeProjectAssociation-objects as value to a dart map
  static Map<String, List<WorkflowSchemeProjectAssociation>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowSchemeProjectAssociation>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowSchemeProjectAssociation.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'projectId',
  };
}

