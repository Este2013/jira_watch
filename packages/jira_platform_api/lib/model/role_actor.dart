//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RoleActor {
  /// Returns a new [RoleActor] instance.
  RoleActor({
    this.actorGroup,
    this.actorUser,
    this.avatarUrl,
    this.displayName,
    this.id,
    this.name,
    this.type,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectRoleGroup? actorGroup;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectRoleUser? actorUser;

  /// The avatar of the role actor.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? avatarUrl;

  /// The display name of the role actor. For users, depending on the user’s privacy setting, this may return an alternative value for the user's name.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? displayName;

  /// The ID of the role actor.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  /// This property is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The type of role actor.
  RoleActorTypeEnum? type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RoleActor &&
    other.actorGroup == actorGroup &&
    other.actorUser == actorUser &&
    other.avatarUrl == avatarUrl &&
    other.displayName == displayName &&
    other.id == id &&
    other.name == name &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (actorGroup == null ? 0 : actorGroup!.hashCode) +
    (actorUser == null ? 0 : actorUser!.hashCode) +
    (avatarUrl == null ? 0 : avatarUrl!.hashCode) +
    (displayName == null ? 0 : displayName!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (type == null ? 0 : type!.hashCode);

  @override
  String toString() => 'RoleActor[actorGroup=$actorGroup, actorUser=$actorUser, avatarUrl=$avatarUrl, displayName=$displayName, id=$id, name=$name, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.actorGroup != null) {
      json[r'actorGroup'] = this.actorGroup;
    } else {
      json[r'actorGroup'] = null;
    }
    if (this.actorUser != null) {
      json[r'actorUser'] = this.actorUser;
    } else {
      json[r'actorUser'] = null;
    }
    if (this.avatarUrl != null) {
      json[r'avatarUrl'] = this.avatarUrl;
    } else {
      json[r'avatarUrl'] = null;
    }
    if (this.displayName != null) {
      json[r'displayName'] = this.displayName;
    } else {
      json[r'displayName'] = null;
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
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    return json;
  }

  /// Returns a new [RoleActor] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RoleActor? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return RoleActor(
        actorGroup: ProjectRoleGroup.fromJson(json[r'actorGroup']),
        actorUser: ProjectRoleUser.fromJson(json[r'actorUser']),
        avatarUrl: mapValueOfType<String>(json, r'avatarUrl'),
        displayName: mapValueOfType<String>(json, r'displayName'),
        id: mapValueOfType<int>(json, r'id'),
        name: mapValueOfType<String>(json, r'name'),
        type: RoleActorTypeEnum.fromJson(json[r'type']),
      );
    }
    return null;
  }

  static List<RoleActor> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RoleActor>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RoleActor.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RoleActor> mapFromJson(dynamic json) {
    final map = <String, RoleActor>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RoleActor.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RoleActor-objects as value to a dart map
  static Map<String, List<RoleActor>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RoleActor>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RoleActor.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The type of role actor.
enum RoleActorTypeEnum {
  atlassianGroupRoleActor._(r'atlassian-group-role-actor'),
  atlassianUserRoleActor._(r'atlassian-user-role-actor'),
  ;

  /// Instantiate a new enum with the provided value.
  const RoleActorTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [RoleActorTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static RoleActorTypeEnum? fromJson(dynamic value) => RoleActorTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [RoleActorTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<RoleActorTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RoleActorTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RoleActorTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [RoleActorTypeEnum] to String,
/// and [decode] dynamic data back to [RoleActorTypeEnum].
class RoleActorTypeEnumTypeTransformer {
  factory RoleActorTypeEnumTypeTransformer() => _instance ??= const RoleActorTypeEnumTypeTransformer._();

  const RoleActorTypeEnumTypeTransformer._();

  String encode(RoleActorTypeEnum data) => data._value;

  /// Returns the instance of [RoleActorTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  RoleActorTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is RoleActorTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'atlassian-group-role-actor': return RoleActorTypeEnum.atlassianGroupRoleActor;
        case r'atlassian-user-role-actor': return RoleActorTypeEnum.atlassianUserRoleActor;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static RoleActorTypeEnumTypeTransformer? _instance;
}


