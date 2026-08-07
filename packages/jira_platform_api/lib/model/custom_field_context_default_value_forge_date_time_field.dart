//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CustomFieldContextDefaultValueForgeDateTimeField {
  /// Returns a new [CustomFieldContextDefaultValueForgeDateTimeField] instance.
  CustomFieldContextDefaultValueForgeDateTimeField({
    required this.contextId,
    this.dateTime,
    required this.type,
    this.useCurrent = false,
  });

  /// The ID of the context.
  String contextId;

  /// The default date-time in ISO format. Ignored if `useCurrent` is true.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? dateTime;

  String type;

  /// Whether to use the current date.
  bool useCurrent;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CustomFieldContextDefaultValueForgeDateTimeField &&
    other.contextId == contextId &&
    other.dateTime == dateTime &&
    other.type == type &&
    other.useCurrent == useCurrent;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (contextId.hashCode) +
    (dateTime == null ? 0 : dateTime!.hashCode) +
    (type.hashCode) +
    (useCurrent.hashCode);

  @override
  String toString() => 'CustomFieldContextDefaultValueForgeDateTimeField[contextId=$contextId, dateTime=$dateTime, type=$type, useCurrent=$useCurrent]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'contextId'] = this.contextId;
    if (this.dateTime != null) {
      json[r'dateTime'] = this.dateTime;
    } else {
      json[r'dateTime'] = null;
    }
      json[r'type'] = this.type;
      json[r'useCurrent'] = this.useCurrent;
    return json;
  }

  /// Returns a new [CustomFieldContextDefaultValueForgeDateTimeField] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CustomFieldContextDefaultValueForgeDateTimeField? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'contextId'), 'Required key "CustomFieldContextDefaultValueForgeDateTimeField[contextId]" is missing from JSON.');
        assert(json[r'contextId'] != null, 'Required key "CustomFieldContextDefaultValueForgeDateTimeField[contextId]" has a null value in JSON.');
        assert(json.containsKey(r'type'), 'Required key "CustomFieldContextDefaultValueForgeDateTimeField[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "CustomFieldContextDefaultValueForgeDateTimeField[type]" has a null value in JSON.');
        return true;
      }());

      return CustomFieldContextDefaultValueForgeDateTimeField(
        contextId: mapValueOfType<String>(json, r'contextId')!,
        dateTime: mapValueOfType<String>(json, r'dateTime'),
        type: mapValueOfType<String>(json, r'type')!,
        useCurrent: mapValueOfType<bool>(json, r'useCurrent') ?? false,
      );
    }
    return null;
  }

  static List<CustomFieldContextDefaultValueForgeDateTimeField> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomFieldContextDefaultValueForgeDateTimeField>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomFieldContextDefaultValueForgeDateTimeField.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CustomFieldContextDefaultValueForgeDateTimeField> mapFromJson(dynamic json) {
    final map = <String, CustomFieldContextDefaultValueForgeDateTimeField>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CustomFieldContextDefaultValueForgeDateTimeField.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CustomFieldContextDefaultValueForgeDateTimeField-objects as value to a dart map
  static Map<String, List<CustomFieldContextDefaultValueForgeDateTimeField>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CustomFieldContextDefaultValueForgeDateTimeField>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CustomFieldContextDefaultValueForgeDateTimeField.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'contextId',
    'type',
  };
}

