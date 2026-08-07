//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BulkProjectPermissionGrants {
  /// Returns a new [BulkProjectPermissionGrants] instance.
  BulkProjectPermissionGrants({
    this.issues = const [],
    required this.permission,
    this.projects = const [],
  });

  /// IDs of the issues the user has the permission for.
  List<int> issues;

  /// A project permission,
  String permission;

  /// IDs of the projects the user has the permission for.
  List<int> projects;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BulkProjectPermissionGrants &&
    _deepEquality.equals(other.issues, issues) &&
    other.permission == permission &&
    _deepEquality.equals(other.projects, projects);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (issues.hashCode) +
    (permission.hashCode) +
    (projects.hashCode);

  @override
  String toString() => 'BulkProjectPermissionGrants[issues=$issues, permission=$permission, projects=$projects]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'issues'] = this.issues;
      json[r'permission'] = this.permission;
      json[r'projects'] = this.projects;
    return json;
  }

  /// Returns a new [BulkProjectPermissionGrants] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BulkProjectPermissionGrants? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'issues'), 'Required key "BulkProjectPermissionGrants[issues]" is missing from JSON.');
        assert(json[r'issues'] != null, 'Required key "BulkProjectPermissionGrants[issues]" has a null value in JSON.');
        assert(json.containsKey(r'permission'), 'Required key "BulkProjectPermissionGrants[permission]" is missing from JSON.');
        assert(json[r'permission'] != null, 'Required key "BulkProjectPermissionGrants[permission]" has a null value in JSON.');
        assert(json.containsKey(r'projects'), 'Required key "BulkProjectPermissionGrants[projects]" is missing from JSON.');
        assert(json[r'projects'] != null, 'Required key "BulkProjectPermissionGrants[projects]" has a null value in JSON.');
        return true;
      }());

      return BulkProjectPermissionGrants(
        issues: json[r'issues'] is Iterable
            ? (json[r'issues'] as Iterable).cast<int>().toList(growable: false)
            : const [],
        permission: mapValueOfType<String>(json, r'permission')!,
        projects: json[r'projects'] is Iterable
            ? (json[r'projects'] as Iterable).cast<int>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<BulkProjectPermissionGrants> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BulkProjectPermissionGrants>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BulkProjectPermissionGrants.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BulkProjectPermissionGrants> mapFromJson(dynamic json) {
    final map = <String, BulkProjectPermissionGrants>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BulkProjectPermissionGrants.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BulkProjectPermissionGrants-objects as value to a dart map
  static Map<String, List<BulkProjectPermissionGrants>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BulkProjectPermissionGrants>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BulkProjectPermissionGrants.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'issues',
    'permission',
    'projects',
  };
}

