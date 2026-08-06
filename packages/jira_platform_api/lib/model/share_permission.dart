//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SharePermission {
  /// Returns a new [SharePermission] instance.
  SharePermission({
    this.group,
    this.id,
    this.project,
    this.role,
    required this.type,
    this.user,
  });

  /// The group that the filter is shared with. For a request, specify the `groupId` or `name` property for the group. As a group's name can change, use of `groupId` is recommended.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  GroupName? group;

  /// The unique identifier of the share permission.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  /// The project that the filter is shared with. This is similar to the project object returned by [Get project](#api-rest-api-3-project-projectIdOrKey-get) but it contains a subset of the properties, which are: `self`, `id`, `key`, `assigneeType`, `name`, `roles`, `avatarUrls`, `projectType`, `simplified`.   For a request, specify the `id` for the project.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Project? project;

  /// The project role that the filter is shared with.   For a request, specify the `id` for the role. You must also specify the `project` object and `id` for the project that the role is in.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectRole? role;

  /// The type of share permission:   *  `user` Shared with a user.  *  `group` Shared with a group. If set in a request, then specify `sharePermission.group` as well.  *  `project` Shared with a project. If set in a request, then specify `sharePermission.project` as well.  *  `projectRole` Share with a project role in a project. This value is not returned in responses. It is used in requests, where it needs to be specify with `projectId` and `projectRoleId`.  *  `global` Shared globally. If set in a request, no other `sharePermission` properties need to be specified.  *  `loggedin` Shared with all logged-in users. Note: This value is set in a request by specifying `authenticated` as the `type`.  *  `project-unknown` Shared with a project that the user does not have access to. Cannot be set in a request.
  SharePermissionTypeEnum type;

  /// The user account ID that the filter is shared with. For a request, specify the `accountId` property for the user.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  UserBean? user;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SharePermission &&
    other.group == group &&
    other.id == id &&
    other.project == project &&
    other.role == role &&
    other.type == type &&
    other.user == user;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (group == null ? 0 : group!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (project == null ? 0 : project!.hashCode) +
    (role == null ? 0 : role!.hashCode) +
    (type.hashCode) +
    (user == null ? 0 : user!.hashCode);

  @override
  String toString() => 'SharePermission[group=$group, id=$id, project=$project, role=$role, type=$type, user=$user]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.group != null) {
      json[r'group'] = this.group;
    } else {
      json[r'group'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.project != null) {
      json[r'project'] = this.project;
    } else {
      json[r'project'] = null;
    }
    if (this.role != null) {
      json[r'role'] = this.role;
    } else {
      json[r'role'] = null;
    }
      json[r'type'] = this.type;
    if (this.user != null) {
      json[r'user'] = this.user;
    } else {
      json[r'user'] = null;
    }
    return json;
  }

  /// Returns a new [SharePermission] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SharePermission? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'type'), 'Required key "SharePermission[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "SharePermission[type]" has a null value in JSON.');
        return true;
      }());

      return SharePermission(
        group: GroupName.fromJson(json[r'group']),
        id: mapValueOfType<int>(json, r'id'),
        project: Project.fromJson(json[r'project']),
        role: ProjectRole.fromJson(json[r'role']),
        type: SharePermissionTypeEnum.fromJson(json[r'type'])!,
        user: UserBean.fromJson(json[r'user']),
      );
    }
    return null;
  }

  static List<SharePermission> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SharePermission>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SharePermission.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SharePermission> mapFromJson(dynamic json) {
    final map = <String, SharePermission>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SharePermission.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SharePermission-objects as value to a dart map
  static Map<String, List<SharePermission>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SharePermission>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SharePermission.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'type',
  };
}

/// The type of share permission:   *  `user` Shared with a user.  *  `group` Shared with a group. If set in a request, then specify `sharePermission.group` as well.  *  `project` Shared with a project. If set in a request, then specify `sharePermission.project` as well.  *  `projectRole` Share with a project role in a project. This value is not returned in responses. It is used in requests, where it needs to be specify with `projectId` and `projectRoleId`.  *  `global` Shared globally. If set in a request, no other `sharePermission` properties need to be specified.  *  `loggedin` Shared with all logged-in users. Note: This value is set in a request by specifying `authenticated` as the `type`.  *  `project-unknown` Shared with a project that the user does not have access to. Cannot be set in a request.
enum SharePermissionTypeEnum {
  user._(r'user'),
  group._(r'group'),
  project._(r'project'),
  projectRole._(r'projectRole'),
  global._(r'global'),
  loggedin._(r'loggedin'),
  authenticated._(r'authenticated'),
  projectUnknown._(r'project-unknown'),
  ;

  /// Instantiate a new enum with the provided value.
  const SharePermissionTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [SharePermissionTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static SharePermissionTypeEnum? fromJson(dynamic value) => SharePermissionTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [SharePermissionTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<SharePermissionTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SharePermissionTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SharePermissionTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SharePermissionTypeEnum] to String,
/// and [decode] dynamic data back to [SharePermissionTypeEnum].
class SharePermissionTypeEnumTypeTransformer {
  factory SharePermissionTypeEnumTypeTransformer() => _instance ??= const SharePermissionTypeEnumTypeTransformer._();

  const SharePermissionTypeEnumTypeTransformer._();

  String encode(SharePermissionTypeEnum data) => data._value;

  /// Returns the instance of [SharePermissionTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SharePermissionTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is SharePermissionTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'user': return SharePermissionTypeEnum.user;
        case r'group': return SharePermissionTypeEnum.group;
        case r'project': return SharePermissionTypeEnum.project;
        case r'projectRole': return SharePermissionTypeEnum.projectRole;
        case r'global': return SharePermissionTypeEnum.global;
        case r'loggedin': return SharePermissionTypeEnum.loggedin;
        case r'authenticated': return SharePermissionTypeEnum.authenticated;
        case r'project-unknown': return SharePermissionTypeEnum.projectUnknown;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static SharePermissionTypeEnumTypeTransformer? _instance;
}


