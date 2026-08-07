//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JexpEvaluateCtxJqlIssues {
  /// Returns a new [JexpEvaluateCtxJqlIssues] instance.
  JexpEvaluateCtxJqlIssues({
    this.maxResults,
    this.nextPageToken,
    this.query,
  });

  /// The maximum number of issues to return from the JQL query. max results value considered may be lower than the number specific here.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? maxResults;

  /// The token for a page to fetch that is not the first page. The first page has a `nextPageToken` of `null`. Use the `nextPageToken` to fetch the next page of issues.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? nextPageToken;

  /// The JQL query, required to be bounded. Additionally, `orderBy` clause can contain a maximum of 7 fields
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? query;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JexpEvaluateCtxJqlIssues &&
    other.maxResults == maxResults &&
    other.nextPageToken == nextPageToken &&
    other.query == query;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (maxResults == null ? 0 : maxResults!.hashCode) +
    (nextPageToken == null ? 0 : nextPageToken!.hashCode) +
    (query == null ? 0 : query!.hashCode);

  @override
  String toString() => 'JexpEvaluateCtxJqlIssues[maxResults=$maxResults, nextPageToken=$nextPageToken, query=$query]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.maxResults != null) {
      json[r'maxResults'] = this.maxResults;
    } else {
      json[r'maxResults'] = null;
    }
    if (this.nextPageToken != null) {
      json[r'nextPageToken'] = this.nextPageToken;
    } else {
      json[r'nextPageToken'] = null;
    }
    if (this.query != null) {
      json[r'query'] = this.query;
    } else {
      json[r'query'] = null;
    }
    return json;
  }

  /// Returns a new [JexpEvaluateCtxJqlIssues] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JexpEvaluateCtxJqlIssues? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return JexpEvaluateCtxJqlIssues(
        maxResults: mapValueOfType<int>(json, r'maxResults'),
        nextPageToken: mapValueOfType<String>(json, r'nextPageToken'),
        query: mapValueOfType<String>(json, r'query'),
      );
    }
    return null;
  }

  static List<JexpEvaluateCtxJqlIssues> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JexpEvaluateCtxJqlIssues>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JexpEvaluateCtxJqlIssues.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JexpEvaluateCtxJqlIssues> mapFromJson(dynamic json) {
    final map = <String, JexpEvaluateCtxJqlIssues>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JexpEvaluateCtxJqlIssues.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JexpEvaluateCtxJqlIssues-objects as value to a dart map
  static Map<String, List<JexpEvaluateCtxJqlIssues>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JexpEvaluateCtxJqlIssues>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JexpEvaluateCtxJqlIssues.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

