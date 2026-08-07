//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowTransition {
  /// Returns a new [WorkflowTransition] instance.
  WorkflowTransition({
    required this.id,
    required this.name,
  });

  /// The transition ID.
  int id;

  /// The transition name.
  String name;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowTransition &&
    other.id == id &&
    other.name == name;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (name.hashCode);

  @override
  String toString() => 'WorkflowTransition[id=$id, name=$name]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'name'] = this.name;
    return json;
  }

  /// Returns a new [WorkflowTransition] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowTransition? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "WorkflowTransition[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "WorkflowTransition[id]" has a null value in JSON.');
        assert(json.containsKey(r'name'), 'Required key "WorkflowTransition[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "WorkflowTransition[name]" has a null value in JSON.');
        return true;
      }());

      return WorkflowTransition(
        id: mapValueOfType<int>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
      );
    }
    return null;
  }

  static List<WorkflowTransition> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowTransition>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowTransition.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowTransition> mapFromJson(dynamic json) {
    final map = <String, WorkflowTransition>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowTransition.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowTransition-objects as value to a dart map
  static Map<String, List<WorkflowTransition>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowTransition>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowTransition.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'name',
  };
}

