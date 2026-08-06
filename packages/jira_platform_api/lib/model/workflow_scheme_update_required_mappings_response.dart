//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowSchemeUpdateRequiredMappingsResponse {
  /// Returns a new [WorkflowSchemeUpdateRequiredMappingsResponse] instance.
  WorkflowSchemeUpdateRequiredMappingsResponse({
    this.statusMappingsByIssueTypes = const [],
    this.statusMappingsByWorkflows = const [],
    this.statuses = const [],
    this.statusesPerWorkflow = const [],
  });

  /// The list of required status mappings by issue type.
  List<RequiredMappingByIssueType> statusMappingsByIssueTypes;

  /// The list of required status mappings by workflow.
  List<RequiredMappingByWorkflows> statusMappingsByWorkflows;

  /// The details of the statuses in the associated workflows.
  List<StatusMetadata> statuses;

  /// The statuses associated with each workflow.
  List<StatusesPerWorkflow> statusesPerWorkflow;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowSchemeUpdateRequiredMappingsResponse &&
    _deepEquality.equals(other.statusMappingsByIssueTypes, statusMappingsByIssueTypes) &&
    _deepEquality.equals(other.statusMappingsByWorkflows, statusMappingsByWorkflows) &&
    _deepEquality.equals(other.statuses, statuses) &&
    _deepEquality.equals(other.statusesPerWorkflow, statusesPerWorkflow);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (statusMappingsByIssueTypes.hashCode) +
    (statusMappingsByWorkflows.hashCode) +
    (statuses.hashCode) +
    (statusesPerWorkflow.hashCode);

  @override
  String toString() => 'WorkflowSchemeUpdateRequiredMappingsResponse[statusMappingsByIssueTypes=$statusMappingsByIssueTypes, statusMappingsByWorkflows=$statusMappingsByWorkflows, statuses=$statuses, statusesPerWorkflow=$statusesPerWorkflow]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'statusMappingsByIssueTypes'] = this.statusMappingsByIssueTypes;
      json[r'statusMappingsByWorkflows'] = this.statusMappingsByWorkflows;
      json[r'statuses'] = this.statuses;
      json[r'statusesPerWorkflow'] = this.statusesPerWorkflow;
    return json;
  }

  /// Returns a new [WorkflowSchemeUpdateRequiredMappingsResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowSchemeUpdateRequiredMappingsResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return WorkflowSchemeUpdateRequiredMappingsResponse(
        statusMappingsByIssueTypes: RequiredMappingByIssueType.listFromJson(json[r'statusMappingsByIssueTypes']),
        statusMappingsByWorkflows: RequiredMappingByWorkflows.listFromJson(json[r'statusMappingsByWorkflows']),
        statuses: StatusMetadata.listFromJson(json[r'statuses']),
        statusesPerWorkflow: StatusesPerWorkflow.listFromJson(json[r'statusesPerWorkflow']),
      );
    }
    return null;
  }

  static List<WorkflowSchemeUpdateRequiredMappingsResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowSchemeUpdateRequiredMappingsResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowSchemeUpdateRequiredMappingsResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowSchemeUpdateRequiredMappingsResponse> mapFromJson(dynamic json) {
    final map = <String, WorkflowSchemeUpdateRequiredMappingsResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowSchemeUpdateRequiredMappingsResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowSchemeUpdateRequiredMappingsResponse-objects as value to a dart map
  static Map<String, List<WorkflowSchemeUpdateRequiredMappingsResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowSchemeUpdateRequiredMappingsResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowSchemeUpdateRequiredMappingsResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

