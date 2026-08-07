//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueTypeToContextMapping {
  /// Returns a new [IssueTypeToContextMapping] instance.
  IssueTypeToContextMapping({
    required this.contextId,
    this.isAnyIssueType,
    this.issueTypeId,
  });

  /// The ID of the context.
  String contextId;

  /// Whether the context is mapped to any issue type.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isAnyIssueType;

  /// The ID of the issue type.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? issueTypeId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueTypeToContextMapping &&
    other.contextId == contextId &&
    other.isAnyIssueType == isAnyIssueType &&
    other.issueTypeId == issueTypeId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (contextId.hashCode) +
    (isAnyIssueType == null ? 0 : isAnyIssueType!.hashCode) +
    (issueTypeId == null ? 0 : issueTypeId!.hashCode);

  @override
  String toString() => 'IssueTypeToContextMapping[contextId=$contextId, isAnyIssueType=$isAnyIssueType, issueTypeId=$issueTypeId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'contextId'] = this.contextId;
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
    return json;
  }

  /// Returns a new [IssueTypeToContextMapping] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueTypeToContextMapping? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'contextId'), 'Required key "IssueTypeToContextMapping[contextId]" is missing from JSON.');
        assert(json[r'contextId'] != null, 'Required key "IssueTypeToContextMapping[contextId]" has a null value in JSON.');
        return true;
      }());

      return IssueTypeToContextMapping(
        contextId: mapValueOfType<String>(json, r'contextId')!,
        isAnyIssueType: mapValueOfType<bool>(json, r'isAnyIssueType'),
        issueTypeId: mapValueOfType<String>(json, r'issueTypeId'),
      );
    }
    return null;
  }

  static List<IssueTypeToContextMapping> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueTypeToContextMapping>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueTypeToContextMapping.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueTypeToContextMapping> mapFromJson(dynamic json) {
    final map = <String, IssueTypeToContextMapping>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueTypeToContextMapping.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueTypeToContextMapping-objects as value to a dart map
  static Map<String, List<IssueTypeToContextMapping>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueTypeToContextMapping>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueTypeToContextMapping.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'contextId',
  };
}

