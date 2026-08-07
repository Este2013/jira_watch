//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JiraSingleGroupPickerField {
  /// Returns a new [JiraSingleGroupPickerField] instance.
  JiraSingleGroupPickerField({
    required this.fieldId,
    required this.group,
  });

  String fieldId;

  JiraGroupInput group;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JiraSingleGroupPickerField &&
    other.fieldId == fieldId &&
    other.group == group;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (fieldId.hashCode) +
    (group.hashCode);

  @override
  String toString() => 'JiraSingleGroupPickerField[fieldId=$fieldId, group=$group]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'fieldId'] = this.fieldId;
      json[r'group'] = this.group;
    return json;
  }

  /// Returns a new [JiraSingleGroupPickerField] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JiraSingleGroupPickerField? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'fieldId'), 'Required key "JiraSingleGroupPickerField[fieldId]" is missing from JSON.');
        assert(json[r'fieldId'] != null, 'Required key "JiraSingleGroupPickerField[fieldId]" has a null value in JSON.');
        assert(json.containsKey(r'group'), 'Required key "JiraSingleGroupPickerField[group]" is missing from JSON.');
        assert(json[r'group'] != null, 'Required key "JiraSingleGroupPickerField[group]" has a null value in JSON.');
        return true;
      }());

      return JiraSingleGroupPickerField(
        fieldId: mapValueOfType<String>(json, r'fieldId')!,
        group: JiraGroupInput.fromJson(json[r'group'])!,
      );
    }
    return null;
  }

  static List<JiraSingleGroupPickerField> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JiraSingleGroupPickerField>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JiraSingleGroupPickerField.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JiraSingleGroupPickerField> mapFromJson(dynamic json) {
    final map = <String, JiraSingleGroupPickerField>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JiraSingleGroupPickerField.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JiraSingleGroupPickerField-objects as value to a dart map
  static Map<String, List<JiraSingleGroupPickerField>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JiraSingleGroupPickerField>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JiraSingleGroupPickerField.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'fieldId',
    'group',
  };
}

