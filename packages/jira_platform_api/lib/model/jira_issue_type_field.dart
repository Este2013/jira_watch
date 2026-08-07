//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JiraIssueTypeField {
  /// Returns a new [JiraIssueTypeField] instance.
  JiraIssueTypeField({
    required this.issueTypeId,
  });

  String issueTypeId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JiraIssueTypeField &&
    other.issueTypeId == issueTypeId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (issueTypeId.hashCode);

  @override
  String toString() => 'JiraIssueTypeField[issueTypeId=$issueTypeId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'issueTypeId'] = this.issueTypeId;
    return json;
  }

  /// Returns a new [JiraIssueTypeField] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JiraIssueTypeField? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'issueTypeId'), 'Required key "JiraIssueTypeField[issueTypeId]" is missing from JSON.');
        assert(json[r'issueTypeId'] != null, 'Required key "JiraIssueTypeField[issueTypeId]" has a null value in JSON.');
        return true;
      }());

      return JiraIssueTypeField(
        issueTypeId: mapValueOfType<String>(json, r'issueTypeId')!,
      );
    }
    return null;
  }

  static List<JiraIssueTypeField> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JiraIssueTypeField>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JiraIssueTypeField.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JiraIssueTypeField> mapFromJson(dynamic json) {
    final map = <String, JiraIssueTypeField>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JiraIssueTypeField.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JiraIssueTypeField-objects as value to a dart map
  static Map<String, List<JiraIssueTypeField>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JiraIssueTypeField>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JiraIssueTypeField.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'issueTypeId',
  };
}

