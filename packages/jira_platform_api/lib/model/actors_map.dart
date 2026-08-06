//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ActorsMap {
  /// Returns a new [ActorsMap] instance.
  ActorsMap({
    this.group = const [],
    this.groupId = const [],
    this.user = const [],
  });

  /// The name of the group to add. This parameter cannot be used with the `groupId` parameter. As a group's name can change, use of `groupId` is recommended.
  List<String> group;

  /// The ID of the group to add. This parameter cannot be used with the `group` parameter.
  List<String> groupId;

  /// The user account ID of the user to add.
  List<String> user;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ActorsMap &&
    _deepEquality.equals(other.group, group) &&
    _deepEquality.equals(other.groupId, groupId) &&
    _deepEquality.equals(other.user, user);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (group.hashCode) +
    (groupId.hashCode) +
    (user.hashCode);

  @override
  String toString() => 'ActorsMap[group=$group, groupId=$groupId, user=$user]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'group'] = this.group;
      json[r'groupId'] = this.groupId;
      json[r'user'] = this.user;
    return json;
  }

  /// Returns a new [ActorsMap] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ActorsMap? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ActorsMap(
        group: json[r'group'] is Iterable
            ? (json[r'group'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        groupId: json[r'groupId'] is Iterable
            ? (json[r'groupId'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        user: json[r'user'] is Iterable
            ? (json[r'user'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<ActorsMap> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ActorsMap>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ActorsMap.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ActorsMap> mapFromJson(dynamic json) {
    final map = <String, ActorsMap>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ActorsMap.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ActorsMap-objects as value to a dart map
  static Map<String, List<ActorsMap>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ActorsMap>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ActorsMap.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

