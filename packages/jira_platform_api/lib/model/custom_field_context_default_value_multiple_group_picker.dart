//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CustomFieldContextDefaultValueMultipleGroupPicker {
  /// Returns a new [CustomFieldContextDefaultValueMultipleGroupPicker] instance.
  CustomFieldContextDefaultValueMultipleGroupPicker({
    required this.contextId,
    this.groupIds = const [],
    required this.type,
  });

  /// The ID of the context.
  String contextId;

  /// The IDs of the default groups.
  List<String> groupIds;

  String type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CustomFieldContextDefaultValueMultipleGroupPicker &&
    other.contextId == contextId &&
    _deepEquality.equals(other.groupIds, groupIds) &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (contextId.hashCode) +
    (groupIds.hashCode) +
    (type.hashCode);

  @override
  String toString() => 'CustomFieldContextDefaultValueMultipleGroupPicker[contextId=$contextId, groupIds=$groupIds, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'contextId'] = this.contextId;
      json[r'groupIds'] = this.groupIds;
      json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [CustomFieldContextDefaultValueMultipleGroupPicker] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CustomFieldContextDefaultValueMultipleGroupPicker? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'contextId'), 'Required key "CustomFieldContextDefaultValueMultipleGroupPicker[contextId]" is missing from JSON.');
        assert(json[r'contextId'] != null, 'Required key "CustomFieldContextDefaultValueMultipleGroupPicker[contextId]" has a null value in JSON.');
        assert(json.containsKey(r'groupIds'), 'Required key "CustomFieldContextDefaultValueMultipleGroupPicker[groupIds]" is missing from JSON.');
        assert(json[r'groupIds'] != null, 'Required key "CustomFieldContextDefaultValueMultipleGroupPicker[groupIds]" has a null value in JSON.');
        assert(json.containsKey(r'type'), 'Required key "CustomFieldContextDefaultValueMultipleGroupPicker[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "CustomFieldContextDefaultValueMultipleGroupPicker[type]" has a null value in JSON.');
        return true;
      }());

      return CustomFieldContextDefaultValueMultipleGroupPicker(
        contextId: mapValueOfType<String>(json, r'contextId')!,
        groupIds: json[r'groupIds'] is Iterable
            ? (json[r'groupIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        type: mapValueOfType<String>(json, r'type')!,
      );
    }
    return null;
  }

  static List<CustomFieldContextDefaultValueMultipleGroupPicker> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomFieldContextDefaultValueMultipleGroupPicker>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomFieldContextDefaultValueMultipleGroupPicker.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CustomFieldContextDefaultValueMultipleGroupPicker> mapFromJson(dynamic json) {
    final map = <String, CustomFieldContextDefaultValueMultipleGroupPicker>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CustomFieldContextDefaultValueMultipleGroupPicker.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CustomFieldContextDefaultValueMultipleGroupPicker-objects as value to a dart map
  static Map<String, List<CustomFieldContextDefaultValueMultipleGroupPicker>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CustomFieldContextDefaultValueMultipleGroupPicker>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CustomFieldContextDefaultValueMultipleGroupPicker.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'contextId',
    'groupIds',
    'type',
  };
}

