//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueRankRequestBean {
  /// Returns a new [IssueRankRequestBean] instance.
  IssueRankRequestBean({
    this.issues = const [],
    this.rankAfterIssue,
    this.rankBeforeIssue,
    this.rankCustomFieldId,
  });

  List<String> issues;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? rankAfterIssue;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? rankBeforeIssue;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? rankCustomFieldId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueRankRequestBean &&
    _deepEquality.equals(other.issues, issues) &&
    other.rankAfterIssue == rankAfterIssue &&
    other.rankBeforeIssue == rankBeforeIssue &&
    other.rankCustomFieldId == rankCustomFieldId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (issues.hashCode) +
    (rankAfterIssue == null ? 0 : rankAfterIssue!.hashCode) +
    (rankBeforeIssue == null ? 0 : rankBeforeIssue!.hashCode) +
    (rankCustomFieldId == null ? 0 : rankCustomFieldId!.hashCode);

  @override
  String toString() => 'IssueRankRequestBean[issues=$issues, rankAfterIssue=$rankAfterIssue, rankBeforeIssue=$rankBeforeIssue, rankCustomFieldId=$rankCustomFieldId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'issues'] = this.issues;
    if (this.rankAfterIssue != null) {
      json[r'rankAfterIssue'] = this.rankAfterIssue;
    } else {
      json[r'rankAfterIssue'] = null;
    }
    if (this.rankBeforeIssue != null) {
      json[r'rankBeforeIssue'] = this.rankBeforeIssue;
    } else {
      json[r'rankBeforeIssue'] = null;
    }
    if (this.rankCustomFieldId != null) {
      json[r'rankCustomFieldId'] = this.rankCustomFieldId;
    } else {
      json[r'rankCustomFieldId'] = null;
    }
    return json;
  }

  /// Returns a new [IssueRankRequestBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueRankRequestBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return IssueRankRequestBean(
        issues: json[r'issues'] is Iterable
            ? (json[r'issues'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        rankAfterIssue: mapValueOfType<String>(json, r'rankAfterIssue'),
        rankBeforeIssue: mapValueOfType<String>(json, r'rankBeforeIssue'),
        rankCustomFieldId: mapValueOfType<int>(json, r'rankCustomFieldId'),
      );
    }
    return null;
  }

  static List<IssueRankRequestBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueRankRequestBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueRankRequestBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueRankRequestBean> mapFromJson(dynamic json) {
    final map = <String, IssueRankRequestBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueRankRequestBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueRankRequestBean-objects as value to a dart map
  static Map<String, List<IssueRankRequestBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueRankRequestBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueRankRequestBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

