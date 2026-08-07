//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowsWithTransitionRulesDetails {
  /// Returns a new [WorkflowsWithTransitionRulesDetails] instance.
  WorkflowsWithTransitionRulesDetails({
    this.workflows = const [],
  });

  /// The list of workflows with transition rules to delete.
  List<WorkflowTransitionRulesDetails> workflows;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowsWithTransitionRulesDetails &&
    _deepEquality.equals(other.workflows, workflows);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (workflows.hashCode);

  @override
  String toString() => 'WorkflowsWithTransitionRulesDetails[workflows=$workflows]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'workflows'] = this.workflows;
    return json;
  }

  /// Returns a new [WorkflowsWithTransitionRulesDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowsWithTransitionRulesDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'workflows'), 'Required key "WorkflowsWithTransitionRulesDetails[workflows]" is missing from JSON.');
        assert(json[r'workflows'] != null, 'Required key "WorkflowsWithTransitionRulesDetails[workflows]" has a null value in JSON.');
        return true;
      }());

      return WorkflowsWithTransitionRulesDetails(
        workflows: WorkflowTransitionRulesDetails.listFromJson(json[r'workflows']),
      );
    }
    return null;
  }

  static List<WorkflowsWithTransitionRulesDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowsWithTransitionRulesDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowsWithTransitionRulesDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowsWithTransitionRulesDetails> mapFromJson(dynamic json) {
    final map = <String, WorkflowsWithTransitionRulesDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowsWithTransitionRulesDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowsWithTransitionRulesDetails-objects as value to a dart map
  static Map<String, List<WorkflowsWithTransitionRulesDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowsWithTransitionRulesDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowsWithTransitionRulesDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'workflows',
  };
}

