//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CustomFieldContextDefaultValueMultiUserPicker {
  /// Returns a new [CustomFieldContextDefaultValueMultiUserPicker] instance.
  CustomFieldContextDefaultValueMultiUserPicker({
    this.accountIds = const [],
    required this.contextId,
    required this.type,
  });

  /// The IDs of the default users.
  List<String> accountIds;

  /// The ID of the context.
  String contextId;

  String type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CustomFieldContextDefaultValueMultiUserPicker &&
    _deepEquality.equals(other.accountIds, accountIds) &&
    other.contextId == contextId &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (accountIds.hashCode) +
    (contextId.hashCode) +
    (type.hashCode);

  @override
  String toString() => 'CustomFieldContextDefaultValueMultiUserPicker[accountIds=$accountIds, contextId=$contextId, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'accountIds'] = this.accountIds;
      json[r'contextId'] = this.contextId;
      json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [CustomFieldContextDefaultValueMultiUserPicker] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CustomFieldContextDefaultValueMultiUserPicker? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'accountIds'), 'Required key "CustomFieldContextDefaultValueMultiUserPicker[accountIds]" is missing from JSON.');
        assert(json[r'accountIds'] != null, 'Required key "CustomFieldContextDefaultValueMultiUserPicker[accountIds]" has a null value in JSON.');
        assert(json.containsKey(r'contextId'), 'Required key "CustomFieldContextDefaultValueMultiUserPicker[contextId]" is missing from JSON.');
        assert(json[r'contextId'] != null, 'Required key "CustomFieldContextDefaultValueMultiUserPicker[contextId]" has a null value in JSON.');
        assert(json.containsKey(r'type'), 'Required key "CustomFieldContextDefaultValueMultiUserPicker[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "CustomFieldContextDefaultValueMultiUserPicker[type]" has a null value in JSON.');
        return true;
      }());

      return CustomFieldContextDefaultValueMultiUserPicker(
        accountIds: json[r'accountIds'] is Iterable
            ? (json[r'accountIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        contextId: mapValueOfType<String>(json, r'contextId')!,
        type: mapValueOfType<String>(json, r'type')!,
      );
    }
    return null;
  }

  static List<CustomFieldContextDefaultValueMultiUserPicker> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomFieldContextDefaultValueMultiUserPicker>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomFieldContextDefaultValueMultiUserPicker.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CustomFieldContextDefaultValueMultiUserPicker> mapFromJson(dynamic json) {
    final map = <String, CustomFieldContextDefaultValueMultiUserPicker>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CustomFieldContextDefaultValueMultiUserPicker.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CustomFieldContextDefaultValueMultiUserPicker-objects as value to a dart map
  static Map<String, List<CustomFieldContextDefaultValueMultiUserPicker>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CustomFieldContextDefaultValueMultiUserPicker>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CustomFieldContextDefaultValueMultiUserPicker.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'accountIds',
    'contextId',
    'type',
  };
}

