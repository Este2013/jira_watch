//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class MappingsByWorkflow {
  /// Returns a new [MappingsByWorkflow] instance.
  MappingsByWorkflow({
    required this.newWorkflowId,
    required this.oldWorkflowId,
    this.statusMappings = const [],
  });

  /// The ID of the new workflow.
  String newWorkflowId;

  /// The ID of the old workflow.
  String oldWorkflowId;

  /// The list of status mappings.
  List<WorkflowAssociationStatusMapping> statusMappings;

  @override
  bool operator ==(Object other) => identical(this, other) || other is MappingsByWorkflow &&
    other.newWorkflowId == newWorkflowId &&
    other.oldWorkflowId == oldWorkflowId &&
    _deepEquality.equals(other.statusMappings, statusMappings);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (newWorkflowId.hashCode) +
    (oldWorkflowId.hashCode) +
    (statusMappings.hashCode);

  @override
  String toString() => 'MappingsByWorkflow[newWorkflowId=$newWorkflowId, oldWorkflowId=$oldWorkflowId, statusMappings=$statusMappings]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'newWorkflowId'] = this.newWorkflowId;
      json[r'oldWorkflowId'] = this.oldWorkflowId;
      json[r'statusMappings'] = this.statusMappings;
    return json;
  }

  /// Returns a new [MappingsByWorkflow] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static MappingsByWorkflow? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'newWorkflowId'), 'Required key "MappingsByWorkflow[newWorkflowId]" is missing from JSON.');
        assert(json[r'newWorkflowId'] != null, 'Required key "MappingsByWorkflow[newWorkflowId]" has a null value in JSON.');
        assert(json.containsKey(r'oldWorkflowId'), 'Required key "MappingsByWorkflow[oldWorkflowId]" is missing from JSON.');
        assert(json[r'oldWorkflowId'] != null, 'Required key "MappingsByWorkflow[oldWorkflowId]" has a null value in JSON.');
        assert(json.containsKey(r'statusMappings'), 'Required key "MappingsByWorkflow[statusMappings]" is missing from JSON.');
        assert(json[r'statusMappings'] != null, 'Required key "MappingsByWorkflow[statusMappings]" has a null value in JSON.');
        return true;
      }());

      return MappingsByWorkflow(
        newWorkflowId: mapValueOfType<String>(json, r'newWorkflowId')!,
        oldWorkflowId: mapValueOfType<String>(json, r'oldWorkflowId')!,
        statusMappings: WorkflowAssociationStatusMapping.listFromJson(json[r'statusMappings']),
      );
    }
    return null;
  }

  static List<MappingsByWorkflow> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <MappingsByWorkflow>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MappingsByWorkflow.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, MappingsByWorkflow> mapFromJson(dynamic json) {
    final map = <String, MappingsByWorkflow>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MappingsByWorkflow.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of MappingsByWorkflow-objects as value to a dart map
  static Map<String, List<MappingsByWorkflow>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<MappingsByWorkflow>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = MappingsByWorkflow.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'newWorkflowId',
    'oldWorkflowId',
    'statusMappings',
  };
}

