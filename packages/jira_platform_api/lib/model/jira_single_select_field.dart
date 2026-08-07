//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JiraSingleSelectField {
  /// Returns a new [JiraSingleSelectField] instance.
  JiraSingleSelectField({
    required this.fieldId,
    required this.option,
  });

  String fieldId;

  JiraSelectedOptionField option;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JiraSingleSelectField &&
    other.fieldId == fieldId &&
    other.option == option;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (fieldId.hashCode) +
    (option.hashCode);

  @override
  String toString() => 'JiraSingleSelectField[fieldId=$fieldId, option=$option]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'fieldId'] = this.fieldId;
      json[r'option'] = this.option;
    return json;
  }

  /// Returns a new [JiraSingleSelectField] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JiraSingleSelectField? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'fieldId'), 'Required key "JiraSingleSelectField[fieldId]" is missing from JSON.');
        assert(json[r'fieldId'] != null, 'Required key "JiraSingleSelectField[fieldId]" has a null value in JSON.');
        assert(json.containsKey(r'option'), 'Required key "JiraSingleSelectField[option]" is missing from JSON.');
        assert(json[r'option'] != null, 'Required key "JiraSingleSelectField[option]" has a null value in JSON.');
        return true;
      }());

      return JiraSingleSelectField(
        fieldId: mapValueOfType<String>(json, r'fieldId')!,
        option: JiraSelectedOptionField.fromJson(json[r'option'])!,
      );
    }
    return null;
  }

  static List<JiraSingleSelectField> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JiraSingleSelectField>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JiraSingleSelectField.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JiraSingleSelectField> mapFromJson(dynamic json) {
    final map = <String, JiraSingleSelectField>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JiraSingleSelectField.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JiraSingleSelectField-objects as value to a dart map
  static Map<String, List<JiraSingleSelectField>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JiraSingleSelectField>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JiraSingleSelectField.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'fieldId',
    'option',
  };
}

