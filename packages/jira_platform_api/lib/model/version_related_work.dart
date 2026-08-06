//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class VersionRelatedWork {
  /// Returns a new [VersionRelatedWork] instance.
  VersionRelatedWork({
    required this.category,
    this.issueId,
    this.relatedWorkId,
    this.title,
    this.url,
  });

  /// The category of the related work
  String category;

  /// The ID of the issue associated with the related work (if there is one). Cannot be updated via the Rest API.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? issueId;

  /// The id of the related work. For the native release note related work item, this will be null, and Rest API does not support updating it.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? relatedWorkId;

  /// The title of the related work
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? title;

  /// The URL of the related work. Will be null for the native release note related work item, but is otherwise required.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? url;

  @override
  bool operator ==(Object other) => identical(this, other) || other is VersionRelatedWork &&
    other.category == category &&
    other.issueId == issueId &&
    other.relatedWorkId == relatedWorkId &&
    other.title == title &&
    other.url == url;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (category.hashCode) +
    (issueId == null ? 0 : issueId!.hashCode) +
    (relatedWorkId == null ? 0 : relatedWorkId!.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (url == null ? 0 : url!.hashCode);

  @override
  String toString() => 'VersionRelatedWork[category=$category, issueId=$issueId, relatedWorkId=$relatedWorkId, title=$title, url=$url]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'category'] = this.category;
    if (this.issueId != null) {
      json[r'issueId'] = this.issueId;
    } else {
      json[r'issueId'] = null;
    }
    if (this.relatedWorkId != null) {
      json[r'relatedWorkId'] = this.relatedWorkId;
    } else {
      json[r'relatedWorkId'] = null;
    }
    if (this.title != null) {
      json[r'title'] = this.title;
    } else {
      json[r'title'] = null;
    }
    if (this.url != null) {
      json[r'url'] = this.url;
    } else {
      json[r'url'] = null;
    }
    return json;
  }

  /// Returns a new [VersionRelatedWork] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static VersionRelatedWork? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'category'), 'Required key "VersionRelatedWork[category]" is missing from JSON.');
        assert(json[r'category'] != null, 'Required key "VersionRelatedWork[category]" has a null value in JSON.');
        return true;
      }());

      return VersionRelatedWork(
        category: mapValueOfType<String>(json, r'category')!,
        issueId: mapValueOfType<int>(json, r'issueId'),
        relatedWorkId: mapValueOfType<String>(json, r'relatedWorkId'),
        title: mapValueOfType<String>(json, r'title'),
        url: mapValueOfType<String>(json, r'url'),
      );
    }
    return null;
  }

  static List<VersionRelatedWork> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <VersionRelatedWork>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VersionRelatedWork.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, VersionRelatedWork> mapFromJson(dynamic json) {
    final map = <String, VersionRelatedWork>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = VersionRelatedWork.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of VersionRelatedWork-objects as value to a dart map
  static Map<String, List<VersionRelatedWork>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<VersionRelatedWork>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = VersionRelatedWork.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'category',
  };
}

