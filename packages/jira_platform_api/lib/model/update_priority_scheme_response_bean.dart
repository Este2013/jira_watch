//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdatePrioritySchemeResponseBean {
  /// Returns a new [UpdatePrioritySchemeResponseBean] instance.
  UpdatePrioritySchemeResponseBean({
    this.priorityScheme,
    this.task,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  PrioritySchemeWithPaginatedPrioritiesAndProjects? priorityScheme;

  /// The in-progress issue migration task.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  TaskProgressBeanJsonNode? task;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UpdatePrioritySchemeResponseBean &&
    other.priorityScheme == priorityScheme &&
    other.task == task;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (priorityScheme == null ? 0 : priorityScheme!.hashCode) +
    (task == null ? 0 : task!.hashCode);

  @override
  String toString() => 'UpdatePrioritySchemeResponseBean[priorityScheme=$priorityScheme, task=$task]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.priorityScheme != null) {
      json[r'priorityScheme'] = this.priorityScheme;
    } else {
      json[r'priorityScheme'] = null;
    }
    if (this.task != null) {
      json[r'task'] = this.task;
    } else {
      json[r'task'] = null;
    }
    return json;
  }

  /// Returns a new [UpdatePrioritySchemeResponseBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdatePrioritySchemeResponseBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return UpdatePrioritySchemeResponseBean(
        priorityScheme: PrioritySchemeWithPaginatedPrioritiesAndProjects.fromJson(json[r'priorityScheme']),
        task: TaskProgressBeanJsonNode.fromJson(json[r'task']),
      );
    }
    return null;
  }

  static List<UpdatePrioritySchemeResponseBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdatePrioritySchemeResponseBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdatePrioritySchemeResponseBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdatePrioritySchemeResponseBean> mapFromJson(dynamic json) {
    final map = <String, UpdatePrioritySchemeResponseBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdatePrioritySchemeResponseBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdatePrioritySchemeResponseBean-objects as value to a dart map
  static Map<String, List<UpdatePrioritySchemeResponseBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UpdatePrioritySchemeResponseBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdatePrioritySchemeResponseBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

