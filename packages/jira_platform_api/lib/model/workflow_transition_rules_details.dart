//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowTransitionRulesDetails {
  /// Returns a new [WorkflowTransitionRulesDetails] instance.
  WorkflowTransitionRulesDetails({
    required this.workflowId,
    this.workflowRuleIds = const [],
  });

  WorkflowId workflowId;

  /// The list of connect workflow rule IDs.
  List<String> workflowRuleIds;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowTransitionRulesDetails &&
    other.workflowId == workflowId &&
    _deepEquality.equals(other.workflowRuleIds, workflowRuleIds);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (workflowId.hashCode) +
    (workflowRuleIds.hashCode);

  @override
  String toString() => 'WorkflowTransitionRulesDetails[workflowId=$workflowId, workflowRuleIds=$workflowRuleIds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'workflowId'] = this.workflowId;
      json[r'workflowRuleIds'] = this.workflowRuleIds;
    return json;
  }

  /// Returns a new [WorkflowTransitionRulesDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowTransitionRulesDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'workflowId'), 'Required key "WorkflowTransitionRulesDetails[workflowId]" is missing from JSON.');
        assert(json[r'workflowId'] != null, 'Required key "WorkflowTransitionRulesDetails[workflowId]" has a null value in JSON.');
        assert(json.containsKey(r'workflowRuleIds'), 'Required key "WorkflowTransitionRulesDetails[workflowRuleIds]" is missing from JSON.');
        assert(json[r'workflowRuleIds'] != null, 'Required key "WorkflowTransitionRulesDetails[workflowRuleIds]" has a null value in JSON.');
        return true;
      }());

      return WorkflowTransitionRulesDetails(
        workflowId: WorkflowId.fromJson(json[r'workflowId'])!,
        workflowRuleIds: json[r'workflowRuleIds'] is Iterable
            ? (json[r'workflowRuleIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<WorkflowTransitionRulesDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowTransitionRulesDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowTransitionRulesDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowTransitionRulesDetails> mapFromJson(dynamic json) {
    final map = <String, WorkflowTransitionRulesDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowTransitionRulesDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowTransitionRulesDetails-objects as value to a dart map
  static Map<String, List<WorkflowTransitionRulesDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowTransitionRulesDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowTransitionRulesDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'workflowId',
    'workflowRuleIds',
  };
}

