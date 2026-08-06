//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetExclusionRulesResponse {
  /// Returns a new [GetExclusionRulesResponse] instance.
  GetExclusionRulesResponse({
    this.issueIds = const [],
    this.issueTypeIds = const [],
    required this.numberOfDaysToShowCompletedIssues,
    this.releaseIds = const [],
    this.workStatusCategoryIds = const [],
    this.workStatusIds = const [],
  });

  /// The IDs of the issues excluded from the plan.
  List<int> issueIds;

  /// The IDs of the issue types excluded from the plan.
  List<int> issueTypeIds;

  /// Issues completed this number of days ago are excluded from the plan.
  int numberOfDaysToShowCompletedIssues;

  /// The IDs of the releases excluded from the plan.
  List<int> releaseIds;

  /// The IDs of the work status categories excluded from the plan.
  List<int> workStatusCategoryIds;

  /// The IDs of the work statuses excluded from the plan.
  List<int> workStatusIds;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetExclusionRulesResponse &&
    _deepEquality.equals(other.issueIds, issueIds) &&
    _deepEquality.equals(other.issueTypeIds, issueTypeIds) &&
    other.numberOfDaysToShowCompletedIssues == numberOfDaysToShowCompletedIssues &&
    _deepEquality.equals(other.releaseIds, releaseIds) &&
    _deepEquality.equals(other.workStatusCategoryIds, workStatusCategoryIds) &&
    _deepEquality.equals(other.workStatusIds, workStatusIds);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (issueIds.hashCode) +
    (issueTypeIds.hashCode) +
    (numberOfDaysToShowCompletedIssues.hashCode) +
    (releaseIds.hashCode) +
    (workStatusCategoryIds.hashCode) +
    (workStatusIds.hashCode);

  @override
  String toString() => 'GetExclusionRulesResponse[issueIds=$issueIds, issueTypeIds=$issueTypeIds, numberOfDaysToShowCompletedIssues=$numberOfDaysToShowCompletedIssues, releaseIds=$releaseIds, workStatusCategoryIds=$workStatusCategoryIds, workStatusIds=$workStatusIds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'issueIds'] = this.issueIds;
      json[r'issueTypeIds'] = this.issueTypeIds;
      json[r'numberOfDaysToShowCompletedIssues'] = this.numberOfDaysToShowCompletedIssues;
      json[r'releaseIds'] = this.releaseIds;
      json[r'workStatusCategoryIds'] = this.workStatusCategoryIds;
      json[r'workStatusIds'] = this.workStatusIds;
    return json;
  }

  /// Returns a new [GetExclusionRulesResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetExclusionRulesResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'numberOfDaysToShowCompletedIssues'), 'Required key "GetExclusionRulesResponse[numberOfDaysToShowCompletedIssues]" is missing from JSON.');
        assert(json[r'numberOfDaysToShowCompletedIssues'] != null, 'Required key "GetExclusionRulesResponse[numberOfDaysToShowCompletedIssues]" has a null value in JSON.');
        return true;
      }());

      return GetExclusionRulesResponse(
        issueIds: json[r'issueIds'] is Iterable
            ? (json[r'issueIds'] as Iterable).cast<int>().toList(growable: false)
            : const [],
        issueTypeIds: json[r'issueTypeIds'] is Iterable
            ? (json[r'issueTypeIds'] as Iterable).cast<int>().toList(growable: false)
            : const [],
        numberOfDaysToShowCompletedIssues: mapValueOfType<int>(json, r'numberOfDaysToShowCompletedIssues')!,
        releaseIds: json[r'releaseIds'] is Iterable
            ? (json[r'releaseIds'] as Iterable).cast<int>().toList(growable: false)
            : const [],
        workStatusCategoryIds: json[r'workStatusCategoryIds'] is Iterable
            ? (json[r'workStatusCategoryIds'] as Iterable).cast<int>().toList(growable: false)
            : const [],
        workStatusIds: json[r'workStatusIds'] is Iterable
            ? (json[r'workStatusIds'] as Iterable).cast<int>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<GetExclusionRulesResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetExclusionRulesResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetExclusionRulesResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetExclusionRulesResponse> mapFromJson(dynamic json) {
    final map = <String, GetExclusionRulesResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetExclusionRulesResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetExclusionRulesResponse-objects as value to a dart map
  static Map<String, List<GetExclusionRulesResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetExclusionRulesResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetExclusionRulesResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'numberOfDaysToShowCompletedIssues',
  };
}

