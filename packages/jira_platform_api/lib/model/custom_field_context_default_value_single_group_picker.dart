//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CustomFieldContextDefaultValueSingleGroupPicker {
  /// Returns a new [CustomFieldContextDefaultValueSingleGroupPicker] instance.
  CustomFieldContextDefaultValueSingleGroupPicker({
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
  bool operator ==(Object other) => identical(this, other) || other is CustomFieldContextDefaultValueSingleGroupPicker &&
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
  String toString() => 'CustomFieldContextDefaultValueSingleGroupPicker[contextId=$contextId, groupId=$groupId, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'contextId'] = this.contextId;
      json[r'groupId'] = this.groupId;
      json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [CustomFieldContextDefaultValueSingleGroupPicker] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CustomFieldContextDefaultValueSingleGroupPicker? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'contextId'), 'Required key "CustomFieldContextDefaultValueSingleGroupPicker[contextId]" is missing from JSON.');
        assert(json[r'contextId'] != null, 'Required key "CustomFieldContextDefaultValueSingleGroupPicker[contextId]" has a null value in JSON.');
        assert(json.containsKey(r'groupId'), 'Required key "CustomFieldContextDefaultValueSingleGroupPicker[groupId]" is missing from JSON.');
        assert(json[r'groupId'] != null, 'Required key "CustomFieldContextDefaultValueSingleGroupPicker[groupId]" has a null value in JSON.');
        assert(json.containsKey(r'type'), 'Required key "CustomFieldContextDefaultValueSingleGroupPicker[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "CustomFieldContextDefaultValueSingleGroupPicker[type]" has a null value in JSON.');
        return true;
      }());

      return CustomFieldContextDefaultValueSingleGroupPicker(
        contextId: mapValueOfType<String>(json, r'contextId')!,
        groupId: mapValueOfType<String>(json, r'groupId')!,
        type: mapValueOfType<String>(json, r'type')!,
      );
    }
    return null;
  }

  static List<CustomFieldContextDefaultValueSingleGroupPicker> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomFieldContextDefaultValueSingleGroupPicker>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomFieldContextDefaultValueSingleGroupPicker.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CustomFieldContextDefaultValueSingleGroupPicker> mapFromJson(dynamic json) {
    final map = <String, CustomFieldContextDefaultValueSingleGroupPicker>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CustomFieldContextDefaultValueSingleGroupPicker.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CustomFieldContextDefaultValueSingleGroupPicker-objects as value to a dart map
  static Map<String, List<CustomFieldContextDefaultValueSingleGroupPicker>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CustomFieldContextDefaultValueSingleGroupPicker>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CustomFieldContextDefaultValueSingleGroupPicker.listFromJson(entry.value, growable: growable,);
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

