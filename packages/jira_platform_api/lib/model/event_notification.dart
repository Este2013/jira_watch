//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class EventNotification {
  /// Returns a new [EventNotification] instance.
  EventNotification({
    this.emailAddress,
    this.expand,
    this.field,
    this.group,
    this.id,
    this.notificationType,
    this.parameter,
    this.projectRole,
    this.recipient,
    this.user,
  });

  /// The email address.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? emailAddress;

  /// Expand options that include additional event notification details in the response.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? expand;

  /// The custom user or group field.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  FieldDetails? field;

  /// The specified group.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  GroupName? group;

  /// The ID of the notification.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  /// Identifies the recipients of the notification.
  EventNotificationNotificationTypeEnum? notificationType;

  /// As a group's name can change, use of `recipient` is recommended. The identifier associated with the `notificationType` value that defines the receiver of the notification, where the receiver isn't implied by `notificationType` value. So, when `notificationType` is:   *  `User` The `parameter` is the user account ID.  *  `Group` The `parameter` is the group name.  *  `ProjectRole` The `parameter` is the project role ID.  *  `UserCustomField` The `parameter` is the ID of the custom field.  *  `GroupCustomField` The `parameter` is the ID of the custom field.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? parameter;

  /// The specified project role.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectRole? projectRole;

  /// The identifier associated with the `notificationType` value that defines the receiver of the notification, where the receiver isn't implied by the `notificationType` value. So, when `notificationType` is:   *  `User`, `recipient` is the user account ID.  *  `Group`, `recipient` is the group ID.  *  `ProjectRole`, `recipient` is the project role ID.  *  `UserCustomField`, `recipient` is the ID of the custom field.  *  `GroupCustomField`, `recipient` is the ID of the custom field.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? recipient;

  /// The specified user.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  UserDetails? user;

  @override
  bool operator ==(Object other) => identical(this, other) || other is EventNotification &&
    other.emailAddress == emailAddress &&
    other.expand == expand &&
    other.field == field &&
    other.group == group &&
    other.id == id &&
    other.notificationType == notificationType &&
    other.parameter == parameter &&
    other.projectRole == projectRole &&
    other.recipient == recipient &&
    other.user == user;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (emailAddress == null ? 0 : emailAddress!.hashCode) +
    (expand == null ? 0 : expand!.hashCode) +
    (field == null ? 0 : field!.hashCode) +
    (group == null ? 0 : group!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (notificationType == null ? 0 : notificationType!.hashCode) +
    (parameter == null ? 0 : parameter!.hashCode) +
    (projectRole == null ? 0 : projectRole!.hashCode) +
    (recipient == null ? 0 : recipient!.hashCode) +
    (user == null ? 0 : user!.hashCode);

  @override
  String toString() => 'EventNotification[emailAddress=$emailAddress, expand=$expand, field=$field, group=$group, id=$id, notificationType=$notificationType, parameter=$parameter, projectRole=$projectRole, recipient=$recipient, user=$user]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
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
    if (this.field != null) {
      json[r'field'] = this.field;
    } else {
      json[r'field'] = null;
    }
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
    if (this.notificationType != null) {
      json[r'notificationType'] = this.notificationType;
    } else {
      json[r'notificationType'] = null;
    }
    if (this.parameter != null) {
      json[r'parameter'] = this.parameter;
    } else {
      json[r'parameter'] = null;
    }
    if (this.projectRole != null) {
      json[r'projectRole'] = this.projectRole;
    } else {
      json[r'projectRole'] = null;
    }
    if (this.recipient != null) {
      json[r'recipient'] = this.recipient;
    } else {
      json[r'recipient'] = null;
    }
    if (this.user != null) {
      json[r'user'] = this.user;
    } else {
      json[r'user'] = null;
    }
    return json;
  }

  /// Returns a new [EventNotification] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static EventNotification? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return EventNotification(
        emailAddress: mapValueOfType<String>(json, r'emailAddress'),
        expand: mapValueOfType<String>(json, r'expand'),
        field: FieldDetails.fromJson(json[r'field']),
        group: GroupName.fromJson(json[r'group']),
        id: mapValueOfType<int>(json, r'id'),
        notificationType: EventNotificationNotificationTypeEnum.fromJson(json[r'notificationType']),
        parameter: mapValueOfType<String>(json, r'parameter'),
        projectRole: ProjectRole.fromJson(json[r'projectRole']),
        recipient: mapValueOfType<String>(json, r'recipient'),
        user: UserDetails.fromJson(json[r'user']),
      );
    }
    return null;
  }

  static List<EventNotification> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <EventNotification>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = EventNotification.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, EventNotification> mapFromJson(dynamic json) {
    final map = <String, EventNotification>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = EventNotification.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of EventNotification-objects as value to a dart map
  static Map<String, List<EventNotification>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<EventNotification>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = EventNotification.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// Identifies the recipients of the notification.
enum EventNotificationNotificationTypeEnum {
  currentAssignee._(r'CurrentAssignee'),
  reporter._(r'Reporter'),
  currentUser._(r'CurrentUser'),
  projectLead._(r'ProjectLead'),
  componentLead._(r'ComponentLead'),
  user._(r'User'),
  group._(r'Group'),
  projectRole._(r'ProjectRole'),
  emailAddress._(r'EmailAddress'),
  allWatchers._(r'AllWatchers'),
  userCustomField._(r'UserCustomField'),
  groupCustomField._(r'GroupCustomField'),
  ;

  /// Instantiate a new enum with the provided value.
  const EventNotificationNotificationTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [EventNotificationNotificationTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static EventNotificationNotificationTypeEnum? fromJson(dynamic value) => EventNotificationNotificationTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [EventNotificationNotificationTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<EventNotificationNotificationTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <EventNotificationNotificationTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = EventNotificationNotificationTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [EventNotificationNotificationTypeEnum] to String,
/// and [decode] dynamic data back to [EventNotificationNotificationTypeEnum].
class EventNotificationNotificationTypeEnumTypeTransformer {
  factory EventNotificationNotificationTypeEnumTypeTransformer() => _instance ??= const EventNotificationNotificationTypeEnumTypeTransformer._();

  const EventNotificationNotificationTypeEnumTypeTransformer._();

  String encode(EventNotificationNotificationTypeEnum data) => data._value;

  /// Returns the instance of [EventNotificationNotificationTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  EventNotificationNotificationTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is EventNotificationNotificationTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'CurrentAssignee': return EventNotificationNotificationTypeEnum.currentAssignee;
        case r'Reporter': return EventNotificationNotificationTypeEnum.reporter;
        case r'CurrentUser': return EventNotificationNotificationTypeEnum.currentUser;
        case r'ProjectLead': return EventNotificationNotificationTypeEnum.projectLead;
        case r'ComponentLead': return EventNotificationNotificationTypeEnum.componentLead;
        case r'User': return EventNotificationNotificationTypeEnum.user;
        case r'Group': return EventNotificationNotificationTypeEnum.group;
        case r'ProjectRole': return EventNotificationNotificationTypeEnum.projectRole;
        case r'EmailAddress': return EventNotificationNotificationTypeEnum.emailAddress;
        case r'AllWatchers': return EventNotificationNotificationTypeEnum.allWatchers;
        case r'UserCustomField': return EventNotificationNotificationTypeEnum.userCustomField;
        case r'GroupCustomField': return EventNotificationNotificationTypeEnum.groupCustomField;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static EventNotificationNotificationTypeEnumTypeTransformer? _instance;
}


