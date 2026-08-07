//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AnnouncementBannerConfigurationUpdate {
  /// Returns a new [AnnouncementBannerConfigurationUpdate] instance.
  AnnouncementBannerConfigurationUpdate({
    this.isDismissible,
    this.isEnabled,
    this.message,
    this.visibility,
  });

  /// Flag indicating if the announcement banner can be dismissed by the user.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isDismissible;

  /// Flag indicating if the announcement banner is enabled or not.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isEnabled;

  /// The text on the announcement banner.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

  /// Visibility of the announcement banner. Can be public or private.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? visibility;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AnnouncementBannerConfigurationUpdate &&
    other.isDismissible == isDismissible &&
    other.isEnabled == isEnabled &&
    other.message == message &&
    other.visibility == visibility;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (isDismissible == null ? 0 : isDismissible!.hashCode) +
    (isEnabled == null ? 0 : isEnabled!.hashCode) +
    (message == null ? 0 : message!.hashCode) +
    (visibility == null ? 0 : visibility!.hashCode);

  @override
  String toString() => 'AnnouncementBannerConfigurationUpdate[isDismissible=$isDismissible, isEnabled=$isEnabled, message=$message, visibility=$visibility]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.isDismissible != null) {
      json[r'isDismissible'] = this.isDismissible;
    } else {
      json[r'isDismissible'] = null;
    }
    if (this.isEnabled != null) {
      json[r'isEnabled'] = this.isEnabled;
    } else {
      json[r'isEnabled'] = null;
    }
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
    if (this.visibility != null) {
      json[r'visibility'] = this.visibility;
    } else {
      json[r'visibility'] = null;
    }
    return json;
  }

  /// Returns a new [AnnouncementBannerConfigurationUpdate] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AnnouncementBannerConfigurationUpdate? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return AnnouncementBannerConfigurationUpdate(
        isDismissible: mapValueOfType<bool>(json, r'isDismissible'),
        isEnabled: mapValueOfType<bool>(json, r'isEnabled'),
        message: mapValueOfType<String>(json, r'message'),
        visibility: mapValueOfType<String>(json, r'visibility'),
      );
    }
    return null;
  }

  static List<AnnouncementBannerConfigurationUpdate> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AnnouncementBannerConfigurationUpdate>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AnnouncementBannerConfigurationUpdate.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AnnouncementBannerConfigurationUpdate> mapFromJson(dynamic json) {
    final map = <String, AnnouncementBannerConfigurationUpdate>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AnnouncementBannerConfigurationUpdate.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AnnouncementBannerConfigurationUpdate-objects as value to a dart map
  static Map<String, List<AnnouncementBannerConfigurationUpdate>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AnnouncementBannerConfigurationUpdate>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AnnouncementBannerConfigurationUpdate.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

