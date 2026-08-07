//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FoundGroup {
  /// Returns a new [FoundGroup] instance.
  FoundGroup({
    this.avatarUrl,
    this.groupId,
    this.html,
    this.labels = const [],
    this.managedBy,
    this.name,
    this.usageType,
  });

  /// Avatar url for the group/team if present.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? avatarUrl;

  /// The ID of the group, which uniquely identifies the group across all Atlassian products. For example, *952d12c3-5b5b-4d04-bb32-44d383afc4b2*.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? groupId;

  /// The group name with the matched query string highlighted with the HTML bold tag.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? html;

  List<GroupLabel> labels;

  /// Describes who/how the team is managed. The possible values are   \\* external - when team is synced from an external directory like SCIM or HRIS, and team members cannot be modified.   \\* admins - when a team is managed by an admin (team members can only be modified by admins).   \\* team-members - managed by existing team members, new members need to be invited to join.   \\* open - anyone can join or modify this team.
  FoundGroupManagedByEnum? managedBy;

  /// The name of the group. The name of a group is mutable, to reliably identify a group use ``groupId`.`
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// Describes the type of group. The possible values are   \\* team-collaboration - A platform team managed in people directory.   \\* userbase-group - a group of users created in adminhub.   \\* admin-oversight - currently unused.
  FoundGroupUsageTypeEnum? usageType;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FoundGroup &&
    other.avatarUrl == avatarUrl &&
    other.groupId == groupId &&
    other.html == html &&
    _deepEquality.equals(other.labels, labels) &&
    other.managedBy == managedBy &&
    other.name == name &&
    other.usageType == usageType;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (avatarUrl == null ? 0 : avatarUrl!.hashCode) +
    (groupId == null ? 0 : groupId!.hashCode) +
    (html == null ? 0 : html!.hashCode) +
    (labels.hashCode) +
    (managedBy == null ? 0 : managedBy!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (usageType == null ? 0 : usageType!.hashCode);

  @override
  String toString() => 'FoundGroup[avatarUrl=$avatarUrl, groupId=$groupId, html=$html, labels=$labels, managedBy=$managedBy, name=$name, usageType=$usageType]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.avatarUrl != null) {
      json[r'avatarUrl'] = this.avatarUrl;
    } else {
      json[r'avatarUrl'] = null;
    }
    if (this.groupId != null) {
      json[r'groupId'] = this.groupId;
    } else {
      json[r'groupId'] = null;
    }
    if (this.html != null) {
      json[r'html'] = this.html;
    } else {
      json[r'html'] = null;
    }
      json[r'labels'] = this.labels;
    if (this.managedBy != null) {
      json[r'managedBy'] = this.managedBy;
    } else {
      json[r'managedBy'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.usageType != null) {
      json[r'usageType'] = this.usageType;
    } else {
      json[r'usageType'] = null;
    }
    return json;
  }

  /// Returns a new [FoundGroup] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FoundGroup? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return FoundGroup(
        avatarUrl: mapValueOfType<String>(json, r'avatarUrl'),
        groupId: mapValueOfType<String>(json, r'groupId'),
        html: mapValueOfType<String>(json, r'html'),
        labels: GroupLabel.listFromJson(json[r'labels']),
        managedBy: FoundGroupManagedByEnum.fromJson(json[r'managedBy']),
        name: mapValueOfType<String>(json, r'name'),
        usageType: FoundGroupUsageTypeEnum.fromJson(json[r'usageType']),
      );
    }
    return null;
  }

  static List<FoundGroup> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FoundGroup>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FoundGroup.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FoundGroup> mapFromJson(dynamic json) {
    final map = <String, FoundGroup>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FoundGroup.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FoundGroup-objects as value to a dart map
  static Map<String, List<FoundGroup>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FoundGroup>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FoundGroup.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// Describes who/how the team is managed. The possible values are   \\* external - when team is synced from an external directory like SCIM or HRIS, and team members cannot be modified.   \\* admins - when a team is managed by an admin (team members can only be modified by admins).   \\* team-members - managed by existing team members, new members need to be invited to join.   \\* open - anyone can join or modify this team.
enum FoundGroupManagedByEnum {
  EXTERNAL._(r'EXTERNAL'),
  ADMINS._(r'ADMINS'),
  TEAM_MEMBERS._(r'TEAM_MEMBERS'),
  OPEN._(r'OPEN'),
  ;

  /// Instantiate a new enum with the provided value.
  const FoundGroupManagedByEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [FoundGroupManagedByEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static FoundGroupManagedByEnum? fromJson(dynamic value) => FoundGroupManagedByEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [FoundGroupManagedByEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<FoundGroupManagedByEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FoundGroupManagedByEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FoundGroupManagedByEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [FoundGroupManagedByEnum] to String,
/// and [decode] dynamic data back to [FoundGroupManagedByEnum].
class FoundGroupManagedByEnumTypeTransformer {
  factory FoundGroupManagedByEnumTypeTransformer() => _instance ??= const FoundGroupManagedByEnumTypeTransformer._();

  const FoundGroupManagedByEnumTypeTransformer._();

  String encode(FoundGroupManagedByEnum data) => data._value;

  /// Returns the instance of [FoundGroupManagedByEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  FoundGroupManagedByEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is FoundGroupManagedByEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'EXTERNAL': return FoundGroupManagedByEnum.EXTERNAL;
        case r'ADMINS': return FoundGroupManagedByEnum.ADMINS;
        case r'TEAM_MEMBERS': return FoundGroupManagedByEnum.TEAM_MEMBERS;
        case r'OPEN': return FoundGroupManagedByEnum.OPEN;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static FoundGroupManagedByEnumTypeTransformer? _instance;
}


/// Describes the type of group. The possible values are   \\* team-collaboration - A platform team managed in people directory.   \\* userbase-group - a group of users created in adminhub.   \\* admin-oversight - currently unused.
enum FoundGroupUsageTypeEnum {
  USERBASE_GROUP._(r'USERBASE_GROUP'),
  TEAM_COLLABORATION._(r'TEAM_COLLABORATION'),
  ADMIN_OVERSIGHT._(r'ADMIN_OVERSIGHT'),
  ;

  /// Instantiate a new enum with the provided value.
  const FoundGroupUsageTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [FoundGroupUsageTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static FoundGroupUsageTypeEnum? fromJson(dynamic value) => FoundGroupUsageTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [FoundGroupUsageTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<FoundGroupUsageTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FoundGroupUsageTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FoundGroupUsageTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [FoundGroupUsageTypeEnum] to String,
/// and [decode] dynamic data back to [FoundGroupUsageTypeEnum].
class FoundGroupUsageTypeEnumTypeTransformer {
  factory FoundGroupUsageTypeEnumTypeTransformer() => _instance ??= const FoundGroupUsageTypeEnumTypeTransformer._();

  const FoundGroupUsageTypeEnumTypeTransformer._();

  String encode(FoundGroupUsageTypeEnum data) => data._value;

  /// Returns the instance of [FoundGroupUsageTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  FoundGroupUsageTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is FoundGroupUsageTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'USERBASE_GROUP': return FoundGroupUsageTypeEnum.USERBASE_GROUP;
        case r'TEAM_COLLABORATION': return FoundGroupUsageTypeEnum.TEAM_COLLABORATION;
        case r'ADMIN_OVERSIGHT': return FoundGroupUsageTypeEnum.ADMIN_OVERSIGHT;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static FoundGroupUsageTypeEnumTypeTransformer? _instance;
}


