//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class StatusesPerWorkflow {
  /// Returns a new [StatusesPerWorkflow] instance.
  StatusesPerWorkflow({
    this.initialStatusId,
    this.statuses = const [],
    this.workflowId,
  });

  /// The ID of the initial status for the workflow.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? initialStatusId;

  /// The status IDs associated with the workflow.
  List<String> statuses;

  /// The ID of the workflow.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? workflowId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is StatusesPerWorkflow &&
    other.initialStatusId == initialStatusId &&
    _deepEquality.equals(other.statuses, statuses) &&
    other.workflowId == workflowId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (initialStatusId == null ? 0 : initialStatusId!.hashCode) +
    (statuses.hashCode) +
    (workflowId == null ? 0 : workflowId!.hashCode);

  @override
  String toString() => 'StatusesPerWorkflow[initialStatusId=$initialStatusId, statuses=$statuses, workflowId=$workflowId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.initialStatusId != null) {
      json[r'initialStatusId'] = this.initialStatusId;
    } else {
      json[r'initialStatusId'] = null;
    }
      json[r'statuses'] = this.statuses;
    if (this.workflowId != null) {
      json[r'workflowId'] = this.workflowId;
    } else {
      json[r'workflowId'] = null;
    }
    return json;
  }

  /// Returns a new [StatusesPerWorkflow] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static StatusesPerWorkflow? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return StatusesPerWorkflow(
        initialStatusId: mapValueOfType<String>(json, r'initialStatusId'),
        statuses: json[r'statuses'] is Iterable
            ? (json[r'statuses'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        workflowId: mapValueOfType<String>(json, r'workflowId'),
      );
    }
    return null;
  }

  static List<StatusesPerWorkflow> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StatusesPerWorkflow>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StatusesPerWorkflow.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, StatusesPerWorkflow> mapFromJson(dynamic json) {
    final map = <String, StatusesPerWorkflow>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = StatusesPerWorkflow.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of StatusesPerWorkflow-objects as value to a dart map
  static Map<String, List<StatusesPerWorkflow>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<StatusesPerWorkflow>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = StatusesPerWorkflow.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

