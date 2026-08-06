//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RequiredMappingByWorkflows {
  /// Returns a new [RequiredMappingByWorkflows] instance.
  RequiredMappingByWorkflows({
    this.sourceWorkflowId,
    this.statusIds = const [],
    this.targetWorkflowId,
  });

  /// The ID of the source workflow.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? sourceWorkflowId;

  /// The status IDs requiring mapping.
  List<String> statusIds;

  /// The ID of the target workflow.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? targetWorkflowId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RequiredMappingByWorkflows &&
    other.sourceWorkflowId == sourceWorkflowId &&
    _deepEquality.equals(other.statusIds, statusIds) &&
    other.targetWorkflowId == targetWorkflowId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (sourceWorkflowId == null ? 0 : sourceWorkflowId!.hashCode) +
    (statusIds.hashCode) +
    (targetWorkflowId == null ? 0 : targetWorkflowId!.hashCode);

  @override
  String toString() => 'RequiredMappingByWorkflows[sourceWorkflowId=$sourceWorkflowId, statusIds=$statusIds, targetWorkflowId=$targetWorkflowId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.sourceWorkflowId != null) {
      json[r'sourceWorkflowId'] = this.sourceWorkflowId;
    } else {
      json[r'sourceWorkflowId'] = null;
    }
      json[r'statusIds'] = this.statusIds;
    if (this.targetWorkflowId != null) {
      json[r'targetWorkflowId'] = this.targetWorkflowId;
    } else {
      json[r'targetWorkflowId'] = null;
    }
    return json;
  }

  /// Returns a new [RequiredMappingByWorkflows] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RequiredMappingByWorkflows? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return RequiredMappingByWorkflows(
        sourceWorkflowId: mapValueOfType<String>(json, r'sourceWorkflowId'),
        statusIds: json[r'statusIds'] is Iterable
            ? (json[r'statusIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        targetWorkflowId: mapValueOfType<String>(json, r'targetWorkflowId'),
      );
    }
    return null;
  }

  static List<RequiredMappingByWorkflows> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RequiredMappingByWorkflows>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RequiredMappingByWorkflows.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RequiredMappingByWorkflows> mapFromJson(dynamic json) {
    final map = <String, RequiredMappingByWorkflows>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RequiredMappingByWorkflows.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RequiredMappingByWorkflows-objects as value to a dart map
  static Map<String, List<RequiredMappingByWorkflows>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RequiredMappingByWorkflows>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RequiredMappingByWorkflows.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

