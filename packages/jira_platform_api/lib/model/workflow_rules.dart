//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowRules {
  /// Returns a new [WorkflowRules] instance.
  WorkflowRules({
    this.conditionsTree,
    this.postFunctions = const [],
    this.validators = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  WorkflowCondition? conditionsTree;

  /// The workflow post functions.
  List<WorkflowTransitionRule> postFunctions;

  /// The workflow validators.
  List<WorkflowTransitionRule> validators;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowRules &&
    other.conditionsTree == conditionsTree &&
    _deepEquality.equals(other.postFunctions, postFunctions) &&
    _deepEquality.equals(other.validators, validators);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (conditionsTree == null ? 0 : conditionsTree!.hashCode) +
    (postFunctions.hashCode) +
    (validators.hashCode);

  @override
  String toString() => 'WorkflowRules[conditionsTree=$conditionsTree, postFunctions=$postFunctions, validators=$validators]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.conditionsTree != null) {
      json[r'conditionsTree'] = this.conditionsTree;
    } else {
      json[r'conditionsTree'] = null;
    }
      json[r'postFunctions'] = this.postFunctions;
      json[r'validators'] = this.validators;
    return json;
  }

  /// Returns a new [WorkflowRules] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowRules? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return WorkflowRules(
        conditionsTree: WorkflowCondition.fromJson(json[r'conditionsTree']),
        postFunctions: WorkflowTransitionRule.listFromJson(json[r'postFunctions']),
        validators: WorkflowTransitionRule.listFromJson(json[r'validators']),
      );
    }
    return null;
  }

  static List<WorkflowRules> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowRules>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowRules.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowRules> mapFromJson(dynamic json) {
    final map = <String, WorkflowRules>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowRules.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowRules-objects as value to a dart map
  static Map<String, List<WorkflowRules>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowRules>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowRules.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

