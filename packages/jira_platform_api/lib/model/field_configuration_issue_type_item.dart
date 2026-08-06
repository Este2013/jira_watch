//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FieldConfigurationIssueTypeItem {
  /// Returns a new [FieldConfigurationIssueTypeItem] instance.
  FieldConfigurationIssueTypeItem({
    required this.fieldConfigurationId,
    required this.fieldConfigurationSchemeId,
    required this.issueTypeId,
  });

  /// The ID of the field configuration.
  String fieldConfigurationId;

  /// The ID of the field configuration scheme.
  String fieldConfigurationSchemeId;

  /// The ID of the issue type or *default*. When set to *default* this field configuration issue type item applies to all issue types without a field configuration.
  String issueTypeId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FieldConfigurationIssueTypeItem &&
    other.fieldConfigurationId == fieldConfigurationId &&
    other.fieldConfigurationSchemeId == fieldConfigurationSchemeId &&
    other.issueTypeId == issueTypeId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (fieldConfigurationId.hashCode) +
    (fieldConfigurationSchemeId.hashCode) +
    (issueTypeId.hashCode);

  @override
  String toString() => 'FieldConfigurationIssueTypeItem[fieldConfigurationId=$fieldConfigurationId, fieldConfigurationSchemeId=$fieldConfigurationSchemeId, issueTypeId=$issueTypeId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'fieldConfigurationId'] = this.fieldConfigurationId;
      json[r'fieldConfigurationSchemeId'] = this.fieldConfigurationSchemeId;
      json[r'issueTypeId'] = this.issueTypeId;
    return json;
  }

  /// Returns a new [FieldConfigurationIssueTypeItem] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FieldConfigurationIssueTypeItem? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'fieldConfigurationId'), 'Required key "FieldConfigurationIssueTypeItem[fieldConfigurationId]" is missing from JSON.');
        assert(json[r'fieldConfigurationId'] != null, 'Required key "FieldConfigurationIssueTypeItem[fieldConfigurationId]" has a null value in JSON.');
        assert(json.containsKey(r'fieldConfigurationSchemeId'), 'Required key "FieldConfigurationIssueTypeItem[fieldConfigurationSchemeId]" is missing from JSON.');
        assert(json[r'fieldConfigurationSchemeId'] != null, 'Required key "FieldConfigurationIssueTypeItem[fieldConfigurationSchemeId]" has a null value in JSON.');
        assert(json.containsKey(r'issueTypeId'), 'Required key "FieldConfigurationIssueTypeItem[issueTypeId]" is missing from JSON.');
        assert(json[r'issueTypeId'] != null, 'Required key "FieldConfigurationIssueTypeItem[issueTypeId]" has a null value in JSON.');
        return true;
      }());

      return FieldConfigurationIssueTypeItem(
        fieldConfigurationId: mapValueOfType<String>(json, r'fieldConfigurationId')!,
        fieldConfigurationSchemeId: mapValueOfType<String>(json, r'fieldConfigurationSchemeId')!,
        issueTypeId: mapValueOfType<String>(json, r'issueTypeId')!,
      );
    }
    return null;
  }

  static List<FieldConfigurationIssueTypeItem> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldConfigurationIssueTypeItem>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldConfigurationIssueTypeItem.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FieldConfigurationIssueTypeItem> mapFromJson(dynamic json) {
    final map = <String, FieldConfigurationIssueTypeItem>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FieldConfigurationIssueTypeItem.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FieldConfigurationIssueTypeItem-objects as value to a dart map
  static Map<String, List<FieldConfigurationIssueTypeItem>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FieldConfigurationIssueTypeItem>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FieldConfigurationIssueTypeItem.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'fieldConfigurationId',
    'fieldConfigurationSchemeId',
    'issueTypeId',
  };
}

