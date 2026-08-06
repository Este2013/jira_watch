//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JiraExpressionForAnalysis {
  /// Returns a new [JiraExpressionForAnalysis] instance.
  JiraExpressionForAnalysis({
    this.contextVariables = const {},
    this.expressions = const [],
  });

  /// Context variables and their types. The type checker assumes that [common context variables](https://developer.atlassian.com/cloud/jira/platform/jira-expressions/#context-variables), such as `issue` or `project`, are available in context and sets their type. Use this property to override the default types or provide details of new variables.
  Map<String, String> contextVariables;

  /// The list of Jira expressions to analyse.
  List<String> expressions;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JiraExpressionForAnalysis &&
    _deepEquality.equals(other.contextVariables, contextVariables) &&
    _deepEquality.equals(other.expressions, expressions);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (contextVariables.hashCode) +
    (expressions.hashCode);

  @override
  String toString() => 'JiraExpressionForAnalysis[contextVariables=$contextVariables, expressions=$expressions]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'contextVariables'] = this.contextVariables;
      json[r'expressions'] = this.expressions;
    return json;
  }

  /// Returns a new [JiraExpressionForAnalysis] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JiraExpressionForAnalysis? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'expressions'), 'Required key "JiraExpressionForAnalysis[expressions]" is missing from JSON.');
        assert(json[r'expressions'] != null, 'Required key "JiraExpressionForAnalysis[expressions]" has a null value in JSON.');
        return true;
      }());

      return JiraExpressionForAnalysis(
        contextVariables: mapCastOfType<String, String>(json, r'contextVariables') ?? const {},
        expressions: json[r'expressions'] is Iterable
            ? (json[r'expressions'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<JiraExpressionForAnalysis> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JiraExpressionForAnalysis>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JiraExpressionForAnalysis.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JiraExpressionForAnalysis> mapFromJson(dynamic json) {
    final map = <String, JiraExpressionForAnalysis>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JiraExpressionForAnalysis.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JiraExpressionForAnalysis-objects as value to a dart map
  static Map<String, List<JiraExpressionForAnalysis>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JiraExpressionForAnalysis>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JiraExpressionForAnalysis.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'expressions',
  };
}

