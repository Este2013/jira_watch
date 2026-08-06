//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JqlQueryClauseTimePredicate {
  /// Returns a new [JqlQueryClauseTimePredicate] instance.
  JqlQueryClauseTimePredicate({
    required this.operand,
    required this.operator_,
  });

  JqlQueryClauseOperand operand;

  /// The operator between the field and the operand.
  JqlQueryClauseTimePredicateOperator_Enum operator_;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JqlQueryClauseTimePredicate &&
    other.operand == operand &&
    other.operator_ == operator_;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (operand.hashCode) +
    (operator_.hashCode);

  @override
  String toString() => 'JqlQueryClauseTimePredicate[operand=$operand, operator_=$operator_]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'operand'] = this.operand;
      json[r'operator'] = this.operator_;
    return json;
  }

  /// Returns a new [JqlQueryClauseTimePredicate] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JqlQueryClauseTimePredicate? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'operand'), 'Required key "JqlQueryClauseTimePredicate[operand]" is missing from JSON.');
        assert(json[r'operand'] != null, 'Required key "JqlQueryClauseTimePredicate[operand]" has a null value in JSON.');
        assert(json.containsKey(r'operator'), 'Required key "JqlQueryClauseTimePredicate[operator]" is missing from JSON.');
        assert(json[r'operator'] != null, 'Required key "JqlQueryClauseTimePredicate[operator]" has a null value in JSON.');
        return true;
      }());

      return JqlQueryClauseTimePredicate(
        operand: JqlQueryClauseOperand.fromJson(json[r'operand'])!,
        operator_: JqlQueryClauseTimePredicateOperator_Enum.fromJson(json[r'operator'])!,
      );
    }
    return null;
  }

  static List<JqlQueryClauseTimePredicate> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JqlQueryClauseTimePredicate>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JqlQueryClauseTimePredicate.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JqlQueryClauseTimePredicate> mapFromJson(dynamic json) {
    final map = <String, JqlQueryClauseTimePredicate>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JqlQueryClauseTimePredicate.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JqlQueryClauseTimePredicate-objects as value to a dart map
  static Map<String, List<JqlQueryClauseTimePredicate>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JqlQueryClauseTimePredicate>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JqlQueryClauseTimePredicate.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'operand',
    'operator',
  };
}

/// The operator between the field and the operand.
enum JqlQueryClauseTimePredicateOperator_Enum {
  before._(r'before'),
  after._(r'after'),
  from._(r'from'),
  to._(r'to'),
  on_._(r'on'),
  during._(r'during'),
  by._(r'by'),
  ;

  /// Instantiate a new enum with the provided value.
  const JqlQueryClauseTimePredicateOperator_Enum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [JqlQueryClauseTimePredicateOperator_Enum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static JqlQueryClauseTimePredicateOperator_Enum? fromJson(dynamic value) => JqlQueryClauseTimePredicateOperator_EnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [JqlQueryClauseTimePredicateOperator_Enum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<JqlQueryClauseTimePredicateOperator_Enum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JqlQueryClauseTimePredicateOperator_Enum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JqlQueryClauseTimePredicateOperator_Enum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [JqlQueryClauseTimePredicateOperator_Enum] to String,
/// and [decode] dynamic data back to [JqlQueryClauseTimePredicateOperator_Enum].
class JqlQueryClauseTimePredicateOperator_EnumTypeTransformer {
  factory JqlQueryClauseTimePredicateOperator_EnumTypeTransformer() => _instance ??= const JqlQueryClauseTimePredicateOperator_EnumTypeTransformer._();

  const JqlQueryClauseTimePredicateOperator_EnumTypeTransformer._();

  String encode(JqlQueryClauseTimePredicateOperator_Enum data) => data._value;

  /// Returns the instance of [JqlQueryClauseTimePredicateOperator_Enum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  JqlQueryClauseTimePredicateOperator_Enum? decode(dynamic data, {bool allowNull = true}) {
    if (data is JqlQueryClauseTimePredicateOperator_Enum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'before': return JqlQueryClauseTimePredicateOperator_Enum.before;
        case r'after': return JqlQueryClauseTimePredicateOperator_Enum.after;
        case r'from': return JqlQueryClauseTimePredicateOperator_Enum.from;
        case r'to': return JqlQueryClauseTimePredicateOperator_Enum.to;
        case r'on': return JqlQueryClauseTimePredicateOperator_Enum.on_;
        case r'during': return JqlQueryClauseTimePredicateOperator_Enum.during;
        case r'by': return JqlQueryClauseTimePredicateOperator_Enum.by;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static JqlQueryClauseTimePredicateOperator_EnumTypeTransformer? _instance;
}


