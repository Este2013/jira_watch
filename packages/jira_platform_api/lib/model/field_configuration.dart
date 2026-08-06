//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FieldConfiguration {
  /// Returns a new [FieldConfiguration] instance.
  FieldConfiguration({
    required this.description,
    required this.id,
    this.isDefault,
    required this.name,
  });

  /// The description of the field configuration.
  String description;

  /// The ID of the field configuration.
  int id;

  /// Whether the field configuration is the default.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isDefault;

  /// The name of the field configuration.
  String name;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FieldConfiguration &&
    other.description == description &&
    other.id == id &&
    other.isDefault == isDefault &&
    other.name == name;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description.hashCode) +
    (id.hashCode) +
    (isDefault == null ? 0 : isDefault!.hashCode) +
    (name.hashCode);

  @override
  String toString() => 'FieldConfiguration[description=$description, id=$id, isDefault=$isDefault, name=$name]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'description'] = this.description;
      json[r'id'] = this.id;
    if (this.isDefault != null) {
      json[r'isDefault'] = this.isDefault;
    } else {
      json[r'isDefault'] = null;
    }
      json[r'name'] = this.name;
    return json;
  }

  /// Returns a new [FieldConfiguration] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FieldConfiguration? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'description'), 'Required key "FieldConfiguration[description]" is missing from JSON.');
        assert(json[r'description'] != null, 'Required key "FieldConfiguration[description]" has a null value in JSON.');
        assert(json.containsKey(r'id'), 'Required key "FieldConfiguration[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "FieldConfiguration[id]" has a null value in JSON.');
        assert(json.containsKey(r'name'), 'Required key "FieldConfiguration[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "FieldConfiguration[name]" has a null value in JSON.');
        return true;
      }());

      return FieldConfiguration(
        description: mapValueOfType<String>(json, r'description')!,
        id: mapValueOfType<int>(json, r'id')!,
        isDefault: mapValueOfType<bool>(json, r'isDefault'),
        name: mapValueOfType<String>(json, r'name')!,
      );
    }
    return null;
  }

  static List<FieldConfiguration> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldConfiguration>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldConfiguration.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FieldConfiguration> mapFromJson(dynamic json) {
    final map = <String, FieldConfiguration>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FieldConfiguration.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FieldConfiguration-objects as value to a dart map
  static Map<String, List<FieldConfiguration>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FieldConfiguration>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FieldConfiguration.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'description',
    'id',
    'name',
  };
}

