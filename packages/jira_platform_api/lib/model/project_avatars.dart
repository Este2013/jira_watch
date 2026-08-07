//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProjectAvatars {
  /// Returns a new [ProjectAvatars] instance.
  ProjectAvatars({
    this.custom = const [],
    this.system = const [],
  });

  /// List of avatars added to Jira. These avatars may be deleted.
  List<Avatar> custom;

  /// List of avatars included with Jira. These avatars cannot be deleted.
  List<Avatar> system;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProjectAvatars &&
    _deepEquality.equals(other.custom, custom) &&
    _deepEquality.equals(other.system, system);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (custom.hashCode) +
    (system.hashCode);

  @override
  String toString() => 'ProjectAvatars[custom=$custom, system=$system]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'custom'] = this.custom;
      json[r'system'] = this.system;
    return json;
  }

  /// Returns a new [ProjectAvatars] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProjectAvatars? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ProjectAvatars(
        custom: Avatar.listFromJson(json[r'custom']),
        system: Avatar.listFromJson(json[r'system']),
      );
    }
    return null;
  }

  static List<ProjectAvatars> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectAvatars>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectAvatars.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProjectAvatars> mapFromJson(dynamic json) {
    final map = <String, ProjectAvatars>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProjectAvatars.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProjectAvatars-objects as value to a dart map
  static Map<String, List<ProjectAvatars>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProjectAvatars>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProjectAvatars.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

