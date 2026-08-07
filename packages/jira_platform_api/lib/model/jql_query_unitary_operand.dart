//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JqlQueryUnitaryOperand {
  /// Returns a new [JqlQueryUnitaryOperand] instance.
  JqlQueryUnitaryOperand({
    this.encodedValue,
    required this.value,
    this.arguments = const [],
    this.encodedOperand,
    required this.function_,
    required this.keyword,
  });

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

  /// Encoded operand, which can be used directly in a JQL query.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? encodedOperand;

  /// The name of the function.
  String function_;

  /// The keyword that is the operand value.
  JqlQueryUnitaryOperandKeywordEnum keyword;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JqlQueryUnitaryOperand &&
    other.encodedValue == encodedValue &&
    other.value == value &&
    _deepEquality.equals(other.arguments, arguments) &&
    other.encodedOperand == encodedOperand &&
    other.function_ == function_ &&
    other.keyword == keyword;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (encodedValue == null ? 0 : encodedValue!.hashCode) +
    (value.hashCode) +
    (arguments.hashCode) +
    (encodedOperand == null ? 0 : encodedOperand!.hashCode) +
    (function_.hashCode) +
    (keyword.hashCode);

  @override
  String toString() => 'JqlQueryUnitaryOperand[encodedValue=$encodedValue, value=$value, arguments=$arguments, encodedOperand=$encodedOperand, function_=$function_, keyword=$keyword]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.encodedValue != null) {
      json[r'encodedValue'] = this.encodedValue;
    } else {
      json[r'encodedValue'] = null;
    }
      json[r'value'] = this.value;
      json[r'arguments'] = this.arguments;
    if (this.encodedOperand != null) {
      json[r'encodedOperand'] = this.encodedOperand;
    } else {
      json[r'encodedOperand'] = null;
    }
      json[r'function'] = this.function_;
      json[r'keyword'] = this.keyword;
    return json;
  }

  /// Returns a new [JqlQueryUnitaryOperand] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JqlQueryUnitaryOperand? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'value'), 'Required key "JqlQueryUnitaryOperand[value]" is missing from JSON.');
        assert(json[r'value'] != null, 'Required key "JqlQueryUnitaryOperand[value]" has a null value in JSON.');
        assert(json.containsKey(r'arguments'), 'Required key "JqlQueryUnitaryOperand[arguments]" is missing from JSON.');
        assert(json[r'arguments'] != null, 'Required key "JqlQueryUnitaryOperand[arguments]" has a null value in JSON.');
        assert(json.containsKey(r'function'), 'Required key "JqlQueryUnitaryOperand[function]" is missing from JSON.');
        assert(json[r'function'] != null, 'Required key "JqlQueryUnitaryOperand[function]" has a null value in JSON.');
        assert(json.containsKey(r'keyword'), 'Required key "JqlQueryUnitaryOperand[keyword]" is missing from JSON.');
        assert(json[r'keyword'] != null, 'Required key "JqlQueryUnitaryOperand[keyword]" has a null value in JSON.');
        return true;
      }());

      return JqlQueryUnitaryOperand(
        encodedValue: mapValueOfType<String>(json, r'encodedValue'),
        value: mapValueOfType<String>(json, r'value')!,
        arguments: json[r'arguments'] is Iterable
            ? (json[r'arguments'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        encodedOperand: mapValueOfType<String>(json, r'encodedOperand'),
        function_: mapValueOfType<String>(json, r'function')!,
        keyword: JqlQueryUnitaryOperandKeywordEnum.fromJson(json[r'keyword'])!,
      );
    }
    return null;
  }

  static List<JqlQueryUnitaryOperand> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JqlQueryUnitaryOperand>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JqlQueryUnitaryOperand.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JqlQueryUnitaryOperand> mapFromJson(dynamic json) {
    final map = <String, JqlQueryUnitaryOperand>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JqlQueryUnitaryOperand.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JqlQueryUnitaryOperand-objects as value to a dart map
  static Map<String, List<JqlQueryUnitaryOperand>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JqlQueryUnitaryOperand>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JqlQueryUnitaryOperand.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'value',
    'arguments',
    'function',
    'keyword',
  };
}

/// The keyword that is the operand value.
enum JqlQueryUnitaryOperandKeywordEnum {
  empty._(r'empty'),
  ;

  /// Instantiate a new enum with the provided value.
  const JqlQueryUnitaryOperandKeywordEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [JqlQueryUnitaryOperandKeywordEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static JqlQueryUnitaryOperandKeywordEnum? fromJson(dynamic value) => JqlQueryUnitaryOperandKeywordEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [JqlQueryUnitaryOperandKeywordEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<JqlQueryUnitaryOperandKeywordEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JqlQueryUnitaryOperandKeywordEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JqlQueryUnitaryOperandKeywordEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [JqlQueryUnitaryOperandKeywordEnum] to String,
/// and [decode] dynamic data back to [JqlQueryUnitaryOperandKeywordEnum].
class JqlQueryUnitaryOperandKeywordEnumTypeTransformer {
  factory JqlQueryUnitaryOperandKeywordEnumTypeTransformer() => _instance ??= const JqlQueryUnitaryOperandKeywordEnumTypeTransformer._();

  const JqlQueryUnitaryOperandKeywordEnumTypeTransformer._();

  String encode(JqlQueryUnitaryOperandKeywordEnum data) => data._value;

  /// Returns the instance of [JqlQueryUnitaryOperandKeywordEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  JqlQueryUnitaryOperandKeywordEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is JqlQueryUnitaryOperandKeywordEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'empty': return JqlQueryUnitaryOperandKeywordEnum.empty;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static JqlQueryUnitaryOperandKeywordEnumTypeTransformer? _instance;
}


