//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ChangelogAuthor {
  /// Returns a new [ChangelogAuthor] instance.
  ChangelogAuthor({
    this.accountId,
    this.accountType,
    this.active,
    this.avatarUrls,
    this.displayName,
    this.emailAddress,
    this.key,
    this.name,
    this.self,
    this.timeZone,
  });

  /// The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? accountId;

  /// The type of account represented by this user. This will be one of 'atlassian' (normal users), 'app' (application user) or 'customer' (Jira Service Desk customer user)
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? accountType;

  /// Whether the user is active.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? active;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ChangelogAuthorAllOfAvatarUrls? avatarUrls;

  /// The display name of the user. Depending on the user’s privacy settings, this may return an alternative value.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? displayName;

  /// The email address of the user. Depending on the user’s privacy settings, this may be returned as null.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? emailAddress;

  /// This property is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? key;

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

  /// The time zone specified in the user's profile. Depending on the user’s privacy settings, this may be returned as null.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? timeZone;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ChangelogAuthor &&
    other.accountId == accountId &&
    other.accountType == accountType &&
    other.active == active &&
    other.avatarUrls == avatarUrls &&
    other.displayName == displayName &&
    other.emailAddress == emailAddress &&
    other.key == key &&
    other.name == name &&
    other.self == self &&
    other.timeZone == timeZone;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (accountId == null ? 0 : accountId!.hashCode) +
    (accountType == null ? 0 : accountType!.hashCode) +
    (active == null ? 0 : active!.hashCode) +
    (avatarUrls == null ? 0 : avatarUrls!.hashCode) +
    (displayName == null ? 0 : displayName!.hashCode) +
    (emailAddress == null ? 0 : emailAddress!.hashCode) +
    (key == null ? 0 : key!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (self == null ? 0 : self!.hashCode) +
    (timeZone == null ? 0 : timeZone!.hashCode);

  @override
  String toString() => 'ChangelogAuthor[accountId=$accountId, accountType=$accountType, active=$active, avatarUrls=$avatarUrls, displayName=$displayName, emailAddress=$emailAddress, key=$key, name=$name, self=$self, timeZone=$timeZone]';

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

  /// Returns a new [ChangelogAuthor] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ChangelogAuthor? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ChangelogAuthor(
        accountId: mapValueOfType<String>(json, r'accountId'),
        accountType: mapValueOfType<String>(json, r'accountType'),
        active: mapValueOfType<bool>(json, r'active'),
        avatarUrls: ChangelogAuthorAllOfAvatarUrls.fromJson(json[r'avatarUrls']),
        displayName: mapValueOfType<String>(json, r'displayName'),
        emailAddress: mapValueOfType<String>(json, r'emailAddress'),
        key: mapValueOfType<String>(json, r'key'),
        name: mapValueOfType<String>(json, r'name'),
        self: mapValueOfType<String>(json, r'self'),
        timeZone: mapValueOfType<String>(json, r'timeZone'),
      );
    }
    return null;
  }

  static List<ChangelogAuthor> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ChangelogAuthor>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ChangelogAuthor.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ChangelogAuthor> mapFromJson(dynamic json) {
    final map = <String, ChangelogAuthor>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ChangelogAuthor.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ChangelogAuthor-objects as value to a dart map
  static Map<String, List<ChangelogAuthor>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ChangelogAuthor>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ChangelogAuthor.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

