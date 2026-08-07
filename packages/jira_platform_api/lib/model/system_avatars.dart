//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SystemAvatars {
  /// Returns a new [SystemAvatars] instance.
  SystemAvatars({
    this.system = const [],
  });

  /// A list of avatar details.
  List<Avatar> system;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SystemAvatars &&
    _deepEquality.equals(other.system, system);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (system.hashCode);

  @override
  String toString() => 'SystemAvatars[system=$system]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'system'] = this.system;
    return json;
  }

  /// Returns a new [SystemAvatars] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SystemAvatars? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return SystemAvatars(
        system: Avatar.listFromJson(json[r'system']),
      );
    }
    return null;
  }

  static List<SystemAvatars> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SystemAvatars>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SystemAvatars.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SystemAvatars> mapFromJson(dynamic json) {
    final map = <String, SystemAvatars>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SystemAvatars.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SystemAvatars-objects as value to a dart map
  static Map<String, List<SystemAvatars>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SystemAvatars>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SystemAvatars.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

