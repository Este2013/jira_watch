//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JiraExpressionEvaluateRequestBean {
  /// Returns a new [JiraExpressionEvaluateRequestBean] instance.
  JiraExpressionEvaluateRequestBean({
    this.context,
    required this.expression,
  });

  /// The context in which the Jira expression is evaluated.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  JiraExpressionEvaluateContextBean? context;

  /// The Jira expression to evaluate.
  String expression;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JiraExpressionEvaluateRequestBean &&
    other.context == context &&
    other.expression == expression;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (context == null ? 0 : context!.hashCode) +
    (expression.hashCode);

  @override
  String toString() => 'JiraExpressionEvaluateRequestBean[context=$context, expression=$expression]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.context != null) {
      json[r'context'] = this.context;
    } else {
      json[r'context'] = null;
    }
      json[r'expression'] = this.expression;
    return json;
  }

  /// Returns a new [JiraExpressionEvaluateRequestBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JiraExpressionEvaluateRequestBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'expression'), 'Required key "JiraExpressionEvaluateRequestBean[expression]" is missing from JSON.');
        assert(json[r'expression'] != null, 'Required key "JiraExpressionEvaluateRequestBean[expression]" has a null value in JSON.');
        return true;
      }());

      return JiraExpressionEvaluateRequestBean(
        context: JiraExpressionEvaluateContextBean.fromJson(json[r'context']),
        expression: mapValueOfType<String>(json, r'expression')!,
      );
    }
    return null;
  }

  static List<JiraExpressionEvaluateRequestBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JiraExpressionEvaluateRequestBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JiraExpressionEvaluateRequestBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JiraExpressionEvaluateRequestBean> mapFromJson(dynamic json) {
    final map = <String, JiraExpressionEvaluateRequestBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JiraExpressionEvaluateRequestBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JiraExpressionEvaluateRequestBean-objects as value to a dart map
  static Map<String, List<JiraExpressionEvaluateRequestBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JiraExpressionEvaluateRequestBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JiraExpressionEvaluateRequestBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'expression',
  };
}

