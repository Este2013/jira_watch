//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JiraExpressionsComplexityBean {
  /// Returns a new [JiraExpressionsComplexityBean] instance.
  JiraExpressionsComplexityBean({
    required this.beans,
    required this.expensiveOperations,
    required this.primitiveValues,
    required this.steps,
  });

  /// The number of Jira REST API beans returned in the response.
  JiraExpressionsComplexityValueBean beans;

  /// The number of expensive operations executed while evaluating the expression. Expensive operations are those that load additional data, such as entity properties, comments, or custom fields.
  JiraExpressionsComplexityValueBean expensiveOperations;

  /// The number of primitive values returned in the response.
  JiraExpressionsComplexityValueBean primitiveValues;

  /// The number of steps it took to evaluate the expression, where a step is a high-level operation performed by the expression. A step is an operation such as arithmetic, accessing a property, accessing a context variable, or calling a function.
  JiraExpressionsComplexityValueBean steps;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JiraExpressionsComplexityBean &&
    other.beans == beans &&
    other.expensiveOperations == expensiveOperations &&
    other.primitiveValues == primitiveValues &&
    other.steps == steps;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (beans.hashCode) +
    (expensiveOperations.hashCode) +
    (primitiveValues.hashCode) +
    (steps.hashCode);

  @override
  String toString() => 'JiraExpressionsComplexityBean[beans=$beans, expensiveOperations=$expensiveOperations, primitiveValues=$primitiveValues, steps=$steps]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'beans'] = this.beans;
      json[r'expensiveOperations'] = this.expensiveOperations;
      json[r'primitiveValues'] = this.primitiveValues;
      json[r'steps'] = this.steps;
    return json;
  }

  /// Returns a new [JiraExpressionsComplexityBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JiraExpressionsComplexityBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'beans'), 'Required key "JiraExpressionsComplexityBean[beans]" is missing from JSON.');
        assert(json[r'beans'] != null, 'Required key "JiraExpressionsComplexityBean[beans]" has a null value in JSON.');
        assert(json.containsKey(r'expensiveOperations'), 'Required key "JiraExpressionsComplexityBean[expensiveOperations]" is missing from JSON.');
        assert(json[r'expensiveOperations'] != null, 'Required key "JiraExpressionsComplexityBean[expensiveOperations]" has a null value in JSON.');
        assert(json.containsKey(r'primitiveValues'), 'Required key "JiraExpressionsComplexityBean[primitiveValues]" is missing from JSON.');
        assert(json[r'primitiveValues'] != null, 'Required key "JiraExpressionsComplexityBean[primitiveValues]" has a null value in JSON.');
        assert(json.containsKey(r'steps'), 'Required key "JiraExpressionsComplexityBean[steps]" is missing from JSON.');
        assert(json[r'steps'] != null, 'Required key "JiraExpressionsComplexityBean[steps]" has a null value in JSON.');
        return true;
      }());

      return JiraExpressionsComplexityBean(
        beans: JiraExpressionsComplexityValueBean.fromJson(json[r'beans'])!,
        expensiveOperations: JiraExpressionsComplexityValueBean.fromJson(json[r'expensiveOperations'])!,
        primitiveValues: JiraExpressionsComplexityValueBean.fromJson(json[r'primitiveValues'])!,
        steps: JiraExpressionsComplexityValueBean.fromJson(json[r'steps'])!,
      );
    }
    return null;
  }

  static List<JiraExpressionsComplexityBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JiraExpressionsComplexityBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JiraExpressionsComplexityBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JiraExpressionsComplexityBean> mapFromJson(dynamic json) {
    final map = <String, JiraExpressionsComplexityBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JiraExpressionsComplexityBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JiraExpressionsComplexityBean-objects as value to a dart map
  static Map<String, List<JiraExpressionsComplexityBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JiraExpressionsComplexityBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JiraExpressionsComplexityBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'beans',
    'expensiveOperations',
    'primitiveValues',
    'steps',
  };
}

