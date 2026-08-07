//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowSchemeReadResponse {
  /// Returns a new [WorkflowSchemeReadResponse] instance.
  WorkflowSchemeReadResponse({
    this.defaultWorkflow,
    this.description,
    required this.id,
    required this.name,
    required this.scope,
    this.taskId,
    required this.version,
    this.workflowsForIssueTypes = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  WorkflowMetadataRestModel? defaultWorkflow;

  /// The description of the workflow scheme.
  String? description;

  /// The ID of the workflow scheme.
  String id;

  /// The name of the workflow scheme.
  String name;

  WorkflowScope scope;

  /// Indicates if there's an [asynchronous task](#async-operations) for this workflow scheme.
  String? taskId;

  DocumentVersion version;

  /// Mappings from workflows to issue types.
  List<WorkflowMetadataAndIssueTypeRestModel> workflowsForIssueTypes;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowSchemeReadResponse &&
    other.defaultWorkflow == defaultWorkflow &&
    other.description == description &&
    other.id == id &&
    other.name == name &&
    other.scope == scope &&
    other.taskId == taskId &&
    other.version == version &&
    _deepEquality.equals(other.workflowsForIssueTypes, workflowsForIssueTypes);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (defaultWorkflow == null ? 0 : defaultWorkflow!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (id.hashCode) +
    (name.hashCode) +
    (scope.hashCode) +
    (taskId == null ? 0 : taskId!.hashCode) +
    (version.hashCode) +
    (workflowsForIssueTypes.hashCode);

  @override
  String toString() => 'WorkflowSchemeReadResponse[defaultWorkflow=$defaultWorkflow, description=$description, id=$id, name=$name, scope=$scope, taskId=$taskId, version=$version, workflowsForIssueTypes=$workflowsForIssueTypes]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.defaultWorkflow != null) {
      json[r'defaultWorkflow'] = this.defaultWorkflow;
    } else {
      json[r'defaultWorkflow'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
      json[r'id'] = this.id;
      json[r'name'] = this.name;
      json[r'scope'] = this.scope;
    if (this.taskId != null) {
      json[r'taskId'] = this.taskId;
    } else {
      json[r'taskId'] = null;
    }
      json[r'version'] = this.version;
      json[r'workflowsForIssueTypes'] = this.workflowsForIssueTypes;
    return json;
  }

  /// Returns a new [WorkflowSchemeReadResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowSchemeReadResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "WorkflowSchemeReadResponse[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "WorkflowSchemeReadResponse[id]" has a null value in JSON.');
        assert(json.containsKey(r'name'), 'Required key "WorkflowSchemeReadResponse[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "WorkflowSchemeReadResponse[name]" has a null value in JSON.');
        assert(json.containsKey(r'scope'), 'Required key "WorkflowSchemeReadResponse[scope]" is missing from JSON.');
        assert(json[r'scope'] != null, 'Required key "WorkflowSchemeReadResponse[scope]" has a null value in JSON.');
        assert(json.containsKey(r'version'), 'Required key "WorkflowSchemeReadResponse[version]" is missing from JSON.');
        assert(json[r'version'] != null, 'Required key "WorkflowSchemeReadResponse[version]" has a null value in JSON.');
        assert(json.containsKey(r'workflowsForIssueTypes'), 'Required key "WorkflowSchemeReadResponse[workflowsForIssueTypes]" is missing from JSON.');
        assert(json[r'workflowsForIssueTypes'] != null, 'Required key "WorkflowSchemeReadResponse[workflowsForIssueTypes]" has a null value in JSON.');
        return true;
      }());

      return WorkflowSchemeReadResponse(
        defaultWorkflow: WorkflowMetadataRestModel.fromJson(json[r'defaultWorkflow']),
        description: mapValueOfType<String>(json, r'description'),
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        scope: WorkflowScope.fromJson(json[r'scope'])!,
        taskId: mapValueOfType<String>(json, r'taskId'),
        version: DocumentVersion.fromJson(json[r'version'])!,
        workflowsForIssueTypes: WorkflowMetadataAndIssueTypeRestModel.listFromJson(json[r'workflowsForIssueTypes']),
      );
    }
    return null;
  }

  static List<WorkflowSchemeReadResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowSchemeReadResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowSchemeReadResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowSchemeReadResponse> mapFromJson(dynamic json) {
    final map = <String, WorkflowSchemeReadResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowSchemeReadResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowSchemeReadResponse-objects as value to a dart map
  static Map<String, List<WorkflowSchemeReadResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowSchemeReadResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowSchemeReadResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'name',
    'scope',
    'version',
    'workflowsForIssueTypes',
  };
}

