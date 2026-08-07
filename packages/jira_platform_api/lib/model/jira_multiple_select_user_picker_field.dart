//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JiraMultipleSelectUserPickerField {
  /// Returns a new [JiraMultipleSelectUserPickerField] instance.
  JiraMultipleSelectUserPickerField({
    required this.fieldId,
    this.users = const [],
  });

  String fieldId;

  List<JiraUserField> users;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JiraMultipleSelectUserPickerField &&
    other.fieldId == fieldId &&
    _deepEquality.equals(other.users, users);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (fieldId.hashCode) +
    (users.hashCode);

  @override
  String toString() => 'JiraMultipleSelectUserPickerField[fieldId=$fieldId, users=$users]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'fieldId'] = this.fieldId;
      json[r'users'] = this.users;
    return json;
  }

  /// Returns a new [JiraMultipleSelectUserPickerField] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JiraMultipleSelectUserPickerField? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'fieldId'), 'Required key "JiraMultipleSelectUserPickerField[fieldId]" is missing from JSON.');
        assert(json[r'fieldId'] != null, 'Required key "JiraMultipleSelectUserPickerField[fieldId]" has a null value in JSON.');
        return true;
      }());

      return JiraMultipleSelectUserPickerField(
        fieldId: mapValueOfType<String>(json, r'fieldId')!,
        users: JiraUserField.listFromJson(json[r'users']),
      );
    }
    return null;
  }

  static List<JiraMultipleSelectUserPickerField> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JiraMultipleSelectUserPickerField>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JiraMultipleSelectUserPickerField.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JiraMultipleSelectUserPickerField> mapFromJson(dynamic json) {
    final map = <String, JiraMultipleSelectUserPickerField>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JiraMultipleSelectUserPickerField.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JiraMultipleSelectUserPickerField-objects as value to a dart map
  static Map<String, List<JiraMultipleSelectUserPickerField>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JiraMultipleSelectUserPickerField>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JiraMultipleSelectUserPickerField.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'fieldId',
  };
}

