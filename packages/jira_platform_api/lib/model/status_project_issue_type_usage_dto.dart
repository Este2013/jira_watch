//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class StatusProjectIssueTypeUsageDTO {
  /// Returns a new [StatusProjectIssueTypeUsageDTO] instance.
  StatusProjectIssueTypeUsageDTO({
    this.issueTypes,
    this.projectId,
    this.statusId,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  StatusProjectIssueTypeUsagePage? issueTypes;

  /// The project ID.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? projectId;

  /// The status ID.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? statusId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is StatusProjectIssueTypeUsageDTO &&
    other.issueTypes == issueTypes &&
    other.projectId == projectId &&
    other.statusId == statusId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (issueTypes == null ? 0 : issueTypes!.hashCode) +
    (projectId == null ? 0 : projectId!.hashCode) +
    (statusId == null ? 0 : statusId!.hashCode);

  @override
  String toString() => 'StatusProjectIssueTypeUsageDTO[issueTypes=$issueTypes, projectId=$projectId, statusId=$statusId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.issueTypes != null) {
      json[r'issueTypes'] = this.issueTypes;
    } else {
      json[r'issueTypes'] = null;
    }
    if (this.projectId != null) {
      json[r'projectId'] = this.projectId;
    } else {
      json[r'projectId'] = null;
    }
    if (this.statusId != null) {
      json[r'statusId'] = this.statusId;
    } else {
      json[r'statusId'] = null;
    }
    return json;
  }

  /// Returns a new [StatusProjectIssueTypeUsageDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static StatusProjectIssueTypeUsageDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return StatusProjectIssueTypeUsageDTO(
        issueTypes: StatusProjectIssueTypeUsagePage.fromJson(json[r'issueTypes']),
        projectId: mapValueOfType<String>(json, r'projectId'),
        statusId: mapValueOfType<String>(json, r'statusId'),
      );
    }
    return null;
  }

  static List<StatusProjectIssueTypeUsageDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StatusProjectIssueTypeUsageDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StatusProjectIssueTypeUsageDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, StatusProjectIssueTypeUsageDTO> mapFromJson(dynamic json) {
    final map = <String, StatusProjectIssueTypeUsageDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = StatusProjectIssueTypeUsageDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of StatusProjectIssueTypeUsageDTO-objects as value to a dart map
  static Map<String, List<StatusProjectIssueTypeUsageDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<StatusProjectIssueTypeUsageDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = StatusProjectIssueTypeUsageDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

