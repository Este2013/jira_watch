//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BulkProjectPermissions {
  /// Returns a new [BulkProjectPermissions] instance.
  BulkProjectPermissions({
    this.issues = const [],
    this.permissions = const [],
    this.projects = const [],
  });

  /// List of issue IDs.
  List<int> issues;

  /// List of project permissions.
  List<String> permissions;

  /// List of project IDs.
  List<int> projects;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BulkProjectPermissions &&
    _deepEquality.equals(other.issues, issues) &&
    _deepEquality.equals(other.permissions, permissions) &&
    _deepEquality.equals(other.projects, projects);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (issues.hashCode) +
    (permissions.hashCode) +
    (projects.hashCode);

  @override
  String toString() => 'BulkProjectPermissions[issues=$issues, permissions=$permissions, projects=$projects]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'issues'] = this.issues;
      json[r'permissions'] = this.permissions;
      json[r'projects'] = this.projects;
    return json;
  }

  /// Returns a new [BulkProjectPermissions] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BulkProjectPermissions? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'permissions'), 'Required key "BulkProjectPermissions[permissions]" is missing from JSON.');
        assert(json[r'permissions'] != null, 'Required key "BulkProjectPermissions[permissions]" has a null value in JSON.');
        return true;
      }());

      return BulkProjectPermissions(
        issues: json[r'issues'] is Iterable
            ? (json[r'issues'] as Iterable).cast<int>().toList(growable: false)
            : const [],
        permissions: json[r'permissions'] is Iterable
            ? (json[r'permissions'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        projects: json[r'projects'] is Iterable
            ? (json[r'projects'] as Iterable).cast<int>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<BulkProjectPermissions> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BulkProjectPermissions>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BulkProjectPermissions.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BulkProjectPermissions> mapFromJson(dynamic json) {
    final map = <String, BulkProjectPermissions>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BulkProjectPermissions.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BulkProjectPermissions-objects as value to a dart map
  static Map<String, List<BulkProjectPermissions>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BulkProjectPermissions>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BulkProjectPermissions.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'permissions',
  };
}

