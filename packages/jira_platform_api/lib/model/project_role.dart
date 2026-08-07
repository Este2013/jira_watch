//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProjectRole {
  /// Returns a new [ProjectRole] instance.
  ProjectRole({
    this.actors = const [],
    this.admin,
    this.currentUserRole,
    this.default_,
    this.description,
    this.id,
    this.name,
    this.roleConfigurable,
    this.scope,
    this.self,
    this.translatedName,
  });

  /// The list of users who act in this role.
  List<RoleActor> actors;

  /// Whether this role is the admin role for the project.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? admin;

  /// Whether the calling user is part of this role.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? currentUserRole;

  /// Whether this role is the default role for the project
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? default_;

  /// The description of the project role.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The ID of the project role.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  /// The name of the project role.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// Whether the roles are configurable for this project.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? roleConfigurable;

  /// The scope of the role. Indicated for roles associated with [next-gen projects](https://confluence.atlassian.com/x/loMyO).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Scope? scope;

  /// The URL the project role details.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? self;

  /// The translated name of the project role.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? translatedName;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProjectRole &&
    _deepEquality.equals(other.actors, actors) &&
    other.admin == admin &&
    other.currentUserRole == currentUserRole &&
    other.default_ == default_ &&
    other.description == description &&
    other.id == id &&
    other.name == name &&
    other.roleConfigurable == roleConfigurable &&
    other.scope == scope &&
    other.self == self &&
    other.translatedName == translatedName;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (actors.hashCode) +
    (admin == null ? 0 : admin!.hashCode) +
    (currentUserRole == null ? 0 : currentUserRole!.hashCode) +
    (default_ == null ? 0 : default_!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (roleConfigurable == null ? 0 : roleConfigurable!.hashCode) +
    (scope == null ? 0 : scope!.hashCode) +
    (self == null ? 0 : self!.hashCode) +
    (translatedName == null ? 0 : translatedName!.hashCode);

  @override
  String toString() => 'ProjectRole[actors=$actors, admin=$admin, currentUserRole=$currentUserRole, default_=$default_, description=$description, id=$id, name=$name, roleConfigurable=$roleConfigurable, scope=$scope, self=$self, translatedName=$translatedName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'actors'] = this.actors;
    if (this.admin != null) {
      json[r'admin'] = this.admin;
    } else {
      json[r'admin'] = null;
    }
    if (this.currentUserRole != null) {
      json[r'currentUserRole'] = this.currentUserRole;
    } else {
      json[r'currentUserRole'] = null;
    }
    if (this.default_ != null) {
      json[r'default'] = this.default_;
    } else {
      json[r'default'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.roleConfigurable != null) {
      json[r'roleConfigurable'] = this.roleConfigurable;
    } else {
      json[r'roleConfigurable'] = null;
    }
    if (this.scope != null) {
      json[r'scope'] = this.scope;
    } else {
      json[r'scope'] = null;
    }
    if (this.self != null) {
      json[r'self'] = this.self;
    } else {
      json[r'self'] = null;
    }
    if (this.translatedName != null) {
      json[r'translatedName'] = this.translatedName;
    } else {
      json[r'translatedName'] = null;
    }
    return json;
  }

  /// Returns a new [ProjectRole] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProjectRole? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ProjectRole(
        actors: RoleActor.listFromJson(json[r'actors']),
        admin: mapValueOfType<bool>(json, r'admin'),
        currentUserRole: mapValueOfType<bool>(json, r'currentUserRole'),
        default_: mapValueOfType<bool>(json, r'default'),
        description: mapValueOfType<String>(json, r'description'),
        id: mapValueOfType<int>(json, r'id'),
        name: mapValueOfType<String>(json, r'name'),
        roleConfigurable: mapValueOfType<bool>(json, r'roleConfigurable'),
        scope: Scope.fromJson(json[r'scope']),
        self: mapValueOfType<String>(json, r'self'),
        translatedName: mapValueOfType<String>(json, r'translatedName'),
      );
    }
    return null;
  }

  static List<ProjectRole> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectRole>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectRole.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProjectRole> mapFromJson(dynamic json) {
    final map = <String, ProjectRole>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProjectRole.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProjectRole-objects as value to a dart map
  static Map<String, List<ProjectRole>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProjectRole>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProjectRole.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

