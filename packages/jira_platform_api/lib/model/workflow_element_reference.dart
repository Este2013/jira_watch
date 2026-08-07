//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowElementReference {
  /// Returns a new [WorkflowElementReference] instance.
  WorkflowElementReference({
    this.propertyKey,
    this.ruleId,
    this.statusMappingReference,
    this.statusReference,
    this.transitionId,
  });

  /// A property key.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? propertyKey;

  /// A rule ID.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? ruleId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectAndIssueTypePair? statusMappingReference;

  /// A status reference.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? statusReference;

  /// A transition ID.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? transitionId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowElementReference &&
    other.propertyKey == propertyKey &&
    other.ruleId == ruleId &&
    other.statusMappingReference == statusMappingReference &&
    other.statusReference == statusReference &&
    other.transitionId == transitionId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (propertyKey == null ? 0 : propertyKey!.hashCode) +
    (ruleId == null ? 0 : ruleId!.hashCode) +
    (statusMappingReference == null ? 0 : statusMappingReference!.hashCode) +
    (statusReference == null ? 0 : statusReference!.hashCode) +
    (transitionId == null ? 0 : transitionId!.hashCode);

  @override
  String toString() => 'WorkflowElementReference[propertyKey=$propertyKey, ruleId=$ruleId, statusMappingReference=$statusMappingReference, statusReference=$statusReference, transitionId=$transitionId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.propertyKey != null) {
      json[r'propertyKey'] = this.propertyKey;
    } else {
      json[r'propertyKey'] = null;
    }
    if (this.ruleId != null) {
      json[r'ruleId'] = this.ruleId;
    } else {
      json[r'ruleId'] = null;
    }
    if (this.statusMappingReference != null) {
      json[r'statusMappingReference'] = this.statusMappingReference;
    } else {
      json[r'statusMappingReference'] = null;
    }
    if (this.statusReference != null) {
      json[r'statusReference'] = this.statusReference;
    } else {
      json[r'statusReference'] = null;
    }
    if (this.transitionId != null) {
      json[r'transitionId'] = this.transitionId;
    } else {
      json[r'transitionId'] = null;
    }
    return json;
  }

  /// Returns a new [WorkflowElementReference] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowElementReference? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return WorkflowElementReference(
        propertyKey: mapValueOfType<String>(json, r'propertyKey'),
        ruleId: mapValueOfType<String>(json, r'ruleId'),
        statusMappingReference: ProjectAndIssueTypePair.fromJson(json[r'statusMappingReference']),
        statusReference: mapValueOfType<String>(json, r'statusReference'),
        transitionId: mapValueOfType<String>(json, r'transitionId'),
      );
    }
    return null;
  }

  static List<WorkflowElementReference> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowElementReference>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowElementReference.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowElementReference> mapFromJson(dynamic json) {
    final map = <String, WorkflowElementReference>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowElementReference.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowElementReference-objects as value to a dart map
  static Map<String, List<WorkflowElementReference>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowElementReference>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowElementReference.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

