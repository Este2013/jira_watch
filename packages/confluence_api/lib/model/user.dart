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
    this.displayName,
    this.timeZone,
    this.personalSpaceId,
    this.isExternalCollaborator,
    this.accountStatus,
    this.accountId,
    this.email,
    this.accountType,
    this.publicName,
    this.profilePicture,
  });

  /// Display name of the user.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? displayName;

  /// Time zone of the user. Depending on the user's privacy setting, this may return null.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? timeZone;

  /// Space ID of the user's personal space. Returns null, if no personal space for the user.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? personalSpaceId;

  /// Whether the user is an external collaborator.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isExternalCollaborator;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  AccountStatus? accountStatus;

  /// Account ID of the user.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? accountId;

  /// The email address of the user. Depending on the user's privacy setting, this may return an empty string.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? email;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  AccountType? accountType;

  /// Public name of the user.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? publicName;

  Icon? profilePicture;

  @override
  bool operator ==(Object other) => identical(this, other) || other is User &&
    other.displayName == displayName &&
    other.timeZone == timeZone &&
    other.personalSpaceId == personalSpaceId &&
    other.isExternalCollaborator == isExternalCollaborator &&
    other.accountStatus == accountStatus &&
    other.accountId == accountId &&
    other.email == email &&
    other.accountType == accountType &&
    other.publicName == publicName &&
    other.profilePicture == profilePicture;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (displayName == null ? 0 : displayName!.hashCode) +
    (timeZone == null ? 0 : timeZone!.hashCode) +
    (personalSpaceId == null ? 0 : personalSpaceId!.hashCode) +
    (isExternalCollaborator == null ? 0 : isExternalCollaborator!.hashCode) +
    (accountStatus == null ? 0 : accountStatus!.hashCode) +
    (accountId == null ? 0 : accountId!.hashCode) +
    (email == null ? 0 : email!.hashCode) +
    (accountType == null ? 0 : accountType!.hashCode) +
    (publicName == null ? 0 : publicName!.hashCode) +
    (profilePicture == null ? 0 : profilePicture!.hashCode);

  @override
  String toString() => 'User[displayName=$displayName, timeZone=$timeZone, personalSpaceId=$personalSpaceId, isExternalCollaborator=$isExternalCollaborator, accountStatus=$accountStatus, accountId=$accountId, email=$email, accountType=$accountType, publicName=$publicName, profilePicture=$profilePicture]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.displayName != null) {
      json[r'displayName'] = this.displayName;
    } else {
      json[r'displayName'] = null;
    }
    if (this.timeZone != null) {
      json[r'timeZone'] = this.timeZone;
    } else {
      json[r'timeZone'] = null;
    }
    if (this.personalSpaceId != null) {
      json[r'personalSpaceId'] = this.personalSpaceId;
    } else {
      json[r'personalSpaceId'] = null;
    }
    if (this.isExternalCollaborator != null) {
      json[r'isExternalCollaborator'] = this.isExternalCollaborator;
    } else {
      json[r'isExternalCollaborator'] = null;
    }
    if (this.accountStatus != null) {
      json[r'accountStatus'] = this.accountStatus;
    } else {
      json[r'accountStatus'] = null;
    }
    if (this.accountId != null) {
      json[r'accountId'] = this.accountId;
    } else {
      json[r'accountId'] = null;
    }
    if (this.email != null) {
      json[r'email'] = this.email;
    } else {
      json[r'email'] = null;
    }
    if (this.accountType != null) {
      json[r'accountType'] = this.accountType;
    } else {
      json[r'accountType'] = null;
    }
    if (this.publicName != null) {
      json[r'publicName'] = this.publicName;
    } else {
      json[r'publicName'] = null;
    }
    if (this.profilePicture != null) {
      json[r'profilePicture'] = this.profilePicture;
    } else {
      json[r'profilePicture'] = null;
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
        displayName: mapValueOfType<String>(json, r'displayName'),
        timeZone: mapValueOfType<String>(json, r'timeZone'),
        personalSpaceId: mapValueOfType<String>(json, r'personalSpaceId'),
        isExternalCollaborator: mapValueOfType<bool>(json, r'isExternalCollaborator'),
        accountStatus: AccountStatus.fromJson(json[r'accountStatus']),
        accountId: mapValueOfType<String>(json, r'accountId'),
        email: mapValueOfType<String>(json, r'email'),
        accountType: AccountType.fromJson(json[r'accountType']),
        publicName: mapValueOfType<String>(json, r'publicName'),
        profilePicture: Icon.fromJson(json[r'profilePicture']),
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

