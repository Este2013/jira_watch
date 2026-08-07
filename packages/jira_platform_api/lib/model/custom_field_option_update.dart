//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CustomFieldOptionUpdate {
  /// Returns a new [CustomFieldOptionUpdate] instance.
  CustomFieldOptionUpdate({
    this.disabled,
    required this.id,
    this.value,
  });

  /// Whether the option is disabled.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? disabled;

  /// The ID of the custom field option.
  String id;

  /// The value of the custom field option.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CustomFieldOptionUpdate &&
    other.disabled == disabled &&
    other.id == id &&
    other.value == value;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (disabled == null ? 0 : disabled!.hashCode) +
    (id.hashCode) +
    (value == null ? 0 : value!.hashCode);

  @override
  String toString() => 'CustomFieldOptionUpdate[disabled=$disabled, id=$id, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.disabled != null) {
      json[r'disabled'] = this.disabled;
    } else {
      json[r'disabled'] = null;
    }
      json[r'id'] = this.id;
    if (this.value != null) {
      json[r'value'] = this.value;
    } else {
      json[r'value'] = null;
    }
    return json;
  }

  /// Returns a new [CustomFieldOptionUpdate] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CustomFieldOptionUpdate? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "CustomFieldOptionUpdate[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "CustomFieldOptionUpdate[id]" has a null value in JSON.');
        return true;
      }());

      return CustomFieldOptionUpdate(
        disabled: mapValueOfType<bool>(json, r'disabled'),
        id: mapValueOfType<String>(json, r'id')!,
        value: mapValueOfType<String>(json, r'value'),
      );
    }
    return null;
  }

  static List<CustomFieldOptionUpdate> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomFieldOptionUpdate>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomFieldOptionUpdate.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CustomFieldOptionUpdate> mapFromJson(dynamic json) {
    final map = <String, CustomFieldOptionUpdate>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CustomFieldOptionUpdate.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CustomFieldOptionUpdate-objects as value to a dart map
  static Map<String, List<CustomFieldOptionUpdate>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CustomFieldOptionUpdate>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CustomFieldOptionUpdate.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
  };
}

