//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CustomFieldContextDefaultValueDate {
  /// Returns a new [CustomFieldContextDefaultValueDate] instance.
  CustomFieldContextDefaultValueDate({
    required this.contextId,
    this.date,
    required this.type,
    this.useCurrent = false,
  });

  /// The ID of the context.
  String contextId;

  /// The default date in ISO format. Ignored if `useCurrent` is true.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? date;

  String type;

  /// Whether to use the current date.
  bool useCurrent;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CustomFieldContextDefaultValueDate &&
    other.contextId == contextId &&
    other.date == date &&
    other.type == type &&
    other.useCurrent == useCurrent;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (contextId.hashCode) +
    (date == null ? 0 : date!.hashCode) +
    (type.hashCode) +
    (useCurrent.hashCode);

  @override
  String toString() => 'CustomFieldContextDefaultValueDate[contextId=$contextId, date=$date, type=$type, useCurrent=$useCurrent]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'contextId'] = this.contextId;
    if (this.date != null) {
      json[r'date'] = this.date;
    } else {
      json[r'date'] = null;
    }
      json[r'type'] = this.type;
      json[r'useCurrent'] = this.useCurrent;
    return json;
  }

  /// Returns a new [CustomFieldContextDefaultValueDate] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CustomFieldContextDefaultValueDate? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'contextId'), 'Required key "CustomFieldContextDefaultValueDate[contextId]" is missing from JSON.');
        assert(json[r'contextId'] != null, 'Required key "CustomFieldContextDefaultValueDate[contextId]" has a null value in JSON.');
        assert(json.containsKey(r'type'), 'Required key "CustomFieldContextDefaultValueDate[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "CustomFieldContextDefaultValueDate[type]" has a null value in JSON.');
        return true;
      }());

      return CustomFieldContextDefaultValueDate(
        contextId: mapValueOfType<String>(json, r'contextId')!,
        date: mapValueOfType<String>(json, r'date'),
        type: mapValueOfType<String>(json, r'type')!,
        useCurrent: mapValueOfType<bool>(json, r'useCurrent') ?? false,
      );
    }
    return null;
  }

  static List<CustomFieldContextDefaultValueDate> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomFieldContextDefaultValueDate>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomFieldContextDefaultValueDate.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CustomFieldContextDefaultValueDate> mapFromJson(dynamic json) {
    final map = <String, CustomFieldContextDefaultValueDate>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CustomFieldContextDefaultValueDate.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CustomFieldContextDefaultValueDate-objects as value to a dart map
  static Map<String, List<CustomFieldContextDefaultValueDate>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CustomFieldContextDefaultValueDate>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CustomFieldContextDefaultValueDate.listFromJson(entry.value, growable: growable,);
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

