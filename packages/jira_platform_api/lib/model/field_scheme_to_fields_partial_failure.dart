//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FieldSchemeToFieldsPartialFailure {
  /// Returns a new [FieldSchemeToFieldsPartialFailure] instance.
  FieldSchemeToFieldsPartialFailure({
    this.error,
    required this.fieldId,
    required this.schemeId,
    required this.success,
    this.workTypeIds = const [],
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

  List<int> workTypeIds;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FieldSchemeToFieldsPartialFailure &&
    other.error == error &&
    other.fieldId == fieldId &&
    other.schemeId == schemeId &&
    other.success == success &&
    _deepEquality.equals(other.workTypeIds, workTypeIds);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (error == null ? 0 : error!.hashCode) +
    (fieldId.hashCode) +
    (schemeId.hashCode) +
    (success.hashCode) +
    (workTypeIds.hashCode);

  @override
  String toString() => 'FieldSchemeToFieldsPartialFailure[error=$error, fieldId=$fieldId, schemeId=$schemeId, success=$success, workTypeIds=$workTypeIds]';

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
      json[r'workTypeIds'] = this.workTypeIds;
    return json;
  }

  /// Returns a new [FieldSchemeToFieldsPartialFailure] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FieldSchemeToFieldsPartialFailure? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'fieldId'), 'Required key "FieldSchemeToFieldsPartialFailure[fieldId]" is missing from JSON.');
        assert(json[r'fieldId'] != null, 'Required key "FieldSchemeToFieldsPartialFailure[fieldId]" has a null value in JSON.');
        assert(json.containsKey(r'schemeId'), 'Required key "FieldSchemeToFieldsPartialFailure[schemeId]" is missing from JSON.');
        assert(json[r'schemeId'] != null, 'Required key "FieldSchemeToFieldsPartialFailure[schemeId]" has a null value in JSON.');
        assert(json.containsKey(r'success'), 'Required key "FieldSchemeToFieldsPartialFailure[success]" is missing from JSON.');
        assert(json[r'success'] != null, 'Required key "FieldSchemeToFieldsPartialFailure[success]" has a null value in JSON.');
        assert(json.containsKey(r'workTypeIds'), 'Required key "FieldSchemeToFieldsPartialFailure[workTypeIds]" is missing from JSON.');
        assert(json[r'workTypeIds'] != null, 'Required key "FieldSchemeToFieldsPartialFailure[workTypeIds]" has a null value in JSON.');
        return true;
      }());

      return FieldSchemeToFieldsPartialFailure(
        error: mapValueOfType<String>(json, r'error'),
        fieldId: mapValueOfType<String>(json, r'fieldId')!,
        schemeId: mapValueOfType<int>(json, r'schemeId')!,
        success: mapValueOfType<bool>(json, r'success')!,
        workTypeIds: json[r'workTypeIds'] is Iterable
            ? (json[r'workTypeIds'] as Iterable).cast<int>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<FieldSchemeToFieldsPartialFailure> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldSchemeToFieldsPartialFailure>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldSchemeToFieldsPartialFailure.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FieldSchemeToFieldsPartialFailure> mapFromJson(dynamic json) {
    final map = <String, FieldSchemeToFieldsPartialFailure>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FieldSchemeToFieldsPartialFailure.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FieldSchemeToFieldsPartialFailure-objects as value to a dart map
  static Map<String, List<FieldSchemeToFieldsPartialFailure>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FieldSchemeToFieldsPartialFailure>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FieldSchemeToFieldsPartialFailure.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'fieldId',
    'schemeId',
    'success',
    'workTypeIds',
  };
}

