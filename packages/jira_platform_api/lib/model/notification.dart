//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Notification {
  /// Returns a new [Notification] instance.
  Notification({
    this.htmlBody,
    this.restrict,
    this.subject,
    this.textBody,
    this.to,
  });

  /// The HTML body of the email notification for the issue.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? htmlBody;

  /// Restricts the notifications to users with the specified permissions.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  NotificationRecipientsRestrictions? restrict;

  /// The subject of the email notification for the issue. If this is not specified, then the subject is set to the issue key and summary.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? subject;

  /// The plain text body of the email notification for the issue.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? textBody;

  /// The recipients of the email notification for the issue.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  NotificationRecipients? to;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Notification &&
    other.htmlBody == htmlBody &&
    other.restrict == restrict &&
    other.subject == subject &&
    other.textBody == textBody &&
    other.to == to;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (htmlBody == null ? 0 : htmlBody!.hashCode) +
    (restrict == null ? 0 : restrict!.hashCode) +
    (subject == null ? 0 : subject!.hashCode) +
    (textBody == null ? 0 : textBody!.hashCode) +
    (to == null ? 0 : to!.hashCode);

  @override
  String toString() => 'Notification[htmlBody=$htmlBody, restrict=$restrict, subject=$subject, textBody=$textBody, to=$to]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.htmlBody != null) {
      json[r'htmlBody'] = this.htmlBody;
    } else {
      json[r'htmlBody'] = null;
    }
    if (this.restrict != null) {
      json[r'restrict'] = this.restrict;
    } else {
      json[r'restrict'] = null;
    }
    if (this.subject != null) {
      json[r'subject'] = this.subject;
    } else {
      json[r'subject'] = null;
    }
    if (this.textBody != null) {
      json[r'textBody'] = this.textBody;
    } else {
      json[r'textBody'] = null;
    }
    if (this.to != null) {
      json[r'to'] = this.to;
    } else {
      json[r'to'] = null;
    }
    return json;
  }

  /// Returns a new [Notification] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Notification? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return Notification(
        htmlBody: mapValueOfType<String>(json, r'htmlBody'),
        restrict: NotificationRecipientsRestrictions.fromJson(json[r'restrict']),
        subject: mapValueOfType<String>(json, r'subject'),
        textBody: mapValueOfType<String>(json, r'textBody'),
        to: NotificationRecipients.fromJson(json[r'to']),
      );
    }
    return null;
  }

  static List<Notification> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Notification>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Notification.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Notification> mapFromJson(dynamic json) {
    final map = <String, Notification>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Notification.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Notification-objects as value to a dart map
  static Map<String, List<Notification>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Notification>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Notification.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

