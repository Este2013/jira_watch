//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateSpaceRequestRoleAssignmentsInner {
  /// Returns a new [CreateSpaceRequestRoleAssignmentsInner] instance.
  CreateSpaceRequestRoleAssignmentsInner({
    this.principal,
    this.roleId,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Principal? principal;

  /// The role to which the principal is assigned.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? roleId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateSpaceRequestRoleAssignmentsInner &&
    other.principal == principal &&
    other.roleId == roleId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (principal == null ? 0 : principal!.hashCode) +
    (roleId == null ? 0 : roleId!.hashCode);

  @override
  String toString() => 'CreateSpaceRequestRoleAssignmentsInner[principal=$principal, roleId=$roleId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.principal != null) {
      json[r'principal'] = this.principal;
    } else {
      json[r'principal'] = null;
    }
    if (this.roleId != null) {
      json[r'roleId'] = this.roleId;
    } else {
      json[r'roleId'] = null;
    }
    return json;
  }

  /// Returns a new [CreateSpaceRequestRoleAssignmentsInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateSpaceRequestRoleAssignmentsInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return CreateSpaceRequestRoleAssignmentsInner(
        principal: Principal.fromJson(json[r'principal']),
        roleId: mapValueOfType<String>(json, r'roleId'),
      );
    }
    return null;
  }

  static List<CreateSpaceRequestRoleAssignmentsInner> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateSpaceRequestRoleAssignmentsInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateSpaceRequestRoleAssignmentsInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateSpaceRequestRoleAssignmentsInner> mapFromJson(dynamic json) {
    final map = <String, CreateSpaceRequestRoleAssignmentsInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateSpaceRequestRoleAssignmentsInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateSpaceRequestRoleAssignmentsInner-objects as value to a dart map
  static Map<String, List<CreateSpaceRequestRoleAssignmentsInner>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateSpaceRequestRoleAssignmentsInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateSpaceRequestRoleAssignmentsInner.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

