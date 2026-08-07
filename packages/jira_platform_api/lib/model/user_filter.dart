//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UserFilter {
  /// Returns a new [UserFilter] instance.
  UserFilter({
    required this.enabled,
    this.groups = const [],
    this.roleIds = const [],
  });

  /// Whether the filter is enabled.
  bool enabled;

  /// User groups autocomplete suggestion users must belong to. If not provided, the default values are used. A maximum of 10 groups can be provided.
  List<String> groups;

  /// Roles that autocomplete suggestion users must belong to. If not provided, the default values are used. A maximum of 10 roles can be provided.
  List<int> roleIds;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UserFilter &&
    other.enabled == enabled &&
    _deepEquality.equals(other.groups, groups) &&
    _deepEquality.equals(other.roleIds, roleIds);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (enabled.hashCode) +
    (groups.hashCode) +
    (roleIds.hashCode);

  @override
  String toString() => 'UserFilter[enabled=$enabled, groups=$groups, roleIds=$roleIds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'enabled'] = this.enabled;
      json[r'groups'] = this.groups;
      json[r'roleIds'] = this.roleIds;
    return json;
  }

  /// Returns a new [UserFilter] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UserFilter? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'enabled'), 'Required key "UserFilter[enabled]" is missing from JSON.');
        assert(json[r'enabled'] != null, 'Required key "UserFilter[enabled]" has a null value in JSON.');
        return true;
      }());

      return UserFilter(
        enabled: mapValueOfType<bool>(json, r'enabled')!,
        groups: json[r'groups'] is Iterable
            ? (json[r'groups'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        roleIds: json[r'roleIds'] is Iterable
            ? (json[r'roleIds'] as Iterable).cast<int>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<UserFilter> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UserFilter>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UserFilter.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UserFilter> mapFromJson(dynamic json) {
    final map = <String, UserFilter>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UserFilter.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UserFilter-objects as value to a dart map
  static Map<String, List<UserFilter>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UserFilter>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UserFilter.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'enabled',
  };
}

