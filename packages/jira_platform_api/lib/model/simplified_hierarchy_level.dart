//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SimplifiedHierarchyLevel {
  /// Returns a new [SimplifiedHierarchyLevel] instance.
  SimplifiedHierarchyLevel({
    this.aboveLevelId,
    this.belowLevelId,
    this.externalUuid,
    this.hierarchyLevelNumber,
    this.id,
    this.issueTypeIds = const [],
    this.level,
    this.name,
    this.projectConfigurationId,
  });

  /// The ID of the level above this one in the hierarchy. This property is deprecated, see [Change notice: Removing hierarchy level IDs from next-gen APIs](https://developer.atlassian.com/cloud/jira/platform/change-notice-removing-hierarchy-level-ids-from-next-gen-apis/).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? aboveLevelId;

  /// The ID of the level below this one in the hierarchy. This property is deprecated, see [Change notice: Removing hierarchy level IDs from next-gen APIs](https://developer.atlassian.com/cloud/jira/platform/change-notice-removing-hierarchy-level-ids-from-next-gen-apis/).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? belowLevelId;

  /// The external UUID of the hierarchy level. This property is deprecated, see [Change notice: Removing hierarchy level IDs from next-gen APIs](https://developer.atlassian.com/cloud/jira/platform/change-notice-removing-hierarchy-level-ids-from-next-gen-apis/).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? externalUuid;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? hierarchyLevelNumber;

  /// The ID of the hierarchy level. This property is deprecated, see [Change notice: Removing hierarchy level IDs from next-gen APIs](https://developer.atlassian.com/cloud/jira/platform/change-notice-removing-hierarchy-level-ids-from-next-gen-apis/).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  /// The issue types available in this hierarchy level.
  List<int> issueTypeIds;

  /// The level of this item in the hierarchy.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? level;

  /// The name of this hierarchy level.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The ID of the project configuration. This property is deprecated, see [Change oticen: Removing hierarchy level IDs from next-gen APIs](https://developer.atlassian.com/cloud/jira/platform/change-notice-removing-hierarchy-level-ids-from-next-gen-apis/).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? projectConfigurationId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SimplifiedHierarchyLevel &&
    other.aboveLevelId == aboveLevelId &&
    other.belowLevelId == belowLevelId &&
    other.externalUuid == externalUuid &&
    other.hierarchyLevelNumber == hierarchyLevelNumber &&
    other.id == id &&
    _deepEquality.equals(other.issueTypeIds, issueTypeIds) &&
    other.level == level &&
    other.name == name &&
    other.projectConfigurationId == projectConfigurationId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (aboveLevelId == null ? 0 : aboveLevelId!.hashCode) +
    (belowLevelId == null ? 0 : belowLevelId!.hashCode) +
    (externalUuid == null ? 0 : externalUuid!.hashCode) +
    (hierarchyLevelNumber == null ? 0 : hierarchyLevelNumber!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (issueTypeIds.hashCode) +
    (level == null ? 0 : level!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (projectConfigurationId == null ? 0 : projectConfigurationId!.hashCode);

  @override
  String toString() => 'SimplifiedHierarchyLevel[aboveLevelId=$aboveLevelId, belowLevelId=$belowLevelId, externalUuid=$externalUuid, hierarchyLevelNumber=$hierarchyLevelNumber, id=$id, issueTypeIds=$issueTypeIds, level=$level, name=$name, projectConfigurationId=$projectConfigurationId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.aboveLevelId != null) {
      json[r'aboveLevelId'] = this.aboveLevelId;
    } else {
      json[r'aboveLevelId'] = null;
    }
    if (this.belowLevelId != null) {
      json[r'belowLevelId'] = this.belowLevelId;
    } else {
      json[r'belowLevelId'] = null;
    }
    if (this.externalUuid != null) {
      json[r'externalUuid'] = this.externalUuid;
    } else {
      json[r'externalUuid'] = null;
    }
    if (this.hierarchyLevelNumber != null) {
      json[r'hierarchyLevelNumber'] = this.hierarchyLevelNumber;
    } else {
      json[r'hierarchyLevelNumber'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
      json[r'issueTypeIds'] = this.issueTypeIds;
    if (this.level != null) {
      json[r'level'] = this.level;
    } else {
      json[r'level'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.projectConfigurationId != null) {
      json[r'projectConfigurationId'] = this.projectConfigurationId;
    } else {
      json[r'projectConfigurationId'] = null;
    }
    return json;
  }

  /// Returns a new [SimplifiedHierarchyLevel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SimplifiedHierarchyLevel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return SimplifiedHierarchyLevel(
        aboveLevelId: mapValueOfType<int>(json, r'aboveLevelId'),
        belowLevelId: mapValueOfType<int>(json, r'belowLevelId'),
        externalUuid: mapValueOfType<String>(json, r'externalUuid'),
        hierarchyLevelNumber: mapValueOfType<int>(json, r'hierarchyLevelNumber'),
        id: mapValueOfType<int>(json, r'id'),
        issueTypeIds: json[r'issueTypeIds'] is Iterable
            ? (json[r'issueTypeIds'] as Iterable).cast<int>().toList(growable: false)
            : const [],
        level: mapValueOfType<int>(json, r'level'),
        name: mapValueOfType<String>(json, r'name'),
        projectConfigurationId: mapValueOfType<int>(json, r'projectConfigurationId'),
      );
    }
    return null;
  }

  static List<SimplifiedHierarchyLevel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SimplifiedHierarchyLevel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SimplifiedHierarchyLevel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SimplifiedHierarchyLevel> mapFromJson(dynamic json) {
    final map = <String, SimplifiedHierarchyLevel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SimplifiedHierarchyLevel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SimplifiedHierarchyLevel-objects as value to a dart map
  static Map<String, List<SimplifiedHierarchyLevel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SimplifiedHierarchyLevel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SimplifiedHierarchyLevel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

