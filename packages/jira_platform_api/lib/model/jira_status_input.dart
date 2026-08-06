//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JiraStatusInput {
  /// Returns a new [JiraStatusInput] instance.
  JiraStatusInput({
    required this.statusId,
  });

  String statusId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JiraStatusInput &&
    other.statusId == statusId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (statusId.hashCode);

  @override
  String toString() => 'JiraStatusInput[statusId=$statusId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'statusId'] = this.statusId;
    return json;
  }

  /// Returns a new [JiraStatusInput] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JiraStatusInput? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'statusId'), 'Required key "JiraStatusInput[statusId]" is missing from JSON.');
        assert(json[r'statusId'] != null, 'Required key "JiraStatusInput[statusId]" has a null value in JSON.');
        return true;
      }());

      return JiraStatusInput(
        statusId: mapValueOfType<String>(json, r'statusId')!,
      );
    }
    return null;
  }

  static List<JiraStatusInput> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JiraStatusInput>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JiraStatusInput.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JiraStatusInput> mapFromJson(dynamic json) {
    final map = <String, JiraStatusInput>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JiraStatusInput.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JiraStatusInput-objects as value to a dart map
  static Map<String, List<JiraStatusInput>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JiraStatusInput>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JiraStatusInput.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'statusId',
  };
}

