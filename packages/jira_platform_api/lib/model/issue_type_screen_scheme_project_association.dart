//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueTypeScreenSchemeProjectAssociation {
  /// Returns a new [IssueTypeScreenSchemeProjectAssociation] instance.
  IssueTypeScreenSchemeProjectAssociation({
    this.issueTypeScreenSchemeId,
    this.projectId,
  });

  /// The ID of the issue type screen scheme.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? issueTypeScreenSchemeId;

  /// The ID of the project.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? projectId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueTypeScreenSchemeProjectAssociation &&
    other.issueTypeScreenSchemeId == issueTypeScreenSchemeId &&
    other.projectId == projectId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (issueTypeScreenSchemeId == null ? 0 : issueTypeScreenSchemeId!.hashCode) +
    (projectId == null ? 0 : projectId!.hashCode);

  @override
  String toString() => 'IssueTypeScreenSchemeProjectAssociation[issueTypeScreenSchemeId=$issueTypeScreenSchemeId, projectId=$projectId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.issueTypeScreenSchemeId != null) {
      json[r'issueTypeScreenSchemeId'] = this.issueTypeScreenSchemeId;
    } else {
      json[r'issueTypeScreenSchemeId'] = null;
    }
    if (this.projectId != null) {
      json[r'projectId'] = this.projectId;
    } else {
      json[r'projectId'] = null;
    }
    return json;
  }

  /// Returns a new [IssueTypeScreenSchemeProjectAssociation] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueTypeScreenSchemeProjectAssociation? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return IssueTypeScreenSchemeProjectAssociation(
        issueTypeScreenSchemeId: mapValueOfType<String>(json, r'issueTypeScreenSchemeId'),
        projectId: mapValueOfType<String>(json, r'projectId'),
      );
    }
    return null;
  }

  static List<IssueTypeScreenSchemeProjectAssociation> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueTypeScreenSchemeProjectAssociation>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueTypeScreenSchemeProjectAssociation.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueTypeScreenSchemeProjectAssociation> mapFromJson(dynamic json) {
    final map = <String, IssueTypeScreenSchemeProjectAssociation>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueTypeScreenSchemeProjectAssociation.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueTypeScreenSchemeProjectAssociation-objects as value to a dart map
  static Map<String, List<IssueTypeScreenSchemeProjectAssociation>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueTypeScreenSchemeProjectAssociation>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueTypeScreenSchemeProjectAssociation.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

