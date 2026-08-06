//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CustomFieldContextDefaultValueMultipleVersionPicker {
  /// Returns a new [CustomFieldContextDefaultValueMultipleVersionPicker] instance.
  CustomFieldContextDefaultValueMultipleVersionPicker({
    required this.contextId,
    required this.type,
    this.versionIds = const [],
    this.versionOrder,
  });

  /// The ID of the context.
  String contextId;

  String type;

  /// The IDs of the default versions.
  List<String> versionIds;

  /// The order the pickable versions are displayed in. If not provided, the released-first order is used. Available version orders are `\"releasedFirst\"` and `\"unreleasedFirst\"`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? versionOrder;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CustomFieldContextDefaultValueMultipleVersionPicker &&
    other.contextId == contextId &&
    other.type == type &&
    _deepEquality.equals(other.versionIds, versionIds) &&
    other.versionOrder == versionOrder;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (contextId.hashCode) +
    (type.hashCode) +
    (versionIds.hashCode) +
    (versionOrder == null ? 0 : versionOrder!.hashCode);

  @override
  String toString() => 'CustomFieldContextDefaultValueMultipleVersionPicker[contextId=$contextId, type=$type, versionIds=$versionIds, versionOrder=$versionOrder]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'contextId'] = this.contextId;
      json[r'type'] = this.type;
      json[r'versionIds'] = this.versionIds;
    if (this.versionOrder != null) {
      json[r'versionOrder'] = this.versionOrder;
    } else {
      json[r'versionOrder'] = null;
    }
    return json;
  }

  /// Returns a new [CustomFieldContextDefaultValueMultipleVersionPicker] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CustomFieldContextDefaultValueMultipleVersionPicker? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'contextId'), 'Required key "CustomFieldContextDefaultValueMultipleVersionPicker[contextId]" is missing from JSON.');
        assert(json[r'contextId'] != null, 'Required key "CustomFieldContextDefaultValueMultipleVersionPicker[contextId]" has a null value in JSON.');
        assert(json.containsKey(r'type'), 'Required key "CustomFieldContextDefaultValueMultipleVersionPicker[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "CustomFieldContextDefaultValueMultipleVersionPicker[type]" has a null value in JSON.');
        assert(json.containsKey(r'versionIds'), 'Required key "CustomFieldContextDefaultValueMultipleVersionPicker[versionIds]" is missing from JSON.');
        assert(json[r'versionIds'] != null, 'Required key "CustomFieldContextDefaultValueMultipleVersionPicker[versionIds]" has a null value in JSON.');
        return true;
      }());

      return CustomFieldContextDefaultValueMultipleVersionPicker(
        contextId: mapValueOfType<String>(json, r'contextId')!,
        type: mapValueOfType<String>(json, r'type')!,
        versionIds: json[r'versionIds'] is Iterable
            ? (json[r'versionIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        versionOrder: mapValueOfType<String>(json, r'versionOrder'),
      );
    }
    return null;
  }

  static List<CustomFieldContextDefaultValueMultipleVersionPicker> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomFieldContextDefaultValueMultipleVersionPicker>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomFieldContextDefaultValueMultipleVersionPicker.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CustomFieldContextDefaultValueMultipleVersionPicker> mapFromJson(dynamic json) {
    final map = <String, CustomFieldContextDefaultValueMultipleVersionPicker>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CustomFieldContextDefaultValueMultipleVersionPicker.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CustomFieldContextDefaultValueMultipleVersionPicker-objects as value to a dart map
  static Map<String, List<CustomFieldContextDefaultValueMultipleVersionPicker>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CustomFieldContextDefaultValueMultipleVersionPicker>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CustomFieldContextDefaultValueMultipleVersionPicker.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'contextId',
    'type',
    'versionIds',
  };
}

