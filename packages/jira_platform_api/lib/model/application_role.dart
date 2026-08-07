//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ApplicationRole {
  /// Returns a new [ApplicationRole] instance.
  ApplicationRole({
    this.defaultGroups = const [],
    this.defaultGroupsDetails = const [],
    this.defined,
    this.groupDetails = const [],
    this.groups = const [],
    this.hasUnlimitedSeats,
    this.key,
    this.name,
    this.numberOfSeats,
    this.platform,
    this.remainingSeats,
    this.selectedByDefault,
    this.userCount,
    this.userCountDescription,
  });

  /// The groups that are granted default access for this application role. As a group's name can change, use of `defaultGroupsDetails` is recommended to identify a groups.
  List<String> defaultGroups;

  /// The groups that are granted default access for this application role.
  List<GroupName> defaultGroupsDetails;

  /// Deprecated.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? defined;

  /// The groups associated with the application role.
  List<GroupName> groupDetails;

  /// The groups associated with the application role. As a group's name can change, use of `groupDetails` is recommended to identify a groups.
  List<String> groups;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? hasUnlimitedSeats;

  /// The key of the application role.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? key;

  /// The display name of the application role.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The maximum count of users on your license.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? numberOfSeats;

  /// Indicates if the application role belongs to Jira platform (`jira-core`).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? platform;

  /// The count of users remaining on your license.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? remainingSeats;

  /// Determines whether this application role should be selected by default on user creation.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? selectedByDefault;

  /// The number of users counting against your license.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? userCount;

  /// The [type of users](https://confluence.atlassian.com/x/lRW3Ng) being counted against your license.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? userCountDescription;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ApplicationRole &&
    _deepEquality.equals(other.defaultGroups, defaultGroups) &&
    _deepEquality.equals(other.defaultGroupsDetails, defaultGroupsDetails) &&
    other.defined == defined &&
    _deepEquality.equals(other.groupDetails, groupDetails) &&
    _deepEquality.equals(other.groups, groups) &&
    other.hasUnlimitedSeats == hasUnlimitedSeats &&
    other.key == key &&
    other.name == name &&
    other.numberOfSeats == numberOfSeats &&
    other.platform == platform &&
    other.remainingSeats == remainingSeats &&
    other.selectedByDefault == selectedByDefault &&
    other.userCount == userCount &&
    other.userCountDescription == userCountDescription;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (defaultGroups.hashCode) +
    (defaultGroupsDetails.hashCode) +
    (defined == null ? 0 : defined!.hashCode) +
    (groupDetails.hashCode) +
    (groups.hashCode) +
    (hasUnlimitedSeats == null ? 0 : hasUnlimitedSeats!.hashCode) +
    (key == null ? 0 : key!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (numberOfSeats == null ? 0 : numberOfSeats!.hashCode) +
    (platform == null ? 0 : platform!.hashCode) +
    (remainingSeats == null ? 0 : remainingSeats!.hashCode) +
    (selectedByDefault == null ? 0 : selectedByDefault!.hashCode) +
    (userCount == null ? 0 : userCount!.hashCode) +
    (userCountDescription == null ? 0 : userCountDescription!.hashCode);

  @override
  String toString() => 'ApplicationRole[defaultGroups=$defaultGroups, defaultGroupsDetails=$defaultGroupsDetails, defined=$defined, groupDetails=$groupDetails, groups=$groups, hasUnlimitedSeats=$hasUnlimitedSeats, key=$key, name=$name, numberOfSeats=$numberOfSeats, platform=$platform, remainingSeats=$remainingSeats, selectedByDefault=$selectedByDefault, userCount=$userCount, userCountDescription=$userCountDescription]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'defaultGroups'] = this.defaultGroups;
      json[r'defaultGroupsDetails'] = this.defaultGroupsDetails;
    if (this.defined != null) {
      json[r'defined'] = this.defined;
    } else {
      json[r'defined'] = null;
    }
      json[r'groupDetails'] = this.groupDetails;
      json[r'groups'] = this.groups;
    if (this.hasUnlimitedSeats != null) {
      json[r'hasUnlimitedSeats'] = this.hasUnlimitedSeats;
    } else {
      json[r'hasUnlimitedSeats'] = null;
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
    if (this.numberOfSeats != null) {
      json[r'numberOfSeats'] = this.numberOfSeats;
    } else {
      json[r'numberOfSeats'] = null;
    }
    if (this.platform != null) {
      json[r'platform'] = this.platform;
    } else {
      json[r'platform'] = null;
    }
    if (this.remainingSeats != null) {
      json[r'remainingSeats'] = this.remainingSeats;
    } else {
      json[r'remainingSeats'] = null;
    }
    if (this.selectedByDefault != null) {
      json[r'selectedByDefault'] = this.selectedByDefault;
    } else {
      json[r'selectedByDefault'] = null;
    }
    if (this.userCount != null) {
      json[r'userCount'] = this.userCount;
    } else {
      json[r'userCount'] = null;
    }
    if (this.userCountDescription != null) {
      json[r'userCountDescription'] = this.userCountDescription;
    } else {
      json[r'userCountDescription'] = null;
    }
    return json;
  }

  /// Returns a new [ApplicationRole] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ApplicationRole? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ApplicationRole(
        defaultGroups: json[r'defaultGroups'] is Iterable
            ? (json[r'defaultGroups'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        defaultGroupsDetails: GroupName.listFromJson(json[r'defaultGroupsDetails']),
        defined: mapValueOfType<bool>(json, r'defined'),
        groupDetails: GroupName.listFromJson(json[r'groupDetails']),
        groups: json[r'groups'] is Iterable
            ? (json[r'groups'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        hasUnlimitedSeats: mapValueOfType<bool>(json, r'hasUnlimitedSeats'),
        key: mapValueOfType<String>(json, r'key'),
        name: mapValueOfType<String>(json, r'name'),
        numberOfSeats: mapValueOfType<int>(json, r'numberOfSeats'),
        platform: mapValueOfType<bool>(json, r'platform'),
        remainingSeats: mapValueOfType<int>(json, r'remainingSeats'),
        selectedByDefault: mapValueOfType<bool>(json, r'selectedByDefault'),
        userCount: mapValueOfType<int>(json, r'userCount'),
        userCountDescription: mapValueOfType<String>(json, r'userCountDescription'),
      );
    }
    return null;
  }

  static List<ApplicationRole> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ApplicationRole>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ApplicationRole.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ApplicationRole> mapFromJson(dynamic json) {
    final map = <String, ApplicationRole>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ApplicationRole.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ApplicationRole-objects as value to a dart map
  static Map<String, List<ApplicationRole>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ApplicationRole>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ApplicationRole.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

