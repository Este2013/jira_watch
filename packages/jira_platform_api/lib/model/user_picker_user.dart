//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserPickerUser {
  /// Returns a new [UserPickerUser] instance.
  UserPickerUser({
    this.accountId,
    this.accountType,
    this.avatarUrl,
    this.displayName,
    this.html,
    this.key,
    this.name,
  });

  /// The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? accountId;

  /// The user account type. Can take the following values:   *  `atlassian` regular Atlassian user account  *  `app` system account used for Connect applications and OAuth to represent external systems  *  `customer` Jira Service Desk account representing an external service desk
  UserPickerUserAccountTypeEnum? accountType;

  /// The avatar URL of the user.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? avatarUrl;

  /// The display name of the user. Depending on the user’s privacy setting, this may be returned as null.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? displayName;

  /// The display name, email address, and key of the user with the matched query string highlighted with the HTML bold tag.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? html;

  /// This property is no longer available. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? key;

  /// This property is no longer available . See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserPickerUser &&
    other.accountId == accountId &&
    other.accountType == accountType &&
    other.avatarUrl == avatarUrl &&
    other.displayName == displayName &&
    other.html == html &&
    other.key == key &&
    other.name == name;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (accountId == null ? 0 : accountId!.hashCode) +
    (accountType == null ? 0 : accountType!.hashCode) +
    (avatarUrl == null ? 0 : avatarUrl!.hashCode) +
    (displayName == null ? 0 : displayName!.hashCode) +
    (html == null ? 0 : html!.hashCode) +
    (key == null ? 0 : key!.hashCode) +
    (name == null ? 0 : name!.hashCode);

  @override
  String toString() => 'UserPickerUser[accountId=$accountId, accountType=$accountType, avatarUrl=$avatarUrl, displayName=$displayName, html=$html, key=$key, name=$name]';

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
    if (this.html != null) {
      json[r'html'] = this.html;
    } else {
      json[r'html'] = null;
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
    return json;
  }

  /// Returns a new [UserPickerUser] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserPickerUser? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return UserPickerUser(
        accountId: mapValueOfType<String>(json, r'accountId'),
        accountType: UserPickerUserAccountTypeEnum.fromJson(json[r'accountType']),
        avatarUrl: mapValueOfType<String>(json, r'avatarUrl'),
        displayName: mapValueOfType<String>(json, r'displayName'),
        html: mapValueOfType<String>(json, r'html'),
        key: mapValueOfType<String>(json, r'key'),
        name: mapValueOfType<String>(json, r'name'),
      );
    }
    return null;
  }

  static List<UserPickerUser> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UserPickerUser>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserPickerUser.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserPickerUser> mapFromJson(dynamic json) {
    final map = <String, UserPickerUser>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserPickerUser.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserPickerUser-objects as value to a dart map
  static Map<String, List<UserPickerUser>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UserPickerUser>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UserPickerUser.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The user account type. Can take the following values:   *  `atlassian` regular Atlassian user account  *  `app` system account used for Connect applications and OAuth to represent external systems  *  `customer` Jira Service Desk account representing an external service desk
enum UserPickerUserAccountTypeEnum {
  atlassian._(r'atlassian'),
  app._(r'app'),
  customer._(r'customer'),
  unknown._(r'unknown'),
  ;

  /// Instantiate a new enum with the provided value.
  const UserPickerUserAccountTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [UserPickerUserAccountTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static UserPickerUserAccountTypeEnum? fromJson(dynamic value) => UserPickerUserAccountTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [UserPickerUserAccountTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<UserPickerUserAccountTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UserPickerUserAccountTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserPickerUserAccountTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [UserPickerUserAccountTypeEnum] to String,
/// and [decode] dynamic data back to [UserPickerUserAccountTypeEnum].
class UserPickerUserAccountTypeEnumTypeTransformer {
  factory UserPickerUserAccountTypeEnumTypeTransformer() => _instance ??= const UserPickerUserAccountTypeEnumTypeTransformer._();

  const UserPickerUserAccountTypeEnumTypeTransformer._();

  String encode(UserPickerUserAccountTypeEnum data) => data._value;

  /// Returns the instance of [UserPickerUserAccountTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  UserPickerUserAccountTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is UserPickerUserAccountTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'atlassian': return UserPickerUserAccountTypeEnum.atlassian;
        case r'app': return UserPickerUserAccountTypeEnum.app;
        case r'customer': return UserPickerUserAccountTypeEnum.customer;
        case r'unknown': return UserPickerUserAccountTypeEnum.unknown;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static UserPickerUserAccountTypeEnumTypeTransformer? _instance;
}


