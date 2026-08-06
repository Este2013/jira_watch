//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowReferenceStatus {
  /// Returns a new [WorkflowReferenceStatus] instance.
  WorkflowReferenceStatus({
    this.approvalConfiguration,
    this.deprecated,
    this.layout,
    this.properties = const {},
    this.statusReference,
  });

  ApprovalConfiguration? approvalConfiguration;

  /// Indicates if the status is deprecated.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? deprecated;

  WorkflowStatusLayout? layout;

  /// The properties associated with the status.
  Map<String, String> properties;

  /// The reference of the status.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? statusReference;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowReferenceStatus &&
    other.approvalConfiguration == approvalConfiguration &&
    other.deprecated == deprecated &&
    other.layout == layout &&
    _deepEquality.equals(other.properties, properties) &&
    other.statusReference == statusReference;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (approvalConfiguration == null ? 0 : approvalConfiguration!.hashCode) +
    (deprecated == null ? 0 : deprecated!.hashCode) +
    (layout == null ? 0 : layout!.hashCode) +
    (properties.hashCode) +
    (statusReference == null ? 0 : statusReference!.hashCode);

  @override
  String toString() => 'WorkflowReferenceStatus[approvalConfiguration=$approvalConfiguration, deprecated=$deprecated, layout=$layout, properties=$properties, statusReference=$statusReference]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.approvalConfiguration != null) {
      json[r'approvalConfiguration'] = this.approvalConfiguration;
    } else {
      json[r'approvalConfiguration'] = null;
    }
    if (this.deprecated != null) {
      json[r'deprecated'] = this.deprecated;
    } else {
      json[r'deprecated'] = null;
    }
    if (this.layout != null) {
      json[r'layout'] = this.layout;
    } else {
      json[r'layout'] = null;
    }
      json[r'properties'] = this.properties;
    if (this.statusReference != null) {
      json[r'statusReference'] = this.statusReference;
    } else {
      json[r'statusReference'] = null;
    }
    return json;
  }

  /// Returns a new [WorkflowReferenceStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowReferenceStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return WorkflowReferenceStatus(
        approvalConfiguration: ApprovalConfiguration.fromJson(json[r'approvalConfiguration']),
        deprecated: mapValueOfType<bool>(json, r'deprecated'),
        layout: WorkflowStatusLayout.fromJson(json[r'layout']),
        properties: mapCastOfType<String, String>(json, r'properties') ?? const {},
        statusReference: mapValueOfType<String>(json, r'statusReference'),
      );
    }
    return null;
  }

  static List<WorkflowReferenceStatus> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowReferenceStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowReferenceStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowReferenceStatus> mapFromJson(dynamic json) {
    final map = <String, WorkflowReferenceStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowReferenceStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowReferenceStatus-objects as value to a dart map
  static Map<String, List<WorkflowReferenceStatus>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowReferenceStatus>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowReferenceStatus.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

