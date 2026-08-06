//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowStatus {
  /// Returns a new [WorkflowStatus] instance.
  WorkflowStatus({
    required this.id,
    required this.name,
    this.properties = const {},
  });

  /// The ID of the issue status.
  String id;

  /// The name of the status in the workflow.
  String name;

  /// Additional properties that modify the behavior of issues in this status. Supports the properties `jira.issue.editable` and `issueEditable` (deprecated) that indicate whether issues are editable.
  Map<String, Object> properties;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowStatus &&
    other.id == id &&
    other.name == name &&
    _deepEquality.equals(other.properties, properties);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (name.hashCode) +
    (properties.hashCode);

  @override
  String toString() => 'WorkflowStatus[id=$id, name=$name, properties=$properties]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'name'] = this.name;
      json[r'properties'] = this.properties;
    return json;
  }

  /// Returns a new [WorkflowStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "WorkflowStatus[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "WorkflowStatus[id]" has a null value in JSON.');
        assert(json.containsKey(r'name'), 'Required key "WorkflowStatus[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "WorkflowStatus[name]" has a null value in JSON.');
        return true;
      }());

      return WorkflowStatus(
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        properties: mapCastOfType<String, Object>(json, r'properties') ?? const {},
      );
    }
    return null;
  }

  static List<WorkflowStatus> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowStatus> mapFromJson(dynamic json) {
    final map = <String, WorkflowStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowStatus-objects as value to a dart map
  static Map<String, List<WorkflowStatus>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowStatus>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowStatus.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'name',
  };
}

