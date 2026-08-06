//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserPermission {
  /// Returns a new [UserPermission] instance.
  UserPermission({
    this.deprecatedKey,
    this.description,
    this.havePermission,
    this.id,
    this.key,
    this.name,
    this.type,
  });

  /// Indicate whether the permission key is deprecated. Note that deprecated keys cannot be used in the `permissions parameter of Get my permissions. Deprecated keys are not returned by Get all permissions.`
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? deprecatedKey;

  /// The description of the permission.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// Whether the permission is available to the user in the queried context.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? havePermission;

  /// The ID of the permission. Either `id` or `key` must be specified. Use [Get all permissions](#api-rest-api-3-permissions-get) to get the list of permissions.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// The key of the permission. Either `id` or `key` must be specified. Use [Get all permissions](#api-rest-api-3-permissions-get) to get the list of permissions.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? key;

  /// The name of the permission.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The type of the permission.
  UserPermissionTypeEnum? type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserPermission &&
    other.deprecatedKey == deprecatedKey &&
    other.description == description &&
    other.havePermission == havePermission &&
    other.id == id &&
    other.key == key &&
    other.name == name &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (deprecatedKey == null ? 0 : deprecatedKey!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (havePermission == null ? 0 : havePermission!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (key == null ? 0 : key!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (type == null ? 0 : type!.hashCode);

  @override
  String toString() => 'UserPermission[deprecatedKey=$deprecatedKey, description=$description, havePermission=$havePermission, id=$id, key=$key, name=$name, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.deprecatedKey != null) {
      json[r'deprecatedKey'] = this.deprecatedKey;
    } else {
      json[r'deprecatedKey'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.havePermission != null) {
      json[r'havePermission'] = this.havePermission;
    } else {
      json[r'havePermission'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.key != null) {
      json[r'key'] = this.key;
    } else {
      json[r'key'] = null;
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

  /// Returns a new [UserPermission] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserPermission? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return UserPermission(
        deprecatedKey: mapValueOfType<bool>(json, r'deprecatedKey'),
        description: mapValueOfType<String>(json, r'description'),
        havePermission: mapValueOfType<bool>(json, r'havePermission'),
        id: mapValueOfType<String>(json, r'id'),
        key: mapValueOfType<String>(json, r'key'),
        name: mapValueOfType<String>(json, r'name'),
        type: UserPermissionTypeEnum.fromJson(json[r'type']),
      );
    }
    return null;
  }

  static List<UserPermission> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UserPermission>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserPermission.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserPermission> mapFromJson(dynamic json) {
    final map = <String, UserPermission>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserPermission.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserPermission-objects as value to a dart map
  static Map<String, List<UserPermission>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UserPermission>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UserPermission.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The type of the permission.
enum UserPermissionTypeEnum {
  GLOBAL._(r'GLOBAL'),
  PROJECT._(r'PROJECT'),
  ;

  /// Instantiate a new enum with the provided value.
  const UserPermissionTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [UserPermissionTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static UserPermissionTypeEnum? fromJson(dynamic value) => UserPermissionTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [UserPermissionTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<UserPermissionTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UserPermissionTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserPermissionTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [UserPermissionTypeEnum] to String,
/// and [decode] dynamic data back to [UserPermissionTypeEnum].
class UserPermissionTypeEnumTypeTransformer {
  factory UserPermissionTypeEnumTypeTransformer() => _instance ??= const UserPermissionTypeEnumTypeTransformer._();

  const UserPermissionTypeEnumTypeTransformer._();

  String encode(UserPermissionTypeEnum data) => data._value;

  /// Returns the instance of [UserPermissionTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  UserPermissionTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is UserPermissionTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'GLOBAL': return UserPermissionTypeEnum.GLOBAL;
        case r'PROJECT': return UserPermissionTypeEnum.PROJECT;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static UserPermissionTypeEnumTypeTransformer? _instance;
}


