//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CustomFieldContextDefaultValueForgeUserField {
  /// Returns a new [CustomFieldContextDefaultValueForgeUserField] instance.
  CustomFieldContextDefaultValueForgeUserField({
    required this.accountId,
    required this.contextId,
    required this.type,
    required this.userFilter,
  });

  /// The ID of the default user.
  String accountId;

  /// The ID of the context.
  String contextId;

  String type;

  UserFilter userFilter;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CustomFieldContextDefaultValueForgeUserField &&
    other.accountId == accountId &&
    other.contextId == contextId &&
    other.type == type &&
    other.userFilter == userFilter;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (accountId.hashCode) +
    (contextId.hashCode) +
    (type.hashCode) +
    (userFilter.hashCode);

  @override
  String toString() => 'CustomFieldContextDefaultValueForgeUserField[accountId=$accountId, contextId=$contextId, type=$type, userFilter=$userFilter]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'accountId'] = this.accountId;
      json[r'contextId'] = this.contextId;
      json[r'type'] = this.type;
      json[r'userFilter'] = this.userFilter;
    return json;
  }

  /// Returns a new [CustomFieldContextDefaultValueForgeUserField] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CustomFieldContextDefaultValueForgeUserField? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'accountId'), 'Required key "CustomFieldContextDefaultValueForgeUserField[accountId]" is missing from JSON.');
        assert(json[r'accountId'] != null, 'Required key "CustomFieldContextDefaultValueForgeUserField[accountId]" has a null value in JSON.');
        assert(json.containsKey(r'contextId'), 'Required key "CustomFieldContextDefaultValueForgeUserField[contextId]" is missing from JSON.');
        assert(json[r'contextId'] != null, 'Required key "CustomFieldContextDefaultValueForgeUserField[contextId]" has a null value in JSON.');
        assert(json.containsKey(r'type'), 'Required key "CustomFieldContextDefaultValueForgeUserField[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "CustomFieldContextDefaultValueForgeUserField[type]" has a null value in JSON.');
        assert(json.containsKey(r'userFilter'), 'Required key "CustomFieldContextDefaultValueForgeUserField[userFilter]" is missing from JSON.');
        assert(json[r'userFilter'] != null, 'Required key "CustomFieldContextDefaultValueForgeUserField[userFilter]" has a null value in JSON.');
        return true;
      }());

      return CustomFieldContextDefaultValueForgeUserField(
        accountId: mapValueOfType<String>(json, r'accountId')!,
        contextId: mapValueOfType<String>(json, r'contextId')!,
        type: mapValueOfType<String>(json, r'type')!,
        userFilter: UserFilter.fromJson(json[r'userFilter'])!,
      );
    }
    return null;
  }

  static List<CustomFieldContextDefaultValueForgeUserField> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomFieldContextDefaultValueForgeUserField>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomFieldContextDefaultValueForgeUserField.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CustomFieldContextDefaultValueForgeUserField> mapFromJson(dynamic json) {
    final map = <String, CustomFieldContextDefaultValueForgeUserField>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CustomFieldContextDefaultValueForgeUserField.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CustomFieldContextDefaultValueForgeUserField-objects as value to a dart map
  static Map<String, List<CustomFieldContextDefaultValueForgeUserField>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CustomFieldContextDefaultValueForgeUserField>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CustomFieldContextDefaultValueForgeUserField.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'accountId',
    'contextId',
    'type',
    'userFilter',
  };
}

