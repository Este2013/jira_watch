//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueTypeDefaultValue {
  /// Returns a new [IssueTypeDefaultValue] instance.
  IssueTypeDefaultValue({
    this.isAnyIssueType,
    this.issueTypeId,
    this.value,
  });

  /// True when this default value applies to every issue type covered by the context (no specific issue type). Only present when true; omitted otherwise.
  bool? isAnyIssueType;

  /// The ID of the issue type this default value applies to. Null when isAnyIssueType is true.
  String? issueTypeId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CustomFieldContextDefaultValue? value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueTypeDefaultValue &&
    other.isAnyIssueType == isAnyIssueType &&
    other.issueTypeId == issueTypeId &&
    other.value == value;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (isAnyIssueType == null ? 0 : isAnyIssueType!.hashCode) +
    (issueTypeId == null ? 0 : issueTypeId!.hashCode) +
    (value == null ? 0 : value!.hashCode);

  @override
  String toString() => 'IssueTypeDefaultValue[isAnyIssueType=$isAnyIssueType, issueTypeId=$issueTypeId, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.isAnyIssueType != null) {
      json[r'isAnyIssueType'] = this.isAnyIssueType;
    } else {
      json[r'isAnyIssueType'] = null;
    }
    if (this.issueTypeId != null) {
      json[r'issueTypeId'] = this.issueTypeId;
    } else {
      json[r'issueTypeId'] = null;
    }
    if (this.value != null) {
      json[r'value'] = this.value;
    } else {
      json[r'value'] = null;
    }
    return json;
  }

  /// Returns a new [IssueTypeDefaultValue] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueTypeDefaultValue? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return IssueTypeDefaultValue(
        isAnyIssueType: mapValueOfType<bool>(json, r'isAnyIssueType'),
        issueTypeId: mapValueOfType<String>(json, r'issueTypeId'),
        value: CustomFieldContextDefaultValue.fromJson(json[r'value']),
      );
    }
    return null;
  }

  static List<IssueTypeDefaultValue> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueTypeDefaultValue>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueTypeDefaultValue.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueTypeDefaultValue> mapFromJson(dynamic json) {
    final map = <String, IssueTypeDefaultValue>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueTypeDefaultValue.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueTypeDefaultValue-objects as value to a dart map
  static Map<String, List<IssueTypeDefaultValue>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueTypeDefaultValue>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueTypeDefaultValue.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

