//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowSimpleCondition {
  /// Returns a new [WorkflowSimpleCondition] instance.
  WorkflowSimpleCondition({
    this.configuration,
    required this.nodeType,
    required this.type,
  });

  /// EXPERIMENTAL. The configuration of the transition rule.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? configuration;

  String nodeType;

  /// The type of the transition rule.
  String type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowSimpleCondition &&
    other.configuration == configuration &&
    other.nodeType == nodeType &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (configuration == null ? 0 : configuration!.hashCode) +
    (nodeType.hashCode) +
    (type.hashCode);

  @override
  String toString() => 'WorkflowSimpleCondition[configuration=$configuration, nodeType=$nodeType, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.configuration != null) {
      json[r'configuration'] = this.configuration;
    } else {
      json[r'configuration'] = null;
    }
      json[r'nodeType'] = this.nodeType;
      json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [WorkflowSimpleCondition] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowSimpleCondition? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'nodeType'), 'Required key "WorkflowSimpleCondition[nodeType]" is missing from JSON.');
        assert(json[r'nodeType'] != null, 'Required key "WorkflowSimpleCondition[nodeType]" has a null value in JSON.');
        assert(json.containsKey(r'type'), 'Required key "WorkflowSimpleCondition[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "WorkflowSimpleCondition[type]" has a null value in JSON.');
        return true;
      }());

      return WorkflowSimpleCondition(
        configuration: mapValueOfType<Object>(json, r'configuration'),
        nodeType: mapValueOfType<String>(json, r'nodeType')!,
        type: mapValueOfType<String>(json, r'type')!,
      );
    }
    return null;
  }

  static List<WorkflowSimpleCondition> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowSimpleCondition>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowSimpleCondition.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowSimpleCondition> mapFromJson(dynamic json) {
    final map = <String, WorkflowSimpleCondition>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowSimpleCondition.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowSimpleCondition-objects as value to a dart map
  static Map<String, List<WorkflowSimpleCondition>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowSimpleCondition>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowSimpleCondition.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'nodeType',
    'type',
  };
}

