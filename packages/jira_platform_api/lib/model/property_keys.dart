//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PropertyKeys {
  /// Returns a new [PropertyKeys] instance.
  PropertyKeys({
    this.keys = const [],
  });

  /// Property key details.
  List<PropertyKey> keys;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PropertyKeys &&
    _deepEquality.equals(other.keys, keys);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (keys.hashCode);

  @override
  String toString() => 'PropertyKeys[keys=$keys]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'keys'] = this.keys;
    return json;
  }

  /// Returns a new [PropertyKeys] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PropertyKeys? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return PropertyKeys(
        keys: PropertyKey.listFromJson(json[r'keys']),
      );
    }
    return null;
  }

  static List<PropertyKeys> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PropertyKeys>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PropertyKeys.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PropertyKeys> mapFromJson(dynamic json) {
    final map = <String, PropertyKeys>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PropertyKeys.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PropertyKeys-objects as value to a dart map
  static Map<String, List<PropertyKeys>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PropertyKeys>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PropertyKeys.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

