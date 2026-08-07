//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JiraExpressionValidationError {
  /// Returns a new [JiraExpressionValidationError] instance.
  JiraExpressionValidationError({
    this.column,
    this.expression,
    this.line,
    required this.message,
    required this.type,
  });

  /// The text column in which the error occurred.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? column;

  /// The part of the expression in which the error occurred.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? expression;

  /// The text line in which the error occurred.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? line;

  /// Details about the error.
  String message;

  /// The error type.
  JiraExpressionValidationErrorTypeEnum type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JiraExpressionValidationError &&
    other.column == column &&
    other.expression == expression &&
    other.line == line &&
    other.message == message &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (column == null ? 0 : column!.hashCode) +
    (expression == null ? 0 : expression!.hashCode) +
    (line == null ? 0 : line!.hashCode) +
    (message.hashCode) +
    (type.hashCode);

  @override
  String toString() => 'JiraExpressionValidationError[column=$column, expression=$expression, line=$line, message=$message, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.column != null) {
      json[r'column'] = this.column;
    } else {
      json[r'column'] = null;
    }
    if (this.expression != null) {
      json[r'expression'] = this.expression;
    } else {
      json[r'expression'] = null;
    }
    if (this.line != null) {
      json[r'line'] = this.line;
    } else {
      json[r'line'] = null;
    }
      json[r'message'] = this.message;
      json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [JiraExpressionValidationError] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JiraExpressionValidationError? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'message'), 'Required key "JiraExpressionValidationError[message]" is missing from JSON.');
        assert(json[r'message'] != null, 'Required key "JiraExpressionValidationError[message]" has a null value in JSON.');
        assert(json.containsKey(r'type'), 'Required key "JiraExpressionValidationError[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "JiraExpressionValidationError[type]" has a null value in JSON.');
        return true;
      }());

      return JiraExpressionValidationError(
        column: mapValueOfType<int>(json, r'column'),
        expression: mapValueOfType<String>(json, r'expression'),
        line: mapValueOfType<int>(json, r'line'),
        message: mapValueOfType<String>(json, r'message')!,
        type: JiraExpressionValidationErrorTypeEnum.fromJson(json[r'type'])!,
      );
    }
    return null;
  }

  static List<JiraExpressionValidationError> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JiraExpressionValidationError>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JiraExpressionValidationError.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JiraExpressionValidationError> mapFromJson(dynamic json) {
    final map = <String, JiraExpressionValidationError>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JiraExpressionValidationError.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JiraExpressionValidationError-objects as value to a dart map
  static Map<String, List<JiraExpressionValidationError>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JiraExpressionValidationError>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JiraExpressionValidationError.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'message',
    'type',
  };
}

/// The error type.
enum JiraExpressionValidationErrorTypeEnum {
  syntax._(r'syntax'),
  type._(r'type'),
  other._(r'other'),
  ;

  /// Instantiate a new enum with the provided value.
  const JiraExpressionValidationErrorTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [JiraExpressionValidationErrorTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static JiraExpressionValidationErrorTypeEnum? fromJson(dynamic value) => JiraExpressionValidationErrorTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [JiraExpressionValidationErrorTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<JiraExpressionValidationErrorTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JiraExpressionValidationErrorTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JiraExpressionValidationErrorTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [JiraExpressionValidationErrorTypeEnum] to String,
/// and [decode] dynamic data back to [JiraExpressionValidationErrorTypeEnum].
class JiraExpressionValidationErrorTypeEnumTypeTransformer {
  factory JiraExpressionValidationErrorTypeEnumTypeTransformer() => _instance ??= const JiraExpressionValidationErrorTypeEnumTypeTransformer._();

  const JiraExpressionValidationErrorTypeEnumTypeTransformer._();

  String encode(JiraExpressionValidationErrorTypeEnum data) => data._value;

  /// Returns the instance of [JiraExpressionValidationErrorTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  JiraExpressionValidationErrorTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is JiraExpressionValidationErrorTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'syntax': return JiraExpressionValidationErrorTypeEnum.syntax;
        case r'type': return JiraExpressionValidationErrorTypeEnum.type;
        case r'other': return JiraExpressionValidationErrorTypeEnum.other;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static JiraExpressionValidationErrorTypeEnumTypeTransformer? _instance;
}


