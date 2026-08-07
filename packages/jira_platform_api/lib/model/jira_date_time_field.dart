//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JiraDateTimeField {
  /// Returns a new [JiraDateTimeField] instance.
  JiraDateTimeField({
    required this.dateTime,
    required this.fieldId,
  });

  JiraDateTimeInput dateTime;

  String fieldId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JiraDateTimeField &&
    other.dateTime == dateTime &&
    other.fieldId == fieldId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (dateTime.hashCode) +
    (fieldId.hashCode);

  @override
  String toString() => 'JiraDateTimeField[dateTime=$dateTime, fieldId=$fieldId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'dateTime'] = this.dateTime;
      json[r'fieldId'] = this.fieldId;
    return json;
  }

  /// Returns a new [JiraDateTimeField] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JiraDateTimeField? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'dateTime'), 'Required key "JiraDateTimeField[dateTime]" is missing from JSON.');
        assert(json[r'dateTime'] != null, 'Required key "JiraDateTimeField[dateTime]" has a null value in JSON.');
        assert(json.containsKey(r'fieldId'), 'Required key "JiraDateTimeField[fieldId]" is missing from JSON.');
        assert(json[r'fieldId'] != null, 'Required key "JiraDateTimeField[fieldId]" has a null value in JSON.');
        return true;
      }());

      return JiraDateTimeField(
        dateTime: JiraDateTimeInput.fromJson(json[r'dateTime'])!,
        fieldId: mapValueOfType<String>(json, r'fieldId')!,
      );
    }
    return null;
  }

  static List<JiraDateTimeField> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JiraDateTimeField>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JiraDateTimeField.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JiraDateTimeField> mapFromJson(dynamic json) {
    final map = <String, JiraDateTimeField>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JiraDateTimeField.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JiraDateTimeField-objects as value to a dart map
  static Map<String, List<JiraDateTimeField>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JiraDateTimeField>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JiraDateTimeField.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'dateTime',
    'fieldId',
  };
}

