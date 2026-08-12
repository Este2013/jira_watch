//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SpaceDescription {
  /// Returns a new [SpaceDescription] instance.
  SpaceDescription({
    this.plain,
    this.view,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  BodyType? plain;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  BodyType? view;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SpaceDescription &&
    other.plain == plain &&
    other.view == view;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (plain == null ? 0 : plain!.hashCode) +
    (view == null ? 0 : view!.hashCode);

  @override
  String toString() => 'SpaceDescription[plain=$plain, view=$view]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.plain != null) {
      json[r'plain'] = this.plain;
    } else {
      json[r'plain'] = null;
    }
    if (this.view != null) {
      json[r'view'] = this.view;
    } else {
      json[r'view'] = null;
    }
    return json;
  }

  /// Returns a new [SpaceDescription] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SpaceDescription? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return SpaceDescription(
        plain: BodyType.fromJson(json[r'plain']),
        view: BodyType.fromJson(json[r'view']),
      );
    }
    return null;
  }

  static List<SpaceDescription> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SpaceDescription>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SpaceDescription.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SpaceDescription> mapFromJson(dynamic json) {
    final map = <String, SpaceDescription>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SpaceDescription.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SpaceDescription-objects as value to a dart map
  static Map<String, List<SpaceDescription>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SpaceDescription>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SpaceDescription.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

