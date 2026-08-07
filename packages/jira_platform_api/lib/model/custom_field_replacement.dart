//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CustomFieldReplacement {
  /// Returns a new [CustomFieldReplacement] instance.
  CustomFieldReplacement({
    this.customFieldId,
    this.moveTo,
  });

  /// The ID of the custom field in which to replace the version number.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? customFieldId;

  /// The version number to use as a replacement for the deleted version.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? moveTo;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CustomFieldReplacement &&
    other.customFieldId == customFieldId &&
    other.moveTo == moveTo;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (customFieldId == null ? 0 : customFieldId!.hashCode) +
    (moveTo == null ? 0 : moveTo!.hashCode);

  @override
  String toString() => 'CustomFieldReplacement[customFieldId=$customFieldId, moveTo=$moveTo]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.customFieldId != null) {
      json[r'customFieldId'] = this.customFieldId;
    } else {
      json[r'customFieldId'] = null;
    }
    if (this.moveTo != null) {
      json[r'moveTo'] = this.moveTo;
    } else {
      json[r'moveTo'] = null;
    }
    return json;
  }

  /// Returns a new [CustomFieldReplacement] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CustomFieldReplacement? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return CustomFieldReplacement(
        customFieldId: mapValueOfType<int>(json, r'customFieldId'),
        moveTo: mapValueOfType<int>(json, r'moveTo'),
      );
    }
    return null;
  }

  static List<CustomFieldReplacement> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomFieldReplacement>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomFieldReplacement.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CustomFieldReplacement> mapFromJson(dynamic json) {
    final map = <String, CustomFieldReplacement>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CustomFieldReplacement.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CustomFieldReplacement-objects as value to a dart map
  static Map<String, List<CustomFieldReplacement>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CustomFieldReplacement>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CustomFieldReplacement.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

