//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NotificationRecipients {
  /// Returns a new [NotificationRecipients] instance.
  NotificationRecipients({
    this.assignee,
    this.groupIds = const [],
    this.groups = const [],
    this.reporter,
    this.users = const [],
    this.voters,
    this.watchers,
  });

  /// Whether the notification should be sent to the issue's assignees.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? assignee;

  /// List of groupIds to receive the notification.
  List<String> groupIds;

  /// List of groups to receive the notification.
  List<GroupName> groups;

  /// Whether the notification should be sent to the issue's reporter.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? reporter;

  /// List of users to receive the notification.
  List<UserDetails> users;

  /// Whether the notification should be sent to the issue's voters.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? voters;

  /// Whether the notification should be sent to the issue's watchers.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? watchers;

  @override
  bool operator ==(Object other) => identical(this, other) || other is NotificationRecipients &&
    other.assignee == assignee &&
    _deepEquality.equals(other.groupIds, groupIds) &&
    _deepEquality.equals(other.groups, groups) &&
    other.reporter == reporter &&
    _deepEquality.equals(other.users, users) &&
    other.voters == voters &&
    other.watchers == watchers;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (assignee == null ? 0 : assignee!.hashCode) +
    (groupIds.hashCode) +
    (groups.hashCode) +
    (reporter == null ? 0 : reporter!.hashCode) +
    (users.hashCode) +
    (voters == null ? 0 : voters!.hashCode) +
    (watchers == null ? 0 : watchers!.hashCode);

  @override
  String toString() => 'NotificationRecipients[assignee=$assignee, groupIds=$groupIds, groups=$groups, reporter=$reporter, users=$users, voters=$voters, watchers=$watchers]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.assignee != null) {
      json[r'assignee'] = this.assignee;
    } else {
      json[r'assignee'] = null;
    }
      json[r'groupIds'] = this.groupIds;
      json[r'groups'] = this.groups;
    if (this.reporter != null) {
      json[r'reporter'] = this.reporter;
    } else {
      json[r'reporter'] = null;
    }
      json[r'users'] = this.users;
    if (this.voters != null) {
      json[r'voters'] = this.voters;
    } else {
      json[r'voters'] = null;
    }
    if (this.watchers != null) {
      json[r'watchers'] = this.watchers;
    } else {
      json[r'watchers'] = null;
    }
    return json;
  }

  /// Returns a new [NotificationRecipients] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NotificationRecipients? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return NotificationRecipients(
        assignee: mapValueOfType<bool>(json, r'assignee'),
        groupIds: json[r'groupIds'] is Iterable
            ? (json[r'groupIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        groups: GroupName.listFromJson(json[r'groups']),
        reporter: mapValueOfType<bool>(json, r'reporter'),
        users: UserDetails.listFromJson(json[r'users']),
        voters: mapValueOfType<bool>(json, r'voters'),
        watchers: mapValueOfType<bool>(json, r'watchers'),
      );
    }
    return null;
  }

  static List<NotificationRecipients> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <NotificationRecipients>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NotificationRecipients.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NotificationRecipients> mapFromJson(dynamic json) {
    final map = <String, NotificationRecipients>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NotificationRecipients.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NotificationRecipients-objects as value to a dart map
  static Map<String, List<NotificationRecipients>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<NotificationRecipients>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = NotificationRecipients.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

