//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowTransitionRules {
  /// Returns a new [WorkflowTransitionRules] instance.
  WorkflowTransitionRules({
    this.conditions = const [],
    this.postFunctions = const [],
    this.validators = const [],
    required this.workflowId,
  });

  /// The list of conditions within the workflow.
  List<AppWorkflowTransitionRule> conditions;

  /// The list of post functions within the workflow.
  List<AppWorkflowTransitionRule> postFunctions;

  /// The list of validators within the workflow.
  List<AppWorkflowTransitionRule> validators;

  WorkflowId workflowId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowTransitionRules &&
    _deepEquality.equals(other.conditions, conditions) &&
    _deepEquality.equals(other.postFunctions, postFunctions) &&
    _deepEquality.equals(other.validators, validators) &&
    other.workflowId == workflowId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (conditions.hashCode) +
    (postFunctions.hashCode) +
    (validators.hashCode) +
    (workflowId.hashCode);

  @override
  String toString() => 'WorkflowTransitionRules[conditions=$conditions, postFunctions=$postFunctions, validators=$validators, workflowId=$workflowId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'conditions'] = this.conditions;
      json[r'postFunctions'] = this.postFunctions;
      json[r'validators'] = this.validators;
      json[r'workflowId'] = this.workflowId;
    return json;
  }

  /// Returns a new [WorkflowTransitionRules] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowTransitionRules? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'workflowId'), 'Required key "WorkflowTransitionRules[workflowId]" is missing from JSON.');
        assert(json[r'workflowId'] != null, 'Required key "WorkflowTransitionRules[workflowId]" has a null value in JSON.');
        return true;
      }());

      return WorkflowTransitionRules(
        conditions: AppWorkflowTransitionRule.listFromJson(json[r'conditions']),
        postFunctions: AppWorkflowTransitionRule.listFromJson(json[r'postFunctions']),
        validators: AppWorkflowTransitionRule.listFromJson(json[r'validators']),
        workflowId: WorkflowId.fromJson(json[r'workflowId'])!,
      );
    }
    return null;
  }

  static List<WorkflowTransitionRules> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowTransitionRules>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowTransitionRules.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowTransitionRules> mapFromJson(dynamic json) {
    final map = <String, WorkflowTransitionRules>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowTransitionRules.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowTransitionRules-objects as value to a dart map
  static Map<String, List<WorkflowTransitionRules>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowTransitionRules>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowTransitionRules.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'workflowId',
  };
}

