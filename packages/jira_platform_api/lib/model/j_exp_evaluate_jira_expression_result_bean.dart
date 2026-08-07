//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JExpEvaluateJiraExpressionResultBean {
  /// Returns a new [JExpEvaluateJiraExpressionResultBean] instance.
  JExpEvaluateJiraExpressionResultBean({
    this.meta,
    required this.value,
  });

  /// Contains various characteristics of the performed expression evaluation.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  JExpEvaluateMetaDataBean? meta;

  /// The value of the evaluated expression. It may be a primitive JSON value or a Jira REST API object. (Some expressions do not produce any meaningful results—for example, an expression that returns a lambda function—if that's the case a simple string representation is returned. These string representations should not be relied upon and may change without notice.)
  Object? value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JExpEvaluateJiraExpressionResultBean &&
    other.meta == meta &&
    other.value == value;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (meta == null ? 0 : meta!.hashCode) +
    (value == null ? 0 : value!.hashCode);

  @override
  String toString() => 'JExpEvaluateJiraExpressionResultBean[meta=$meta, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.meta != null) {
      json[r'meta'] = this.meta;
    } else {
      json[r'meta'] = null;
    }
    if (this.value != null) {
      json[r'value'] = this.value;
    } else {
      json[r'value'] = null;
    }
    return json;
  }

  /// Returns a new [JExpEvaluateJiraExpressionResultBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JExpEvaluateJiraExpressionResultBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'value'), 'Required key "JExpEvaluateJiraExpressionResultBean[value]" is missing from JSON.');
        return true;
      }());

      return JExpEvaluateJiraExpressionResultBean(
        meta: JExpEvaluateMetaDataBean.fromJson(json[r'meta']),
        value: mapValueOfType<Object>(json, r'value'),
      );
    }
    return null;
  }

  static List<JExpEvaluateJiraExpressionResultBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JExpEvaluateJiraExpressionResultBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JExpEvaluateJiraExpressionResultBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JExpEvaluateJiraExpressionResultBean> mapFromJson(dynamic json) {
    final map = <String, JExpEvaluateJiraExpressionResultBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JExpEvaluateJiraExpressionResultBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JExpEvaluateJiraExpressionResultBean-objects as value to a dart map
  static Map<String, List<JExpEvaluateJiraExpressionResultBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JExpEvaluateJiraExpressionResultBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JExpEvaluateJiraExpressionResultBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'value',
  };
}

