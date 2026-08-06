//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowSchemeProjectSwitchBean {
  /// Returns a new [WorkflowSchemeProjectSwitchBean] instance.
  WorkflowSchemeProjectSwitchBean({
    this.mappingsByIssueTypeOverride = const [],
    this.projectId,
    this.targetSchemeId,
  });

  /// The mappings for migrating issues from old statuses to new statuses when switching from one workflow scheme to another. This field is required if any statuses in the current project's workflows would no longer exist in the target workflow scheme. Each mapping defines how to update issues from an old status to the corresponding new status in the issue’s new workflow.
  List<MappingsByIssueTypeOverride> mappingsByIssueTypeOverride;

  /// The ID of the project to switch the workflow scheme for
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? projectId;

  /// The ID of the target workflow scheme to switch to
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? targetSchemeId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowSchemeProjectSwitchBean &&
    _deepEquality.equals(other.mappingsByIssueTypeOverride, mappingsByIssueTypeOverride) &&
    other.projectId == projectId &&
    other.targetSchemeId == targetSchemeId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (mappingsByIssueTypeOverride.hashCode) +
    (projectId == null ? 0 : projectId!.hashCode) +
    (targetSchemeId == null ? 0 : targetSchemeId!.hashCode);

  @override
  String toString() => 'WorkflowSchemeProjectSwitchBean[mappingsByIssueTypeOverride=$mappingsByIssueTypeOverride, projectId=$projectId, targetSchemeId=$targetSchemeId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'mappingsByIssueTypeOverride'] = this.mappingsByIssueTypeOverride;
    if (this.projectId != null) {
      json[r'projectId'] = this.projectId;
    } else {
      json[r'projectId'] = null;
    }
    if (this.targetSchemeId != null) {
      json[r'targetSchemeId'] = this.targetSchemeId;
    } else {
      json[r'targetSchemeId'] = null;
    }
    return json;
  }

  /// Returns a new [WorkflowSchemeProjectSwitchBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowSchemeProjectSwitchBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return WorkflowSchemeProjectSwitchBean(
        mappingsByIssueTypeOverride: MappingsByIssueTypeOverride.listFromJson(json[r'mappingsByIssueTypeOverride']),
        projectId: mapValueOfType<String>(json, r'projectId'),
        targetSchemeId: mapValueOfType<String>(json, r'targetSchemeId'),
      );
    }
    return null;
  }

  static List<WorkflowSchemeProjectSwitchBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowSchemeProjectSwitchBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowSchemeProjectSwitchBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowSchemeProjectSwitchBean> mapFromJson(dynamic json) {
    final map = <String, WorkflowSchemeProjectSwitchBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowSchemeProjectSwitchBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowSchemeProjectSwitchBean-objects as value to a dart map
  static Map<String, List<WorkflowSchemeProjectSwitchBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowSchemeProjectSwitchBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowSchemeProjectSwitchBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

