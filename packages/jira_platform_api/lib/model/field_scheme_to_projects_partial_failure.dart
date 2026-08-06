//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FieldSchemeToProjectsPartialFailure {
  /// Returns a new [FieldSchemeToProjectsPartialFailure] instance.
  FieldSchemeToProjectsPartialFailure({
    this.error,
    required this.projectId,
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

  int projectId;

  int schemeId;

  bool success;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FieldSchemeToProjectsPartialFailure &&
    other.error == error &&
    other.projectId == projectId &&
    other.schemeId == schemeId &&
    other.success == success;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (error == null ? 0 : error!.hashCode) +
    (projectId.hashCode) +
    (schemeId.hashCode) +
    (success.hashCode);

  @override
  String toString() => 'FieldSchemeToProjectsPartialFailure[error=$error, projectId=$projectId, schemeId=$schemeId, success=$success]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.error != null) {
      json[r'error'] = this.error;
    } else {
      json[r'error'] = null;
    }
      json[r'projectId'] = this.projectId;
      json[r'schemeId'] = this.schemeId;
      json[r'success'] = this.success;
    return json;
  }

  /// Returns a new [FieldSchemeToProjectsPartialFailure] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FieldSchemeToProjectsPartialFailure? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'projectId'), 'Required key "FieldSchemeToProjectsPartialFailure[projectId]" is missing from JSON.');
        assert(json[r'projectId'] != null, 'Required key "FieldSchemeToProjectsPartialFailure[projectId]" has a null value in JSON.');
        assert(json.containsKey(r'schemeId'), 'Required key "FieldSchemeToProjectsPartialFailure[schemeId]" is missing from JSON.');
        assert(json[r'schemeId'] != null, 'Required key "FieldSchemeToProjectsPartialFailure[schemeId]" has a null value in JSON.');
        assert(json.containsKey(r'success'), 'Required key "FieldSchemeToProjectsPartialFailure[success]" is missing from JSON.');
        assert(json[r'success'] != null, 'Required key "FieldSchemeToProjectsPartialFailure[success]" has a null value in JSON.');
        return true;
      }());

      return FieldSchemeToProjectsPartialFailure(
        error: mapValueOfType<String>(json, r'error'),
        projectId: mapValueOfType<int>(json, r'projectId')!,
        schemeId: mapValueOfType<int>(json, r'schemeId')!,
        success: mapValueOfType<bool>(json, r'success')!,
      );
    }
    return null;
  }

  static List<FieldSchemeToProjectsPartialFailure> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldSchemeToProjectsPartialFailure>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldSchemeToProjectsPartialFailure.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FieldSchemeToProjectsPartialFailure> mapFromJson(dynamic json) {
    final map = <String, FieldSchemeToProjectsPartialFailure>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FieldSchemeToProjectsPartialFailure.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FieldSchemeToProjectsPartialFailure-objects as value to a dart map
  static Map<String, List<FieldSchemeToProjectsPartialFailure>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FieldSchemeToProjectsPartialFailure>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FieldSchemeToProjectsPartialFailure.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'projectId',
    'schemeId',
    'success',
  };
}

