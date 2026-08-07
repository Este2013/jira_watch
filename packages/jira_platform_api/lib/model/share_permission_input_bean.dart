//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SharePermissionInputBean {
  /// Returns a new [SharePermissionInputBean] instance.
  SharePermissionInputBean({
    this.accountId,
    this.groupId,
    this.groupname,
    this.projectId,
    this.projectRoleId,
    this.rights,
    required this.type,
  });

  /// The user account ID that the filter is shared with. For a request, specify the `accountId` property for the user.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? accountId;

  /// The ID of the group, which uniquely identifies the group across all Atlassian products.For example, *952d12c3-5b5b-4d04-bb32-44d383afc4b2*. Cannot be provided with `groupname`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? groupId;

  /// The name of the group to share the filter with. Set `type` to `group`. Please note that the name of a group is mutable, to reliably identify a group use `groupId`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? groupname;

  /// The ID of the project to share the filter with. Set `type` to `project`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? projectId;

  /// The ID of the project role to share the filter with. Set `type` to `projectRole` and the `projectId` for the project that the role is in.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? projectRoleId;

  /// The rights for the share permission.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? rights;

  /// The type of the share permission.Specify the type as follows:   *  `user` Share with a user.  *  `group` Share with a group. Specify `groupname` as well.  *  `project` Share with a project. Specify `projectId` as well.  *  `projectRole` Share with a project role in a project. Specify `projectId` and `projectRoleId` as well.  *  `global` Share globally, including anonymous users. If set, this type overrides all existing share permissions and must be deleted before any non-global share permissions is set.  *  `authenticated` Share with all logged-in users. This shows as `loggedin` in the response. If set, this type overrides all existing share permissions and must be deleted before any non-global share permissions is set.
  SharePermissionInputBeanTypeEnum type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SharePermissionInputBean &&
    other.accountId == accountId &&
    other.groupId == groupId &&
    other.groupname == groupname &&
    other.projectId == projectId &&
    other.projectRoleId == projectRoleId &&
    other.rights == rights &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (accountId == null ? 0 : accountId!.hashCode) +
    (groupId == null ? 0 : groupId!.hashCode) +
    (groupname == null ? 0 : groupname!.hashCode) +
    (projectId == null ? 0 : projectId!.hashCode) +
    (projectRoleId == null ? 0 : projectRoleId!.hashCode) +
    (rights == null ? 0 : rights!.hashCode) +
    (type.hashCode);

  @override
  String toString() => 'SharePermissionInputBean[accountId=$accountId, groupId=$groupId, groupname=$groupname, projectId=$projectId, projectRoleId=$projectRoleId, rights=$rights, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.accountId != null) {
      json[r'accountId'] = this.accountId;
    } else {
      json[r'accountId'] = null;
    }
    if (this.groupId != null) {
      json[r'groupId'] = this.groupId;
    } else {
      json[r'groupId'] = null;
    }
    if (this.groupname != null) {
      json[r'groupname'] = this.groupname;
    } else {
      json[r'groupname'] = null;
    }
    if (this.projectId != null) {
      json[r'projectId'] = this.projectId;
    } else {
      json[r'projectId'] = null;
    }
    if (this.projectRoleId != null) {
      json[r'projectRoleId'] = this.projectRoleId;
    } else {
      json[r'projectRoleId'] = null;
    }
    if (this.rights != null) {
      json[r'rights'] = this.rights;
    } else {
      json[r'rights'] = null;
    }
      json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [SharePermissionInputBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SharePermissionInputBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'type'), 'Required key "SharePermissionInputBean[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "SharePermissionInputBean[type]" has a null value in JSON.');
        return true;
      }());

      return SharePermissionInputBean(
        accountId: mapValueOfType<String>(json, r'accountId'),
        groupId: mapValueOfType<String>(json, r'groupId'),
        groupname: mapValueOfType<String>(json, r'groupname'),
        projectId: mapValueOfType<String>(json, r'projectId'),
        projectRoleId: mapValueOfType<String>(json, r'projectRoleId'),
        rights: mapValueOfType<int>(json, r'rights'),
        type: SharePermissionInputBeanTypeEnum.fromJson(json[r'type'])!,
      );
    }
    return null;
  }

  static List<SharePermissionInputBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SharePermissionInputBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SharePermissionInputBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SharePermissionInputBean> mapFromJson(dynamic json) {
    final map = <String, SharePermissionInputBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SharePermissionInputBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SharePermissionInputBean-objects as value to a dart map
  static Map<String, List<SharePermissionInputBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SharePermissionInputBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SharePermissionInputBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'type',
  };
}

/// The type of the share permission.Specify the type as follows:   *  `user` Share with a user.  *  `group` Share with a group. Specify `groupname` as well.  *  `project` Share with a project. Specify `projectId` as well.  *  `projectRole` Share with a project role in a project. Specify `projectId` and `projectRoleId` as well.  *  `global` Share globally, including anonymous users. If set, this type overrides all existing share permissions and must be deleted before any non-global share permissions is set.  *  `authenticated` Share with all logged-in users. This shows as `loggedin` in the response. If set, this type overrides all existing share permissions and must be deleted before any non-global share permissions is set.
enum SharePermissionInputBeanTypeEnum {
  user._(r'user'),
  project._(r'project'),
  group._(r'group'),
  projectRole._(r'projectRole'),
  global._(r'global'),
  authenticated._(r'authenticated'),
  ;

  /// Instantiate a new enum with the provided value.
  const SharePermissionInputBeanTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [SharePermissionInputBeanTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static SharePermissionInputBeanTypeEnum? fromJson(dynamic value) => SharePermissionInputBeanTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [SharePermissionInputBeanTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<SharePermissionInputBeanTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SharePermissionInputBeanTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SharePermissionInputBeanTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SharePermissionInputBeanTypeEnum] to String,
/// and [decode] dynamic data back to [SharePermissionInputBeanTypeEnum].
class SharePermissionInputBeanTypeEnumTypeTransformer {
  factory SharePermissionInputBeanTypeEnumTypeTransformer() => _instance ??= const SharePermissionInputBeanTypeEnumTypeTransformer._();

  const SharePermissionInputBeanTypeEnumTypeTransformer._();

  String encode(SharePermissionInputBeanTypeEnum data) => data._value;

  /// Returns the instance of [SharePermissionInputBeanTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SharePermissionInputBeanTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is SharePermissionInputBeanTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'user': return SharePermissionInputBeanTypeEnum.user;
        case r'project': return SharePermissionInputBeanTypeEnum.project;
        case r'group': return SharePermissionInputBeanTypeEnum.group;
        case r'projectRole': return SharePermissionInputBeanTypeEnum.projectRole;
        case r'global': return SharePermissionInputBeanTypeEnum.global;
        case r'authenticated': return SharePermissionInputBeanTypeEnum.authenticated;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static SharePermissionInputBeanTypeEnumTypeTransformer? _instance;
}


