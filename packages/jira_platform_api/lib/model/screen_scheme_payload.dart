//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ScreenSchemePayload {
  /// Returns a new [ScreenSchemePayload] instance.
  ScreenSchemePayload({
    this.defaultScreen,
    this.description,
    this.name,
    this.pcri,
    this.screens = const {},
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectCreateResourceIdentifier? defaultScreen;

  /// The description of the screen scheme
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The name of the screen scheme
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectCreateResourceIdentifier? pcri;

  /// Similar to the field layout scheme those mappings allow users to set different screens for different operations: default - always there, applied to all operations that don't have an explicit mapping `create`, `view`, `edit` - specific operations that are available and users can assign a different screen for each one of them https://support.atlassian.com/jira-cloud-administration/docs/manage-screen-schemes/\\#Associating-a-screen-with-an-issue-operation
  Map<String, ProjectCreateResourceIdentifier> screens;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ScreenSchemePayload &&
    other.defaultScreen == defaultScreen &&
    other.description == description &&
    other.name == name &&
    other.pcri == pcri &&
    _deepEquality.equals(other.screens, screens);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (defaultScreen == null ? 0 : defaultScreen!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (pcri == null ? 0 : pcri!.hashCode) +
    (screens.hashCode);

  @override
  String toString() => 'ScreenSchemePayload[defaultScreen=$defaultScreen, description=$description, name=$name, pcri=$pcri, screens=$screens]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.defaultScreen != null) {
      json[r'defaultScreen'] = this.defaultScreen;
    } else {
      json[r'defaultScreen'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.pcri != null) {
      json[r'pcri'] = this.pcri;
    } else {
      json[r'pcri'] = null;
    }
      json[r'screens'] = this.screens;
    return json;
  }

  /// Returns a new [ScreenSchemePayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ScreenSchemePayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ScreenSchemePayload(
        defaultScreen: ProjectCreateResourceIdentifier.fromJson(json[r'defaultScreen']),
        description: mapValueOfType<String>(json, r'description'),
        name: mapValueOfType<String>(json, r'name'),
        pcri: ProjectCreateResourceIdentifier.fromJson(json[r'pcri']),
        screens: ProjectCreateResourceIdentifier.mapFromJson(json[r'screens']),
      );
    }
    return null;
  }

  static List<ScreenSchemePayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ScreenSchemePayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ScreenSchemePayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ScreenSchemePayload> mapFromJson(dynamic json) {
    final map = <String, ScreenSchemePayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ScreenSchemePayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ScreenSchemePayload-objects as value to a dart map
  static Map<String, List<ScreenSchemePayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ScreenSchemePayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ScreenSchemePayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

