//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowTransitionRulesUpdate {
  /// Returns a new [WorkflowTransitionRulesUpdate] instance.
  WorkflowTransitionRulesUpdate({
    this.workflows = const [],
  });

  /// The list of workflows with transition rules to update.
  List<WorkflowTransitionRules> workflows;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowTransitionRulesUpdate &&
    _deepEquality.equals(other.workflows, workflows);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (workflows.hashCode);

  @override
  String toString() => 'WorkflowTransitionRulesUpdate[workflows=$workflows]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'workflows'] = this.workflows;
    return json;
  }

  /// Returns a new [WorkflowTransitionRulesUpdate] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowTransitionRulesUpdate? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'workflows'), 'Required key "WorkflowTransitionRulesUpdate[workflows]" is missing from JSON.');
        assert(json[r'workflows'] != null, 'Required key "WorkflowTransitionRulesUpdate[workflows]" has a null value in JSON.');
        return true;
      }());

      return WorkflowTransitionRulesUpdate(
        workflows: WorkflowTransitionRules.listFromJson(json[r'workflows']),
      );
    }
    return null;
  }

  static List<WorkflowTransitionRulesUpdate> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowTransitionRulesUpdate>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowTransitionRulesUpdate.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowTransitionRulesUpdate> mapFromJson(dynamic json) {
    final map = <String, WorkflowTransitionRulesUpdate>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowTransitionRulesUpdate.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowTransitionRulesUpdate-objects as value to a dart map
  static Map<String, List<WorkflowTransitionRulesUpdate>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowTransitionRulesUpdate>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowTransitionRulesUpdate.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'workflows',
  };
}

