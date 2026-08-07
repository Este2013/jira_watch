//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProjectRoleActorsUpdateBean {
  /// Returns a new [ProjectRoleActorsUpdateBean] instance.
  ProjectRoleActorsUpdateBean({
    this.categorisedActors = const {},
    this.id,
  });

  /// The actors to add to the project role.  Add groups using:   *  `atlassian-group-role-actor` and a list of group names.  *  `atlassian-group-role-actor-id` and a list of group IDs.  As a group's name can change, use of `atlassian-group-role-actor-id` is recommended. For example, `\"atlassian-group-role-actor-id\":[\"eef79f81-0b89-4fca-a736-4be531a10869\",\"77f6ab39-e755-4570-a6ae-2d7a8df0bcb8\"]`.  Add users using `atlassian-user-role-actor` and a list of account IDs. For example, `\"atlassian-user-role-actor\":[\"12345678-9abc-def1-2345-6789abcdef12\", \"abcdef12-3456-789a-bcde-f123456789ab\"]`.
  Map<String, List<String>> categorisedActors;

  /// The ID of the project role. Use [Get all project roles](#api-rest-api-3-role-get) to get a list of project role IDs.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProjectRoleActorsUpdateBean &&
    _deepEquality.equals(other.categorisedActors, categorisedActors) &&
    other.id == id;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (categorisedActors.hashCode) +
    (id == null ? 0 : id!.hashCode);

  @override
  String toString() => 'ProjectRoleActorsUpdateBean[categorisedActors=$categorisedActors, id=$id]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'categorisedActors'] = this.categorisedActors;
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    return json;
  }

  /// Returns a new [ProjectRoleActorsUpdateBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProjectRoleActorsUpdateBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ProjectRoleActorsUpdateBean(
        categorisedActors: json[r'categorisedActors'] == null
          ? const {}
            : (json[r'categorisedActors'] as Map<String, dynamic>).map((k, v) => MapEntry(k, v == null ? const <String>[] : (v as List).map((value) => value as String).toList(growable: false))),
        id: mapValueOfType<int>(json, r'id'),
      );
    }
    return null;
  }

  static List<ProjectRoleActorsUpdateBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectRoleActorsUpdateBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectRoleActorsUpdateBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProjectRoleActorsUpdateBean> mapFromJson(dynamic json) {
    final map = <String, ProjectRoleActorsUpdateBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProjectRoleActorsUpdateBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProjectRoleActorsUpdateBean-objects as value to a dart map
  static Map<String, List<ProjectRoleActorsUpdateBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProjectRoleActorsUpdateBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProjectRoleActorsUpdateBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

