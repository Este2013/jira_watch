//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ScreenSchemeDetails {
  /// Returns a new [ScreenSchemeDetails] instance.
  ScreenSchemeDetails({
    this.description,
    required this.name,
    required this.screens,
  });

  /// The description of the screen scheme. The maximum length is 255 characters.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The name of the screen scheme. The name must be unique. The maximum length is 255 characters.
  String name;

  /// The IDs of the screens for the screen types of the screen scheme. Only screens used in classic projects are accepted.
  ScreenTypes screens;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ScreenSchemeDetails &&
    other.description == description &&
    other.name == name &&
    other.screens == screens;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (name.hashCode) +
    (screens.hashCode);

  @override
  String toString() => 'ScreenSchemeDetails[description=$description, name=$name, screens=$screens]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
      json[r'name'] = this.name;
      json[r'screens'] = this.screens;
    return json;
  }

  /// Returns a new [ScreenSchemeDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ScreenSchemeDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'name'), 'Required key "ScreenSchemeDetails[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "ScreenSchemeDetails[name]" has a null value in JSON.');
        assert(json.containsKey(r'screens'), 'Required key "ScreenSchemeDetails[screens]" is missing from JSON.');
        assert(json[r'screens'] != null, 'Required key "ScreenSchemeDetails[screens]" has a null value in JSON.');
        return true;
      }());

      return ScreenSchemeDetails(
        description: mapValueOfType<String>(json, r'description'),
        name: mapValueOfType<String>(json, r'name')!,
        screens: ScreenTypes.fromJson(json[r'screens'])!,
      );
    }
    return null;
  }

  static List<ScreenSchemeDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ScreenSchemeDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ScreenSchemeDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ScreenSchemeDetails> mapFromJson(dynamic json) {
    final map = <String, ScreenSchemeDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ScreenSchemeDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ScreenSchemeDetails-objects as value to a dart map
  static Map<String, List<ScreenSchemeDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ScreenSchemeDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ScreenSchemeDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
    'screens',
  };
}

