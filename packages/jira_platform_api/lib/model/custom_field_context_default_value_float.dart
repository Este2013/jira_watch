//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CustomFieldContextDefaultValueFloat {
  /// Returns a new [CustomFieldContextDefaultValueFloat] instance.
  CustomFieldContextDefaultValueFloat({
    required this.contextId,
    required this.number,
    required this.type,
  });

  /// The ID of the context.
  String contextId;

  /// The default floating-point number.
  double number;

  String type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CustomFieldContextDefaultValueFloat &&
    other.contextId == contextId &&
    other.number == number &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (contextId.hashCode) +
    (number.hashCode) +
    (type.hashCode);

  @override
  String toString() => 'CustomFieldContextDefaultValueFloat[contextId=$contextId, number=$number, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'contextId'] = this.contextId;
      json[r'number'] = this.number;
      json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [CustomFieldContextDefaultValueFloat] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CustomFieldContextDefaultValueFloat? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'contextId'), 'Required key "CustomFieldContextDefaultValueFloat[contextId]" is missing from JSON.');
        assert(json[r'contextId'] != null, 'Required key "CustomFieldContextDefaultValueFloat[contextId]" has a null value in JSON.');
        assert(json.containsKey(r'number'), 'Required key "CustomFieldContextDefaultValueFloat[number]" is missing from JSON.');
        assert(json[r'number'] != null, 'Required key "CustomFieldContextDefaultValueFloat[number]" has a null value in JSON.');
        assert(json.containsKey(r'type'), 'Required key "CustomFieldContextDefaultValueFloat[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "CustomFieldContextDefaultValueFloat[type]" has a null value in JSON.');
        return true;
      }());

      return CustomFieldContextDefaultValueFloat(
        contextId: mapValueOfType<String>(json, r'contextId')!,
        number: mapValueOfType<double>(json, r'number')!,
        type: mapValueOfType<String>(json, r'type')!,
      );
    }
    return null;
  }

  static List<CustomFieldContextDefaultValueFloat> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomFieldContextDefaultValueFloat>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomFieldContextDefaultValueFloat.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CustomFieldContextDefaultValueFloat> mapFromJson(dynamic json) {
    final map = <String, CustomFieldContextDefaultValueFloat>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CustomFieldContextDefaultValueFloat.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CustomFieldContextDefaultValueFloat-objects as value to a dart map
  static Map<String, List<CustomFieldContextDefaultValueFloat>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CustomFieldContextDefaultValueFloat>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CustomFieldContextDefaultValueFloat.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'contextId',
    'number',
    'type',
  };
}

