//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class VersionUsageInCustomField {
  /// Returns a new [VersionUsageInCustomField] instance.
  VersionUsageInCustomField({
    this.customFieldId,
    this.fieldName,
    this.issueCountWithVersionInCustomField,
  });

  /// The ID of the custom field.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? customFieldId;

  /// The name of the custom field.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? fieldName;

  /// Count of the issues where the custom field contains the version.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? issueCountWithVersionInCustomField;

  @override
  bool operator ==(Object other) => identical(this, other) || other is VersionUsageInCustomField &&
    other.customFieldId == customFieldId &&
    other.fieldName == fieldName &&
    other.issueCountWithVersionInCustomField == issueCountWithVersionInCustomField;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (customFieldId == null ? 0 : customFieldId!.hashCode) +
    (fieldName == null ? 0 : fieldName!.hashCode) +
    (issueCountWithVersionInCustomField == null ? 0 : issueCountWithVersionInCustomField!.hashCode);

  @override
  String toString() => 'VersionUsageInCustomField[customFieldId=$customFieldId, fieldName=$fieldName, issueCountWithVersionInCustomField=$issueCountWithVersionInCustomField]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.customFieldId != null) {
      json[r'customFieldId'] = this.customFieldId;
    } else {
      json[r'customFieldId'] = null;
    }
    if (this.fieldName != null) {
      json[r'fieldName'] = this.fieldName;
    } else {
      json[r'fieldName'] = null;
    }
    if (this.issueCountWithVersionInCustomField != null) {
      json[r'issueCountWithVersionInCustomField'] = this.issueCountWithVersionInCustomField;
    } else {
      json[r'issueCountWithVersionInCustomField'] = null;
    }
    return json;
  }

  /// Returns a new [VersionUsageInCustomField] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static VersionUsageInCustomField? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return VersionUsageInCustomField(
        customFieldId: mapValueOfType<int>(json, r'customFieldId'),
        fieldName: mapValueOfType<String>(json, r'fieldName'),
        issueCountWithVersionInCustomField: mapValueOfType<int>(json, r'issueCountWithVersionInCustomField'),
      );
    }
    return null;
  }

  static List<VersionUsageInCustomField> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <VersionUsageInCustomField>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VersionUsageInCustomField.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, VersionUsageInCustomField> mapFromJson(dynamic json) {
    final map = <String, VersionUsageInCustomField>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = VersionUsageInCustomField.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of VersionUsageInCustomField-objects as value to a dart map
  static Map<String, List<VersionUsageInCustomField>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<VersionUsageInCustomField>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = VersionUsageInCustomField.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

