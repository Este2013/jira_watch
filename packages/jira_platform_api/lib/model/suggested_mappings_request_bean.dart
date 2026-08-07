//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SuggestedMappingsRequestBean {
  /// Returns a new [SuggestedMappingsRequestBean] instance.
  SuggestedMappingsRequestBean({
    this.maxResults,
    this.priorities,
    this.projects,
    this.schemeId,
    this.startAt,
  });

  /// The maximum number of results that could be on the page.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? maxResults;

  /// The priority changes in the scheme.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  SuggestedMappingsForPrioritiesRequestBean? priorities;

  /// The project changes in the scheme.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  SuggestedMappingsForProjectsRequestBean? projects;

  /// The id of the priority scheme.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? schemeId;

  /// The index of the first item returned on the page.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? startAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SuggestedMappingsRequestBean &&
    other.maxResults == maxResults &&
    other.priorities == priorities &&
    other.projects == projects &&
    other.schemeId == schemeId &&
    other.startAt == startAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (maxResults == null ? 0 : maxResults!.hashCode) +
    (priorities == null ? 0 : priorities!.hashCode) +
    (projects == null ? 0 : projects!.hashCode) +
    (schemeId == null ? 0 : schemeId!.hashCode) +
    (startAt == null ? 0 : startAt!.hashCode);

  @override
  String toString() => 'SuggestedMappingsRequestBean[maxResults=$maxResults, priorities=$priorities, projects=$projects, schemeId=$schemeId, startAt=$startAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.maxResults != null) {
      json[r'maxResults'] = this.maxResults;
    } else {
      json[r'maxResults'] = null;
    }
    if (this.priorities != null) {
      json[r'priorities'] = this.priorities;
    } else {
      json[r'priorities'] = null;
    }
    if (this.projects != null) {
      json[r'projects'] = this.projects;
    } else {
      json[r'projects'] = null;
    }
    if (this.schemeId != null) {
      json[r'schemeId'] = this.schemeId;
    } else {
      json[r'schemeId'] = null;
    }
    if (this.startAt != null) {
      json[r'startAt'] = this.startAt;
    } else {
      json[r'startAt'] = null;
    }
    return json;
  }

  /// Returns a new [SuggestedMappingsRequestBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SuggestedMappingsRequestBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return SuggestedMappingsRequestBean(
        maxResults: mapValueOfType<int>(json, r'maxResults'),
        priorities: SuggestedMappingsForPrioritiesRequestBean.fromJson(json[r'priorities']),
        projects: SuggestedMappingsForProjectsRequestBean.fromJson(json[r'projects']),
        schemeId: mapValueOfType<int>(json, r'schemeId'),
        startAt: mapValueOfType<int>(json, r'startAt'),
      );
    }
    return null;
  }

  static List<SuggestedMappingsRequestBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SuggestedMappingsRequestBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SuggestedMappingsRequestBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SuggestedMappingsRequestBean> mapFromJson(dynamic json) {
    final map = <String, SuggestedMappingsRequestBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SuggestedMappingsRequestBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SuggestedMappingsRequestBean-objects as value to a dart map
  static Map<String, List<SuggestedMappingsRequestBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SuggestedMappingsRequestBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SuggestedMappingsRequestBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

