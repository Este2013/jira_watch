//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AvailableWorkflowTriggers {
  /// Returns a new [AvailableWorkflowTriggers] instance.
  AvailableWorkflowTriggers({
    this.availableTypes = const [],
    required this.ruleKey,
  });

  /// The list of available trigger types.
  List<AvailableWorkflowTriggerTypes> availableTypes;

  /// The rule key of the rule.
  String ruleKey;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AvailableWorkflowTriggers &&
    _deepEquality.equals(other.availableTypes, availableTypes) &&
    other.ruleKey == ruleKey;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (availableTypes.hashCode) +
    (ruleKey.hashCode);

  @override
  String toString() => 'AvailableWorkflowTriggers[availableTypes=$availableTypes, ruleKey=$ruleKey]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'availableTypes'] = this.availableTypes;
      json[r'ruleKey'] = this.ruleKey;
    return json;
  }

  /// Returns a new [AvailableWorkflowTriggers] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AvailableWorkflowTriggers? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'availableTypes'), 'Required key "AvailableWorkflowTriggers[availableTypes]" is missing from JSON.');
        assert(json[r'availableTypes'] != null, 'Required key "AvailableWorkflowTriggers[availableTypes]" has a null value in JSON.');
        assert(json.containsKey(r'ruleKey'), 'Required key "AvailableWorkflowTriggers[ruleKey]" is missing from JSON.');
        assert(json[r'ruleKey'] != null, 'Required key "AvailableWorkflowTriggers[ruleKey]" has a null value in JSON.');
        return true;
      }());

      return AvailableWorkflowTriggers(
        availableTypes: AvailableWorkflowTriggerTypes.listFromJson(json[r'availableTypes']),
        ruleKey: mapValueOfType<String>(json, r'ruleKey')!,
      );
    }
    return null;
  }

  static List<AvailableWorkflowTriggers> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AvailableWorkflowTriggers>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AvailableWorkflowTriggers.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AvailableWorkflowTriggers> mapFromJson(dynamic json) {
    final map = <String, AvailableWorkflowTriggers>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AvailableWorkflowTriggers.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AvailableWorkflowTriggers-objects as value to a dart map
  static Map<String, List<AvailableWorkflowTriggers>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AvailableWorkflowTriggers>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AvailableWorkflowTriggers.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'availableTypes',
    'ruleKey',
  };
}

