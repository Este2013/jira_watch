//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JiraPriorityField {
  /// Returns a new [JiraPriorityField] instance.
  JiraPriorityField({
    required this.priorityId,
  });

  String priorityId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JiraPriorityField &&
    other.priorityId == priorityId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (priorityId.hashCode);

  @override
  String toString() => 'JiraPriorityField[priorityId=$priorityId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'priorityId'] = this.priorityId;
    return json;
  }

  /// Returns a new [JiraPriorityField] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JiraPriorityField? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'priorityId'), 'Required key "JiraPriorityField[priorityId]" is missing from JSON.');
        assert(json[r'priorityId'] != null, 'Required key "JiraPriorityField[priorityId]" has a null value in JSON.');
        return true;
      }());

      return JiraPriorityField(
        priorityId: mapValueOfType<String>(json, r'priorityId')!,
      );
    }
    return null;
  }

  static List<JiraPriorityField> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JiraPriorityField>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JiraPriorityField.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JiraPriorityField> mapFromJson(dynamic json) {
    final map = <String, JiraPriorityField>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JiraPriorityField.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JiraPriorityField-objects as value to a dart map
  static Map<String, List<JiraPriorityField>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JiraPriorityField>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JiraPriorityField.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'priorityId',
  };
}

