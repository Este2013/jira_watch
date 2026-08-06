//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProjectRoleDetails {
  /// Returns a new [ProjectRoleDetails] instance.
  ProjectRoleDetails({
    this.admin,
    this.default_,
    this.description,
    this.id,
    this.name,
    this.roleConfigurable,
    this.scope,
    this.self,
    this.translatedName,
    this.type,
  });

  /// Whether this role is the admin role for the project.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? admin;

  /// Whether this role is the default role for the project.
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

  /// The type of the project role. This is \"DEFAULT\" or \"GUEST\\_ROLE\".
  ProjectRoleDetailsTypeEnum? type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProjectRoleDetails &&
    other.admin == admin &&
    other.default_ == default_ &&
    other.description == description &&
    other.id == id &&
    other.name == name &&
    other.roleConfigurable == roleConfigurable &&
    other.scope == scope &&
    other.self == self &&
    other.translatedName == translatedName &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (admin == null ? 0 : admin!.hashCode) +
    (default_ == null ? 0 : default_!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (roleConfigurable == null ? 0 : roleConfigurable!.hashCode) +
    (scope == null ? 0 : scope!.hashCode) +
    (self == null ? 0 : self!.hashCode) +
    (translatedName == null ? 0 : translatedName!.hashCode) +
    (type == null ? 0 : type!.hashCode);

  @override
  String toString() => 'ProjectRoleDetails[admin=$admin, default_=$default_, description=$description, id=$id, name=$name, roleConfigurable=$roleConfigurable, scope=$scope, self=$self, translatedName=$translatedName, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.admin != null) {
      json[r'admin'] = this.admin;
    } else {
      json[r'admin'] = null;
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
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    return json;
  }

  /// Returns a new [ProjectRoleDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProjectRoleDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ProjectRoleDetails(
        admin: mapValueOfType<bool>(json, r'admin'),
        default_: mapValueOfType<bool>(json, r'default'),
        description: mapValueOfType<String>(json, r'description'),
        id: mapValueOfType<int>(json, r'id'),
        name: mapValueOfType<String>(json, r'name'),
        roleConfigurable: mapValueOfType<bool>(json, r'roleConfigurable'),
        scope: Scope.fromJson(json[r'scope']),
        self: mapValueOfType<String>(json, r'self'),
        translatedName: mapValueOfType<String>(json, r'translatedName'),
        type: ProjectRoleDetailsTypeEnum.fromJson(json[r'type']),
      );
    }
    return null;
  }

  static List<ProjectRoleDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectRoleDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectRoleDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProjectRoleDetails> mapFromJson(dynamic json) {
    final map = <String, ProjectRoleDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProjectRoleDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProjectRoleDetails-objects as value to a dart map
  static Map<String, List<ProjectRoleDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProjectRoleDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProjectRoleDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The type of the project role. This is \"DEFAULT\" or \"GUEST\\_ROLE\".
enum ProjectRoleDetailsTypeEnum {
  DEFAULT._(r'DEFAULT'),
  GUEST_ROLE._(r'GUEST_ROLE'),
  AI_AGENT_ROLE._(r'AI_AGENT_ROLE'),
  ;

  /// Instantiate a new enum with the provided value.
  const ProjectRoleDetailsTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ProjectRoleDetailsTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ProjectRoleDetailsTypeEnum? fromJson(dynamic value) => ProjectRoleDetailsTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ProjectRoleDetailsTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ProjectRoleDetailsTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectRoleDetailsTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectRoleDetailsTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ProjectRoleDetailsTypeEnum] to String,
/// and [decode] dynamic data back to [ProjectRoleDetailsTypeEnum].
class ProjectRoleDetailsTypeEnumTypeTransformer {
  factory ProjectRoleDetailsTypeEnumTypeTransformer() => _instance ??= const ProjectRoleDetailsTypeEnumTypeTransformer._();

  const ProjectRoleDetailsTypeEnumTypeTransformer._();

  String encode(ProjectRoleDetailsTypeEnum data) => data._value;

  /// Returns the instance of [ProjectRoleDetailsTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ProjectRoleDetailsTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is ProjectRoleDetailsTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'DEFAULT': return ProjectRoleDetailsTypeEnum.DEFAULT;
        case r'GUEST_ROLE': return ProjectRoleDetailsTypeEnum.GUEST_ROLE;
        case r'AI_AGENT_ROLE': return ProjectRoleDetailsTypeEnum.AI_AGENT_ROLE;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ProjectRoleDetailsTypeEnumTypeTransformer? _instance;
}


