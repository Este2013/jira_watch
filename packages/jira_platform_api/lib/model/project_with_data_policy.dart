//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProjectWithDataPolicy {
  /// Returns a new [ProjectWithDataPolicy] instance.
  ProjectWithDataPolicy({
    this.dataPolicy,
    this.id,
  });

  /// Data policy.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectDataPolicy? dataPolicy;

  /// The project ID.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProjectWithDataPolicy &&
    other.dataPolicy == dataPolicy &&
    other.id == id;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (dataPolicy == null ? 0 : dataPolicy!.hashCode) +
    (id == null ? 0 : id!.hashCode);

  @override
  String toString() => 'ProjectWithDataPolicy[dataPolicy=$dataPolicy, id=$id]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.dataPolicy != null) {
      json[r'dataPolicy'] = this.dataPolicy;
    } else {
      json[r'dataPolicy'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    return json;
  }

  /// Returns a new [ProjectWithDataPolicy] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProjectWithDataPolicy? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ProjectWithDataPolicy(
        dataPolicy: ProjectDataPolicy.fromJson(json[r'dataPolicy']),
        id: mapValueOfType<int>(json, r'id'),
      );
    }
    return null;
  }

  static List<ProjectWithDataPolicy> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectWithDataPolicy>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectWithDataPolicy.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProjectWithDataPolicy> mapFromJson(dynamic json) {
    final map = <String, ProjectWithDataPolicy>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProjectWithDataPolicy.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProjectWithDataPolicy-objects as value to a dart map
  static Map<String, List<ProjectWithDataPolicy>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProjectWithDataPolicy>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProjectWithDataPolicy.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

