//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ConfigurationsListParameters {
  /// Returns a new [ConfigurationsListParameters] instance.
  ConfigurationsListParameters({
    this.fieldIdsOrKeys = const [],
  });

  /// List of IDs or keys of the custom fields. It can be a mix of IDs and keys in the same query.
  List<String> fieldIdsOrKeys;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ConfigurationsListParameters &&
    _deepEquality.equals(other.fieldIdsOrKeys, fieldIdsOrKeys);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (fieldIdsOrKeys.hashCode);

  @override
  String toString() => 'ConfigurationsListParameters[fieldIdsOrKeys=$fieldIdsOrKeys]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'fieldIdsOrKeys'] = this.fieldIdsOrKeys;
    return json;
  }

  /// Returns a new [ConfigurationsListParameters] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ConfigurationsListParameters? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'fieldIdsOrKeys'), 'Required key "ConfigurationsListParameters[fieldIdsOrKeys]" is missing from JSON.');
        assert(json[r'fieldIdsOrKeys'] != null, 'Required key "ConfigurationsListParameters[fieldIdsOrKeys]" has a null value in JSON.');
        return true;
      }());

      return ConfigurationsListParameters(
        fieldIdsOrKeys: json[r'fieldIdsOrKeys'] is Iterable
            ? (json[r'fieldIdsOrKeys'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<ConfigurationsListParameters> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ConfigurationsListParameters>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ConfigurationsListParameters.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ConfigurationsListParameters> mapFromJson(dynamic json) {
    final map = <String, ConfigurationsListParameters>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ConfigurationsListParameters.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ConfigurationsListParameters-objects as value to a dart map
  static Map<String, List<ConfigurationsListParameters>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ConfigurationsListParameters>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ConfigurationsListParameters.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'fieldIdsOrKeys',
  };
}

