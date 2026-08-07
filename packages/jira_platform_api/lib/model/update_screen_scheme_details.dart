//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateScreenSchemeDetails {
  /// Returns a new [UpdateScreenSchemeDetails] instance.
  UpdateScreenSchemeDetails({
    this.description,
    this.name,
    this.screens,
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
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The IDs of the screens for the screen types of the screen scheme. Only screens used in classic projects are accepted.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  UpdateScreenTypes? screens;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UpdateScreenSchemeDetails &&
    other.description == description &&
    other.name == name &&
    other.screens == screens;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (screens == null ? 0 : screens!.hashCode);

  @override
  String toString() => 'UpdateScreenSchemeDetails[description=$description, name=$name, screens=$screens]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
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
    if (this.screens != null) {
      json[r'screens'] = this.screens;
    } else {
      json[r'screens'] = null;
    }
    return json;
  }

  /// Returns a new [UpdateScreenSchemeDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateScreenSchemeDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return UpdateScreenSchemeDetails(
        description: mapValueOfType<String>(json, r'description'),
        name: mapValueOfType<String>(json, r'name'),
        screens: UpdateScreenTypes.fromJson(json[r'screens']),
      );
    }
    return null;
  }

  static List<UpdateScreenSchemeDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdateScreenSchemeDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateScreenSchemeDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateScreenSchemeDetails> mapFromJson(dynamic json) {
    final map = <String, UpdateScreenSchemeDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateScreenSchemeDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateScreenSchemeDetails-objects as value to a dart map
  static Map<String, List<UpdateScreenSchemeDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UpdateScreenSchemeDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdateScreenSchemeDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

