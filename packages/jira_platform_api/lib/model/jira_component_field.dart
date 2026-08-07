//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JiraComponentField {
  /// Returns a new [JiraComponentField] instance.
  JiraComponentField({
    required this.componentId,
  });

  int componentId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JiraComponentField &&
    other.componentId == componentId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (componentId.hashCode);

  @override
  String toString() => 'JiraComponentField[componentId=$componentId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'componentId'] = this.componentId;
    return json;
  }

  /// Returns a new [JiraComponentField] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JiraComponentField? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'componentId'), 'Required key "JiraComponentField[componentId]" is missing from JSON.');
        assert(json[r'componentId'] != null, 'Required key "JiraComponentField[componentId]" has a null value in JSON.');
        return true;
      }());

      return JiraComponentField(
        componentId: mapValueOfType<int>(json, r'componentId')!,
      );
    }
    return null;
  }

  static List<JiraComponentField> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JiraComponentField>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JiraComponentField.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JiraComponentField> mapFromJson(dynamic json) {
    final map = <String, JiraComponentField>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JiraComponentField.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JiraComponentField-objects as value to a dart map
  static Map<String, List<JiraComponentField>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JiraComponentField>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JiraComponentField.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'componentId',
  };
}

