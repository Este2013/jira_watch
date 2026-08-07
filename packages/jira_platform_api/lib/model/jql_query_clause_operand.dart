//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JqlQueryClauseOperand {
  /// Returns a new [JqlQueryClauseOperand] instance.
  JqlQueryClauseOperand({
    this.encodedOperand,
    this.values = const [],
    this.encodedValue,
    required this.value,
    this.arguments = const [],
    required this.function_,
    required this.keyword,
  });

  /// Encoded operand, which can be used directly in a JQL query.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? encodedOperand;

  /// The list of operand values.
  List<JqlQueryUnitaryOperand> values;

  /// Encoded value, which can be used directly in a JQL query.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? encodedValue;

  /// The operand value.
  String value;

  /// The list of function arguments.
  List<String> arguments;

  /// The name of the function.
  String function_;

  /// The keyword that is the operand value.
  JqlQueryClauseOperandKeywordEnum keyword;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JqlQueryClauseOperand &&
    other.encodedOperand == encodedOperand &&
    _deepEquality.equals(other.values, values) &&
    other.encodedValue == encodedValue &&
    other.value == value &&
    _deepEquality.equals(other.arguments, arguments) &&
    other.function_ == function_ &&
    other.keyword == keyword;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (encodedOperand == null ? 0 : encodedOperand!.hashCode) +
    (values.hashCode) +
    (encodedValue == null ? 0 : encodedValue!.hashCode) +
    (value.hashCode) +
    (arguments.hashCode) +
    (function_.hashCode) +
    (keyword.hashCode);

  @override
  String toString() => 'JqlQueryClauseOperand[encodedOperand=$encodedOperand, values=$values, encodedValue=$encodedValue, value=$value, arguments=$arguments, function_=$function_, keyword=$keyword]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.encodedOperand != null) {
      json[r'encodedOperand'] = this.encodedOperand;
    } else {
      json[r'encodedOperand'] = null;
    }
      json[r'values'] = this.values;
    if (this.encodedValue != null) {
      json[r'encodedValue'] = this.encodedValue;
    } else {
      json[r'encodedValue'] = null;
    }
      json[r'value'] = this.value;
      json[r'arguments'] = this.arguments;
      json[r'function'] = this.function_;
      json[r'keyword'] = this.keyword;
    return json;
  }

  /// Returns a new [JqlQueryClauseOperand] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JqlQueryClauseOperand? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'values'), 'Required key "JqlQueryClauseOperand[values]" is missing from JSON.');
        assert(json[r'values'] != null, 'Required key "JqlQueryClauseOperand[values]" has a null value in JSON.');
        assert(json.containsKey(r'value'), 'Required key "JqlQueryClauseOperand[value]" is missing from JSON.');
        assert(json[r'value'] != null, 'Required key "JqlQueryClauseOperand[value]" has a null value in JSON.');
        assert(json.containsKey(r'arguments'), 'Required key "JqlQueryClauseOperand[arguments]" is missing from JSON.');
        assert(json[r'arguments'] != null, 'Required key "JqlQueryClauseOperand[arguments]" has a null value in JSON.');
        assert(json.containsKey(r'function'), 'Required key "JqlQueryClauseOperand[function]" is missing from JSON.');
        assert(json[r'function'] != null, 'Required key "JqlQueryClauseOperand[function]" has a null value in JSON.');
        assert(json.containsKey(r'keyword'), 'Required key "JqlQueryClauseOperand[keyword]" is missing from JSON.');
        assert(json[r'keyword'] != null, 'Required key "JqlQueryClauseOperand[keyword]" has a null value in JSON.');
        return true;
      }());

      return JqlQueryClauseOperand(
        encodedOperand: mapValueOfType<String>(json, r'encodedOperand'),
        values: JqlQueryUnitaryOperand.listFromJson(json[r'values']),
        encodedValue: mapValueOfType<String>(json, r'encodedValue'),
        value: mapValueOfType<String>(json, r'value')!,
        arguments: json[r'arguments'] is Iterable
            ? (json[r'arguments'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        function_: mapValueOfType<String>(json, r'function')!,
        keyword: JqlQueryClauseOperandKeywordEnum.fromJson(json[r'keyword'])!,
      );
    }
    return null;
  }

  static List<JqlQueryClauseOperand> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JqlQueryClauseOperand>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JqlQueryClauseOperand.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JqlQueryClauseOperand> mapFromJson(dynamic json) {
    final map = <String, JqlQueryClauseOperand>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JqlQueryClauseOperand.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JqlQueryClauseOperand-objects as value to a dart map
  static Map<String, List<JqlQueryClauseOperand>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JqlQueryClauseOperand>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JqlQueryClauseOperand.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'values',
    'value',
    'arguments',
    'function',
    'keyword',
  };
}

/// The keyword that is the operand value.
enum JqlQueryClauseOperandKeywordEnum {
  empty._(r'empty'),
  ;

  /// Instantiate a new enum with the provided value.
  const JqlQueryClauseOperandKeywordEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [JqlQueryClauseOperandKeywordEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static JqlQueryClauseOperandKeywordEnum? fromJson(dynamic value) => JqlQueryClauseOperandKeywordEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [JqlQueryClauseOperandKeywordEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<JqlQueryClauseOperandKeywordEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JqlQueryClauseOperandKeywordEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JqlQueryClauseOperandKeywordEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [JqlQueryClauseOperandKeywordEnum] to String,
/// and [decode] dynamic data back to [JqlQueryClauseOperandKeywordEnum].
class JqlQueryClauseOperandKeywordEnumTypeTransformer {
  factory JqlQueryClauseOperandKeywordEnumTypeTransformer() => _instance ??= const JqlQueryClauseOperandKeywordEnumTypeTransformer._();

  const JqlQueryClauseOperandKeywordEnumTypeTransformer._();

  String encode(JqlQueryClauseOperandKeywordEnum data) => data._value;

  /// Returns the instance of [JqlQueryClauseOperandKeywordEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  JqlQueryClauseOperandKeywordEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is JqlQueryClauseOperandKeywordEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'empty': return JqlQueryClauseOperandKeywordEnum.empty;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static JqlQueryClauseOperandKeywordEnumTypeTransformer? _instance;
}


