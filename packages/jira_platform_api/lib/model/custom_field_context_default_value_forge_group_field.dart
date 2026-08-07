//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CustomFieldContextDefaultValueForgeGroupField {
  /// Returns a new [CustomFieldContextDefaultValueForgeGroupField] instance.
  CustomFieldContextDefaultValueForgeGroupField({
    required this.contextId,
    required this.groupId,
    required this.type,
  });

  /// The ID of the context.
  String contextId;

  /// The ID of the the default group.
  String groupId;

  String type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CustomFieldContextDefaultValueForgeGroupField &&
    other.contextId == contextId &&
    other.groupId == groupId &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (contextId.hashCode) +
    (groupId.hashCode) +
    (type.hashCode);

  @override
  String toString() => 'CustomFieldContextDefaultValueForgeGroupField[contextId=$contextId, groupId=$groupId, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'contextId'] = this.contextId;
      json[r'groupId'] = this.groupId;
      json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [CustomFieldContextDefaultValueForgeGroupField] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CustomFieldContextDefaultValueForgeGroupField? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'contextId'), 'Required key "CustomFieldContextDefaultValueForgeGroupField[contextId]" is missing from JSON.');
        assert(json[r'contextId'] != null, 'Required key "CustomFieldContextDefaultValueForgeGroupField[contextId]" has a null value in JSON.');
        assert(json.containsKey(r'groupId'), 'Required key "CustomFieldContextDefaultValueForgeGroupField[groupId]" is missing from JSON.');
        assert(json[r'groupId'] != null, 'Required key "CustomFieldContextDefaultValueForgeGroupField[groupId]" has a null value in JSON.');
        assert(json.containsKey(r'type'), 'Required key "CustomFieldContextDefaultValueForgeGroupField[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "CustomFieldContextDefaultValueForgeGroupField[type]" has a null value in JSON.');
        return true;
      }());

      return CustomFieldContextDefaultValueForgeGroupField(
        contextId: mapValueOfType<String>(json, r'contextId')!,
        groupId: mapValueOfType<String>(json, r'groupId')!,
        type: mapValueOfType<String>(json, r'type')!,
      );
    }
    return null;
  }

  static List<CustomFieldContextDefaultValueForgeGroupField> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomFieldContextDefaultValueForgeGroupField>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomFieldContextDefaultValueForgeGroupField.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CustomFieldContextDefaultValueForgeGroupField> mapFromJson(dynamic json) {
    final map = <String, CustomFieldContextDefaultValueForgeGroupField>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CustomFieldContextDefaultValueForgeGroupField.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CustomFieldContextDefaultValueForgeGroupField-objects as value to a dart map
  static Map<String, List<CustomFieldContextDefaultValueForgeGroupField>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CustomFieldContextDefaultValueForgeGroupField>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CustomFieldContextDefaultValueForgeGroupField.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'contextId',
    'groupId',
    'type',
  };
}

