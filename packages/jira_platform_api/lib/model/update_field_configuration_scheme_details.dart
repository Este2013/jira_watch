//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateFieldConfigurationSchemeDetails {
  /// Returns a new [UpdateFieldConfigurationSchemeDetails] instance.
  UpdateFieldConfigurationSchemeDetails({
    this.description,
    required this.name,
  });

  /// The description of the field configuration scheme.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The name of the field configuration scheme. The name must be unique.
  String name;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UpdateFieldConfigurationSchemeDetails &&
    other.description == description &&
    other.name == name;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (name.hashCode);

  @override
  String toString() => 'UpdateFieldConfigurationSchemeDetails[description=$description, name=$name]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
      json[r'name'] = this.name;
    return json;
  }

  /// Returns a new [UpdateFieldConfigurationSchemeDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateFieldConfigurationSchemeDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'name'), 'Required key "UpdateFieldConfigurationSchemeDetails[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "UpdateFieldConfigurationSchemeDetails[name]" has a null value in JSON.');
        return true;
      }());

      return UpdateFieldConfigurationSchemeDetails(
        description: mapValueOfType<String>(json, r'description'),
        name: mapValueOfType<String>(json, r'name')!,
      );
    }
    return null;
  }

  static List<UpdateFieldConfigurationSchemeDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdateFieldConfigurationSchemeDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateFieldConfigurationSchemeDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateFieldConfigurationSchemeDetails> mapFromJson(dynamic json) {
    final map = <String, UpdateFieldConfigurationSchemeDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateFieldConfigurationSchemeDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateFieldConfigurationSchemeDetails-objects as value to a dart map
  static Map<String, List<UpdateFieldConfigurationSchemeDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UpdateFieldConfigurationSchemeDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdateFieldConfigurationSchemeDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
  };
}

