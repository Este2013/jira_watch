//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BulkPermissionGrants {
  /// Returns a new [BulkPermissionGrants] instance.
  BulkPermissionGrants({
    this.globalPermissions = const [],
    this.projectPermissions = const [],
  });

  /// List of permissions granted to the user.
  List<String> globalPermissions;

  /// List of project permissions and the projects and issues those permissions provide access to.
  List<BulkProjectPermissionGrants> projectPermissions;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BulkPermissionGrants &&
    _deepEquality.equals(other.globalPermissions, globalPermissions) &&
    _deepEquality.equals(other.projectPermissions, projectPermissions);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (globalPermissions.hashCode) +
    (projectPermissions.hashCode);

  @override
  String toString() => 'BulkPermissionGrants[globalPermissions=$globalPermissions, projectPermissions=$projectPermissions]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'globalPermissions'] = this.globalPermissions;
      json[r'projectPermissions'] = this.projectPermissions;
    return json;
  }

  /// Returns a new [BulkPermissionGrants] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BulkPermissionGrants? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'globalPermissions'), 'Required key "BulkPermissionGrants[globalPermissions]" is missing from JSON.');
        assert(json[r'globalPermissions'] != null, 'Required key "BulkPermissionGrants[globalPermissions]" has a null value in JSON.');
        assert(json.containsKey(r'projectPermissions'), 'Required key "BulkPermissionGrants[projectPermissions]" is missing from JSON.');
        assert(json[r'projectPermissions'] != null, 'Required key "BulkPermissionGrants[projectPermissions]" has a null value in JSON.');
        return true;
      }());

      return BulkPermissionGrants(
        globalPermissions: json[r'globalPermissions'] is Iterable
            ? (json[r'globalPermissions'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        projectPermissions: BulkProjectPermissionGrants.listFromJson(json[r'projectPermissions']),
      );
    }
    return null;
  }

  static List<BulkPermissionGrants> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BulkPermissionGrants>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BulkPermissionGrants.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BulkPermissionGrants> mapFromJson(dynamic json) {
    final map = <String, BulkPermissionGrants>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BulkPermissionGrants.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BulkPermissionGrants-objects as value to a dart map
  static Map<String, List<BulkPermissionGrants>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BulkPermissionGrants>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BulkPermissionGrants.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'globalPermissions',
    'projectPermissions',
  };
}

