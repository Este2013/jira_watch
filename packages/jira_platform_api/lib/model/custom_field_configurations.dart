//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CustomFieldConfigurations {
  /// Returns a new [CustomFieldConfigurations] instance.
  CustomFieldConfigurations({
    this.configurations = const [],
  });

  /// The list of custom field configuration details.
  List<ContextualConfiguration> configurations;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CustomFieldConfigurations &&
    _deepEquality.equals(other.configurations, configurations);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (configurations.hashCode);

  @override
  String toString() => 'CustomFieldConfigurations[configurations=$configurations]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'configurations'] = this.configurations;
    return json;
  }

  /// Returns a new [CustomFieldConfigurations] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CustomFieldConfigurations? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'configurations'), 'Required key "CustomFieldConfigurations[configurations]" is missing from JSON.');
        assert(json[r'configurations'] != null, 'Required key "CustomFieldConfigurations[configurations]" has a null value in JSON.');
        return true;
      }());

      return CustomFieldConfigurations(
        configurations: ContextualConfiguration.listFromJson(json[r'configurations']),
      );
    }
    return null;
  }

  static List<CustomFieldConfigurations> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomFieldConfigurations>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomFieldConfigurations.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CustomFieldConfigurations> mapFromJson(dynamic json) {
    final map = <String, CustomFieldConfigurations>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CustomFieldConfigurations.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CustomFieldConfigurations-objects as value to a dart map
  static Map<String, List<CustomFieldConfigurations>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CustomFieldConfigurations>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CustomFieldConfigurations.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'configurations',
  };
}

