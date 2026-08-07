//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ChangedWorklog {
  /// Returns a new [ChangedWorklog] instance.
  ChangedWorklog({
    this.properties = const [],
    this.updatedTime,
    this.worklogId,
  });

  /// Details of properties associated with the change.
  List<EntityProperty> properties;

  /// The datetime of the change.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? updatedTime;

  /// The ID of the worklog.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? worklogId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ChangedWorklog &&
    _deepEquality.equals(other.properties, properties) &&
    other.updatedTime == updatedTime &&
    other.worklogId == worklogId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (properties.hashCode) +
    (updatedTime == null ? 0 : updatedTime!.hashCode) +
    (worklogId == null ? 0 : worklogId!.hashCode);

  @override
  String toString() => 'ChangedWorklog[properties=$properties, updatedTime=$updatedTime, worklogId=$worklogId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'properties'] = this.properties;
    if (this.updatedTime != null) {
      json[r'updatedTime'] = this.updatedTime;
    } else {
      json[r'updatedTime'] = null;
    }
    if (this.worklogId != null) {
      json[r'worklogId'] = this.worklogId;
    } else {
      json[r'worklogId'] = null;
    }
    return json;
  }

  /// Returns a new [ChangedWorklog] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ChangedWorklog? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ChangedWorklog(
        properties: EntityProperty.listFromJson(json[r'properties']),
        updatedTime: mapValueOfType<int>(json, r'updatedTime'),
        worklogId: mapValueOfType<int>(json, r'worklogId'),
      );
    }
    return null;
  }

  static List<ChangedWorklog> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ChangedWorklog>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ChangedWorklog.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ChangedWorklog> mapFromJson(dynamic json) {
    final map = <String, ChangedWorklog>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ChangedWorklog.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ChangedWorklog-objects as value to a dart map
  static Map<String, List<ChangedWorklog>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ChangedWorklog>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ChangedWorklog.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

