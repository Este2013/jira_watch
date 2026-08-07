//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueTypesWorkflowMapping {
  /// Returns a new [IssueTypesWorkflowMapping] instance.
  IssueTypesWorkflowMapping({
    this.defaultMapping,
    this.issueTypes = const [],
    this.updateDraftIfNeeded,
    this.workflow,
  });

  /// Whether the workflow is the default workflow for the workflow scheme.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? defaultMapping;

  /// The list of issue type IDs.
  List<String> issueTypes;

  /// Whether a draft workflow scheme is created or updated when updating an active workflow scheme. The draft is updated with the new workflow-issue types mapping. Defaults to `false`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? updateDraftIfNeeded;

  /// The name of the workflow. Optional if updating the workflow-issue types mapping.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? workflow;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueTypesWorkflowMapping &&
    other.defaultMapping == defaultMapping &&
    _deepEquality.equals(other.issueTypes, issueTypes) &&
    other.updateDraftIfNeeded == updateDraftIfNeeded &&
    other.workflow == workflow;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (defaultMapping == null ? 0 : defaultMapping!.hashCode) +
    (issueTypes.hashCode) +
    (updateDraftIfNeeded == null ? 0 : updateDraftIfNeeded!.hashCode) +
    (workflow == null ? 0 : workflow!.hashCode);

  @override
  String toString() => 'IssueTypesWorkflowMapping[defaultMapping=$defaultMapping, issueTypes=$issueTypes, updateDraftIfNeeded=$updateDraftIfNeeded, workflow=$workflow]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.defaultMapping != null) {
      json[r'defaultMapping'] = this.defaultMapping;
    } else {
      json[r'defaultMapping'] = null;
    }
      json[r'issueTypes'] = this.issueTypes;
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

  /// Returns a new [IssueTypesWorkflowMapping] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueTypesWorkflowMapping? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return IssueTypesWorkflowMapping(
        defaultMapping: mapValueOfType<bool>(json, r'defaultMapping'),
        issueTypes: json[r'issueTypes'] is Iterable
            ? (json[r'issueTypes'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        updateDraftIfNeeded: mapValueOfType<bool>(json, r'updateDraftIfNeeded'),
        workflow: mapValueOfType<String>(json, r'workflow'),
      );
    }
    return null;
  }

  static List<IssueTypesWorkflowMapping> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueTypesWorkflowMapping>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueTypesWorkflowMapping.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueTypesWorkflowMapping> mapFromJson(dynamic json) {
    final map = <String, IssueTypesWorkflowMapping>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueTypesWorkflowMapping.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueTypesWorkflowMapping-objects as value to a dart map
  static Map<String, List<IssueTypesWorkflowMapping>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueTypesWorkflowMapping>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueTypesWorkflowMapping.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

