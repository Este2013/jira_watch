//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateSpaceRoleRequest {
  /// Returns a new [UpdateSpaceRoleRequest] instance.
  UpdateSpaceRoleRequest({
    required this.name,
    required this.description,
    this.spacePermissions = const [],
    this.anonymousReassignmentRoleId,
    this.guestReassignmentRoleId,
  });

  /// Name of the space role
  String name;

  /// Description for the space role
  String description;

  /// The ids of the space permissions associated with the space role. Sample value \"read/space\"; retrieve ids from responses returned by [GET /space-permissions](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-space-permissions/#api-space-permissions-get) endpoint
  List<String> spacePermissions;

  /// If space anonymous access is assigned to the role being modified, the Id of a role to migrate those assignments to can be specified. Anonymous access role assignments left unchanged if unspecified.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? anonymousReassignmentRoleId;

  /// If guests are assigned to the role being modified, the Id of a role to migrate those assignments to can be specified. Guest role assignments left unchanged if unspecified.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? guestReassignmentRoleId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UpdateSpaceRoleRequest &&
    other.name == name &&
    other.description == description &&
    _deepEquality.equals(other.spacePermissions, spacePermissions) &&
    other.anonymousReassignmentRoleId == anonymousReassignmentRoleId &&
    other.guestReassignmentRoleId == guestReassignmentRoleId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name.hashCode) +
    (description.hashCode) +
    (spacePermissions.hashCode) +
    (anonymousReassignmentRoleId == null ? 0 : anonymousReassignmentRoleId!.hashCode) +
    (guestReassignmentRoleId == null ? 0 : guestReassignmentRoleId!.hashCode);

  @override
  String toString() => 'UpdateSpaceRoleRequest[name=$name, description=$description, spacePermissions=$spacePermissions, anonymousReassignmentRoleId=$anonymousReassignmentRoleId, guestReassignmentRoleId=$guestReassignmentRoleId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'name'] = this.name;
      json[r'description'] = this.description;
      json[r'spacePermissions'] = this.spacePermissions;
    if (this.anonymousReassignmentRoleId != null) {
      json[r'anonymousReassignmentRoleId'] = this.anonymousReassignmentRoleId;
    } else {
      json[r'anonymousReassignmentRoleId'] = null;
    }
    if (this.guestReassignmentRoleId != null) {
      json[r'guestReassignmentRoleId'] = this.guestReassignmentRoleId;
    } else {
      json[r'guestReassignmentRoleId'] = null;
    }
    return json;
  }

  /// Returns a new [UpdateSpaceRoleRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateSpaceRoleRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'name'), 'Required key "UpdateSpaceRoleRequest[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "UpdateSpaceRoleRequest[name]" has a null value in JSON.');
        assert(json.containsKey(r'description'), 'Required key "UpdateSpaceRoleRequest[description]" is missing from JSON.');
        assert(json[r'description'] != null, 'Required key "UpdateSpaceRoleRequest[description]" has a null value in JSON.');
        assert(json.containsKey(r'spacePermissions'), 'Required key "UpdateSpaceRoleRequest[spacePermissions]" is missing from JSON.');
        assert(json[r'spacePermissions'] != null, 'Required key "UpdateSpaceRoleRequest[spacePermissions]" has a null value in JSON.');
        return true;
      }());

      return UpdateSpaceRoleRequest(
        name: mapValueOfType<String>(json, r'name')!,
        description: mapValueOfType<String>(json, r'description')!,
        spacePermissions: json[r'spacePermissions'] is Iterable
            ? (json[r'spacePermissions'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        anonymousReassignmentRoleId: mapValueOfType<String>(json, r'anonymousReassignmentRoleId'),
        guestReassignmentRoleId: mapValueOfType<String>(json, r'guestReassignmentRoleId'),
      );
    }
    return null;
  }

  static List<UpdateSpaceRoleRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdateSpaceRoleRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateSpaceRoleRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateSpaceRoleRequest> mapFromJson(dynamic json) {
    final map = <String, UpdateSpaceRoleRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateSpaceRoleRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateSpaceRoleRequest-objects as value to a dart map
  static Map<String, List<UpdateSpaceRoleRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UpdateSpaceRoleRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdateSpaceRoleRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
    'description',
    'spacePermissions',
  };
}

