//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CustomFieldContextDefaultValueForgeMultiStringField {
  /// Returns a new [CustomFieldContextDefaultValueForgeMultiStringField] instance.
  CustomFieldContextDefaultValueForgeMultiStringField({
    required this.contextId,
    required this.type,
    this.values = const [],
  });

  /// The ID of the context.
  String contextId;

  String type;

  /// List of string values. The maximum length for a value is 254 characters.
  List<String> values;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CustomFieldContextDefaultValueForgeMultiStringField &&
    other.contextId == contextId &&
    other.type == type &&
    _deepEquality.equals(other.values, values);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (contextId.hashCode) +
    (type.hashCode) +
    (values.hashCode);

  @override
  String toString() => 'CustomFieldContextDefaultValueForgeMultiStringField[contextId=$contextId, type=$type, values=$values]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'contextId'] = this.contextId;
      json[r'type'] = this.type;
      json[r'values'] = this.values;
    return json;
  }

  /// Returns a new [CustomFieldContextDefaultValueForgeMultiStringField] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CustomFieldContextDefaultValueForgeMultiStringField? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'contextId'), 'Required key "CustomFieldContextDefaultValueForgeMultiStringField[contextId]" is missing from JSON.');
        assert(json[r'contextId'] != null, 'Required key "CustomFieldContextDefaultValueForgeMultiStringField[contextId]" has a null value in JSON.');
        assert(json.containsKey(r'type'), 'Required key "CustomFieldContextDefaultValueForgeMultiStringField[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "CustomFieldContextDefaultValueForgeMultiStringField[type]" has a null value in JSON.');
        return true;
      }());

      return CustomFieldContextDefaultValueForgeMultiStringField(
        contextId: mapValueOfType<String>(json, r'contextId')!,
        type: mapValueOfType<String>(json, r'type')!,
        values: json[r'values'] is Iterable
            ? (json[r'values'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<CustomFieldContextDefaultValueForgeMultiStringField> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomFieldContextDefaultValueForgeMultiStringField>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomFieldContextDefaultValueForgeMultiStringField.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CustomFieldContextDefaultValueForgeMultiStringField> mapFromJson(dynamic json) {
    final map = <String, CustomFieldContextDefaultValueForgeMultiStringField>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CustomFieldContextDefaultValueForgeMultiStringField.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CustomFieldContextDefaultValueForgeMultiStringField-objects as value to a dart map
  static Map<String, List<CustomFieldContextDefaultValueForgeMultiStringField>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CustomFieldContextDefaultValueForgeMultiStringField>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CustomFieldContextDefaultValueForgeMultiStringField.listFromJson(entry.value, growable: growable,);
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

