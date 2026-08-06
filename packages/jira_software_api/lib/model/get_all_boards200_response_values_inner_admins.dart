//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetAllBoards200ResponseValuesInnerAdmins {
  /// Returns a new [GetAllBoards200ResponseValuesInnerAdmins] instance.
  GetAllBoards200ResponseValuesInnerAdmins({
    this.groups = const [],
    this.users = const [],
  });

  List<GetAllBoards200ResponseValuesInnerAdminsAllOfGroupsInner> groups;

  List<GetAllBoards200ResponseValuesInnerAdminsAllOfUsersInner> users;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetAllBoards200ResponseValuesInnerAdmins &&
    _deepEquality.equals(other.groups, groups) &&
    _deepEquality.equals(other.users, users);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (groups.hashCode) +
    (users.hashCode);

  @override
  String toString() => 'GetAllBoards200ResponseValuesInnerAdmins[groups=$groups, users=$users]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'groups'] = this.groups;
      json[r'users'] = this.users;
    return json;
  }

  /// Returns a new [GetAllBoards200ResponseValuesInnerAdmins] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetAllBoards200ResponseValuesInnerAdmins? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return GetAllBoards200ResponseValuesInnerAdmins(
        groups: GetAllBoards200ResponseValuesInnerAdminsAllOfGroupsInner.listFromJson(json[r'groups']),
        users: GetAllBoards200ResponseValuesInnerAdminsAllOfUsersInner.listFromJson(json[r'users']),
      );
    }
    return null;
  }

  static List<GetAllBoards200ResponseValuesInnerAdmins> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetAllBoards200ResponseValuesInnerAdmins>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetAllBoards200ResponseValuesInnerAdmins.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetAllBoards200ResponseValuesInnerAdmins> mapFromJson(dynamic json) {
    final map = <String, GetAllBoards200ResponseValuesInnerAdmins>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetAllBoards200ResponseValuesInnerAdmins.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetAllBoards200ResponseValuesInnerAdmins-objects as value to a dart map
  static Map<String, List<GetAllBoards200ResponseValuesInnerAdmins>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetAllBoards200ResponseValuesInnerAdmins>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetAllBoards200ResponseValuesInnerAdmins.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

