//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowOperations {
  /// Returns a new [WorkflowOperations] instance.
  WorkflowOperations({
    required this.canDelete,
    required this.canEdit,
  });

  /// Whether the workflow can be deleted.
  bool canDelete;

  /// Whether the workflow can be updated.
  bool canEdit;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowOperations &&
    other.canDelete == canDelete &&
    other.canEdit == canEdit;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (canDelete.hashCode) +
    (canEdit.hashCode);

  @override
  String toString() => 'WorkflowOperations[canDelete=$canDelete, canEdit=$canEdit]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'canDelete'] = this.canDelete;
      json[r'canEdit'] = this.canEdit;
    return json;
  }

  /// Returns a new [WorkflowOperations] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowOperations? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'canDelete'), 'Required key "WorkflowOperations[canDelete]" is missing from JSON.');
        assert(json[r'canDelete'] != null, 'Required key "WorkflowOperations[canDelete]" has a null value in JSON.');
        assert(json.containsKey(r'canEdit'), 'Required key "WorkflowOperations[canEdit]" is missing from JSON.');
        assert(json[r'canEdit'] != null, 'Required key "WorkflowOperations[canEdit]" has a null value in JSON.');
        return true;
      }());

      return WorkflowOperations(
        canDelete: mapValueOfType<bool>(json, r'canDelete')!,
        canEdit: mapValueOfType<bool>(json, r'canEdit')!,
      );
    }
    return null;
  }

  static List<WorkflowOperations> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowOperations>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowOperations.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowOperations> mapFromJson(dynamic json) {
    final map = <String, WorkflowOperations>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowOperations.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowOperations-objects as value to a dart map
  static Map<String, List<WorkflowOperations>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowOperations>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowOperations.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'canDelete',
    'canEdit',
  };
}

