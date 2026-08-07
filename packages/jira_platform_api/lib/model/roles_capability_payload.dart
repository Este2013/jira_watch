//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RolesCapabilityPayload {
  /// Returns a new [RolesCapabilityPayload] instance.
  RolesCapabilityPayload({
    this.roleToProjectActors = const {},
    this.roles = const [],
  });

  /// A map of role PCRI (can be ID or REF) to a list of user or group PCRI IDs to associate with the role and project.
  Map<String, List<ProjectCreateResourceIdentifier>> roleToProjectActors;

  /// The list of roles to create.
  List<RolePayload> roles;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RolesCapabilityPayload &&
    _deepEquality.equals(other.roleToProjectActors, roleToProjectActors) &&
    _deepEquality.equals(other.roles, roles);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (roleToProjectActors.hashCode) +
    (roles.hashCode);

  @override
  String toString() => 'RolesCapabilityPayload[roleToProjectActors=$roleToProjectActors, roles=$roles]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'roleToProjectActors'] = this.roleToProjectActors;
      json[r'roles'] = this.roles;
    return json;
  }

  /// Returns a new [RolesCapabilityPayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RolesCapabilityPayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return RolesCapabilityPayload(
        roleToProjectActors: json[r'roleToProjectActors'] == null
          ? const {}
            : ProjectCreateResourceIdentifier.mapListFromJson(json[r'roleToProjectActors']),
        roles: RolePayload.listFromJson(json[r'roles']),
      );
    }
    return null;
  }

  static List<RolesCapabilityPayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RolesCapabilityPayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RolesCapabilityPayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RolesCapabilityPayload> mapFromJson(dynamic json) {
    final map = <String, RolesCapabilityPayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RolesCapabilityPayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RolesCapabilityPayload-objects as value to a dart map
  static Map<String, List<RolesCapabilityPayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RolesCapabilityPayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RolesCapabilityPayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

