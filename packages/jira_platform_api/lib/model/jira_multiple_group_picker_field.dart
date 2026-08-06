//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JiraMultipleGroupPickerField {
  /// Returns a new [JiraMultipleGroupPickerField] instance.
  JiraMultipleGroupPickerField({
    required this.fieldId,
    this.groups = const [],
  });

  String fieldId;

  List<JiraGroupInput> groups;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JiraMultipleGroupPickerField &&
    other.fieldId == fieldId &&
    _deepEquality.equals(other.groups, groups);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (fieldId.hashCode) +
    (groups.hashCode);

  @override
  String toString() => 'JiraMultipleGroupPickerField[fieldId=$fieldId, groups=$groups]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'fieldId'] = this.fieldId;
      json[r'groups'] = this.groups;
    return json;
  }

  /// Returns a new [JiraMultipleGroupPickerField] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JiraMultipleGroupPickerField? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'fieldId'), 'Required key "JiraMultipleGroupPickerField[fieldId]" is missing from JSON.');
        assert(json[r'fieldId'] != null, 'Required key "JiraMultipleGroupPickerField[fieldId]" has a null value in JSON.');
        assert(json.containsKey(r'groups'), 'Required key "JiraMultipleGroupPickerField[groups]" is missing from JSON.');
        assert(json[r'groups'] != null, 'Required key "JiraMultipleGroupPickerField[groups]" has a null value in JSON.');
        return true;
      }());

      return JiraMultipleGroupPickerField(
        fieldId: mapValueOfType<String>(json, r'fieldId')!,
        groups: JiraGroupInput.listFromJson(json[r'groups']),
      );
    }
    return null;
  }

  static List<JiraMultipleGroupPickerField> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JiraMultipleGroupPickerField>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JiraMultipleGroupPickerField.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JiraMultipleGroupPickerField> mapFromJson(dynamic json) {
    final map = <String, JiraMultipleGroupPickerField>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JiraMultipleGroupPickerField.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JiraMultipleGroupPickerField-objects as value to a dart map
  static Map<String, List<JiraMultipleGroupPickerField>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JiraMultipleGroupPickerField>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JiraMultipleGroupPickerField.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'fieldId',
    'groups',
  };
}

