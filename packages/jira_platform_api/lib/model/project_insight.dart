//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProjectInsight {
  /// Returns a new [ProjectInsight] instance.
  ProjectInsight({
    this.lastIssueUpdateTime,
    this.totalIssueCount,
  });

  /// The last issue update time.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? lastIssueUpdateTime;

  /// Total issue count.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? totalIssueCount;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProjectInsight &&
    other.lastIssueUpdateTime == lastIssueUpdateTime &&
    other.totalIssueCount == totalIssueCount;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (lastIssueUpdateTime == null ? 0 : lastIssueUpdateTime!.hashCode) +
    (totalIssueCount == null ? 0 : totalIssueCount!.hashCode);

  @override
  String toString() => 'ProjectInsight[lastIssueUpdateTime=$lastIssueUpdateTime, totalIssueCount=$totalIssueCount]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.lastIssueUpdateTime != null) {
      json[r'lastIssueUpdateTime'] = this.lastIssueUpdateTime!.toUtc().toIso8601String();
    } else {
      json[r'lastIssueUpdateTime'] = null;
    }
    if (this.totalIssueCount != null) {
      json[r'totalIssueCount'] = this.totalIssueCount;
    } else {
      json[r'totalIssueCount'] = null;
    }
    return json;
  }

  /// Returns a new [ProjectInsight] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProjectInsight? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ProjectInsight(
        lastIssueUpdateTime: mapDateTime(json, r'lastIssueUpdateTime', r''),
        totalIssueCount: mapValueOfType<int>(json, r'totalIssueCount'),
      );
    }
    return null;
  }

  static List<ProjectInsight> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectInsight>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectInsight.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProjectInsight> mapFromJson(dynamic json) {
    final map = <String, ProjectInsight>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProjectInsight.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProjectInsight-objects as value to a dart map
  static Map<String, List<ProjectInsight>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProjectInsight>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProjectInsight.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

