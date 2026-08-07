//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetSpaceRolesById200Response {
  /// Returns a new [GetSpaceRolesById200Response] instance.
  GetSpaceRolesById200Response({
    this.id,
    this.type,
    this.name,
    this.description,
    this.spacePermissions = const [],
    this.links,
  });

  /// The identifier for the space role.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  RoleType? type;

  /// The name for the space role.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The description for the space role’s usage.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The space permissions the space role is comprised of.
  List<String> spacePermissions;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  GetAttachmentById200ResponseAllOfLinks? links;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetSpaceRolesById200Response &&
    other.id == id &&
    other.type == type &&
    other.name == name &&
    other.description == description &&
    _deepEquality.equals(other.spacePermissions, spacePermissions) &&
    other.links == links;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (type == null ? 0 : type!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (spacePermissions.hashCode) +
    (links == null ? 0 : links!.hashCode);

  @override
  String toString() => 'GetSpaceRolesById200Response[id=$id, type=$type, name=$name, description=$description, spacePermissions=$spacePermissions, links=$links]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
      json[r'spacePermissions'] = this.spacePermissions;
    if (this.links != null) {
      json[r'_links'] = this.links;
    } else {
      json[r'_links'] = null;
    }
    return json;
  }

  /// Returns a new [GetSpaceRolesById200Response] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetSpaceRolesById200Response? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return GetSpaceRolesById200Response(
        id: mapValueOfType<String>(json, r'id'),
        type: RoleType.fromJson(json[r'type']),
        name: mapValueOfType<String>(json, r'name'),
        description: mapValueOfType<String>(json, r'description'),
        spacePermissions: json[r'spacePermissions'] is Iterable
            ? (json[r'spacePermissions'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        links: GetAttachmentById200ResponseAllOfLinks.fromJson(json[r'_links']),
      );
    }
    return null;
  }

  static List<GetSpaceRolesById200Response> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetSpaceRolesById200Response>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetSpaceRolesById200Response.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetSpaceRolesById200Response> mapFromJson(dynamic json) {
    final map = <String, GetSpaceRolesById200Response>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetSpaceRolesById200Response.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetSpaceRolesById200Response-objects as value to a dart map
  static Map<String, List<GetSpaceRolesById200Response>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetSpaceRolesById200Response>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetSpaceRolesById200Response.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

