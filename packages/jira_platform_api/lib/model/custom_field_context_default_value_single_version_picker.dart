//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CustomFieldContextDefaultValueSingleVersionPicker {
  /// Returns a new [CustomFieldContextDefaultValueSingleVersionPicker] instance.
  CustomFieldContextDefaultValueSingleVersionPicker({
    required this.contextId,
    required this.type,
    required this.versionId,
    this.versionOrder,
  });

  /// The ID of the context.
  String contextId;

  String type;

  /// The ID of the default version.
  String versionId;

  /// The order the pickable versions are displayed in. If not provided, the released-first order is used. Available version orders are `\"releasedFirst\"` and `\"unreleasedFirst\"`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? versionOrder;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CustomFieldContextDefaultValueSingleVersionPicker &&
    other.contextId == contextId &&
    other.type == type &&
    other.versionId == versionId &&
    other.versionOrder == versionOrder;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (contextId.hashCode) +
    (type.hashCode) +
    (versionId.hashCode) +
    (versionOrder == null ? 0 : versionOrder!.hashCode);

  @override
  String toString() => 'CustomFieldContextDefaultValueSingleVersionPicker[contextId=$contextId, type=$type, versionId=$versionId, versionOrder=$versionOrder]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'contextId'] = this.contextId;
      json[r'type'] = this.type;
      json[r'versionId'] = this.versionId;
    if (this.versionOrder != null) {
      json[r'versionOrder'] = this.versionOrder;
    } else {
      json[r'versionOrder'] = null;
    }
    return json;
  }

  /// Returns a new [CustomFieldContextDefaultValueSingleVersionPicker] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CustomFieldContextDefaultValueSingleVersionPicker? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'contextId'), 'Required key "CustomFieldContextDefaultValueSingleVersionPicker[contextId]" is missing from JSON.');
        assert(json[r'contextId'] != null, 'Required key "CustomFieldContextDefaultValueSingleVersionPicker[contextId]" has a null value in JSON.');
        assert(json.containsKey(r'type'), 'Required key "CustomFieldContextDefaultValueSingleVersionPicker[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "CustomFieldContextDefaultValueSingleVersionPicker[type]" has a null value in JSON.');
        assert(json.containsKey(r'versionId'), 'Required key "CustomFieldContextDefaultValueSingleVersionPicker[versionId]" is missing from JSON.');
        assert(json[r'versionId'] != null, 'Required key "CustomFieldContextDefaultValueSingleVersionPicker[versionId]" has a null value in JSON.');
        return true;
      }());

      return CustomFieldContextDefaultValueSingleVersionPicker(
        contextId: mapValueOfType<String>(json, r'contextId')!,
        type: mapValueOfType<String>(json, r'type')!,
        versionId: mapValueOfType<String>(json, r'versionId')!,
        versionOrder: mapValueOfType<String>(json, r'versionOrder'),
      );
    }
    return null;
  }

  static List<CustomFieldContextDefaultValueSingleVersionPicker> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomFieldContextDefaultValueSingleVersionPicker>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomFieldContextDefaultValueSingleVersionPicker.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CustomFieldContextDefaultValueSingleVersionPicker> mapFromJson(dynamic json) {
    final map = <String, CustomFieldContextDefaultValueSingleVersionPicker>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CustomFieldContextDefaultValueSingleVersionPicker.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CustomFieldContextDefaultValueSingleVersionPicker-objects as value to a dart map
  static Map<String, List<CustomFieldContextDefaultValueSingleVersionPicker>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CustomFieldContextDefaultValueSingleVersionPicker>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CustomFieldContextDefaultValueSingleVersionPicker.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'contextId',
    'type',
    'versionId',
  };
}

