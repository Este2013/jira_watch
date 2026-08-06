//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SecuritySchemeWithProjects {
  /// Returns a new [SecuritySchemeWithProjects] instance.
  SecuritySchemeWithProjects({
    this.defaultLevel,
    this.description,
    required this.id,
    required this.name,
    this.projectIds = const [],
    required this.self,
  });

  /// The default level ID of the issue security scheme.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? defaultLevel;

  /// The description of the issue security scheme.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The ID of the issue security scheme.
  int id;

  /// The name of the issue security scheme.
  String name;

  /// The list of project IDs associated with the issue security scheme.
  List<int> projectIds;

  /// The URL of the issue security scheme.
  String self;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SecuritySchemeWithProjects &&
    other.defaultLevel == defaultLevel &&
    other.description == description &&
    other.id == id &&
    other.name == name &&
    _deepEquality.equals(other.projectIds, projectIds) &&
    other.self == self;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (defaultLevel == null ? 0 : defaultLevel!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (id.hashCode) +
    (name.hashCode) +
    (projectIds.hashCode) +
    (self.hashCode);

  @override
  String toString() => 'SecuritySchemeWithProjects[defaultLevel=$defaultLevel, description=$description, id=$id, name=$name, projectIds=$projectIds, self=$self]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.defaultLevel != null) {
      json[r'defaultLevel'] = this.defaultLevel;
    } else {
      json[r'defaultLevel'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
      json[r'id'] = this.id;
      json[r'name'] = this.name;
      json[r'projectIds'] = this.projectIds;
      json[r'self'] = this.self;
    return json;
  }

  /// Returns a new [SecuritySchemeWithProjects] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SecuritySchemeWithProjects? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "SecuritySchemeWithProjects[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "SecuritySchemeWithProjects[id]" has a null value in JSON.');
        assert(json.containsKey(r'name'), 'Required key "SecuritySchemeWithProjects[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "SecuritySchemeWithProjects[name]" has a null value in JSON.');
        assert(json.containsKey(r'self'), 'Required key "SecuritySchemeWithProjects[self]" is missing from JSON.');
        assert(json[r'self'] != null, 'Required key "SecuritySchemeWithProjects[self]" has a null value in JSON.');
        return true;
      }());

      return SecuritySchemeWithProjects(
        defaultLevel: mapValueOfType<int>(json, r'defaultLevel'),
        description: mapValueOfType<String>(json, r'description'),
        id: mapValueOfType<int>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        projectIds: json[r'projectIds'] is Iterable
            ? (json[r'projectIds'] as Iterable).cast<int>().toList(growable: false)
            : const [],
        self: mapValueOfType<String>(json, r'self')!,
      );
    }
    return null;
  }

  static List<SecuritySchemeWithProjects> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SecuritySchemeWithProjects>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SecuritySchemeWithProjects.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SecuritySchemeWithProjects> mapFromJson(dynamic json) {
    final map = <String, SecuritySchemeWithProjects>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SecuritySchemeWithProjects.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SecuritySchemeWithProjects-objects as value to a dart map
  static Map<String, List<SecuritySchemeWithProjects>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SecuritySchemeWithProjects>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SecuritySchemeWithProjects.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'name',
    'self',
  };
}

