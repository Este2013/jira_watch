//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowStatusLayoutPayload {
  /// Returns a new [WorkflowStatusLayoutPayload] instance.
  WorkflowStatusLayoutPayload({
    this.x,
    this.y,
  });

  /// The x coordinate of the status.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? x;

  /// The y coordinate of the status.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  double? y;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowStatusLayoutPayload &&
    other.x == x &&
    other.y == y;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (x == null ? 0 : x!.hashCode) +
    (y == null ? 0 : y!.hashCode);

  @override
  String toString() => 'WorkflowStatusLayoutPayload[x=$x, y=$y]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.x != null) {
      json[r'x'] = this.x;
    } else {
      json[r'x'] = null;
    }
    if (this.y != null) {
      json[r'y'] = this.y;
    } else {
      json[r'y'] = null;
    }
    return json;
  }

  /// Returns a new [WorkflowStatusLayoutPayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowStatusLayoutPayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return WorkflowStatusLayoutPayload(
        x: mapValueOfType<double>(json, r'x'),
        y: mapValueOfType<double>(json, r'y'),
      );
    }
    return null;
  }

  static List<WorkflowStatusLayoutPayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowStatusLayoutPayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowStatusLayoutPayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowStatusLayoutPayload> mapFromJson(dynamic json) {
    final map = <String, WorkflowStatusLayoutPayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowStatusLayoutPayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowStatusLayoutPayload-objects as value to a dart map
  static Map<String, List<WorkflowStatusLayoutPayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowStatusLayoutPayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowStatusLayoutPayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

