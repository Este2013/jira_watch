//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowRuleConfiguration {
  /// Returns a new [WorkflowRuleConfiguration] instance.
  WorkflowRuleConfiguration({
    this.id,
    this.parameters = const {},
    required this.ruleKey,
  });

  /// The ID of the rule.
  String? id;

  /// The parameters related to the rule.
  Map<String, String> parameters;

  /// The rule key of the rule.
  String ruleKey;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowRuleConfiguration &&
    other.id == id &&
    _deepEquality.equals(other.parameters, parameters) &&
    other.ruleKey == ruleKey;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (parameters.hashCode) +
    (ruleKey.hashCode);

  @override
  String toString() => 'WorkflowRuleConfiguration[id=$id, parameters=$parameters, ruleKey=$ruleKey]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
      json[r'parameters'] = this.parameters;
      json[r'ruleKey'] = this.ruleKey;
    return json;
  }

  /// Returns a new [WorkflowRuleConfiguration] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowRuleConfiguration? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'ruleKey'), 'Required key "WorkflowRuleConfiguration[ruleKey]" is missing from JSON.');
        assert(json[r'ruleKey'] != null, 'Required key "WorkflowRuleConfiguration[ruleKey]" has a null value in JSON.');
        return true;
      }());

      return WorkflowRuleConfiguration(
        id: mapValueOfType<String>(json, r'id'),
        parameters: mapCastOfType<String, String>(json, r'parameters') ?? const {},
        ruleKey: mapValueOfType<String>(json, r'ruleKey')!,
      );
    }
    return null;
  }

  static List<WorkflowRuleConfiguration> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowRuleConfiguration>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowRuleConfiguration.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowRuleConfiguration> mapFromJson(dynamic json) {
    final map = <String, WorkflowRuleConfiguration>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowRuleConfiguration.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowRuleConfiguration-objects as value to a dart map
  static Map<String, List<WorkflowRuleConfiguration>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowRuleConfiguration>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowRuleConfiguration.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'ruleKey',
  };
}

