//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JiraColorField {
  /// Returns a new [JiraColorField] instance.
  JiraColorField({
    required this.color,
    required this.fieldId,
  });

  JiraColorInput color;

  String fieldId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JiraColorField &&
    other.color == color &&
    other.fieldId == fieldId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (color.hashCode) +
    (fieldId.hashCode);

  @override
  String toString() => 'JiraColorField[color=$color, fieldId=$fieldId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'color'] = this.color;
      json[r'fieldId'] = this.fieldId;
    return json;
  }

  /// Returns a new [JiraColorField] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JiraColorField? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'color'), 'Required key "JiraColorField[color]" is missing from JSON.');
        assert(json[r'color'] != null, 'Required key "JiraColorField[color]" has a null value in JSON.');
        assert(json.containsKey(r'fieldId'), 'Required key "JiraColorField[fieldId]" is missing from JSON.');
        assert(json[r'fieldId'] != null, 'Required key "JiraColorField[fieldId]" has a null value in JSON.');
        return true;
      }());

      return JiraColorField(
        color: JiraColorInput.fromJson(json[r'color'])!,
        fieldId: mapValueOfType<String>(json, r'fieldId')!,
      );
    }
    return null;
  }

  static List<JiraColorField> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JiraColorField>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JiraColorField.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JiraColorField> mapFromJson(dynamic json) {
    final map = <String, JiraColorField>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JiraColorField.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JiraColorField-objects as value to a dart map
  static Map<String, List<JiraColorField>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JiraColorField>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JiraColorField.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'color',
    'fieldId',
  };
}

