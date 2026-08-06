//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NotificationRecipientsRestrictions {
  /// Returns a new [NotificationRecipientsRestrictions] instance.
  NotificationRecipientsRestrictions({
    this.groupIds = const [],
    this.groups = const [],
    this.permissions = const [],
  });

  /// List of groupId memberships required to receive the notification.
  List<String> groupIds;

  /// List of group memberships required to receive the notification.
  List<GroupName> groups;

  /// List of permissions required to receive the notification.
  List<RestrictedPermission> permissions;

  @override
  bool operator ==(Object other) => identical(this, other) || other is NotificationRecipientsRestrictions &&
    _deepEquality.equals(other.groupIds, groupIds) &&
    _deepEquality.equals(other.groups, groups) &&
    _deepEquality.equals(other.permissions, permissions);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (groupIds.hashCode) +
    (groups.hashCode) +
    (permissions.hashCode);

  @override
  String toString() => 'NotificationRecipientsRestrictions[groupIds=$groupIds, groups=$groups, permissions=$permissions]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'groupIds'] = this.groupIds;
      json[r'groups'] = this.groups;
      json[r'permissions'] = this.permissions;
    return json;
  }

  /// Returns a new [NotificationRecipientsRestrictions] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NotificationRecipientsRestrictions? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return NotificationRecipientsRestrictions(
        groupIds: json[r'groupIds'] is Iterable
            ? (json[r'groupIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        groups: GroupName.listFromJson(json[r'groups']),
        permissions: RestrictedPermission.listFromJson(json[r'permissions']),
      );
    }
    return null;
  }

  static List<NotificationRecipientsRestrictions> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <NotificationRecipientsRestrictions>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NotificationRecipientsRestrictions.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NotificationRecipientsRestrictions> mapFromJson(dynamic json) {
    final map = <String, NotificationRecipientsRestrictions>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NotificationRecipientsRestrictions.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NotificationRecipientsRestrictions-objects as value to a dart map
  static Map<String, List<NotificationRecipientsRestrictions>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<NotificationRecipientsRestrictions>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = NotificationRecipientsRestrictions.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

