//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FoundUsers {
  /// Returns a new [FoundUsers] instance.
  FoundUsers({
    this.header,
    this.total,
    this.users = const [],
  });

  /// Header text indicating the number of users in the response and the total number of users found in the search.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? header;

  /// The total number of users found in the search.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? total;

  List<UserPickerUser> users;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FoundUsers &&
    other.header == header &&
    other.total == total &&
    _deepEquality.equals(other.users, users);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (header == null ? 0 : header!.hashCode) +
    (total == null ? 0 : total!.hashCode) +
    (users.hashCode);

  @override
  String toString() => 'FoundUsers[header=$header, total=$total, users=$users]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.header != null) {
      json[r'header'] = this.header;
    } else {
      json[r'header'] = null;
    }
    if (this.total != null) {
      json[r'total'] = this.total;
    } else {
      json[r'total'] = null;
    }
      json[r'users'] = this.users;
    return json;
  }

  /// Returns a new [FoundUsers] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FoundUsers? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return FoundUsers(
        header: mapValueOfType<String>(json, r'header'),
        total: mapValueOfType<int>(json, r'total'),
        users: UserPickerUser.listFromJson(json[r'users']),
      );
    }
    return null;
  }

  static List<FoundUsers> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FoundUsers>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FoundUsers.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FoundUsers> mapFromJson(dynamic json) {
    final map = <String, FoundUsers>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FoundUsers.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FoundUsers-objects as value to a dart map
  static Map<String, List<FoundUsers>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FoundUsers>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FoundUsers.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

