//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetProjectsWithFieldSchemesResponse {
  /// Returns a new [GetProjectsWithFieldSchemesResponse] instance.
  GetProjectsWithFieldSchemesResponse({
    this.projectId,
    this.schemeId,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? projectId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? schemeId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetProjectsWithFieldSchemesResponse &&
    other.projectId == projectId &&
    other.schemeId == schemeId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (projectId == null ? 0 : projectId!.hashCode) +
    (schemeId == null ? 0 : schemeId!.hashCode);

  @override
  String toString() => 'GetProjectsWithFieldSchemesResponse[projectId=$projectId, schemeId=$schemeId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.projectId != null) {
      json[r'projectId'] = this.projectId;
    } else {
      json[r'projectId'] = null;
    }
    if (this.schemeId != null) {
      json[r'schemeId'] = this.schemeId;
    } else {
      json[r'schemeId'] = null;
    }
    return json;
  }

  /// Returns a new [GetProjectsWithFieldSchemesResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetProjectsWithFieldSchemesResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return GetProjectsWithFieldSchemesResponse(
        projectId: mapValueOfType<int>(json, r'projectId'),
        schemeId: mapValueOfType<int>(json, r'schemeId'),
      );
    }
    return null;
  }

  static List<GetProjectsWithFieldSchemesResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetProjectsWithFieldSchemesResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetProjectsWithFieldSchemesResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetProjectsWithFieldSchemesResponse> mapFromJson(dynamic json) {
    final map = <String, GetProjectsWithFieldSchemesResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetProjectsWithFieldSchemesResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetProjectsWithFieldSchemesResponse-objects as value to a dart map
  static Map<String, List<GetProjectsWithFieldSchemesResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetProjectsWithFieldSchemesResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetProjectsWithFieldSchemesResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

