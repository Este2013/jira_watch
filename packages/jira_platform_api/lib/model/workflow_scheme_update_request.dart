//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowSchemeUpdateRequest {
  /// Returns a new [WorkflowSchemeUpdateRequest] instance.
  WorkflowSchemeUpdateRequest({
    this.defaultWorkflowId,
    required this.description,
    required this.id,
    required this.name,
    this.statusMappingsByIssueTypeOverride = const [],
    this.statusMappingsByWorkflows = const [],
    required this.version,
    this.workflowsForIssueTypes = const [],
  });

  /// The ID of the workflow for issue types without having a mapping defined in this workflow scheme. Only used in global-scoped workflow schemes. If the `defaultWorkflowId` isn't specified, this is set to *Jira Workflow (jira)*.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? defaultWorkflowId;

  /// The new description for this workflow scheme.
  String description;

  /// The ID of this workflow scheme.
  String id;

  /// The new name for this workflow scheme.
  String name;

  /// Overrides, for the selected issue types, any status mappings provided in `statusMappingsByWorkflows`. Status mappings are required when the new workflow for an issue type doesn't contain all statuses that the old workflow has. Status mappings can be provided by a combination of `statusMappingsByWorkflows` and `statusMappingsByIssueTypeOverride`.
  List<MappingsByIssueTypeOverride> statusMappingsByIssueTypeOverride;

  /// The status mappings by workflows. Status mappings are required when the new workflow for an issue type doesn't contain all statuses that the old workflow has. Status mappings can be provided by a combination of `statusMappingsByWorkflows` and `statusMappingsByIssueTypeOverride`.
  List<MappingsByWorkflow> statusMappingsByWorkflows;

  DocumentVersion version;

  /// Mappings from workflows to issue types.
  List<WorkflowSchemeAssociation> workflowsForIssueTypes;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowSchemeUpdateRequest &&
    other.defaultWorkflowId == defaultWorkflowId &&
    other.description == description &&
    other.id == id &&
    other.name == name &&
    _deepEquality.equals(other.statusMappingsByIssueTypeOverride, statusMappingsByIssueTypeOverride) &&
    _deepEquality.equals(other.statusMappingsByWorkflows, statusMappingsByWorkflows) &&
    other.version == version &&
    _deepEquality.equals(other.workflowsForIssueTypes, workflowsForIssueTypes);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (defaultWorkflowId == null ? 0 : defaultWorkflowId!.hashCode) +
    (description.hashCode) +
    (id.hashCode) +
    (name.hashCode) +
    (statusMappingsByIssueTypeOverride.hashCode) +
    (statusMappingsByWorkflows.hashCode) +
    (version.hashCode) +
    (workflowsForIssueTypes.hashCode);

  @override
  String toString() => 'WorkflowSchemeUpdateRequest[defaultWorkflowId=$defaultWorkflowId, description=$description, id=$id, name=$name, statusMappingsByIssueTypeOverride=$statusMappingsByIssueTypeOverride, statusMappingsByWorkflows=$statusMappingsByWorkflows, version=$version, workflowsForIssueTypes=$workflowsForIssueTypes]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.defaultWorkflowId != null) {
      json[r'defaultWorkflowId'] = this.defaultWorkflowId;
    } else {
      json[r'defaultWorkflowId'] = null;
    }
      json[r'description'] = this.description;
      json[r'id'] = this.id;
      json[r'name'] = this.name;
      json[r'statusMappingsByIssueTypeOverride'] = this.statusMappingsByIssueTypeOverride;
      json[r'statusMappingsByWorkflows'] = this.statusMappingsByWorkflows;
      json[r'version'] = this.version;
      json[r'workflowsForIssueTypes'] = this.workflowsForIssueTypes;
    return json;
  }

  /// Returns a new [WorkflowSchemeUpdateRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowSchemeUpdateRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'description'), 'Required key "WorkflowSchemeUpdateRequest[description]" is missing from JSON.');
        assert(json[r'description'] != null, 'Required key "WorkflowSchemeUpdateRequest[description]" has a null value in JSON.');
        assert(json.containsKey(r'id'), 'Required key "WorkflowSchemeUpdateRequest[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "WorkflowSchemeUpdateRequest[id]" has a null value in JSON.');
        assert(json.containsKey(r'name'), 'Required key "WorkflowSchemeUpdateRequest[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "WorkflowSchemeUpdateRequest[name]" has a null value in JSON.');
        assert(json.containsKey(r'version'), 'Required key "WorkflowSchemeUpdateRequest[version]" is missing from JSON.');
        assert(json[r'version'] != null, 'Required key "WorkflowSchemeUpdateRequest[version]" has a null value in JSON.');
        return true;
      }());

      return WorkflowSchemeUpdateRequest(
        defaultWorkflowId: mapValueOfType<String>(json, r'defaultWorkflowId'),
        description: mapValueOfType<String>(json, r'description')!,
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        statusMappingsByIssueTypeOverride: MappingsByIssueTypeOverride.listFromJson(json[r'statusMappingsByIssueTypeOverride']),
        statusMappingsByWorkflows: MappingsByWorkflow.listFromJson(json[r'statusMappingsByWorkflows']),
        version: DocumentVersion.fromJson(json[r'version'])!,
        workflowsForIssueTypes: WorkflowSchemeAssociation.listFromJson(json[r'workflowsForIssueTypes']),
      );
    }
    return null;
  }

  static List<WorkflowSchemeUpdateRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowSchemeUpdateRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowSchemeUpdateRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowSchemeUpdateRequest> mapFromJson(dynamic json) {
    final map = <String, WorkflowSchemeUpdateRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowSchemeUpdateRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowSchemeUpdateRequest-objects as value to a dart map
  static Map<String, List<WorkflowSchemeUpdateRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowSchemeUpdateRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowSchemeUpdateRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'description',
    'id',
    'name',
    'version',
  };
}

