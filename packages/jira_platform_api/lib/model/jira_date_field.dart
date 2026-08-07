//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JiraDateField {
  /// Returns a new [JiraDateField] instance.
  JiraDateField({
    this.date,
    required this.fieldId,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  JiraDateInput? date;

  String fieldId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JiraDateField &&
    other.date == date &&
    other.fieldId == fieldId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (date == null ? 0 : date!.hashCode) +
    (fieldId.hashCode);

  @override
  String toString() => 'JiraDateField[date=$date, fieldId=$fieldId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.date != null) {
      json[r'date'] = this.date;
    } else {
      json[r'date'] = null;
    }
      json[r'fieldId'] = this.fieldId;
    return json;
  }

  /// Returns a new [JiraDateField] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JiraDateField? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'fieldId'), 'Required key "JiraDateField[fieldId]" is missing from JSON.');
        assert(json[r'fieldId'] != null, 'Required key "JiraDateField[fieldId]" has a null value in JSON.');
        return true;
      }());

      return JiraDateField(
        date: JiraDateInput.fromJson(json[r'date']),
        fieldId: mapValueOfType<String>(json, r'fieldId')!,
      );
    }
    return null;
  }

  static List<JiraDateField> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JiraDateField>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JiraDateField.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JiraDateField> mapFromJson(dynamic json) {
    final map = <String, JiraDateField>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JiraDateField.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JiraDateField-objects as value to a dart map
  static Map<String, List<JiraDateField>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JiraDateField>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JiraDateField.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'fieldId',
  };
}

