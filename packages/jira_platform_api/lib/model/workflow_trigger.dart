//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowTrigger {
  /// Returns a new [WorkflowTrigger] instance.
  WorkflowTrigger({
    this.id,
    this.parameters = const {},
    required this.ruleKey,
  });

  /// The ID of the trigger.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// The parameters of the trigger.
  Map<String, String> parameters;

  /// The rule key of the trigger.
  String ruleKey;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowTrigger &&
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
  String toString() => 'WorkflowTrigger[id=$id, parameters=$parameters, ruleKey=$ruleKey]';

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

  /// Returns a new [WorkflowTrigger] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowTrigger? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'parameters'), 'Required key "WorkflowTrigger[parameters]" is missing from JSON.');
        assert(json[r'parameters'] != null, 'Required key "WorkflowTrigger[parameters]" has a null value in JSON.');
        assert(json.containsKey(r'ruleKey'), 'Required key "WorkflowTrigger[ruleKey]" is missing from JSON.');
        assert(json[r'ruleKey'] != null, 'Required key "WorkflowTrigger[ruleKey]" has a null value in JSON.');
        return true;
      }());

      return WorkflowTrigger(
        id: mapValueOfType<String>(json, r'id'),
        parameters: mapCastOfType<String, String>(json, r'parameters')!,
        ruleKey: mapValueOfType<String>(json, r'ruleKey')!,
      );
    }
    return null;
  }

  static List<WorkflowTrigger> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowTrigger>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowTrigger.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowTrigger> mapFromJson(dynamic json) {
    final map = <String, WorkflowTrigger>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowTrigger.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowTrigger-objects as value to a dart map
  static Map<String, List<WorkflowTrigger>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowTrigger>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowTrigger.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'parameters',
    'ruleKey',
  };
}

