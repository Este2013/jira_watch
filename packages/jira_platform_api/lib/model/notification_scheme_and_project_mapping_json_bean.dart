//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NotificationSchemeAndProjectMappingJsonBean {
  /// Returns a new [NotificationSchemeAndProjectMappingJsonBean] instance.
  NotificationSchemeAndProjectMappingJsonBean({
    this.notificationSchemeId,
    this.projectId,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? notificationSchemeId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? projectId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is NotificationSchemeAndProjectMappingJsonBean &&
    other.notificationSchemeId == notificationSchemeId &&
    other.projectId == projectId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (notificationSchemeId == null ? 0 : notificationSchemeId!.hashCode) +
    (projectId == null ? 0 : projectId!.hashCode);

  @override
  String toString() => 'NotificationSchemeAndProjectMappingJsonBean[notificationSchemeId=$notificationSchemeId, projectId=$projectId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.notificationSchemeId != null) {
      json[r'notificationSchemeId'] = this.notificationSchemeId;
    } else {
      json[r'notificationSchemeId'] = null;
    }
    if (this.projectId != null) {
      json[r'projectId'] = this.projectId;
    } else {
      json[r'projectId'] = null;
    }
    return json;
  }

  /// Returns a new [NotificationSchemeAndProjectMappingJsonBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NotificationSchemeAndProjectMappingJsonBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return NotificationSchemeAndProjectMappingJsonBean(
        notificationSchemeId: mapValueOfType<String>(json, r'notificationSchemeId'),
        projectId: mapValueOfType<String>(json, r'projectId'),
      );
    }
    return null;
  }

  static List<NotificationSchemeAndProjectMappingJsonBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <NotificationSchemeAndProjectMappingJsonBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NotificationSchemeAndProjectMappingJsonBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NotificationSchemeAndProjectMappingJsonBean> mapFromJson(dynamic json) {
    final map = <String, NotificationSchemeAndProjectMappingJsonBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NotificationSchemeAndProjectMappingJsonBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NotificationSchemeAndProjectMappingJsonBean-objects as value to a dart map
  static Map<String, List<NotificationSchemeAndProjectMappingJsonBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<NotificationSchemeAndProjectMappingJsonBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = NotificationSchemeAndProjectMappingJsonBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

