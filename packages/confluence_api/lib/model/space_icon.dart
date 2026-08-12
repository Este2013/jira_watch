//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SpaceIcon {
  /// Returns a new [SpaceIcon] instance.
  SpaceIcon({
    this.path,
    this.apiDownloadLink,
  });

  /// The path (relative to base URL) at which the space's icon can be retrieved. The format should be like `/wiki/download/...` or `/wiki/aa-avatar/...`
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? path;

  /// The path (relative to base URL) that can be used to retrieve a link to download the space icon. 3LO apps should use this link instead of the value provided in the `path` property to retrieve the icon.  Currently this field is only returned for `global` spaces and not `personal` spaces. 
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? apiDownloadLink;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SpaceIcon &&
    other.path == path &&
    other.apiDownloadLink == apiDownloadLink;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (path == null ? 0 : path!.hashCode) +
    (apiDownloadLink == null ? 0 : apiDownloadLink!.hashCode);

  @override
  String toString() => 'SpaceIcon[path=$path, apiDownloadLink=$apiDownloadLink]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.path != null) {
      json[r'path'] = this.path;
    } else {
      json[r'path'] = null;
    }
    if (this.apiDownloadLink != null) {
      json[r'apiDownloadLink'] = this.apiDownloadLink;
    } else {
      json[r'apiDownloadLink'] = null;
    }
    return json;
  }

  /// Returns a new [SpaceIcon] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SpaceIcon? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return SpaceIcon(
        path: mapValueOfType<String>(json, r'path'),
        apiDownloadLink: mapValueOfType<String>(json, r'apiDownloadLink'),
      );
    }
    return null;
  }

  static List<SpaceIcon> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SpaceIcon>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SpaceIcon.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SpaceIcon> mapFromJson(dynamic json) {
    final map = <String, SpaceIcon>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SpaceIcon.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SpaceIcon-objects as value to a dart map
  static Map<String, List<SpaceIcon>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SpaceIcon>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SpaceIcon.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

