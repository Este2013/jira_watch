//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowTransitionRulesUpdateErrorDetails {
  /// Returns a new [WorkflowTransitionRulesUpdateErrorDetails] instance.
  WorkflowTransitionRulesUpdateErrorDetails({
    this.ruleUpdateErrors = const {},
    this.updateErrors = const [],
    required this.workflowId,
  });

  /// A list of transition rule update errors, indexed by the transition rule ID. Any transition rule that appears here wasn't updated.
  Map<String, List<String>> ruleUpdateErrors;

  /// The list of errors that specify why the workflow update failed. The workflow was not updated if the list contains any entries.
  List<String> updateErrors;

  WorkflowId workflowId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowTransitionRulesUpdateErrorDetails &&
    _deepEquality.equals(other.ruleUpdateErrors, ruleUpdateErrors) &&
    _deepEquality.equals(other.updateErrors, updateErrors) &&
    other.workflowId == workflowId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (ruleUpdateErrors.hashCode) +
    (updateErrors.hashCode) +
    (workflowId.hashCode);

  @override
  String toString() => 'WorkflowTransitionRulesUpdateErrorDetails[ruleUpdateErrors=$ruleUpdateErrors, updateErrors=$updateErrors, workflowId=$workflowId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'ruleUpdateErrors'] = this.ruleUpdateErrors;
      json[r'updateErrors'] = this.updateErrors;
      json[r'workflowId'] = this.workflowId;
    return json;
  }

  /// Returns a new [WorkflowTransitionRulesUpdateErrorDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowTransitionRulesUpdateErrorDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'ruleUpdateErrors'), 'Required key "WorkflowTransitionRulesUpdateErrorDetails[ruleUpdateErrors]" is missing from JSON.');
        assert(json[r'ruleUpdateErrors'] != null, 'Required key "WorkflowTransitionRulesUpdateErrorDetails[ruleUpdateErrors]" has a null value in JSON.');
        assert(json.containsKey(r'updateErrors'), 'Required key "WorkflowTransitionRulesUpdateErrorDetails[updateErrors]" is missing from JSON.');
        assert(json[r'updateErrors'] != null, 'Required key "WorkflowTransitionRulesUpdateErrorDetails[updateErrors]" has a null value in JSON.');
        assert(json.containsKey(r'workflowId'), 'Required key "WorkflowTransitionRulesUpdateErrorDetails[workflowId]" is missing from JSON.');
        assert(json[r'workflowId'] != null, 'Required key "WorkflowTransitionRulesUpdateErrorDetails[workflowId]" has a null value in JSON.');
        return true;
      }());

      return WorkflowTransitionRulesUpdateErrorDetails(
        ruleUpdateErrors: json[r'ruleUpdateErrors'] == null
          ? const {}
            : (json[r'ruleUpdateErrors'] as Map<String, dynamic>).map((k, v) => MapEntry(k, v == null ? const <String>[] : (v as List).map((value) => value as String).toList(growable: false))),
        updateErrors: json[r'updateErrors'] is Iterable
            ? (json[r'updateErrors'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        workflowId: WorkflowId.fromJson(json[r'workflowId'])!,
      );
    }
    return null;
  }

  static List<WorkflowTransitionRulesUpdateErrorDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowTransitionRulesUpdateErrorDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowTransitionRulesUpdateErrorDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowTransitionRulesUpdateErrorDetails> mapFromJson(dynamic json) {
    final map = <String, WorkflowTransitionRulesUpdateErrorDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowTransitionRulesUpdateErrorDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowTransitionRulesUpdateErrorDetails-objects as value to a dart map
  static Map<String, List<WorkflowTransitionRulesUpdateErrorDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowTransitionRulesUpdateErrorDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowTransitionRulesUpdateErrorDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'ruleUpdateErrors',
    'updateErrors',
    'workflowId',
  };
}

