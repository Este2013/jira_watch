//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowTransitionRulesUpdateErrors {
  /// Returns a new [WorkflowTransitionRulesUpdateErrors] instance.
  WorkflowTransitionRulesUpdateErrors({
    this.updateResults = const [],
  });

  /// A list of workflows.
  List<WorkflowTransitionRulesUpdateErrorDetails> updateResults;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowTransitionRulesUpdateErrors &&
    _deepEquality.equals(other.updateResults, updateResults);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (updateResults.hashCode);

  @override
  String toString() => 'WorkflowTransitionRulesUpdateErrors[updateResults=$updateResults]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'updateResults'] = this.updateResults;
    return json;
  }

  /// Returns a new [WorkflowTransitionRulesUpdateErrors] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowTransitionRulesUpdateErrors? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'updateResults'), 'Required key "WorkflowTransitionRulesUpdateErrors[updateResults]" is missing from JSON.');
        assert(json[r'updateResults'] != null, 'Required key "WorkflowTransitionRulesUpdateErrors[updateResults]" has a null value in JSON.');
        return true;
      }());

      return WorkflowTransitionRulesUpdateErrors(
        updateResults: WorkflowTransitionRulesUpdateErrorDetails.listFromJson(json[r'updateResults']),
      );
    }
    return null;
  }

  static List<WorkflowTransitionRulesUpdateErrors> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowTransitionRulesUpdateErrors>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowTransitionRulesUpdateErrors.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowTransitionRulesUpdateErrors> mapFromJson(dynamic json) {
    final map = <String, WorkflowTransitionRulesUpdateErrors>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowTransitionRulesUpdateErrors.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowTransitionRulesUpdateErrors-objects as value to a dart map
  static Map<String, List<WorkflowTransitionRulesUpdateErrors>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowTransitionRulesUpdateErrors>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowTransitionRulesUpdateErrors.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'updateResults',
  };
}

