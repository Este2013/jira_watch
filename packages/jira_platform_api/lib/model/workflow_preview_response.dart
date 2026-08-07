//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowPreviewResponse {
  /// Returns a new [WorkflowPreviewResponse] instance.
  WorkflowPreviewResponse({
    this.statuses = const [],
    this.workflows = const [],
  });

  /// The list of statuses referenced by the workflows.
  List<JiraWorkflowPreviewStatus> statuses;

  /// The list of workflows. The workflows are returned in the same order as specified in the request.
  List<WorkflowPreview> workflows;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowPreviewResponse &&
    _deepEquality.equals(other.statuses, statuses) &&
    _deepEquality.equals(other.workflows, workflows);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (statuses.hashCode) +
    (workflows.hashCode);

  @override
  String toString() => 'WorkflowPreviewResponse[statuses=$statuses, workflows=$workflows]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'statuses'] = this.statuses;
      json[r'workflows'] = this.workflows;
    return json;
  }

  /// Returns a new [WorkflowPreviewResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowPreviewResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return WorkflowPreviewResponse(
        statuses: JiraWorkflowPreviewStatus.listFromJson(json[r'statuses']),
        workflows: WorkflowPreview.listFromJson(json[r'workflows']),
      );
    }
    return null;
  }

  static List<WorkflowPreviewResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowPreviewResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowPreviewResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowPreviewResponse> mapFromJson(dynamic json) {
    final map = <String, WorkflowPreviewResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowPreviewResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowPreviewResponse-objects as value to a dart map
  static Map<String, List<WorkflowPreviewResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowPreviewResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowPreviewResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

