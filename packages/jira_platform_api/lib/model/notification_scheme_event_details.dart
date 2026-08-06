//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NotificationSchemeEventDetails {
  /// Returns a new [NotificationSchemeEventDetails] instance.
  NotificationSchemeEventDetails({
    required this.event,
    this.notifications = const [],
  });

  /// The ID of the event.
  NotificationSchemeEventTypeId event;

  /// The list of notifications mapped to a specified event.
  List<NotificationSchemeNotificationDetails> notifications;

  @override
  bool operator ==(Object other) => identical(this, other) || other is NotificationSchemeEventDetails &&
    other.event == event &&
    _deepEquality.equals(other.notifications, notifications);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (event.hashCode) +
    (notifications.hashCode);

  @override
  String toString() => 'NotificationSchemeEventDetails[event=$event, notifications=$notifications]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'event'] = this.event;
      json[r'notifications'] = this.notifications;
    return json;
  }

  /// Returns a new [NotificationSchemeEventDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NotificationSchemeEventDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'event'), 'Required key "NotificationSchemeEventDetails[event]" is missing from JSON.');
        assert(json[r'event'] != null, 'Required key "NotificationSchemeEventDetails[event]" has a null value in JSON.');
        assert(json.containsKey(r'notifications'), 'Required key "NotificationSchemeEventDetails[notifications]" is missing from JSON.');
        assert(json[r'notifications'] != null, 'Required key "NotificationSchemeEventDetails[notifications]" has a null value in JSON.');
        return true;
      }());

      return NotificationSchemeEventDetails(
        event: NotificationSchemeEventTypeId.fromJson(json[r'event'])!,
        notifications: NotificationSchemeNotificationDetails.listFromJson(json[r'notifications']),
      );
    }
    return null;
  }

  static List<NotificationSchemeEventDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <NotificationSchemeEventDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NotificationSchemeEventDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NotificationSchemeEventDetails> mapFromJson(dynamic json) {
    final map = <String, NotificationSchemeEventDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NotificationSchemeEventDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NotificationSchemeEventDetails-objects as value to a dart map
  static Map<String, List<NotificationSchemeEventDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<NotificationSchemeEventDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = NotificationSchemeEventDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'event',
    'notifications',
  };
}

