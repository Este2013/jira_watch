//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateSpaceRoleRequest {
  /// Returns a new [CreateSpaceRoleRequest] instance.
  CreateSpaceRoleRequest({
    required this.name,
    required this.description,
    this.spacePermissions = const [],
  });

  /// Name of the space role
  String name;

  /// Description for the space role
  String description;

  /// The ids of the space permissions associated with the space role. Sample value \"read/space\"; retrieve ids from responses returned by [GET /space-permissions](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-space-permissions/#api-space-permissions-get) endpoint
  List<String> spacePermissions;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateSpaceRoleRequest &&
    other.name == name &&
    other.description == description &&
    _deepEquality.equals(other.spacePermissions, spacePermissions);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name.hashCode) +
    (description.hashCode) +
    (spacePermissions.hashCode);

  @override
  String toString() => 'CreateSpaceRoleRequest[name=$name, description=$description, spacePermissions=$spacePermissions]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'name'] = this.name;
      json[r'description'] = this.description;
      json[r'spacePermissions'] = this.spacePermissions;
    return json;
  }

  /// Returns a new [CreateSpaceRoleRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateSpaceRoleRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'name'), 'Required key "CreateSpaceRoleRequest[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "CreateSpaceRoleRequest[name]" has a null value in JSON.');
        assert(json.containsKey(r'description'), 'Required key "CreateSpaceRoleRequest[description]" is missing from JSON.');
        assert(json[r'description'] != null, 'Required key "CreateSpaceRoleRequest[description]" has a null value in JSON.');
        assert(json.containsKey(r'spacePermissions'), 'Required key "CreateSpaceRoleRequest[spacePermissions]" is missing from JSON.');
        assert(json[r'spacePermissions'] != null, 'Required key "CreateSpaceRoleRequest[spacePermissions]" has a null value in JSON.');
        return true;
      }());

      return CreateSpaceRoleRequest(
        name: mapValueOfType<String>(json, r'name')!,
        description: mapValueOfType<String>(json, r'description')!,
        spacePermissions: json[r'spacePermissions'] is Iterable
            ? (json[r'spacePermissions'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<CreateSpaceRoleRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateSpaceRoleRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateSpaceRoleRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateSpaceRoleRequest> mapFromJson(dynamic json) {
    final map = <String, CreateSpaceRoleRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateSpaceRoleRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateSpaceRoleRequest-objects as value to a dart map
  static Map<String, List<CreateSpaceRoleRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateSpaceRoleRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateSpaceRoleRequest.listFromJson(entry.value, growable: growable,);
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

