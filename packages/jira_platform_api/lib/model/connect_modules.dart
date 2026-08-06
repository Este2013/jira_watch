//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ConnectModules {
  /// Returns a new [ConnectModules] instance.
  ConnectModules({
    this.modules = const [],
  });

  /// A list of app modules in the same format as the `modules` property in the [app descriptor](https://developer.atlassian.com/cloud/jira/platform/app-descriptor/).
  List<Object> modules;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ConnectModules &&
    _deepEquality.equals(other.modules, modules);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (modules.hashCode);

  @override
  String toString() => 'ConnectModules[modules=$modules]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'modules'] = this.modules;
    return json;
  }

  /// Returns a new [ConnectModules] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ConnectModules? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'modules'), 'Required key "ConnectModules[modules]" is missing from JSON.');
        assert(json[r'modules'] != null, 'Required key "ConnectModules[modules]" has a null value in JSON.');
        return true;
      }());

      return ConnectModules(
        modules: json[r'modules'] is Iterable
            ? (json[r'modules'] as Iterable).cast<Object>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<ConnectModules> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ConnectModules>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ConnectModules.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ConnectModules> mapFromJson(dynamic json) {
    final map = <String, ConnectModules>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ConnectModules.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ConnectModules-objects as value to a dart map
  static Map<String, List<ConnectModules>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ConnectModules>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ConnectModules.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'modules',
  };
}

