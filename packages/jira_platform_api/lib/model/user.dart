//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class User {
  /// Returns a new [User] instance.
  User({
    this.accountId,
    this.accountType,
    this.active,
    this.appType,
    this.applicationRoles,
    this.avatarUrls,
    this.displayName,
    this.emailAddress,
    this.expand,
    this.groups,
    this.guest,
    this.key,
    this.locale,
    this.name,
    this.self,
    this.timeZone,
  });

  /// The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*. Required in requests.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? accountId;

  /// The user account type. Can take the following values:   *  `atlassian` regular Atlassian user account  *  `app` system account used for Connect applications and OAuth to represent external systems  *  `customer` Jira Service Desk account representing an external service desk
  UserAccountTypeEnum? accountType;

  /// Whether the user is active.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? active;

  /// The app type of the user account when accountType is 'app'. Can take the following values:   *  `service` Service Account  *  `agent` Rovo Agent Account  *  `unknown` Unknown app type
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? appType;

  /// The application roles the user is assigned to.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  SimpleListWrapperApplicationRole? applicationRoles;

  /// The avatars of the user.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  AvatarUrlsBean? avatarUrls;

  /// The display name of the user. Depending on the user’s privacy setting, this may return an alternative value.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? displayName;

  /// The email address of the user. Depending on the user’s privacy setting, this may be returned as null.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? emailAddress;

  /// Expand options that include additional user details in the response.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? expand;

  /// The groups that the user belongs to.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  SimpleListWrapperGroupName? groups;

  /// Whether the user is a guest.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? guest;

  /// This property is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? key;

  /// The locale of the user. Depending on the user’s privacy setting, this may be returned as null.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? locale;

  /// This property is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The URL of the user.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? self;

  /// The time zone specified in the user's profile. If the user's time zone is not visible to the current user (due to user's profile setting), or if a time zone has not been set, the instance's default time zone will be returned.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? timeZone;

  @override
  bool operator ==(Object other) => identical(this, other) || other is User &&
    other.accountId == accountId &&
    other.accountType == accountType &&
    other.active == active &&
    other.appType == appType &&
    other.applicationRoles == applicationRoles &&
    other.avatarUrls == avatarUrls &&
    other.displayName == displayName &&
    other.emailAddress == emailAddress &&
    other.expand == expand &&
    other.groups == groups &&
    other.guest == guest &&
    other.key == key &&
    other.locale == locale &&
    other.name == name &&
    other.self == self &&
    other.timeZone == timeZone;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (accountId == null ? 0 : accountId!.hashCode) +
    (accountType == null ? 0 : accountType!.hashCode) +
    (active == null ? 0 : active!.hashCode) +
    (appType == null ? 0 : appType!.hashCode) +
    (applicationRoles == null ? 0 : applicationRoles!.hashCode) +
    (avatarUrls == null ? 0 : avatarUrls!.hashCode) +
    (displayName == null ? 0 : displayName!.hashCode) +
    (emailAddress == null ? 0 : emailAddress!.hashCode) +
    (expand == null ? 0 : expand!.hashCode) +
    (groups == null ? 0 : groups!.hashCode) +
    (guest == null ? 0 : guest!.hashCode) +
    (key == null ? 0 : key!.hashCode) +
    (locale == null ? 0 : locale!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (self == null ? 0 : self!.hashCode) +
    (timeZone == null ? 0 : timeZone!.hashCode);

  @override
  String toString() => 'User[accountId=$accountId, accountType=$accountType, active=$active, appType=$appType, applicationRoles=$applicationRoles, avatarUrls=$avatarUrls, displayName=$displayName, emailAddress=$emailAddress, expand=$expand, groups=$groups, guest=$guest, key=$key, locale=$locale, name=$name, self=$self, timeZone=$timeZone]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.accountId != null) {
      json[r'accountId'] = this.accountId;
    } else {
      json[r'accountId'] = null;
    }
    if (this.accountType != null) {
      json[r'accountType'] = this.accountType;
    } else {
      json[r'accountType'] = null;
    }
    if (this.active != null) {
      json[r'active'] = this.active;
    } else {
      json[r'active'] = null;
    }
    if (this.appType != null) {
      json[r'appType'] = this.appType;
    } else {
      json[r'appType'] = null;
    }
    if (this.applicationRoles != null) {
      json[r'applicationRoles'] = this.applicationRoles;
    } else {
      json[r'applicationRoles'] = null;
    }
    if (this.avatarUrls != null) {
      json[r'avatarUrls'] = this.avatarUrls;
    } else {
      json[r'avatarUrls'] = null;
    }
    if (this.displayName != null) {
      json[r'displayName'] = this.displayName;
    } else {
      json[r'displayName'] = null;
    }
    if (this.emailAddress != null) {
      json[r'emailAddress'] = this.emailAddress;
    } else {
      json[r'emailAddress'] = null;
    }
    if (this.expand != null) {
      json[r'expand'] = this.expand;
    } else {
      json[r'expand'] = null;
    }
    if (this.groups != null) {
      json[r'groups'] = this.groups;
    } else {
      json[r'groups'] = null;
    }
    if (this.guest != null) {
      json[r'guest'] = this.guest;
    } else {
      json[r'guest'] = null;
    }
    if (this.key != null) {
      json[r'key'] = this.key;
    } else {
      json[r'key'] = null;
    }
    if (this.locale != null) {
      json[r'locale'] = this.locale;
    } else {
      json[r'locale'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.self != null) {
      json[r'self'] = this.self;
    } else {
      json[r'self'] = null;
    }
    if (this.timeZone != null) {
      json[r'timeZone'] = this.timeZone;
    } else {
      json[r'timeZone'] = null;
    }
    return json;
  }

  /// Returns a new [User] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static User? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return User(
        accountId: mapValueOfType<String>(json, r'accountId'),
        accountType: UserAccountTypeEnum.fromJson(json[r'accountType']),
        active: mapValueOfType<bool>(json, r'active'),
        appType: mapValueOfType<String>(json, r'appType'),
        applicationRoles: SimpleListWrapperApplicationRole.fromJson(json[r'applicationRoles']),
        avatarUrls: AvatarUrlsBean.fromJson(json[r'avatarUrls']),
        displayName: mapValueOfType<String>(json, r'displayName'),
        emailAddress: mapValueOfType<String>(json, r'emailAddress'),
        expand: mapValueOfType<String>(json, r'expand'),
        groups: SimpleListWrapperGroupName.fromJson(json[r'groups']),
        guest: mapValueOfType<bool>(json, r'guest'),
        key: mapValueOfType<String>(json, r'key'),
        locale: mapValueOfType<String>(json, r'locale'),
        name: mapValueOfType<String>(json, r'name'),
        self: mapValueOfType<String>(json, r'self'),
        timeZone: mapValueOfType<String>(json, r'timeZone'),
      );
    }
    return null;
  }

  static List<User> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <User>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = User.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, User> mapFromJson(dynamic json) {
    final map = <String, User>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = User.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of User-objects as value to a dart map
  static Map<String, List<User>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<User>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = User.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The user account type. Can take the following values:   *  `atlassian` regular Atlassian user account  *  `app` system account used for Connect applications and OAuth to represent external systems  *  `customer` Jira Service Desk account representing an external service desk
enum UserAccountTypeEnum {
  atlassian._(r'atlassian'),
  app._(r'app'),
  customer._(r'customer'),
  unknown._(r'unknown'),
  ;

  /// Instantiate a new enum with the provided value.
  const UserAccountTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [UserAccountTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static UserAccountTypeEnum? fromJson(dynamic value) => UserAccountTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [UserAccountTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<UserAccountTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UserAccountTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserAccountTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [UserAccountTypeEnum] to String,
/// and [decode] dynamic data back to [UserAccountTypeEnum].
class UserAccountTypeEnumTypeTransformer {
  factory UserAccountTypeEnumTypeTransformer() => _instance ??= const UserAccountTypeEnumTypeTransformer._();

  const UserAccountTypeEnumTypeTransformer._();

  String encode(UserAccountTypeEnum data) => data._value;

  /// Returns the instance of [UserAccountTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  UserAccountTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is UserAccountTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'atlassian': return UserAccountTypeEnum.atlassian;
        case r'app': return UserAccountTypeEnum.app;
        case r'customer': return UserAccountTypeEnum.customer;
        case r'unknown': return UserAccountTypeEnum.unknown;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static UserAccountTypeEnumTypeTransformer? _instance;
}


