//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JqlQueryField {
  /// Returns a new [JqlQueryField] instance.
  JqlQueryField({
    this.encodedName,
    required this.name,
    this.property = const [],
  });

  /// The encoded name of the field, which can be used directly in a JQL query.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? encodedName;

  /// The name of the field.
  String name;

  /// When the field refers to a value in an entity property, details of the entity property value.
  List<JqlQueryFieldEntityProperty> property;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JqlQueryField &&
    other.encodedName == encodedName &&
    other.name == name &&
    _deepEquality.equals(other.property, property);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (encodedName == null ? 0 : encodedName!.hashCode) +
    (name.hashCode) +
    (property.hashCode);

  @override
  String toString() => 'JqlQueryField[encodedName=$encodedName, name=$name, property=$property]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.encodedName != null) {
      json[r'encodedName'] = this.encodedName;
    } else {
      json[r'encodedName'] = null;
    }
      json[r'name'] = this.name;
      json[r'property'] = this.property;
    return json;
  }

  /// Returns a new [JqlQueryField] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JqlQueryField? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'name'), 'Required key "JqlQueryField[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "JqlQueryField[name]" has a null value in JSON.');
        return true;
      }());

      return JqlQueryField(
        encodedName: mapValueOfType<String>(json, r'encodedName'),
        name: mapValueOfType<String>(json, r'name')!,
        property: JqlQueryFieldEntityProperty.listFromJson(json[r'property']),
      );
    }
    return null;
  }

  static List<JqlQueryField> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JqlQueryField>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JqlQueryField.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JqlQueryField> mapFromJson(dynamic json) {
    final map = <String, JqlQueryField>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JqlQueryField.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JqlQueryField-objects as value to a dart map
  static Map<String, List<JqlQueryField>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JqlQueryField>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JqlQueryField.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
  };
}

