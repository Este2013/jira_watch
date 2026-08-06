//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JiraGroupInput {
  /// Returns a new [JiraGroupInput] instance.
  JiraGroupInput({
    required this.groupName,
  });

  String groupName;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JiraGroupInput &&
    other.groupName == groupName;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (groupName.hashCode);

  @override
  String toString() => 'JiraGroupInput[groupName=$groupName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'groupName'] = this.groupName;
    return json;
  }

  /// Returns a new [JiraGroupInput] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JiraGroupInput? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'groupName'), 'Required key "JiraGroupInput[groupName]" is missing from JSON.');
        assert(json[r'groupName'] != null, 'Required key "JiraGroupInput[groupName]" has a null value in JSON.');
        return true;
      }());

      return JiraGroupInput(
        groupName: mapValueOfType<String>(json, r'groupName')!,
      );
    }
    return null;
  }

  static List<JiraGroupInput> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JiraGroupInput>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JiraGroupInput.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JiraGroupInput> mapFromJson(dynamic json) {
    final map = <String, JiraGroupInput>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JiraGroupInput.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JiraGroupInput-objects as value to a dart map
  static Map<String, List<JiraGroupInput>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JiraGroupInput>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JiraGroupInput.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'groupName',
  };
}

