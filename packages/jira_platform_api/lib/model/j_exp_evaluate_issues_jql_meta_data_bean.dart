//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JExpEvaluateIssuesJqlMetaDataBean {
  /// Returns a new [JExpEvaluateIssuesJqlMetaDataBean] instance.
  JExpEvaluateIssuesJqlMetaDataBean({
    this.isLast,
    required this.nextPageToken,
  });

  /// Indicates whether this is the last page of the paginated response.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isLast;

  /// Next Page token for the next page of issues.
  String nextPageToken;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JExpEvaluateIssuesJqlMetaDataBean &&
    other.isLast == isLast &&
    other.nextPageToken == nextPageToken;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (isLast == null ? 0 : isLast!.hashCode) +
    (nextPageToken.hashCode);

  @override
  String toString() => 'JExpEvaluateIssuesJqlMetaDataBean[isLast=$isLast, nextPageToken=$nextPageToken]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.isLast != null) {
      json[r'isLast'] = this.isLast;
    } else {
      json[r'isLast'] = null;
    }
      json[r'nextPageToken'] = this.nextPageToken;
    return json;
  }

  /// Returns a new [JExpEvaluateIssuesJqlMetaDataBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JExpEvaluateIssuesJqlMetaDataBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'nextPageToken'), 'Required key "JExpEvaluateIssuesJqlMetaDataBean[nextPageToken]" is missing from JSON.');
        assert(json[r'nextPageToken'] != null, 'Required key "JExpEvaluateIssuesJqlMetaDataBean[nextPageToken]" has a null value in JSON.');
        return true;
      }());

      return JExpEvaluateIssuesJqlMetaDataBean(
        isLast: mapValueOfType<bool>(json, r'isLast'),
        nextPageToken: mapValueOfType<String>(json, r'nextPageToken')!,
      );
    }
    return null;
  }

  static List<JExpEvaluateIssuesJqlMetaDataBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JExpEvaluateIssuesJqlMetaDataBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JExpEvaluateIssuesJqlMetaDataBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JExpEvaluateIssuesJqlMetaDataBean> mapFromJson(dynamic json) {
    final map = <String, JExpEvaluateIssuesJqlMetaDataBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JExpEvaluateIssuesJqlMetaDataBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JExpEvaluateIssuesJqlMetaDataBean-objects as value to a dart map
  static Map<String, List<JExpEvaluateIssuesJqlMetaDataBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JExpEvaluateIssuesJqlMetaDataBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JExpEvaluateIssuesJqlMetaDataBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'nextPageToken',
  };
}

