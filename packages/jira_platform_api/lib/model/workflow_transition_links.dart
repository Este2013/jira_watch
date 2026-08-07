//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowTransitionLinks {
  /// Returns a new [WorkflowTransitionLinks] instance.
  WorkflowTransitionLinks({
    this.fromPort,
    this.fromStatusReference,
    this.toPort,
  });

  /// The port that the transition starts from.
  int? fromPort;

  /// The status that the transition starts from.
  String? fromStatusReference;

  /// The port that the transition goes to.
  int? toPort;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowTransitionLinks &&
    other.fromPort == fromPort &&
    other.fromStatusReference == fromStatusReference &&
    other.toPort == toPort;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (fromPort == null ? 0 : fromPort!.hashCode) +
    (fromStatusReference == null ? 0 : fromStatusReference!.hashCode) +
    (toPort == null ? 0 : toPort!.hashCode);

  @override
  String toString() => 'WorkflowTransitionLinks[fromPort=$fromPort, fromStatusReference=$fromStatusReference, toPort=$toPort]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.fromPort != null) {
      json[r'fromPort'] = this.fromPort;
    } else {
      json[r'fromPort'] = null;
    }
    if (this.fromStatusReference != null) {
      json[r'fromStatusReference'] = this.fromStatusReference;
    } else {
      json[r'fromStatusReference'] = null;
    }
    if (this.toPort != null) {
      json[r'toPort'] = this.toPort;
    } else {
      json[r'toPort'] = null;
    }
    return json;
  }

  /// Returns a new [WorkflowTransitionLinks] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowTransitionLinks? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return WorkflowTransitionLinks(
        fromPort: mapValueOfType<int>(json, r'fromPort'),
        fromStatusReference: mapValueOfType<String>(json, r'fromStatusReference'),
        toPort: mapValueOfType<int>(json, r'toPort'),
      );
    }
    return null;
  }

  static List<WorkflowTransitionLinks> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowTransitionLinks>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowTransitionLinks.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowTransitionLinks> mapFromJson(dynamic json) {
    final map = <String, WorkflowTransitionLinks>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowTransitionLinks.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowTransitionLinks-objects as value to a dart map
  static Map<String, List<WorkflowTransitionLinks>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowTransitionLinks>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowTransitionLinks.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

