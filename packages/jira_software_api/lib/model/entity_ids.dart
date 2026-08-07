//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class EntityIds {
  /// Returns a new [EntityIds] instance.
  EntityIds({
    this.commits = const [],
    this.branches = const [],
    this.pullRequests = const [],
  });

  /// Commits IDs
  List<String> commits;

  /// Branch IDs
  List<String> branches;

  /// Pull request IDs
  List<String> pullRequests;

  @override
  bool operator ==(Object other) => identical(this, other) || other is EntityIds &&
    _deepEquality.equals(other.commits, commits) &&
    _deepEquality.equals(other.branches, branches) &&
    _deepEquality.equals(other.pullRequests, pullRequests);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (commits.hashCode) +
    (branches.hashCode) +
    (pullRequests.hashCode);

  @override
  String toString() => 'EntityIds[commits=$commits, branches=$branches, pullRequests=$pullRequests]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'commits'] = this.commits;
      json[r'branches'] = this.branches;
      json[r'pullRequests'] = this.pullRequests;
    return json;
  }

  /// Returns a new [EntityIds] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static EntityIds? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return EntityIds(
        commits: json[r'commits'] is Iterable
            ? (json[r'commits'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        branches: json[r'branches'] is Iterable
            ? (json[r'branches'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        pullRequests: json[r'pullRequests'] is Iterable
            ? (json[r'pullRequests'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<EntityIds> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <EntityIds>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = EntityIds.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, EntityIds> mapFromJson(dynamic json) {
    final map = <String, EntityIds>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = EntityIds.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of EntityIds-objects as value to a dart map
  static Map<String, List<EntityIds>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<EntityIds>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = EntityIds.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

