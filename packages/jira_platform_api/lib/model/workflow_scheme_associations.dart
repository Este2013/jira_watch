//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowSchemeAssociations {
  /// Returns a new [WorkflowSchemeAssociations] instance.
  WorkflowSchemeAssociations({
    this.projectIds = const [],
    required this.workflowScheme,
  });

  /// The list of projects that use the workflow scheme.
  List<String> projectIds;

  /// The workflow scheme.
  WorkflowScheme workflowScheme;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowSchemeAssociations &&
    _deepEquality.equals(other.projectIds, projectIds) &&
    other.workflowScheme == workflowScheme;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (projectIds.hashCode) +
    (workflowScheme.hashCode);

  @override
  String toString() => 'WorkflowSchemeAssociations[projectIds=$projectIds, workflowScheme=$workflowScheme]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'projectIds'] = this.projectIds;
      json[r'workflowScheme'] = this.workflowScheme;
    return json;
  }

  /// Returns a new [WorkflowSchemeAssociations] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowSchemeAssociations? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'projectIds'), 'Required key "WorkflowSchemeAssociations[projectIds]" is missing from JSON.');
        assert(json[r'projectIds'] != null, 'Required key "WorkflowSchemeAssociations[projectIds]" has a null value in JSON.');
        assert(json.containsKey(r'workflowScheme'), 'Required key "WorkflowSchemeAssociations[workflowScheme]" is missing from JSON.');
        assert(json[r'workflowScheme'] != null, 'Required key "WorkflowSchemeAssociations[workflowScheme]" has a null value in JSON.');
        return true;
      }());

      return WorkflowSchemeAssociations(
        projectIds: json[r'projectIds'] is Iterable
            ? (json[r'projectIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        workflowScheme: WorkflowScheme.fromJson(json[r'workflowScheme'])!,
      );
    }
    return null;
  }

  static List<WorkflowSchemeAssociations> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowSchemeAssociations>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowSchemeAssociations.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowSchemeAssociations> mapFromJson(dynamic json) {
    final map = <String, WorkflowSchemeAssociations>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowSchemeAssociations.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowSchemeAssociations-objects as value to a dart map
  static Map<String, List<WorkflowSchemeAssociations>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowSchemeAssociations>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowSchemeAssociations.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'projectIds',
    'workflowScheme',
  };
}

