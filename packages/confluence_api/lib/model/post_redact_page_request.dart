//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PostRedactPageRequest {
  /// Returns a new [PostRedactPageRequest] instance.
  PostRedactPageRequest({
    required this.createdAt,
    this.cleanHistory,
    this.versionNumber,
    this.body,
    this.title,
  });

  /// Timestamp when the content was last updated.
  DateTime createdAt;

  /// Whether to clean up previous versions containing the redaction. When true, historical versions of the content that contain the redacted text will be squashed.
  bool? cleanHistory;

  /// Optional version number of the content to redact. When specified, the redaction will target  a specific historical version of the content rather than the current version.  - If omitted or null, the redaction applies to the current (latest) version of the content. - When provided, must be a valid version number that exists for the content.  **Note**: Version numbers start at 1 and increment with each content update. 
  ///
  /// Minimum value: 1
  int? versionNumber;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  PostRedactPageRequestBody? body;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  PostRedactPageRequestBody? title;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PostRedactPageRequest &&
    other.createdAt == createdAt &&
    other.cleanHistory == cleanHistory &&
    other.versionNumber == versionNumber &&
    other.body == body &&
    other.title == title;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (createdAt.hashCode) +
    (cleanHistory == null ? 0 : cleanHistory!.hashCode) +
    (versionNumber == null ? 0 : versionNumber!.hashCode) +
    (body == null ? 0 : body!.hashCode) +
    (title == null ? 0 : title!.hashCode);

  @override
  String toString() => 'PostRedactPageRequest[createdAt=$createdAt, cleanHistory=$cleanHistory, versionNumber=$versionNumber, body=$body, title=$title]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'createdAt'] = this.createdAt.toUtc().toIso8601String();
    if (this.cleanHistory != null) {
      json[r'cleanHistory'] = this.cleanHistory;
    } else {
      json[r'cleanHistory'] = null;
    }
    if (this.versionNumber != null) {
      json[r'versionNumber'] = this.versionNumber;
    } else {
      json[r'versionNumber'] = null;
    }
    if (this.body != null) {
      json[r'body'] = this.body;
    } else {
      json[r'body'] = null;
    }
    if (this.title != null) {
      json[r'title'] = this.title;
    } else {
      json[r'title'] = null;
    }
    return json;
  }

  /// Returns a new [PostRedactPageRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PostRedactPageRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'createdAt'), 'Required key "PostRedactPageRequest[createdAt]" is missing from JSON.');
        assert(json[r'createdAt'] != null, 'Required key "PostRedactPageRequest[createdAt]" has a null value in JSON.');
        return true;
      }());

      return PostRedactPageRequest(
        createdAt: mapDateTime(json, r'createdAt', r'')!,
        cleanHistory: mapValueOfType<bool>(json, r'cleanHistory'),
        versionNumber: mapValueOfType<int>(json, r'versionNumber'),
        body: PostRedactPageRequestBody.fromJson(json[r'body']),
        title: PostRedactPageRequestBody.fromJson(json[r'title']),
      );
    }
    return null;
  }

  static List<PostRedactPageRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PostRedactPageRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PostRedactPageRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PostRedactPageRequest> mapFromJson(dynamic json) {
    final map = <String, PostRedactPageRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PostRedactPageRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PostRedactPageRequest-objects as value to a dart map
  static Map<String, List<PostRedactPageRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PostRedactPageRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PostRedactPageRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'createdAt',
  };
}

