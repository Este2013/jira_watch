//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AttachmentSettings {
  /// Returns a new [AttachmentSettings] instance.
  AttachmentSettings({
    this.enabled,
    this.uploadLimit,
  });

  /// Whether the ability to add attachments is enabled.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? enabled;

  /// The maximum size of attachments permitted, in bytes.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? uploadLimit;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AttachmentSettings &&
    other.enabled == enabled &&
    other.uploadLimit == uploadLimit;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (enabled == null ? 0 : enabled!.hashCode) +
    (uploadLimit == null ? 0 : uploadLimit!.hashCode);

  @override
  String toString() => 'AttachmentSettings[enabled=$enabled, uploadLimit=$uploadLimit]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.enabled != null) {
      json[r'enabled'] = this.enabled;
    } else {
      json[r'enabled'] = null;
    }
    if (this.uploadLimit != null) {
      json[r'uploadLimit'] = this.uploadLimit;
    } else {
      json[r'uploadLimit'] = null;
    }
    return json;
  }

  /// Returns a new [AttachmentSettings] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AttachmentSettings? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return AttachmentSettings(
        enabled: mapValueOfType<bool>(json, r'enabled'),
        uploadLimit: mapValueOfType<int>(json, r'uploadLimit'),
      );
    }
    return null;
  }

  static List<AttachmentSettings> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AttachmentSettings>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AttachmentSettings.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AttachmentSettings> mapFromJson(dynamic json) {
    final map = <String, AttachmentSettings>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AttachmentSettings.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AttachmentSettings-objects as value to a dart map
  static Map<String, List<AttachmentSettings>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AttachmentSettings>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AttachmentSettings.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

