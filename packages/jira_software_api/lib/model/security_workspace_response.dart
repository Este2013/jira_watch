//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SecurityWorkspaceResponse {
  /// Returns a new [SecurityWorkspaceResponse] instance.
  SecurityWorkspaceResponse({
    required this.workspaceId,
    required this.updatedAt,
  });

  /// The Security Workspace ID 
  String workspaceId;

  /// Latest date and time that the Security Workspace was updated in Jira. 
  DateTime updatedAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SecurityWorkspaceResponse &&
    other.workspaceId == workspaceId &&
    other.updatedAt == updatedAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (workspaceId.hashCode) +
    (updatedAt.hashCode);

  @override
  String toString() => 'SecurityWorkspaceResponse[workspaceId=$workspaceId, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'workspaceId'] = this.workspaceId;
      json[r'updatedAt'] = this.updatedAt.toUtc().toIso8601String();
    return json;
  }

  /// Returns a new [SecurityWorkspaceResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SecurityWorkspaceResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'workspaceId'), 'Required key "SecurityWorkspaceResponse[workspaceId]" is missing from JSON.');
        assert(json[r'workspaceId'] != null, 'Required key "SecurityWorkspaceResponse[workspaceId]" has a null value in JSON.');
        assert(json.containsKey(r'updatedAt'), 'Required key "SecurityWorkspaceResponse[updatedAt]" is missing from JSON.');
        assert(json[r'updatedAt'] != null, 'Required key "SecurityWorkspaceResponse[updatedAt]" has a null value in JSON.');
        return true;
      }());

      return SecurityWorkspaceResponse(
        workspaceId: mapValueOfType<String>(json, r'workspaceId')!,
        updatedAt: mapDateTime(json, r'updatedAt', r'')!,
      );
    }
    return null;
  }

  static List<SecurityWorkspaceResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SecurityWorkspaceResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SecurityWorkspaceResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SecurityWorkspaceResponse> mapFromJson(dynamic json) {
    final map = <String, SecurityWorkspaceResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SecurityWorkspaceResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SecurityWorkspaceResponse-objects as value to a dart map
  static Map<String, List<SecurityWorkspaceResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SecurityWorkspaceResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SecurityWorkspaceResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'workspaceId',
    'updatedAt',
  };
}

