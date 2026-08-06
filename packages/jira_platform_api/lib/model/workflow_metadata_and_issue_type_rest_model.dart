//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowMetadataAndIssueTypeRestModel {
  /// Returns a new [WorkflowMetadataAndIssueTypeRestModel] instance.
  WorkflowMetadataAndIssueTypeRestModel({
    this.issueTypeIds = const [],
    required this.workflow,
  });

  /// The list of issue type IDs for the mapping.
  List<String> issueTypeIds;

  WorkflowMetadataRestModel workflow;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowMetadataAndIssueTypeRestModel &&
    _deepEquality.equals(other.issueTypeIds, issueTypeIds) &&
    other.workflow == workflow;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (issueTypeIds.hashCode) +
    (workflow.hashCode);

  @override
  String toString() => 'WorkflowMetadataAndIssueTypeRestModel[issueTypeIds=$issueTypeIds, workflow=$workflow]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'issueTypeIds'] = this.issueTypeIds;
      json[r'workflow'] = this.workflow;
    return json;
  }

  /// Returns a new [WorkflowMetadataAndIssueTypeRestModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowMetadataAndIssueTypeRestModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'issueTypeIds'), 'Required key "WorkflowMetadataAndIssueTypeRestModel[issueTypeIds]" is missing from JSON.');
        assert(json[r'issueTypeIds'] != null, 'Required key "WorkflowMetadataAndIssueTypeRestModel[issueTypeIds]" has a null value in JSON.');
        assert(json.containsKey(r'workflow'), 'Required key "WorkflowMetadataAndIssueTypeRestModel[workflow]" is missing from JSON.');
        assert(json[r'workflow'] != null, 'Required key "WorkflowMetadataAndIssueTypeRestModel[workflow]" has a null value in JSON.');
        return true;
      }());

      return WorkflowMetadataAndIssueTypeRestModel(
        issueTypeIds: json[r'issueTypeIds'] is Iterable
            ? (json[r'issueTypeIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        workflow: WorkflowMetadataRestModel.fromJson(json[r'workflow'])!,
      );
    }
    return null;
  }

  static List<WorkflowMetadataAndIssueTypeRestModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowMetadataAndIssueTypeRestModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowMetadataAndIssueTypeRestModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowMetadataAndIssueTypeRestModel> mapFromJson(dynamic json) {
    final map = <String, WorkflowMetadataAndIssueTypeRestModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowMetadataAndIssueTypeRestModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowMetadataAndIssueTypeRestModel-objects as value to a dart map
  static Map<String, List<WorkflowMetadataAndIssueTypeRestModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowMetadataAndIssueTypeRestModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowMetadataAndIssueTypeRestModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'issueTypeIds',
    'workflow',
  };
}

