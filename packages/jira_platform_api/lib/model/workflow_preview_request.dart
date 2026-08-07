//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowPreviewRequest {
  /// Returns a new [WorkflowPreviewRequest] instance.
  WorkflowPreviewRequest({
    this.issueTypeIds = const [],
    required this.projectId,
    this.workflowIds = const [],
    this.workflowNames = const [],
  });

  /// The list of issue type IDs. At most 25 issue type IDs can be specified.
  List<String> issueTypeIds;

  /// The projectId parameter is required and will be used for permission checks. In addition, you must supply at least one of the following lookup terms: *workflowNames*, *workflowIds*, or *issueTypeIds*. The specified workflows must be associated with the given project.
  String projectId;

  /// The list of workflow IDs to be returned. At most 25 workflow IDs can be specified.
  List<String> workflowIds;

  /// The list of workflow names to be returned. At most 25 workflow names can be specified.
  List<String> workflowNames;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowPreviewRequest &&
    _deepEquality.equals(other.issueTypeIds, issueTypeIds) &&
    other.projectId == projectId &&
    _deepEquality.equals(other.workflowIds, workflowIds) &&
    _deepEquality.equals(other.workflowNames, workflowNames);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (issueTypeIds.hashCode) +
    (projectId.hashCode) +
    (workflowIds.hashCode) +
    (workflowNames.hashCode);

  @override
  String toString() => 'WorkflowPreviewRequest[issueTypeIds=$issueTypeIds, projectId=$projectId, workflowIds=$workflowIds, workflowNames=$workflowNames]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'issueTypeIds'] = this.issueTypeIds;
      json[r'projectId'] = this.projectId;
      json[r'workflowIds'] = this.workflowIds;
      json[r'workflowNames'] = this.workflowNames;
    return json;
  }

  /// Returns a new [WorkflowPreviewRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowPreviewRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'projectId'), 'Required key "WorkflowPreviewRequest[projectId]" is missing from JSON.');
        assert(json[r'projectId'] != null, 'Required key "WorkflowPreviewRequest[projectId]" has a null value in JSON.');
        return true;
      }());

      return WorkflowPreviewRequest(
        issueTypeIds: json[r'issueTypeIds'] is Iterable
            ? (json[r'issueTypeIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        projectId: mapValueOfType<String>(json, r'projectId')!,
        workflowIds: json[r'workflowIds'] is Iterable
            ? (json[r'workflowIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        workflowNames: json[r'workflowNames'] is Iterable
            ? (json[r'workflowNames'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<WorkflowPreviewRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowPreviewRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowPreviewRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowPreviewRequest> mapFromJson(dynamic json) {
    final map = <String, WorkflowPreviewRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowPreviewRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowPreviewRequest-objects as value to a dart map
  static Map<String, List<WorkflowPreviewRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowPreviewRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowPreviewRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'projectId',
  };
}

