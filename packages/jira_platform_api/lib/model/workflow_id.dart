//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowId {
  /// Returns a new [WorkflowId] instance.
  WorkflowId({
    this.draft,
    required this.name,
  });

  /// **Deprecated:** Whether the workflow is in the draft state. The 'draft' parameter will be removed from this API on [November 2, 2026](https://developer.atlassian.com/cloud/jira/platform/changelog/#CHANGE-3147).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? draft;

  /// The name of the workflow.
  String name;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowId &&
    other.draft == draft &&
    other.name == name;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (draft == null ? 0 : draft!.hashCode) +
    (name.hashCode);

  @override
  String toString() => 'WorkflowId[draft=$draft, name=$name]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.draft != null) {
      json[r'draft'] = this.draft;
    } else {
      json[r'draft'] = null;
    }
      json[r'name'] = this.name;
    return json;
  }

  /// Returns a new [WorkflowId] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowId? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'name'), 'Required key "WorkflowId[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "WorkflowId[name]" has a null value in JSON.');
        return true;
      }());

      return WorkflowId(
        draft: mapValueOfType<bool>(json, r'draft'),
        name: mapValueOfType<String>(json, r'name')!,
      );
    }
    return null;
  }

  static List<WorkflowId> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowId>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowId.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowId> mapFromJson(dynamic json) {
    final map = <String, WorkflowId>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowId.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowId-objects as value to a dart map
  static Map<String, List<WorkflowId>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowId>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowId.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
  };
}

