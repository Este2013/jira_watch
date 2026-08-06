//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueTypeSchemeMapping {
  /// Returns a new [IssueTypeSchemeMapping] instance.
  IssueTypeSchemeMapping({
    required this.issueTypeId,
    required this.issueTypeSchemeId,
  });

  /// The ID of the issue type.
  String issueTypeId;

  /// The ID of the issue type scheme.
  String issueTypeSchemeId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueTypeSchemeMapping &&
    other.issueTypeId == issueTypeId &&
    other.issueTypeSchemeId == issueTypeSchemeId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (issueTypeId.hashCode) +
    (issueTypeSchemeId.hashCode);

  @override
  String toString() => 'IssueTypeSchemeMapping[issueTypeId=$issueTypeId, issueTypeSchemeId=$issueTypeSchemeId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'issueTypeId'] = this.issueTypeId;
      json[r'issueTypeSchemeId'] = this.issueTypeSchemeId;
    return json;
  }

  /// Returns a new [IssueTypeSchemeMapping] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueTypeSchemeMapping? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'issueTypeId'), 'Required key "IssueTypeSchemeMapping[issueTypeId]" is missing from JSON.');
        assert(json[r'issueTypeId'] != null, 'Required key "IssueTypeSchemeMapping[issueTypeId]" has a null value in JSON.');
        assert(json.containsKey(r'issueTypeSchemeId'), 'Required key "IssueTypeSchemeMapping[issueTypeSchemeId]" is missing from JSON.');
        assert(json[r'issueTypeSchemeId'] != null, 'Required key "IssueTypeSchemeMapping[issueTypeSchemeId]" has a null value in JSON.');
        return true;
      }());

      return IssueTypeSchemeMapping(
        issueTypeId: mapValueOfType<String>(json, r'issueTypeId')!,
        issueTypeSchemeId: mapValueOfType<String>(json, r'issueTypeSchemeId')!,
      );
    }
    return null;
  }

  static List<IssueTypeSchemeMapping> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueTypeSchemeMapping>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueTypeSchemeMapping.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueTypeSchemeMapping> mapFromJson(dynamic json) {
    final map = <String, IssueTypeSchemeMapping>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueTypeSchemeMapping.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueTypeSchemeMapping-objects as value to a dart map
  static Map<String, List<IssueTypeSchemeMapping>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueTypeSchemeMapping>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueTypeSchemeMapping.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'issueTypeId',
    'issueTypeSchemeId',
  };
}

