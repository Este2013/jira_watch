//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowSchemeUpdateRequiredMappingsRequest {
  /// Returns a new [WorkflowSchemeUpdateRequiredMappingsRequest] instance.
  WorkflowSchemeUpdateRequiredMappingsRequest({
    this.defaultWorkflowId,
    required this.id,
    this.workflowsForIssueTypes = const [],
  });

  /// The ID of the new default workflow for this workflow scheme. Only used in global-scoped workflow schemes. If it isn't specified, is set to *Jira Workflow (jira)*.
  String? defaultWorkflowId;

  /// The ID of the workflow scheme.
  String id;

  /// The new workflow to issue type mappings for this workflow scheme.
  List<WorkflowSchemeAssociation> workflowsForIssueTypes;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowSchemeUpdateRequiredMappingsRequest &&
    other.defaultWorkflowId == defaultWorkflowId &&
    other.id == id &&
    _deepEquality.equals(other.workflowsForIssueTypes, workflowsForIssueTypes);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (defaultWorkflowId == null ? 0 : defaultWorkflowId!.hashCode) +
    (id.hashCode) +
    (workflowsForIssueTypes.hashCode);

  @override
  String toString() => 'WorkflowSchemeUpdateRequiredMappingsRequest[defaultWorkflowId=$defaultWorkflowId, id=$id, workflowsForIssueTypes=$workflowsForIssueTypes]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.defaultWorkflowId != null) {
      json[r'defaultWorkflowId'] = this.defaultWorkflowId;
    } else {
      json[r'defaultWorkflowId'] = null;
    }
      json[r'id'] = this.id;
      json[r'workflowsForIssueTypes'] = this.workflowsForIssueTypes;
    return json;
  }

  /// Returns a new [WorkflowSchemeUpdateRequiredMappingsRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowSchemeUpdateRequiredMappingsRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "WorkflowSchemeUpdateRequiredMappingsRequest[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "WorkflowSchemeUpdateRequiredMappingsRequest[id]" has a null value in JSON.');
        assert(json.containsKey(r'workflowsForIssueTypes'), 'Required key "WorkflowSchemeUpdateRequiredMappingsRequest[workflowsForIssueTypes]" is missing from JSON.');
        assert(json[r'workflowsForIssueTypes'] != null, 'Required key "WorkflowSchemeUpdateRequiredMappingsRequest[workflowsForIssueTypes]" has a null value in JSON.');
        return true;
      }());

      return WorkflowSchemeUpdateRequiredMappingsRequest(
        defaultWorkflowId: mapValueOfType<String>(json, r'defaultWorkflowId'),
        id: mapValueOfType<String>(json, r'id')!,
        workflowsForIssueTypes: WorkflowSchemeAssociation.listFromJson(json[r'workflowsForIssueTypes']),
      );
    }
    return null;
  }

  static List<WorkflowSchemeUpdateRequiredMappingsRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowSchemeUpdateRequiredMappingsRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowSchemeUpdateRequiredMappingsRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowSchemeUpdateRequiredMappingsRequest> mapFromJson(dynamic json) {
    final map = <String, WorkflowSchemeUpdateRequiredMappingsRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowSchemeUpdateRequiredMappingsRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowSchemeUpdateRequiredMappingsRequest-objects as value to a dart map
  static Map<String, List<WorkflowSchemeUpdateRequiredMappingsRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowSchemeUpdateRequiredMappingsRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowSchemeUpdateRequiredMappingsRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'workflowsForIssueTypes',
  };
}

