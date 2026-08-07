//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SpaceSinglePermissions {
  /// Returns a new [SpaceSinglePermissions] instance.
  SpaceSinglePermissions({
    this.results = const [],
    this.meta,
    this.links,
  });

  List<SpacePermissionAssignment> results;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  OptionalFieldMeta? meta;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  OptionalFieldLinks? links;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SpaceSinglePermissions &&
    _deepEquality.equals(other.results, results) &&
    other.meta == meta &&
    other.links == links;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (results.hashCode) +
    (meta == null ? 0 : meta!.hashCode) +
    (links == null ? 0 : links!.hashCode);

  @override
  String toString() => 'SpaceSinglePermissions[results=$results, meta=$meta, links=$links]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'results'] = this.results;
    if (this.meta != null) {
      json[r'meta'] = this.meta;
    } else {
      json[r'meta'] = null;
    }
    if (this.links != null) {
      json[r'_links'] = this.links;
    } else {
      json[r'_links'] = null;
    }
    return json;
  }

  /// Returns a new [SpaceSinglePermissions] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SpaceSinglePermissions? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return SpaceSinglePermissions(
        results: SpacePermissionAssignment.listFromJson(json[r'results']),
        meta: OptionalFieldMeta.fromJson(json[r'meta']),
        links: OptionalFieldLinks.fromJson(json[r'_links']),
      );
    }
    return null;
  }

  static List<SpaceSinglePermissions> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SpaceSinglePermissions>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SpaceSinglePermissions.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SpaceSinglePermissions> mapFromJson(dynamic json) {
    final map = <String, SpaceSinglePermissions>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SpaceSinglePermissions.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SpaceSinglePermissions-objects as value to a dart map
  static Map<String, List<SpaceSinglePermissions>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SpaceSinglePermissions>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SpaceSinglePermissions.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

