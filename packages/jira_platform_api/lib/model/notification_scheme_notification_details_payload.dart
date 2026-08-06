//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NotificationSchemeNotificationDetailsPayload {
  /// Returns a new [NotificationSchemeNotificationDetailsPayload] instance.
  NotificationSchemeNotificationDetailsPayload({
    this.notificationType,
    this.parameter,
  });

  /// The type of notification.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? notificationType;

  /// The parameter of the notification, should be eiither null if not required, or PCRI.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? parameter;

  @override
  bool operator ==(Object other) => identical(this, other) || other is NotificationSchemeNotificationDetailsPayload &&
    other.notificationType == notificationType &&
    other.parameter == parameter;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (notificationType == null ? 0 : notificationType!.hashCode) +
    (parameter == null ? 0 : parameter!.hashCode);

  @override
  String toString() => 'NotificationSchemeNotificationDetailsPayload[notificationType=$notificationType, parameter=$parameter]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
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
    return json;
  }

  /// Returns a new [NotificationSchemeNotificationDetailsPayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NotificationSchemeNotificationDetailsPayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return NotificationSchemeNotificationDetailsPayload(
        notificationType: mapValueOfType<String>(json, r'notificationType'),
        parameter: mapValueOfType<String>(json, r'parameter'),
      );
    }
    return null;
  }

  static List<NotificationSchemeNotificationDetailsPayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <NotificationSchemeNotificationDetailsPayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NotificationSchemeNotificationDetailsPayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NotificationSchemeNotificationDetailsPayload> mapFromJson(dynamic json) {
    final map = <String, NotificationSchemeNotificationDetailsPayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NotificationSchemeNotificationDetailsPayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NotificationSchemeNotificationDetailsPayload-objects as value to a dart map
  static Map<String, List<NotificationSchemeNotificationDetailsPayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<NotificationSchemeNotificationDetailsPayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = NotificationSchemeNotificationDetailsPayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

