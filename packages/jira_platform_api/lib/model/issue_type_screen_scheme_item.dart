//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueTypeScreenSchemeItem {
  /// Returns a new [IssueTypeScreenSchemeItem] instance.
  IssueTypeScreenSchemeItem({
    required this.issueTypeId,
    required this.issueTypeScreenSchemeId,
    required this.screenSchemeId,
  });

  /// The ID of the issue type or *default*. Only issue types used in classic projects are accepted. When creating an issue screen scheme, an entry for *default* must be provided and defines the mapping for all issue types without a screen scheme. Otherwise, a *default* entry can't be provided.
  String issueTypeId;

  /// The ID of the issue type screen scheme.
  String issueTypeScreenSchemeId;

  /// The ID of the screen scheme.
  String screenSchemeId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueTypeScreenSchemeItem &&
    other.issueTypeId == issueTypeId &&
    other.issueTypeScreenSchemeId == issueTypeScreenSchemeId &&
    other.screenSchemeId == screenSchemeId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (issueTypeId.hashCode) +
    (issueTypeScreenSchemeId.hashCode) +
    (screenSchemeId.hashCode);

  @override
  String toString() => 'IssueTypeScreenSchemeItem[issueTypeId=$issueTypeId, issueTypeScreenSchemeId=$issueTypeScreenSchemeId, screenSchemeId=$screenSchemeId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'issueTypeId'] = this.issueTypeId;
      json[r'issueTypeScreenSchemeId'] = this.issueTypeScreenSchemeId;
      json[r'screenSchemeId'] = this.screenSchemeId;
    return json;
  }

  /// Returns a new [IssueTypeScreenSchemeItem] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueTypeScreenSchemeItem? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'issueTypeId'), 'Required key "IssueTypeScreenSchemeItem[issueTypeId]" is missing from JSON.');
        assert(json[r'issueTypeId'] != null, 'Required key "IssueTypeScreenSchemeItem[issueTypeId]" has a null value in JSON.');
        assert(json.containsKey(r'issueTypeScreenSchemeId'), 'Required key "IssueTypeScreenSchemeItem[issueTypeScreenSchemeId]" is missing from JSON.');
        assert(json[r'issueTypeScreenSchemeId'] != null, 'Required key "IssueTypeScreenSchemeItem[issueTypeScreenSchemeId]" has a null value in JSON.');
        assert(json.containsKey(r'screenSchemeId'), 'Required key "IssueTypeScreenSchemeItem[screenSchemeId]" is missing from JSON.');
        assert(json[r'screenSchemeId'] != null, 'Required key "IssueTypeScreenSchemeItem[screenSchemeId]" has a null value in JSON.');
        return true;
      }());

      return IssueTypeScreenSchemeItem(
        issueTypeId: mapValueOfType<String>(json, r'issueTypeId')!,
        issueTypeScreenSchemeId: mapValueOfType<String>(json, r'issueTypeScreenSchemeId')!,
        screenSchemeId: mapValueOfType<String>(json, r'screenSchemeId')!,
      );
    }
    return null;
  }

  static List<IssueTypeScreenSchemeItem> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueTypeScreenSchemeItem>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueTypeScreenSchemeItem.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueTypeScreenSchemeItem> mapFromJson(dynamic json) {
    final map = <String, IssueTypeScreenSchemeItem>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueTypeScreenSchemeItem.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueTypeScreenSchemeItem-objects as value to a dart map
  static Map<String, List<IssueTypeScreenSchemeItem>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueTypeScreenSchemeItem>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueTypeScreenSchemeItem.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'issueTypeId',
    'issueTypeScreenSchemeId',
    'screenSchemeId',
  };
}

