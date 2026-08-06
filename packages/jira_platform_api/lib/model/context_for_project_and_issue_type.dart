//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ContextForProjectAndIssueType {
  /// Returns a new [ContextForProjectAndIssueType] instance.
  ContextForProjectAndIssueType({
    required this.contextId,
    required this.issueTypeId,
    required this.projectId,
  });

  /// The ID of the custom field context.
  String contextId;

  /// The ID of the issue type.
  String issueTypeId;

  /// The ID of the project.
  String projectId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ContextForProjectAndIssueType &&
    other.contextId == contextId &&
    other.issueTypeId == issueTypeId &&
    other.projectId == projectId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (contextId.hashCode) +
    (issueTypeId.hashCode) +
    (projectId.hashCode);

  @override
  String toString() => 'ContextForProjectAndIssueType[contextId=$contextId, issueTypeId=$issueTypeId, projectId=$projectId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'contextId'] = this.contextId;
      json[r'issueTypeId'] = this.issueTypeId;
      json[r'projectId'] = this.projectId;
    return json;
  }

  /// Returns a new [ContextForProjectAndIssueType] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ContextForProjectAndIssueType? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'contextId'), 'Required key "ContextForProjectAndIssueType[contextId]" is missing from JSON.');
        assert(json[r'contextId'] != null, 'Required key "ContextForProjectAndIssueType[contextId]" has a null value in JSON.');
        assert(json.containsKey(r'issueTypeId'), 'Required key "ContextForProjectAndIssueType[issueTypeId]" is missing from JSON.');
        assert(json[r'issueTypeId'] != null, 'Required key "ContextForProjectAndIssueType[issueTypeId]" has a null value in JSON.');
        assert(json.containsKey(r'projectId'), 'Required key "ContextForProjectAndIssueType[projectId]" is missing from JSON.');
        assert(json[r'projectId'] != null, 'Required key "ContextForProjectAndIssueType[projectId]" has a null value in JSON.');
        return true;
      }());

      return ContextForProjectAndIssueType(
        contextId: mapValueOfType<String>(json, r'contextId')!,
        issueTypeId: mapValueOfType<String>(json, r'issueTypeId')!,
        projectId: mapValueOfType<String>(json, r'projectId')!,
      );
    }
    return null;
  }

  static List<ContextForProjectAndIssueType> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ContextForProjectAndIssueType>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ContextForProjectAndIssueType.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ContextForProjectAndIssueType> mapFromJson(dynamic json) {
    final map = <String, ContextForProjectAndIssueType>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ContextForProjectAndIssueType.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ContextForProjectAndIssueType-objects as value to a dart map
  static Map<String, List<ContextForProjectAndIssueType>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ContextForProjectAndIssueType>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ContextForProjectAndIssueType.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'contextId',
    'issueTypeId',
    'projectId',
  };
}

