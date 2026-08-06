//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueTypeSchemeProjectAssociation {
  /// Returns a new [IssueTypeSchemeProjectAssociation] instance.
  IssueTypeSchemeProjectAssociation({
    required this.issueTypeSchemeId,
    required this.projectId,
  });

  /// The ID of the issue type scheme.
  String issueTypeSchemeId;

  /// The ID of the project.
  String projectId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueTypeSchemeProjectAssociation &&
    other.issueTypeSchemeId == issueTypeSchemeId &&
    other.projectId == projectId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (issueTypeSchemeId.hashCode) +
    (projectId.hashCode);

  @override
  String toString() => 'IssueTypeSchemeProjectAssociation[issueTypeSchemeId=$issueTypeSchemeId, projectId=$projectId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'issueTypeSchemeId'] = this.issueTypeSchemeId;
      json[r'projectId'] = this.projectId;
    return json;
  }

  /// Returns a new [IssueTypeSchemeProjectAssociation] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueTypeSchemeProjectAssociation? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'issueTypeSchemeId'), 'Required key "IssueTypeSchemeProjectAssociation[issueTypeSchemeId]" is missing from JSON.');
        assert(json[r'issueTypeSchemeId'] != null, 'Required key "IssueTypeSchemeProjectAssociation[issueTypeSchemeId]" has a null value in JSON.');
        assert(json.containsKey(r'projectId'), 'Required key "IssueTypeSchemeProjectAssociation[projectId]" is missing from JSON.');
        assert(json[r'projectId'] != null, 'Required key "IssueTypeSchemeProjectAssociation[projectId]" has a null value in JSON.');
        return true;
      }());

      return IssueTypeSchemeProjectAssociation(
        issueTypeSchemeId: mapValueOfType<String>(json, r'issueTypeSchemeId')!,
        projectId: mapValueOfType<String>(json, r'projectId')!,
      );
    }
    return null;
  }

  static List<IssueTypeSchemeProjectAssociation> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueTypeSchemeProjectAssociation>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueTypeSchemeProjectAssociation.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueTypeSchemeProjectAssociation> mapFromJson(dynamic json) {
    final map = <String, IssueTypeSchemeProjectAssociation>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueTypeSchemeProjectAssociation.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueTypeSchemeProjectAssociation-objects as value to a dart map
  static Map<String, List<IssueTypeSchemeProjectAssociation>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueTypeSchemeProjectAssociation>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueTypeSchemeProjectAssociation.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'issueTypeSchemeId',
    'projectId',
  };
}

