//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class MultiEntityResultVersion {
  /// Returns a new [MultiEntityResultVersion] instance.
  MultiEntityResultVersion({
    this.results = const [],
    this.links,
  });

  List<AttachmentVersion> results;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  MultiEntityLinks? links;

  @override
  bool operator ==(Object other) => identical(this, other) || other is MultiEntityResultVersion &&
    _deepEquality.equals(other.results, results) &&
    other.links == links;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (results.hashCode) +
    (links == null ? 0 : links!.hashCode);

  @override
  String toString() => 'MultiEntityResultVersion[results=$results, links=$links]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'results'] = this.results;
    if (this.links != null) {
      json[r'_links'] = this.links;
    } else {
      json[r'_links'] = null;
    }
    return json;
  }

  /// Returns a new [MultiEntityResultVersion] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static MultiEntityResultVersion? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return MultiEntityResultVersion(
        results: AttachmentVersion.listFromJson(json[r'results']),
        links: MultiEntityLinks.fromJson(json[r'_links']),
      );
    }
    return null;
  }

  static List<MultiEntityResultVersion> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <MultiEntityResultVersion>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MultiEntityResultVersion.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, MultiEntityResultVersion> mapFromJson(dynamic json) {
    final map = <String, MultiEntityResultVersion>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MultiEntityResultVersion.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of MultiEntityResultVersion-objects as value to a dart map
  static Map<String, List<MultiEntityResultVersion>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<MultiEntityResultVersion>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = MultiEntityResultVersion.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

