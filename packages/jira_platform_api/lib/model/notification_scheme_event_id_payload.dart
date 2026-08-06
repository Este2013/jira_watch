//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NotificationSchemeEventIDPayload {
  /// Returns a new [NotificationSchemeEventIDPayload] instance.
  NotificationSchemeEventIDPayload({
    this.id,
  });

  /// The event ID to use for reference in the payload
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  @override
  bool operator ==(Object other) => identical(this, other) || other is NotificationSchemeEventIDPayload &&
    other.id == id;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode);

  @override
  String toString() => 'NotificationSchemeEventIDPayload[id=$id]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    return json;
  }

  /// Returns a new [NotificationSchemeEventIDPayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NotificationSchemeEventIDPayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return NotificationSchemeEventIDPayload(
        id: mapValueOfType<String>(json, r'id'),
      );
    }
    return null;
  }

  static List<NotificationSchemeEventIDPayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <NotificationSchemeEventIDPayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NotificationSchemeEventIDPayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NotificationSchemeEventIDPayload> mapFromJson(dynamic json) {
    final map = <String, NotificationSchemeEventIDPayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NotificationSchemeEventIDPayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NotificationSchemeEventIDPayload-objects as value to a dart map
  static Map<String, List<NotificationSchemeEventIDPayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<NotificationSchemeEventIDPayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = NotificationSchemeEventIDPayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

