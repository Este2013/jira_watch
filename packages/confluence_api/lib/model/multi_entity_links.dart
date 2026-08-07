//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class MultiEntityLinks {
  /// Returns a new [MultiEntityLinks] instance.
  MultiEntityLinks({
    this.next,
    this.base_,
  });

  /// Used for pagination. Contains the relative URL for the next set of results, using a cursor query parameter. This property will not be present if there is no additional data available.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? next;

  /// Base url of the Confluence site.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? base_;

  @override
  bool operator ==(Object other) => identical(this, other) || other is MultiEntityLinks &&
    other.next == next &&
    other.base_ == base_;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (next == null ? 0 : next!.hashCode) +
    (base_ == null ? 0 : base_!.hashCode);

  @override
  String toString() => 'MultiEntityLinks[next=$next, base_=$base_]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.next != null) {
      json[r'next'] = this.next;
    } else {
      json[r'next'] = null;
    }
    if (this.base_ != null) {
      json[r'base'] = this.base_;
    } else {
      json[r'base'] = null;
    }
    return json;
  }

  /// Returns a new [MultiEntityLinks] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static MultiEntityLinks? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return MultiEntityLinks(
        next: mapValueOfType<String>(json, r'next'),
        base_: mapValueOfType<String>(json, r'base'),
      );
    }
    return null;
  }

  static List<MultiEntityLinks> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <MultiEntityLinks>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MultiEntityLinks.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, MultiEntityLinks> mapFromJson(dynamic json) {
    final map = <String, MultiEntityLinks>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MultiEntityLinks.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of MultiEntityLinks-objects as value to a dart map
  static Map<String, List<MultiEntityLinks>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<MultiEntityLinks>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = MultiEntityLinks.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

