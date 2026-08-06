//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProjectPermissions {
  /// Returns a new [ProjectPermissions] instance.
  ProjectPermissions({
    this.canEdit,
  });

  /// Whether the logged user can edit the project.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? canEdit;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProjectPermissions &&
    other.canEdit == canEdit;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (canEdit == null ? 0 : canEdit!.hashCode);

  @override
  String toString() => 'ProjectPermissions[canEdit=$canEdit]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.canEdit != null) {
      json[r'canEdit'] = this.canEdit;
    } else {
      json[r'canEdit'] = null;
    }
    return json;
  }

  /// Returns a new [ProjectPermissions] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProjectPermissions? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ProjectPermissions(
        canEdit: mapValueOfType<bool>(json, r'canEdit'),
      );
    }
    return null;
  }

  static List<ProjectPermissions> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectPermissions>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectPermissions.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProjectPermissions> mapFromJson(dynamic json) {
    final map = <String, ProjectPermissions>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProjectPermissions.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProjectPermissions-objects as value to a dart map
  static Map<String, List<ProjectPermissions>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProjectPermissions>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProjectPermissions.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

