//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JiraColorInput {
  /// Returns a new [JiraColorInput] instance.
  JiraColorInput({
    required this.name,
  });

  String name;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JiraColorInput &&
    other.name == name;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name.hashCode);

  @override
  String toString() => 'JiraColorInput[name=$name]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'name'] = this.name;
    return json;
  }

  /// Returns a new [JiraColorInput] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JiraColorInput? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'name'), 'Required key "JiraColorInput[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "JiraColorInput[name]" has a null value in JSON.');
        return true;
      }());

      return JiraColorInput(
        name: mapValueOfType<String>(json, r'name')!,
      );
    }
    return null;
  }

  static List<JiraColorInput> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JiraColorInput>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JiraColorInput.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JiraColorInput> mapFromJson(dynamic json) {
    final map = <String, JiraColorInput>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JiraColorInput.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JiraColorInput-objects as value to a dart map
  static Map<String, List<JiraColorInput>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JiraColorInput>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JiraColorInput.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
  };
}

