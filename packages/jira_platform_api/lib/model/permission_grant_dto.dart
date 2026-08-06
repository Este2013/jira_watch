//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PermissionGrantDTO {
  /// Returns a new [PermissionGrantDTO] instance.
  PermissionGrantDTO({
    this.applicationAccess = const [],
    this.groupCustomFields = const [],
    this.groups = const [],
    this.permissionKeys = const [],
    this.projectRoles = const [],
    this.specialGrants = const [],
    this.userCustomFields = const [],
    this.users = const [],
  });

  List<String> applicationAccess;

  List<ProjectCreateResourceIdentifier> groupCustomFields;

  List<ProjectCreateResourceIdentifier> groups;

  List<String> permissionKeys;

  List<ProjectCreateResourceIdentifier> projectRoles;

  List<String> specialGrants;

  List<ProjectCreateResourceIdentifier> userCustomFields;

  List<ProjectCreateResourceIdentifier> users;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PermissionGrantDTO &&
    _deepEquality.equals(other.applicationAccess, applicationAccess) &&
    _deepEquality.equals(other.groupCustomFields, groupCustomFields) &&
    _deepEquality.equals(other.groups, groups) &&
    _deepEquality.equals(other.permissionKeys, permissionKeys) &&
    _deepEquality.equals(other.projectRoles, projectRoles) &&
    _deepEquality.equals(other.specialGrants, specialGrants) &&
    _deepEquality.equals(other.userCustomFields, userCustomFields) &&
    _deepEquality.equals(other.users, users);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (applicationAccess.hashCode) +
    (groupCustomFields.hashCode) +
    (groups.hashCode) +
    (permissionKeys.hashCode) +
    (projectRoles.hashCode) +
    (specialGrants.hashCode) +
    (userCustomFields.hashCode) +
    (users.hashCode);

  @override
  String toString() => 'PermissionGrantDTO[applicationAccess=$applicationAccess, groupCustomFields=$groupCustomFields, groups=$groups, permissionKeys=$permissionKeys, projectRoles=$projectRoles, specialGrants=$specialGrants, userCustomFields=$userCustomFields, users=$users]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'applicationAccess'] = this.applicationAccess;
      json[r'groupCustomFields'] = this.groupCustomFields;
      json[r'groups'] = this.groups;
      json[r'permissionKeys'] = this.permissionKeys;
      json[r'projectRoles'] = this.projectRoles;
      json[r'specialGrants'] = this.specialGrants;
      json[r'userCustomFields'] = this.userCustomFields;
      json[r'users'] = this.users;
    return json;
  }

  /// Returns a new [PermissionGrantDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PermissionGrantDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return PermissionGrantDTO(
        applicationAccess: json[r'applicationAccess'] is Iterable
            ? (json[r'applicationAccess'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        groupCustomFields: ProjectCreateResourceIdentifier.listFromJson(json[r'groupCustomFields']),
        groups: ProjectCreateResourceIdentifier.listFromJson(json[r'groups']),
        permissionKeys: json[r'permissionKeys'] is Iterable
            ? (json[r'permissionKeys'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        projectRoles: ProjectCreateResourceIdentifier.listFromJson(json[r'projectRoles']),
        specialGrants: json[r'specialGrants'] is Iterable
            ? (json[r'specialGrants'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        userCustomFields: ProjectCreateResourceIdentifier.listFromJson(json[r'userCustomFields']),
        users: ProjectCreateResourceIdentifier.listFromJson(json[r'users']),
      );
    }
    return null;
  }

  static List<PermissionGrantDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PermissionGrantDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PermissionGrantDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PermissionGrantDTO> mapFromJson(dynamic json) {
    final map = <String, PermissionGrantDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PermissionGrantDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PermissionGrantDTO-objects as value to a dart map
  static Map<String, List<PermissionGrantDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PermissionGrantDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PermissionGrantDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

