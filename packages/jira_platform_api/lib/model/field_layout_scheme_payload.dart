//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FieldLayoutSchemePayload {
  /// Returns a new [FieldLayoutSchemePayload] instance.
  FieldLayoutSchemePayload({
    this.defaultFieldLayout,
    this.description,
    this.explicitMappings = const {},
    this.name,
    this.pcri,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectCreateResourceIdentifier? defaultFieldLayout;

  /// The description of the field layout scheme
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// There is a default configuration \"fieldlayout\" that is applied to all issue types using this scheme that don't have an explicit mapping users can create (or re-use existing) configurations for other issue types and map them to this scheme
  Map<String, ProjectCreateResourceIdentifier> explicitMappings;

  /// The name of the field layout scheme
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectCreateResourceIdentifier? pcri;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FieldLayoutSchemePayload &&
    other.defaultFieldLayout == defaultFieldLayout &&
    other.description == description &&
    _deepEquality.equals(other.explicitMappings, explicitMappings) &&
    other.name == name &&
    other.pcri == pcri;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (defaultFieldLayout == null ? 0 : defaultFieldLayout!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (explicitMappings.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (pcri == null ? 0 : pcri!.hashCode);

  @override
  String toString() => 'FieldLayoutSchemePayload[defaultFieldLayout=$defaultFieldLayout, description=$description, explicitMappings=$explicitMappings, name=$name, pcri=$pcri]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.defaultFieldLayout != null) {
      json[r'defaultFieldLayout'] = this.defaultFieldLayout;
    } else {
      json[r'defaultFieldLayout'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
      json[r'explicitMappings'] = this.explicitMappings;
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.pcri != null) {
      json[r'pcri'] = this.pcri;
    } else {
      json[r'pcri'] = null;
    }
    return json;
  }

  /// Returns a new [FieldLayoutSchemePayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FieldLayoutSchemePayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return FieldLayoutSchemePayload(
        defaultFieldLayout: ProjectCreateResourceIdentifier.fromJson(json[r'defaultFieldLayout']),
        description: mapValueOfType<String>(json, r'description'),
        explicitMappings: ProjectCreateResourceIdentifier.mapFromJson(json[r'explicitMappings']),
        name: mapValueOfType<String>(json, r'name'),
        pcri: ProjectCreateResourceIdentifier.fromJson(json[r'pcri']),
      );
    }
    return null;
  }

  static List<FieldLayoutSchemePayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldLayoutSchemePayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldLayoutSchemePayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FieldLayoutSchemePayload> mapFromJson(dynamic json) {
    final map = <String, FieldLayoutSchemePayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FieldLayoutSchemePayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FieldLayoutSchemePayload-objects as value to a dart map
  static Map<String, List<FieldLayoutSchemePayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FieldLayoutSchemePayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FieldLayoutSchemePayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

