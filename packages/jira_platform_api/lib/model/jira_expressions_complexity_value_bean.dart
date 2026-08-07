//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JiraExpressionsComplexityValueBean {
  /// Returns a new [JiraExpressionsComplexityValueBean] instance.
  JiraExpressionsComplexityValueBean({
    required this.limit,
    required this.value,
  });

  /// The maximum allowed complexity. The evaluation will fail if this value is exceeded.
  int limit;

  /// The complexity value of the current expression.
  int value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JiraExpressionsComplexityValueBean &&
    other.limit == limit &&
    other.value == value;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (limit.hashCode) +
    (value.hashCode);

  @override
  String toString() => 'JiraExpressionsComplexityValueBean[limit=$limit, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'limit'] = this.limit;
      json[r'value'] = this.value;
    return json;
  }

  /// Returns a new [JiraExpressionsComplexityValueBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JiraExpressionsComplexityValueBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'limit'), 'Required key "JiraExpressionsComplexityValueBean[limit]" is missing from JSON.');
        assert(json[r'limit'] != null, 'Required key "JiraExpressionsComplexityValueBean[limit]" has a null value in JSON.');
        assert(json.containsKey(r'value'), 'Required key "JiraExpressionsComplexityValueBean[value]" is missing from JSON.');
        assert(json[r'value'] != null, 'Required key "JiraExpressionsComplexityValueBean[value]" has a null value in JSON.');
        return true;
      }());

      return JiraExpressionsComplexityValueBean(
        limit: mapValueOfType<int>(json, r'limit')!,
        value: mapValueOfType<int>(json, r'value')!,
      );
    }
    return null;
  }

  static List<JiraExpressionsComplexityValueBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JiraExpressionsComplexityValueBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JiraExpressionsComplexityValueBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JiraExpressionsComplexityValueBean> mapFromJson(dynamic json) {
    final map = <String, JiraExpressionsComplexityValueBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JiraExpressionsComplexityValueBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JiraExpressionsComplexityValueBean-objects as value to a dart map
  static Map<String, List<JiraExpressionsComplexityValueBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JiraExpressionsComplexityValueBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JiraExpressionsComplexityValueBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'limit',
    'value',
  };
}

