//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueTypeWorkflowMapping {
  /// Returns a new [IssueTypeWorkflowMapping] instance.
  IssueTypeWorkflowMapping({
    this.issueType,
    this.updateDraftIfNeeded,
    this.workflow,
  });

  /// The ID of the issue type. Not required if updating the issue type-workflow mapping.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? issueType;

  /// Set to true to create or update the draft of a workflow scheme and update the mapping in the draft, when the workflow scheme cannot be edited. Defaults to `false`. Only applicable when updating the workflow-issue types mapping.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? updateDraftIfNeeded;

  /// The name of the workflow.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? workflow;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueTypeWorkflowMapping &&
    other.issueType == issueType &&
    other.updateDraftIfNeeded == updateDraftIfNeeded &&
    other.workflow == workflow;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (issueType == null ? 0 : issueType!.hashCode) +
    (updateDraftIfNeeded == null ? 0 : updateDraftIfNeeded!.hashCode) +
    (workflow == null ? 0 : workflow!.hashCode);

  @override
  String toString() => 'IssueTypeWorkflowMapping[issueType=$issueType, updateDraftIfNeeded=$updateDraftIfNeeded, workflow=$workflow]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.issueType != null) {
      json[r'issueType'] = this.issueType;
    } else {
      json[r'issueType'] = null;
    }
    if (this.updateDraftIfNeeded != null) {
      json[r'updateDraftIfNeeded'] = this.updateDraftIfNeeded;
    } else {
      json[r'updateDraftIfNeeded'] = null;
    }
    if (this.workflow != null) {
      json[r'workflow'] = this.workflow;
    } else {
      json[r'workflow'] = null;
    }
    return json;
  }

  /// Returns a new [IssueTypeWorkflowMapping] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueTypeWorkflowMapping? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return IssueTypeWorkflowMapping(
        issueType: mapValueOfType<String>(json, r'issueType'),
        updateDraftIfNeeded: mapValueOfType<bool>(json, r'updateDraftIfNeeded'),
        workflow: mapValueOfType<String>(json, r'workflow'),
      );
    }
    return null;
  }

  static List<IssueTypeWorkflowMapping> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueTypeWorkflowMapping>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueTypeWorkflowMapping.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueTypeWorkflowMapping> mapFromJson(dynamic json) {
    final map = <String, IssueTypeWorkflowMapping>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueTypeWorkflowMapping.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueTypeWorkflowMapping-objects as value to a dart map
  static Map<String, List<IssueTypeWorkflowMapping>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueTypeWorkflowMapping>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueTypeWorkflowMapping.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

