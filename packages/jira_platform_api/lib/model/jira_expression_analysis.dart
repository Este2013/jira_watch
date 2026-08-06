//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JiraExpressionAnalysis {
  /// Returns a new [JiraExpressionAnalysis] instance.
  JiraExpressionAnalysis({
    this.complexity,
    this.errors = const [],
    required this.expression,
    this.type,
    required this.valid,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  JiraExpressionComplexity? complexity;

  /// A list of validation errors. Not included if the expression is valid.
  List<JiraExpressionValidationError> errors;

  /// The analysed expression.
  String expression;

  /// EXPERIMENTAL. The inferred type of the expression.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? type;

  /// Whether the expression is valid and the interpreter will evaluate it. Note that the expression may fail at runtime (for example, if it executes too many expensive operations).
  bool valid;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JiraExpressionAnalysis &&
    other.complexity == complexity &&
    _deepEquality.equals(other.errors, errors) &&
    other.expression == expression &&
    other.type == type &&
    other.valid == valid;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (complexity == null ? 0 : complexity!.hashCode) +
    (errors.hashCode) +
    (expression.hashCode) +
    (type == null ? 0 : type!.hashCode) +
    (valid.hashCode);

  @override
  String toString() => 'JiraExpressionAnalysis[complexity=$complexity, errors=$errors, expression=$expression, type=$type, valid=$valid]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.complexity != null) {
      json[r'complexity'] = this.complexity;
    } else {
      json[r'complexity'] = null;
    }
      json[r'errors'] = this.errors;
      json[r'expression'] = this.expression;
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
      json[r'valid'] = this.valid;
    return json;
  }

  /// Returns a new [JiraExpressionAnalysis] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JiraExpressionAnalysis? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'expression'), 'Required key "JiraExpressionAnalysis[expression]" is missing from JSON.');
        assert(json[r'expression'] != null, 'Required key "JiraExpressionAnalysis[expression]" has a null value in JSON.');
        assert(json.containsKey(r'valid'), 'Required key "JiraExpressionAnalysis[valid]" is missing from JSON.');
        assert(json[r'valid'] != null, 'Required key "JiraExpressionAnalysis[valid]" has a null value in JSON.');
        return true;
      }());

      return JiraExpressionAnalysis(
        complexity: JiraExpressionComplexity.fromJson(json[r'complexity']),
        errors: JiraExpressionValidationError.listFromJson(json[r'errors']),
        expression: mapValueOfType<String>(json, r'expression')!,
        type: mapValueOfType<String>(json, r'type'),
        valid: mapValueOfType<bool>(json, r'valid')!,
      );
    }
    return null;
  }

  static List<JiraExpressionAnalysis> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JiraExpressionAnalysis>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JiraExpressionAnalysis.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JiraExpressionAnalysis> mapFromJson(dynamic json) {
    final map = <String, JiraExpressionAnalysis>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JiraExpressionAnalysis.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JiraExpressionAnalysis-objects as value to a dart map
  static Map<String, List<JiraExpressionAnalysis>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JiraExpressionAnalysis>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JiraExpressionAnalysis.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'expression',
    'valid',
  };
}

