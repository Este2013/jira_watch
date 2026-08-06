//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FieldAssociationParameters {
  /// Returns a new [FieldAssociationParameters] instance.
  FieldAssociationParameters({
    this.description,
    required this.isRequired,
    this.rendererType,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  bool isRequired;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? rendererType;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FieldAssociationParameters &&
    other.description == description &&
    other.isRequired == isRequired &&
    other.rendererType == rendererType;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (isRequired.hashCode) +
    (rendererType == null ? 0 : rendererType!.hashCode);

  @override
  String toString() => 'FieldAssociationParameters[description=$description, isRequired=$isRequired, rendererType=$rendererType]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
      json[r'isRequired'] = this.isRequired;
    if (this.rendererType != null) {
      json[r'rendererType'] = this.rendererType;
    } else {
      json[r'rendererType'] = null;
    }
    return json;
  }

  /// Returns a new [FieldAssociationParameters] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FieldAssociationParameters? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'isRequired'), 'Required key "FieldAssociationParameters[isRequired]" is missing from JSON.');
        assert(json[r'isRequired'] != null, 'Required key "FieldAssociationParameters[isRequired]" has a null value in JSON.');
        return true;
      }());

      return FieldAssociationParameters(
        description: mapValueOfType<String>(json, r'description'),
        isRequired: mapValueOfType<bool>(json, r'isRequired')!,
        rendererType: mapValueOfType<String>(json, r'rendererType'),
      );
    }
    return null;
  }

  static List<FieldAssociationParameters> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldAssociationParameters>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldAssociationParameters.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FieldAssociationParameters> mapFromJson(dynamic json) {
    final map = <String, FieldAssociationParameters>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FieldAssociationParameters.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FieldAssociationParameters-objects as value to a dart map
  static Map<String, List<FieldAssociationParameters>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FieldAssociationParameters>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FieldAssociationParameters.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'isRequired',
  };
}

