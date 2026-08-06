//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class VersionIssueCounts {
  /// Returns a new [VersionIssueCounts] instance.
  VersionIssueCounts({
    this.customFieldUsage = const [],
    this.issueCountWithCustomFieldsShowingVersion,
    this.issuesAffectedCount,
    this.issuesFixedCount,
    this.self,
  });

  /// List of custom fields using the version.
  List<VersionUsageInCustomField> customFieldUsage;

  /// Count of issues where a version custom field is set to the version.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? issueCountWithCustomFieldsShowingVersion;

  /// Count of issues where the `affectedVersion` is set to the version.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? issuesAffectedCount;

  /// Count of issues where the `fixVersion` is set to the version.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? issuesFixedCount;

  /// The URL of these count details.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? self;

  @override
  bool operator ==(Object other) => identical(this, other) || other is VersionIssueCounts &&
    _deepEquality.equals(other.customFieldUsage, customFieldUsage) &&
    other.issueCountWithCustomFieldsShowingVersion == issueCountWithCustomFieldsShowingVersion &&
    other.issuesAffectedCount == issuesAffectedCount &&
    other.issuesFixedCount == issuesFixedCount &&
    other.self == self;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (customFieldUsage.hashCode) +
    (issueCountWithCustomFieldsShowingVersion == null ? 0 : issueCountWithCustomFieldsShowingVersion!.hashCode) +
    (issuesAffectedCount == null ? 0 : issuesAffectedCount!.hashCode) +
    (issuesFixedCount == null ? 0 : issuesFixedCount!.hashCode) +
    (self == null ? 0 : self!.hashCode);

  @override
  String toString() => 'VersionIssueCounts[customFieldUsage=$customFieldUsage, issueCountWithCustomFieldsShowingVersion=$issueCountWithCustomFieldsShowingVersion, issuesAffectedCount=$issuesAffectedCount, issuesFixedCount=$issuesFixedCount, self=$self]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'customFieldUsage'] = this.customFieldUsage;
    if (this.issueCountWithCustomFieldsShowingVersion != null) {
      json[r'issueCountWithCustomFieldsShowingVersion'] = this.issueCountWithCustomFieldsShowingVersion;
    } else {
      json[r'issueCountWithCustomFieldsShowingVersion'] = null;
    }
    if (this.issuesAffectedCount != null) {
      json[r'issuesAffectedCount'] = this.issuesAffectedCount;
    } else {
      json[r'issuesAffectedCount'] = null;
    }
    if (this.issuesFixedCount != null) {
      json[r'issuesFixedCount'] = this.issuesFixedCount;
    } else {
      json[r'issuesFixedCount'] = null;
    }
    if (this.self != null) {
      json[r'self'] = this.self;
    } else {
      json[r'self'] = null;
    }
    return json;
  }

  /// Returns a new [VersionIssueCounts] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static VersionIssueCounts? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return VersionIssueCounts(
        customFieldUsage: VersionUsageInCustomField.listFromJson(json[r'customFieldUsage']),
        issueCountWithCustomFieldsShowingVersion: mapValueOfType<int>(json, r'issueCountWithCustomFieldsShowingVersion'),
        issuesAffectedCount: mapValueOfType<int>(json, r'issuesAffectedCount'),
        issuesFixedCount: mapValueOfType<int>(json, r'issuesFixedCount'),
        self: mapValueOfType<String>(json, r'self'),
      );
    }
    return null;
  }

  static List<VersionIssueCounts> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <VersionIssueCounts>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VersionIssueCounts.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, VersionIssueCounts> mapFromJson(dynamic json) {
    final map = <String, VersionIssueCounts>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = VersionIssueCounts.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of VersionIssueCounts-objects as value to a dart map
  static Map<String, List<VersionIssueCounts>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<VersionIssueCounts>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = VersionIssueCounts.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

