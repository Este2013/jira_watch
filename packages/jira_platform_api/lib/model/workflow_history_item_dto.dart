//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowHistoryItemDTO {
  /// Returns a new [WorkflowHistoryItemDTO] instance.
  WorkflowHistoryItemDTO({
    this.isIntermediate,
    this.workflowId,
    this.workflowVersion,
    this.writtenAt,
  });

  /// Whether the version is an intermediate workflow state, sometimes created during workflow updates.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isIntermediate;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? workflowId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? workflowVersion;

  /// The timestamp when this workflow version was created.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? writtenAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowHistoryItemDTO &&
    other.isIntermediate == isIntermediate &&
    other.workflowId == workflowId &&
    other.workflowVersion == workflowVersion &&
    other.writtenAt == writtenAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (isIntermediate == null ? 0 : isIntermediate!.hashCode) +
    (workflowId == null ? 0 : workflowId!.hashCode) +
    (workflowVersion == null ? 0 : workflowVersion!.hashCode) +
    (writtenAt == null ? 0 : writtenAt!.hashCode);

  @override
  String toString() => 'WorkflowHistoryItemDTO[isIntermediate=$isIntermediate, workflowId=$workflowId, workflowVersion=$workflowVersion, writtenAt=$writtenAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.isIntermediate != null) {
      json[r'isIntermediate'] = this.isIntermediate;
    } else {
      json[r'isIntermediate'] = null;
    }
    if (this.workflowId != null) {
      json[r'workflowId'] = this.workflowId;
    } else {
      json[r'workflowId'] = null;
    }
    if (this.workflowVersion != null) {
      json[r'workflowVersion'] = this.workflowVersion;
    } else {
      json[r'workflowVersion'] = null;
    }
    if (this.writtenAt != null) {
      json[r'writtenAt'] = this.writtenAt;
    } else {
      json[r'writtenAt'] = null;
    }
    return json;
  }

  /// Returns a new [WorkflowHistoryItemDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowHistoryItemDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return WorkflowHistoryItemDTO(
        isIntermediate: mapValueOfType<bool>(json, r'isIntermediate'),
        workflowId: mapValueOfType<String>(json, r'workflowId'),
        workflowVersion: mapValueOfType<int>(json, r'workflowVersion'),
        writtenAt: mapValueOfType<String>(json, r'writtenAt'),
      );
    }
    return null;
  }

  static List<WorkflowHistoryItemDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowHistoryItemDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowHistoryItemDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowHistoryItemDTO> mapFromJson(dynamic json) {
    final map = <String, WorkflowHistoryItemDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowHistoryItemDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowHistoryItemDTO-objects as value to a dart map
  static Map<String, List<WorkflowHistoryItemDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowHistoryItemDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowHistoryItemDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

