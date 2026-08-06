//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowStatusLayout {
  /// Returns a new [WorkflowStatusLayout] instance.
  WorkflowStatusLayout({
    this.x,
    this.y,
  });

  /// The x axis location.
  double? x;

  /// The y axis location.
  double? y;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowStatusLayout &&
    other.x == x &&
    other.y == y;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (x == null ? 0 : x!.hashCode) +
    (y == null ? 0 : y!.hashCode);

  @override
  String toString() => 'WorkflowStatusLayout[x=$x, y=$y]';

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

  /// Returns a new [WorkflowStatusLayout] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowStatusLayout? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return WorkflowStatusLayout(
        x: mapValueOfType<double>(json, r'x'),
        y: mapValueOfType<double>(json, r'y'),
      );
    }
    return null;
  }

  static List<WorkflowStatusLayout> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowStatusLayout>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowStatusLayout.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowStatusLayout> mapFromJson(dynamic json) {
    final map = <String, WorkflowStatusLayout>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowStatusLayout.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowStatusLayout-objects as value to a dart map
  static Map<String, List<WorkflowStatusLayout>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowStatusLayout>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowStatusLayout.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

