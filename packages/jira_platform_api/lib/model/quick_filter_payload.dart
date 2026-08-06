//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class QuickFilterPayload {
  /// Returns a new [QuickFilterPayload] instance.
  QuickFilterPayload({
    this.description,
    this.jqlQuery,
    this.name,
  });

  /// The description of the quick filter
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The jql query for the quick filter
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? jqlQuery;

  /// The name of the quick filter
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  @override
  bool operator ==(Object other) => identical(this, other) || other is QuickFilterPayload &&
    other.description == description &&
    other.jqlQuery == jqlQuery &&
    other.name == name;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (jqlQuery == null ? 0 : jqlQuery!.hashCode) +
    (name == null ? 0 : name!.hashCode);

  @override
  String toString() => 'QuickFilterPayload[description=$description, jqlQuery=$jqlQuery, name=$name]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.jqlQuery != null) {
      json[r'jqlQuery'] = this.jqlQuery;
    } else {
      json[r'jqlQuery'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    return json;
  }

  /// Returns a new [QuickFilterPayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static QuickFilterPayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return QuickFilterPayload(
        description: mapValueOfType<String>(json, r'description'),
        jqlQuery: mapValueOfType<String>(json, r'jqlQuery'),
        name: mapValueOfType<String>(json, r'name'),
      );
    }
    return null;
  }

  static List<QuickFilterPayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <QuickFilterPayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = QuickFilterPayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, QuickFilterPayload> mapFromJson(dynamic json) {
    final map = <String, QuickFilterPayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = QuickFilterPayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of QuickFilterPayload-objects as value to a dart map
  static Map<String, List<QuickFilterPayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<QuickFilterPayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = QuickFilterPayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

