//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JiraExpressionComplexity {
  /// Returns a new [JiraExpressionComplexity] instance.
  JiraExpressionComplexity({
    required this.expensiveOperations,
    this.variables = const {},
  });

  /// Information that can be used to determine how many [expensive operations](https://developer.atlassian.com/cloud/jira/platform/jira-expressions/#expensive-operations) the evaluation of the expression will perform. This information may be a formula or number. For example:   *  `issues.map(i => i.comments)` performs as many expensive operations as there are issues on the issues list. So this parameter returns `N`, where `N` is the size of issue list.  *  `new Issue(10010).comments` gets comments for one issue, so its complexity is `2` (`1` to retrieve issue 10010 from the database plus `1` to get its comments).
  String expensiveOperations;

  /// Variables used in the formula, mapped to the parts of the expression they refer to.
  Map<String, String> variables;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JiraExpressionComplexity &&
    other.expensiveOperations == expensiveOperations &&
    _deepEquality.equals(other.variables, variables);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (expensiveOperations.hashCode) +
    (variables.hashCode);

  @override
  String toString() => 'JiraExpressionComplexity[expensiveOperations=$expensiveOperations, variables=$variables]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'expensiveOperations'] = this.expensiveOperations;
      json[r'variables'] = this.variables;
    return json;
  }

  /// Returns a new [JiraExpressionComplexity] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JiraExpressionComplexity? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'expensiveOperations'), 'Required key "JiraExpressionComplexity[expensiveOperations]" is missing from JSON.');
        assert(json[r'expensiveOperations'] != null, 'Required key "JiraExpressionComplexity[expensiveOperations]" has a null value in JSON.');
        return true;
      }());

      return JiraExpressionComplexity(
        expensiveOperations: mapValueOfType<String>(json, r'expensiveOperations')!,
        variables: mapCastOfType<String, String>(json, r'variables') ?? const {},
      );
    }
    return null;
  }

  static List<JiraExpressionComplexity> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JiraExpressionComplexity>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JiraExpressionComplexity.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JiraExpressionComplexity> mapFromJson(dynamic json) {
    final map = <String, JiraExpressionComplexity>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JiraExpressionComplexity.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JiraExpressionComplexity-objects as value to a dart map
  static Map<String, List<JiraExpressionComplexity>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JiraExpressionComplexity>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JiraExpressionComplexity.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'expensiveOperations',
  };
}

