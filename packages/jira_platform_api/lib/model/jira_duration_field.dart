//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JiraDurationField {
  /// Returns a new [JiraDurationField] instance.
  JiraDurationField({
    required this.originalEstimateField,
  });

  String originalEstimateField;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JiraDurationField &&
    other.originalEstimateField == originalEstimateField;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (originalEstimateField.hashCode);

  @override
  String toString() => 'JiraDurationField[originalEstimateField=$originalEstimateField]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'originalEstimateField'] = this.originalEstimateField;
    return json;
  }

  /// Returns a new [JiraDurationField] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JiraDurationField? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'originalEstimateField'), 'Required key "JiraDurationField[originalEstimateField]" is missing from JSON.');
        assert(json[r'originalEstimateField'] != null, 'Required key "JiraDurationField[originalEstimateField]" has a null value in JSON.');
        return true;
      }());

      return JiraDurationField(
        originalEstimateField: mapValueOfType<String>(json, r'originalEstimateField')!,
      );
    }
    return null;
  }

  static List<JiraDurationField> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JiraDurationField>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JiraDurationField.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JiraDurationField> mapFromJson(dynamic json) {
    final map = <String, JiraDurationField>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JiraDurationField.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JiraDurationField-objects as value to a dart map
  static Map<String, List<JiraDurationField>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JiraDurationField>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JiraDurationField.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'originalEstimateField',
  };
}

