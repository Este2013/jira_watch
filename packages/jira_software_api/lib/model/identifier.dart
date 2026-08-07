//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Identifier {
  /// Returns a new [Identifier] instance.
  Identifier({
    required this.displayName,
    required this.url,
  });

  /// The display name of the Vulnerability identified. 
  String displayName;

  /// A URL users can use to link to the definition of the Vulnerability identified. 
  String url;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Identifier &&
    other.displayName == displayName &&
    other.url == url;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (displayName.hashCode) +
    (url.hashCode);

  @override
  String toString() => 'Identifier[displayName=$displayName, url=$url]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'displayName'] = this.displayName;
      json[r'url'] = this.url;
    return json;
  }

  /// Returns a new [Identifier] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Identifier? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'displayName'), 'Required key "Identifier[displayName]" is missing from JSON.');
        assert(json[r'displayName'] != null, 'Required key "Identifier[displayName]" has a null value in JSON.');
        assert(json.containsKey(r'url'), 'Required key "Identifier[url]" is missing from JSON.');
        assert(json[r'url'] != null, 'Required key "Identifier[url]" has a null value in JSON.');
        return true;
      }());

      return Identifier(
        displayName: mapValueOfType<String>(json, r'displayName')!,
        url: mapValueOfType<String>(json, r'url')!,
      );
    }
    return null;
  }

  static List<Identifier> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Identifier>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Identifier.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Identifier> mapFromJson(dynamic json) {
    final map = <String, Identifier>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Identifier.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Identifier-objects as value to a dart map
  static Map<String, List<Identifier>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Identifier>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Identifier.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'displayName',
    'url',
  };
}

