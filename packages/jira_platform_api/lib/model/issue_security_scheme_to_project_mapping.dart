//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueSecuritySchemeToProjectMapping {
  /// Returns a new [IssueSecuritySchemeToProjectMapping] instance.
  IssueSecuritySchemeToProjectMapping({
    this.issueSecuritySchemeId,
    this.projectId,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? issueSecuritySchemeId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? projectId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueSecuritySchemeToProjectMapping &&
    other.issueSecuritySchemeId == issueSecuritySchemeId &&
    other.projectId == projectId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (issueSecuritySchemeId == null ? 0 : issueSecuritySchemeId!.hashCode) +
    (projectId == null ? 0 : projectId!.hashCode);

  @override
  String toString() => 'IssueSecuritySchemeToProjectMapping[issueSecuritySchemeId=$issueSecuritySchemeId, projectId=$projectId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.issueSecuritySchemeId != null) {
      json[r'issueSecuritySchemeId'] = this.issueSecuritySchemeId;
    } else {
      json[r'issueSecuritySchemeId'] = null;
    }
    if (this.projectId != null) {
      json[r'projectId'] = this.projectId;
    } else {
      json[r'projectId'] = null;
    }
    return json;
  }

  /// Returns a new [IssueSecuritySchemeToProjectMapping] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueSecuritySchemeToProjectMapping? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return IssueSecuritySchemeToProjectMapping(
        issueSecuritySchemeId: mapValueOfType<String>(json, r'issueSecuritySchemeId'),
        projectId: mapValueOfType<String>(json, r'projectId'),
      );
    }
    return null;
  }

  static List<IssueSecuritySchemeToProjectMapping> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueSecuritySchemeToProjectMapping>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueSecuritySchemeToProjectMapping.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueSecuritySchemeToProjectMapping> mapFromJson(dynamic json) {
    final map = <String, IssueSecuritySchemeToProjectMapping>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueSecuritySchemeToProjectMapping.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueSecuritySchemeToProjectMapping-objects as value to a dart map
  static Map<String, List<IssueSecuritySchemeToProjectMapping>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueSecuritySchemeToProjectMapping>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueSecuritySchemeToProjectMapping.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

