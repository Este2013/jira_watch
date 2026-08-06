//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FieldConfigurationToIssueTypeMapping {
  /// Returns a new [FieldConfigurationToIssueTypeMapping] instance.
  FieldConfigurationToIssueTypeMapping({
    required this.fieldConfigurationId,
    required this.issueTypeId,
  });

  /// The ID of the field configuration.
  String fieldConfigurationId;

  /// The ID of the issue type or *default*. When set to *default* this field configuration issue type item applies to all issue types without a field configuration. An issue type can be included only once in a request.
  String issueTypeId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FieldConfigurationToIssueTypeMapping &&
    other.fieldConfigurationId == fieldConfigurationId &&
    other.issueTypeId == issueTypeId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (fieldConfigurationId.hashCode) +
    (issueTypeId.hashCode);

  @override
  String toString() => 'FieldConfigurationToIssueTypeMapping[fieldConfigurationId=$fieldConfigurationId, issueTypeId=$issueTypeId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'fieldConfigurationId'] = this.fieldConfigurationId;
      json[r'issueTypeId'] = this.issueTypeId;
    return json;
  }

  /// Returns a new [FieldConfigurationToIssueTypeMapping] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FieldConfigurationToIssueTypeMapping? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'fieldConfigurationId'), 'Required key "FieldConfigurationToIssueTypeMapping[fieldConfigurationId]" is missing from JSON.');
        assert(json[r'fieldConfigurationId'] != null, 'Required key "FieldConfigurationToIssueTypeMapping[fieldConfigurationId]" has a null value in JSON.');
        assert(json.containsKey(r'issueTypeId'), 'Required key "FieldConfigurationToIssueTypeMapping[issueTypeId]" is missing from JSON.');
        assert(json[r'issueTypeId'] != null, 'Required key "FieldConfigurationToIssueTypeMapping[issueTypeId]" has a null value in JSON.');
        return true;
      }());

      return FieldConfigurationToIssueTypeMapping(
        fieldConfigurationId: mapValueOfType<String>(json, r'fieldConfigurationId')!,
        issueTypeId: mapValueOfType<String>(json, r'issueTypeId')!,
      );
    }
    return null;
  }

  static List<FieldConfigurationToIssueTypeMapping> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldConfigurationToIssueTypeMapping>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldConfigurationToIssueTypeMapping.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FieldConfigurationToIssueTypeMapping> mapFromJson(dynamic json) {
    final map = <String, FieldConfigurationToIssueTypeMapping>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FieldConfigurationToIssueTypeMapping.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FieldConfigurationToIssueTypeMapping-objects as value to a dart map
  static Map<String, List<FieldConfigurationToIssueTypeMapping>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FieldConfigurationToIssueTypeMapping>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FieldConfigurationToIssueTypeMapping.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'fieldConfigurationId',
    'issueTypeId',
  };
}

