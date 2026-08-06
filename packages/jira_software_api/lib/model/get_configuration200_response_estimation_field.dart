//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetConfiguration200ResponseEstimationField {
  /// Returns a new [GetConfiguration200ResponseEstimationField] instance.
  GetConfiguration200ResponseEstimationField({
    this.displayName,
    this.fieldId,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? displayName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? fieldId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetConfiguration200ResponseEstimationField &&
    other.displayName == displayName &&
    other.fieldId == fieldId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (displayName == null ? 0 : displayName!.hashCode) +
    (fieldId == null ? 0 : fieldId!.hashCode);

  @override
  String toString() => 'GetConfiguration200ResponseEstimationField[displayName=$displayName, fieldId=$fieldId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.displayName != null) {
      json[r'displayName'] = this.displayName;
    } else {
      json[r'displayName'] = null;
    }
    if (this.fieldId != null) {
      json[r'fieldId'] = this.fieldId;
    } else {
      json[r'fieldId'] = null;
    }
    return json;
  }

  /// Returns a new [GetConfiguration200ResponseEstimationField] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetConfiguration200ResponseEstimationField? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return GetConfiguration200ResponseEstimationField(
        displayName: mapValueOfType<String>(json, r'displayName'),
        fieldId: mapValueOfType<String>(json, r'fieldId'),
      );
    }
    return null;
  }

  static List<GetConfiguration200ResponseEstimationField> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetConfiguration200ResponseEstimationField>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetConfiguration200ResponseEstimationField.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetConfiguration200ResponseEstimationField> mapFromJson(dynamic json) {
    final map = <String, GetConfiguration200ResponseEstimationField>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetConfiguration200ResponseEstimationField.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetConfiguration200ResponseEstimationField-objects as value to a dart map
  static Map<String, List<GetConfiguration200ResponseEstimationField>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetConfiguration200ResponseEstimationField>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetConfiguration200ResponseEstimationField.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

