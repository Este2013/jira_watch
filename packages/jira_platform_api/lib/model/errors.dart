//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Errors {
  /// Returns a new [Errors] instance.
  Errors({
    this.issueIsSubtask,
    this.issuesInArchivedProjects,
    this.issuesInUnlicensedProjects,
    this.issuesNotFound,
    this.userDoesNotHavePermission,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Error? issueIsSubtask;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Error? issuesInArchivedProjects;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Error? issuesInUnlicensedProjects;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Error? issuesNotFound;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Error? userDoesNotHavePermission;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Errors &&
    other.issueIsSubtask == issueIsSubtask &&
    other.issuesInArchivedProjects == issuesInArchivedProjects &&
    other.issuesInUnlicensedProjects == issuesInUnlicensedProjects &&
    other.issuesNotFound == issuesNotFound &&
    other.userDoesNotHavePermission == userDoesNotHavePermission;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (issueIsSubtask == null ? 0 : issueIsSubtask!.hashCode) +
    (issuesInArchivedProjects == null ? 0 : issuesInArchivedProjects!.hashCode) +
    (issuesInUnlicensedProjects == null ? 0 : issuesInUnlicensedProjects!.hashCode) +
    (issuesNotFound == null ? 0 : issuesNotFound!.hashCode) +
    (userDoesNotHavePermission == null ? 0 : userDoesNotHavePermission!.hashCode);

  @override
  String toString() => 'Errors[issueIsSubtask=$issueIsSubtask, issuesInArchivedProjects=$issuesInArchivedProjects, issuesInUnlicensedProjects=$issuesInUnlicensedProjects, issuesNotFound=$issuesNotFound, userDoesNotHavePermission=$userDoesNotHavePermission]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.issueIsSubtask != null) {
      json[r'issueIsSubtask'] = this.issueIsSubtask;
    } else {
      json[r'issueIsSubtask'] = null;
    }
    if (this.issuesInArchivedProjects != null) {
      json[r'issuesInArchivedProjects'] = this.issuesInArchivedProjects;
    } else {
      json[r'issuesInArchivedProjects'] = null;
    }
    if (this.issuesInUnlicensedProjects != null) {
      json[r'issuesInUnlicensedProjects'] = this.issuesInUnlicensedProjects;
    } else {
      json[r'issuesInUnlicensedProjects'] = null;
    }
    if (this.issuesNotFound != null) {
      json[r'issuesNotFound'] = this.issuesNotFound;
    } else {
      json[r'issuesNotFound'] = null;
    }
    if (this.userDoesNotHavePermission != null) {
      json[r'userDoesNotHavePermission'] = this.userDoesNotHavePermission;
    } else {
      json[r'userDoesNotHavePermission'] = null;
    }
    return json;
  }

  /// Returns a new [Errors] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Errors? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return Errors(
        issueIsSubtask: Error.fromJson(json[r'issueIsSubtask']),
        issuesInArchivedProjects: Error.fromJson(json[r'issuesInArchivedProjects']),
        issuesInUnlicensedProjects: Error.fromJson(json[r'issuesInUnlicensedProjects']),
        issuesNotFound: Error.fromJson(json[r'issuesNotFound']),
        userDoesNotHavePermission: Error.fromJson(json[r'userDoesNotHavePermission']),
      );
    }
    return null;
  }

  static List<Errors> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Errors>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Errors.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Errors> mapFromJson(dynamic json) {
    final map = <String, Errors>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Errors.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Errors-objects as value to a dart map
  static Map<String, List<Errors>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Errors>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Errors.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

