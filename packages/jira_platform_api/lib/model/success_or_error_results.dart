//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SuccessOrErrorResults {
  /// Returns a new [SuccessOrErrorResults] instance.
  SuccessOrErrorResults({
    this.error,
    this.fieldId,
    this.schemeId,
    this.success,
    this.workTypeIds = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  RemoveFieldParametersResultError? error;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? fieldId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? schemeId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? success;

  List<int> workTypeIds;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SuccessOrErrorResults &&
    other.error == error &&
    other.fieldId == fieldId &&
    other.schemeId == schemeId &&
    other.success == success &&
    _deepEquality.equals(other.workTypeIds, workTypeIds);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (error == null ? 0 : error!.hashCode) +
    (fieldId == null ? 0 : fieldId!.hashCode) +
    (schemeId == null ? 0 : schemeId!.hashCode) +
    (success == null ? 0 : success!.hashCode) +
    (workTypeIds.hashCode);

  @override
  String toString() => 'SuccessOrErrorResults[error=$error, fieldId=$fieldId, schemeId=$schemeId, success=$success, workTypeIds=$workTypeIds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.error != null) {
      json[r'error'] = this.error;
    } else {
      json[r'error'] = null;
    }
    if (this.fieldId != null) {
      json[r'fieldId'] = this.fieldId;
    } else {
      json[r'fieldId'] = null;
    }
    if (this.schemeId != null) {
      json[r'schemeId'] = this.schemeId;
    } else {
      json[r'schemeId'] = null;
    }
    if (this.success != null) {
      json[r'success'] = this.success;
    } else {
      json[r'success'] = null;
    }
      json[r'workTypeIds'] = this.workTypeIds;
    return json;
  }

  /// Returns a new [SuccessOrErrorResults] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SuccessOrErrorResults? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return SuccessOrErrorResults(
        error: RemoveFieldParametersResultError.fromJson(json[r'error']),
        fieldId: mapValueOfType<String>(json, r'fieldId'),
        schemeId: mapValueOfType<int>(json, r'schemeId'),
        success: mapValueOfType<bool>(json, r'success'),
        workTypeIds: json[r'workTypeIds'] is Iterable
            ? (json[r'workTypeIds'] as Iterable).cast<int>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<SuccessOrErrorResults> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SuccessOrErrorResults>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SuccessOrErrorResults.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SuccessOrErrorResults> mapFromJson(dynamic json) {
    final map = <String, SuccessOrErrorResults>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SuccessOrErrorResults.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SuccessOrErrorResults-objects as value to a dart map
  static Map<String, List<SuccessOrErrorResults>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SuccessOrErrorResults>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SuccessOrErrorResults.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

