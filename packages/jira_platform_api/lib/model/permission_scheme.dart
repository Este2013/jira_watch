//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PermissionScheme {
  /// Returns a new [PermissionScheme] instance.
  PermissionScheme({
    this.description,
    this.expand,
    this.id,
    required this.name,
    this.permissions = const [],
    this.scope,
    this.self,
  });

  /// A description for the permission scheme.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The expand options available for the permission scheme.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? expand;

  /// The ID of the permission scheme.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  /// The name of the permission scheme. Must be unique.
  String name;

  /// The permission scheme to create or update. See [About permission schemes and grants](../api-group-permission-schemes/#about-permission-schemes-and-grants) for more information.
  List<PermissionGrant> permissions;

  /// The scope of the permission scheme.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Scope? scope;

  /// The URL of the permission scheme.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? self;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PermissionScheme &&
    other.description == description &&
    other.expand == expand &&
    other.id == id &&
    other.name == name &&
    _deepEquality.equals(other.permissions, permissions) &&
    other.scope == scope &&
    other.self == self;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (expand == null ? 0 : expand!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (name.hashCode) +
    (permissions.hashCode) +
    (scope == null ? 0 : scope!.hashCode) +
    (self == null ? 0 : self!.hashCode);

  @override
  String toString() => 'PermissionScheme[description=$description, expand=$expand, id=$id, name=$name, permissions=$permissions, scope=$scope, self=$self]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.expand != null) {
      json[r'expand'] = this.expand;
    } else {
      json[r'expand'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
      json[r'name'] = this.name;
      json[r'permissions'] = this.permissions;
    if (this.scope != null) {
      json[r'scope'] = this.scope;
    } else {
      json[r'scope'] = null;
    }
    if (this.self != null) {
      json[r'self'] = this.self;
    } else {
      json[r'self'] = null;
    }
    return json;
  }

  /// Returns a new [PermissionScheme] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PermissionScheme? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'name'), 'Required key "PermissionScheme[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "PermissionScheme[name]" has a null value in JSON.');
        return true;
      }());

      return PermissionScheme(
        description: mapValueOfType<String>(json, r'description'),
        expand: mapValueOfType<String>(json, r'expand'),
        id: mapValueOfType<int>(json, r'id'),
        name: mapValueOfType<String>(json, r'name')!,
        permissions: PermissionGrant.listFromJson(json[r'permissions']),
        scope: Scope.fromJson(json[r'scope']),
        self: mapValueOfType<String>(json, r'self'),
      );
    }
    return null;
  }

  static List<PermissionScheme> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PermissionScheme>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PermissionScheme.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PermissionScheme> mapFromJson(dynamic json) {
    final map = <String, PermissionScheme>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PermissionScheme.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PermissionScheme-objects as value to a dart map
  static Map<String, List<PermissionScheme>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PermissionScheme>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PermissionScheme.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
  };
}

