//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowPreviewStatus {
  /// Returns a new [WorkflowPreviewStatus] instance.
  WorkflowPreviewStatus({
    this.approvalConfiguration,
    this.deprecated,
    this.layout,
    this.statusReference,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ApprovalConfigurationPreview? approvalConfiguration;

  /// Whether the status is deprecated.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? deprecated;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  WorkflowPreviewLayout? layout;

  /// The reference of the status.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? statusReference;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowPreviewStatus &&
    other.approvalConfiguration == approvalConfiguration &&
    other.deprecated == deprecated &&
    other.layout == layout &&
    other.statusReference == statusReference;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (approvalConfiguration == null ? 0 : approvalConfiguration!.hashCode) +
    (deprecated == null ? 0 : deprecated!.hashCode) +
    (layout == null ? 0 : layout!.hashCode) +
    (statusReference == null ? 0 : statusReference!.hashCode);

  @override
  String toString() => 'WorkflowPreviewStatus[approvalConfiguration=$approvalConfiguration, deprecated=$deprecated, layout=$layout, statusReference=$statusReference]';

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
    if (this.statusReference != null) {
      json[r'statusReference'] = this.statusReference;
    } else {
      json[r'statusReference'] = null;
    }
    return json;
  }

  /// Returns a new [WorkflowPreviewStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowPreviewStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return WorkflowPreviewStatus(
        approvalConfiguration: ApprovalConfigurationPreview.fromJson(json[r'approvalConfiguration']),
        deprecated: mapValueOfType<bool>(json, r'deprecated'),
        layout: WorkflowPreviewLayout.fromJson(json[r'layout']),
        statusReference: mapValueOfType<String>(json, r'statusReference'),
      );
    }
    return null;
  }

  static List<WorkflowPreviewStatus> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowPreviewStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowPreviewStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowPreviewStatus> mapFromJson(dynamic json) {
    final map = <String, WorkflowPreviewStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowPreviewStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowPreviewStatus-objects as value to a dart map
  static Map<String, List<WorkflowPreviewStatus>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowPreviewStatus>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowPreviewStatus.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

