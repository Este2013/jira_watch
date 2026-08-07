//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SubmitOperationsWorkspacesRequest {
  /// Returns a new [SubmitOperationsWorkspacesRequest] instance.
  SubmitOperationsWorkspacesRequest({
    this.workspaceIds = const [],
  });

  /// The IDs of Operations Workspaces that are available to this Jira site. 
  List<String> workspaceIds;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SubmitOperationsWorkspacesRequest &&
    _deepEquality.equals(other.workspaceIds, workspaceIds);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (workspaceIds.hashCode);

  @override
  String toString() => 'SubmitOperationsWorkspacesRequest[workspaceIds=$workspaceIds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'workspaceIds'] = this.workspaceIds;
    return json;
  }

  /// Returns a new [SubmitOperationsWorkspacesRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SubmitOperationsWorkspacesRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'workspaceIds'), 'Required key "SubmitOperationsWorkspacesRequest[workspaceIds]" is missing from JSON.');
        assert(json[r'workspaceIds'] != null, 'Required key "SubmitOperationsWorkspacesRequest[workspaceIds]" has a null value in JSON.');
        return true;
      }());

      return SubmitOperationsWorkspacesRequest(
        workspaceIds: json[r'workspaceIds'] is Iterable
            ? (json[r'workspaceIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<SubmitOperationsWorkspacesRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SubmitOperationsWorkspacesRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SubmitOperationsWorkspacesRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SubmitOperationsWorkspacesRequest> mapFromJson(dynamic json) {
    final map = <String, SubmitOperationsWorkspacesRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SubmitOperationsWorkspacesRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SubmitOperationsWorkspacesRequest-objects as value to a dart map
  static Map<String, List<SubmitOperationsWorkspacesRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SubmitOperationsWorkspacesRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SubmitOperationsWorkspacesRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'workspaceIds',
  };
}

