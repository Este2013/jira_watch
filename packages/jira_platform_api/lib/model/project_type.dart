//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProjectType {
  /// Returns a new [ProjectType] instance.
  ProjectType({
    this.color,
    this.descriptionI18nKey,
    this.formattedKey,
    this.icon,
    this.key,
  });

  /// The color of the project type.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? color;

  /// The key of the project type's description.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? descriptionI18nKey;

  /// The formatted key of the project type.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? formattedKey;

  /// The icon of the project type.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? icon;

  /// The key of the project type.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? key;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProjectType &&
    other.color == color &&
    other.descriptionI18nKey == descriptionI18nKey &&
    other.formattedKey == formattedKey &&
    other.icon == icon &&
    other.key == key;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (color == null ? 0 : color!.hashCode) +
    (descriptionI18nKey == null ? 0 : descriptionI18nKey!.hashCode) +
    (formattedKey == null ? 0 : formattedKey!.hashCode) +
    (icon == null ? 0 : icon!.hashCode) +
    (key == null ? 0 : key!.hashCode);

  @override
  String toString() => 'ProjectType[color=$color, descriptionI18nKey=$descriptionI18nKey, formattedKey=$formattedKey, icon=$icon, key=$key]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.color != null) {
      json[r'color'] = this.color;
    } else {
      json[r'color'] = null;
    }
    if (this.descriptionI18nKey != null) {
      json[r'descriptionI18nKey'] = this.descriptionI18nKey;
    } else {
      json[r'descriptionI18nKey'] = null;
    }
    if (this.formattedKey != null) {
      json[r'formattedKey'] = this.formattedKey;
    } else {
      json[r'formattedKey'] = null;
    }
    if (this.icon != null) {
      json[r'icon'] = this.icon;
    } else {
      json[r'icon'] = null;
    }
    if (this.key != null) {
      json[r'key'] = this.key;
    } else {
      json[r'key'] = null;
    }
    return json;
  }

  /// Returns a new [ProjectType] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProjectType? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ProjectType(
        color: mapValueOfType<String>(json, r'color'),
        descriptionI18nKey: mapValueOfType<String>(json, r'descriptionI18nKey'),
        formattedKey: mapValueOfType<String>(json, r'formattedKey'),
        icon: mapValueOfType<String>(json, r'icon'),
        key: mapValueOfType<String>(json, r'key'),
      );
    }
    return null;
  }

  static List<ProjectType> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectType>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectType.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProjectType> mapFromJson(dynamic json) {
    final map = <String, ProjectType>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProjectType.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProjectType-objects as value to a dart map
  static Map<String, List<ProjectType>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProjectType>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProjectType.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

