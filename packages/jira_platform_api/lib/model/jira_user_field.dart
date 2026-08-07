//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JiraUserField {
  /// Returns a new [JiraUserField] instance.
  JiraUserField({
    required this.accountId,
  });

  String accountId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JiraUserField &&
    other.accountId == accountId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (accountId.hashCode);

  @override
  String toString() => 'JiraUserField[accountId=$accountId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'accountId'] = this.accountId;
    return json;
  }

  /// Returns a new [JiraUserField] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JiraUserField? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'accountId'), 'Required key "JiraUserField[accountId]" is missing from JSON.');
        assert(json[r'accountId'] != null, 'Required key "JiraUserField[accountId]" has a null value in JSON.');
        return true;
      }());

      return JiraUserField(
        accountId: mapValueOfType<String>(json, r'accountId')!,
      );
    }
    return null;
  }

  static List<JiraUserField> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JiraUserField>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JiraUserField.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JiraUserField> mapFromJson(dynamic json) {
    final map = <String, JiraUserField>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JiraUserField.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JiraUserField-objects as value to a dart map
  static Map<String, List<JiraUserField>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JiraUserField>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JiraUserField.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'accountId',
  };
}

