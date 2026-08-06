//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class MinimalFieldSchemeToFieldsPartialFailure {
  /// Returns a new [MinimalFieldSchemeToFieldsPartialFailure] instance.
  MinimalFieldSchemeToFieldsPartialFailure({
    this.error,
    required this.fieldId,
    required this.schemeId,
    required this.success,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? error;

  String fieldId;

  int schemeId;

  bool success;

  @override
  bool operator ==(Object other) => identical(this, other) || other is MinimalFieldSchemeToFieldsPartialFailure &&
    other.error == error &&
    other.fieldId == fieldId &&
    other.schemeId == schemeId &&
    other.success == success;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (error == null ? 0 : error!.hashCode) +
    (fieldId.hashCode) +
    (schemeId.hashCode) +
    (success.hashCode);

  @override
  String toString() => 'MinimalFieldSchemeToFieldsPartialFailure[error=$error, fieldId=$fieldId, schemeId=$schemeId, success=$success]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.error != null) {
      json[r'error'] = this.error;
    } else {
      json[r'error'] = null;
    }
      json[r'fieldId'] = this.fieldId;
      json[r'schemeId'] = this.schemeId;
      json[r'success'] = this.success;
    return json;
  }

  /// Returns a new [MinimalFieldSchemeToFieldsPartialFailure] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static MinimalFieldSchemeToFieldsPartialFailure? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'fieldId'), 'Required key "MinimalFieldSchemeToFieldsPartialFailure[fieldId]" is missing from JSON.');
        assert(json[r'fieldId'] != null, 'Required key "MinimalFieldSchemeToFieldsPartialFailure[fieldId]" has a null value in JSON.');
        assert(json.containsKey(r'schemeId'), 'Required key "MinimalFieldSchemeToFieldsPartialFailure[schemeId]" is missing from JSON.');
        assert(json[r'schemeId'] != null, 'Required key "MinimalFieldSchemeToFieldsPartialFailure[schemeId]" has a null value in JSON.');
        assert(json.containsKey(r'success'), 'Required key "MinimalFieldSchemeToFieldsPartialFailure[success]" is missing from JSON.');
        assert(json[r'success'] != null, 'Required key "MinimalFieldSchemeToFieldsPartialFailure[success]" has a null value in JSON.');
        return true;
      }());

      return MinimalFieldSchemeToFieldsPartialFailure(
        error: mapValueOfType<String>(json, r'error'),
        fieldId: mapValueOfType<String>(json, r'fieldId')!,
        schemeId: mapValueOfType<int>(json, r'schemeId')!,
        success: mapValueOfType<bool>(json, r'success')!,
      );
    }
    return null;
  }

  static List<MinimalFieldSchemeToFieldsPartialFailure> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <MinimalFieldSchemeToFieldsPartialFailure>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MinimalFieldSchemeToFieldsPartialFailure.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, MinimalFieldSchemeToFieldsPartialFailure> mapFromJson(dynamic json) {
    final map = <String, MinimalFieldSchemeToFieldsPartialFailure>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MinimalFieldSchemeToFieldsPartialFailure.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of MinimalFieldSchemeToFieldsPartialFailure-objects as value to a dart map
  static Map<String, List<MinimalFieldSchemeToFieldsPartialFailure>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<MinimalFieldSchemeToFieldsPartialFailure>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = MinimalFieldSchemeToFieldsPartialFailure.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'fieldId',
    'schemeId',
    'success',
  };
}

