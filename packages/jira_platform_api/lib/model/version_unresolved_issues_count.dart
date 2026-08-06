//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class VersionUnresolvedIssuesCount {
  /// Returns a new [VersionUnresolvedIssuesCount] instance.
  VersionUnresolvedIssuesCount({
    this.issuesCount,
    this.issuesUnresolvedCount,
    this.self,
  });

  /// Count of issues.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? issuesCount;

  /// Count of unresolved issues.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? issuesUnresolvedCount;

  /// The URL of these count details.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? self;

  @override
  bool operator ==(Object other) => identical(this, other) || other is VersionUnresolvedIssuesCount &&
    other.issuesCount == issuesCount &&
    other.issuesUnresolvedCount == issuesUnresolvedCount &&
    other.self == self;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (issuesCount == null ? 0 : issuesCount!.hashCode) +
    (issuesUnresolvedCount == null ? 0 : issuesUnresolvedCount!.hashCode) +
    (self == null ? 0 : self!.hashCode);

  @override
  String toString() => 'VersionUnresolvedIssuesCount[issuesCount=$issuesCount, issuesUnresolvedCount=$issuesUnresolvedCount, self=$self]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.issuesCount != null) {
      json[r'issuesCount'] = this.issuesCount;
    } else {
      json[r'issuesCount'] = null;
    }
    if (this.issuesUnresolvedCount != null) {
      json[r'issuesUnresolvedCount'] = this.issuesUnresolvedCount;
    } else {
      json[r'issuesUnresolvedCount'] = null;
    }
    if (this.self != null) {
      json[r'self'] = this.self;
    } else {
      json[r'self'] = null;
    }
    return json;
  }

  /// Returns a new [VersionUnresolvedIssuesCount] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static VersionUnresolvedIssuesCount? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return VersionUnresolvedIssuesCount(
        issuesCount: mapValueOfType<int>(json, r'issuesCount'),
        issuesUnresolvedCount: mapValueOfType<int>(json, r'issuesUnresolvedCount'),
        self: mapValueOfType<String>(json, r'self'),
      );
    }
    return null;
  }

  static List<VersionUnresolvedIssuesCount> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <VersionUnresolvedIssuesCount>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VersionUnresolvedIssuesCount.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, VersionUnresolvedIssuesCount> mapFromJson(dynamic json) {
    final map = <String, VersionUnresolvedIssuesCount>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = VersionUnresolvedIssuesCount.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of VersionUnresolvedIssuesCount-objects as value to a dart map
  static Map<String, List<VersionUnresolvedIssuesCount>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<VersionUnresolvedIssuesCount>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = VersionUnresolvedIssuesCount.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

