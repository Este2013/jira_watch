//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BulkIssueResults {
  /// Returns a new [BulkIssueResults] instance.
  BulkIssueResults({
    this.issueErrors = const [],
    this.issues = const [],
  });

  /// When Jira can't return an issue enumerated in a request due to a retriable error or payload constraint, we'll return the respective issue ID with a corresponding error message. This list is empty when there are no errors Issues which aren't found or that the user doesn't have permission to view won't be returned in this list.
  List<IssueError> issueErrors;

  /// The list of issues.
  List<IssueBean> issues;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BulkIssueResults &&
    _deepEquality.equals(other.issueErrors, issueErrors) &&
    _deepEquality.equals(other.issues, issues);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (issueErrors.hashCode) +
    (issues.hashCode);

  @override
  String toString() => 'BulkIssueResults[issueErrors=$issueErrors, issues=$issues]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'issueErrors'] = this.issueErrors;
      json[r'issues'] = this.issues;
    return json;
  }

  /// Returns a new [BulkIssueResults] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BulkIssueResults? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return BulkIssueResults(
        issueErrors: IssueError.listFromJson(json[r'issueErrors']),
        issues: IssueBean.listFromJson(json[r'issues']),
      );
    }
    return null;
  }

  static List<BulkIssueResults> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BulkIssueResults>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BulkIssueResults.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BulkIssueResults> mapFromJson(dynamic json) {
    final map = <String, BulkIssueResults>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BulkIssueResults.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BulkIssueResults-objects as value to a dart map
  static Map<String, List<BulkIssueResults>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BulkIssueResults>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BulkIssueResults.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

