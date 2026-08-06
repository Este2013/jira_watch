//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class StatusLayoutUpdate {
  /// Returns a new [StatusLayoutUpdate] instance.
  StatusLayoutUpdate({
    this.approvalConfiguration,
    this.layout,
    this.properties = const {},
    required this.statusReference,
  });

  ApprovalConfiguration? approvalConfiguration;

  WorkflowLayout? layout;

  /// The properties for this status layout.
  Map<String, String> properties;

  /// A unique ID which the status will use to refer to this layout configuration.
  String statusReference;

  @override
  bool operator ==(Object other) => identical(this, other) || other is StatusLayoutUpdate &&
    other.approvalConfiguration == approvalConfiguration &&
    other.layout == layout &&
    _deepEquality.equals(other.properties, properties) &&
    other.statusReference == statusReference;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (approvalConfiguration == null ? 0 : approvalConfiguration!.hashCode) +
    (layout == null ? 0 : layout!.hashCode) +
    (properties.hashCode) +
    (statusReference.hashCode);

  @override
  String toString() => 'StatusLayoutUpdate[approvalConfiguration=$approvalConfiguration, layout=$layout, properties=$properties, statusReference=$statusReference]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.approvalConfiguration != null) {
      json[r'approvalConfiguration'] = this.approvalConfiguration;
    } else {
      json[r'approvalConfiguration'] = null;
    }
    if (this.layout != null) {
      json[r'layout'] = this.layout;
    } else {
      json[r'layout'] = null;
    }
      json[r'properties'] = this.properties;
      json[r'statusReference'] = this.statusReference;
    return json;
  }

  /// Returns a new [StatusLayoutUpdate] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static StatusLayoutUpdate? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'properties'), 'Required key "StatusLayoutUpdate[properties]" is missing from JSON.');
        assert(json[r'properties'] != null, 'Required key "StatusLayoutUpdate[properties]" has a null value in JSON.');
        assert(json.containsKey(r'statusReference'), 'Required key "StatusLayoutUpdate[statusReference]" is missing from JSON.');
        assert(json[r'statusReference'] != null, 'Required key "StatusLayoutUpdate[statusReference]" has a null value in JSON.');
        return true;
      }());

      return StatusLayoutUpdate(
        approvalConfiguration: ApprovalConfiguration.fromJson(json[r'approvalConfiguration']),
        layout: WorkflowLayout.fromJson(json[r'layout']),
        properties: mapCastOfType<String, String>(json, r'properties')!,
        statusReference: mapValueOfType<String>(json, r'statusReference')!,
      );
    }
    return null;
  }

  static List<StatusLayoutUpdate> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StatusLayoutUpdate>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StatusLayoutUpdate.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, StatusLayoutUpdate> mapFromJson(dynamic json) {
    final map = <String, StatusLayoutUpdate>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = StatusLayoutUpdate.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of StatusLayoutUpdate-objects as value to a dart map
  static Map<String, List<StatusLayoutUpdate>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<StatusLayoutUpdate>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = StatusLayoutUpdate.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'properties',
    'statusReference',
  };
}

