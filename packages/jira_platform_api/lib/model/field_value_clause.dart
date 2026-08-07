//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FieldValueClause {
  /// Returns a new [FieldValueClause] instance.
  FieldValueClause({
    required this.field,
    required this.operand,
    required this.operator_,
  });

  JqlQueryField field;

  JqlQueryClauseOperand operand;

  /// The operator between the field and operand.
  FieldValueClauseOperator_Enum operator_;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FieldValueClause &&
    other.field == field &&
    other.operand == operand &&
    other.operator_ == operator_;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (field.hashCode) +
    (operand.hashCode) +
    (operator_.hashCode);

  @override
  String toString() => 'FieldValueClause[field=$field, operand=$operand, operator_=$operator_]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'field'] = this.field;
      json[r'operand'] = this.operand;
      json[r'operator'] = this.operator_;
    return json;
  }

  /// Returns a new [FieldValueClause] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FieldValueClause? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'field'), 'Required key "FieldValueClause[field]" is missing from JSON.');
        assert(json[r'field'] != null, 'Required key "FieldValueClause[field]" has a null value in JSON.');
        assert(json.containsKey(r'operand'), 'Required key "FieldValueClause[operand]" is missing from JSON.');
        assert(json[r'operand'] != null, 'Required key "FieldValueClause[operand]" has a null value in JSON.');
        assert(json.containsKey(r'operator'), 'Required key "FieldValueClause[operator]" is missing from JSON.');
        assert(json[r'operator'] != null, 'Required key "FieldValueClause[operator]" has a null value in JSON.');
        return true;
      }());

      return FieldValueClause(
        field: JqlQueryField.fromJson(json[r'field'])!,
        operand: JqlQueryClauseOperand.fromJson(json[r'operand'])!,
        operator_: FieldValueClauseOperator_Enum.fromJson(json[r'operator'])!,
      );
    }
    return null;
  }

  static List<FieldValueClause> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldValueClause>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldValueClause.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FieldValueClause> mapFromJson(dynamic json) {
    final map = <String, FieldValueClause>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FieldValueClause.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FieldValueClause-objects as value to a dart map
  static Map<String, List<FieldValueClause>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FieldValueClause>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FieldValueClause.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'field',
    'operand',
    'operator',
  };
}

/// The operator between the field and operand.
enum FieldValueClauseOperator_Enum {
  equal._(r'='),
  exclamationEqual._(r'!='),
  greaterThan._(r'>'),
  lessThan._(r'<'),
  greaterThanEqual._(r'>='),
  lessThanEqual._(r'<='),
  in_._(r'in'),
  notIn._(r'not in'),
  tilde._(r'~'),
  tildeEqual._(r'~='),
  is_._(r'is'),
  isNot._(r'is not'),
  ;

  /// Instantiate a new enum with the provided value.
  const FieldValueClauseOperator_Enum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [FieldValueClauseOperator_Enum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static FieldValueClauseOperator_Enum? fromJson(dynamic value) => FieldValueClauseOperator_EnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [FieldValueClauseOperator_Enum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<FieldValueClauseOperator_Enum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldValueClauseOperator_Enum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldValueClauseOperator_Enum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [FieldValueClauseOperator_Enum] to String,
/// and [decode] dynamic data back to [FieldValueClauseOperator_Enum].
class FieldValueClauseOperator_EnumTypeTransformer {
  factory FieldValueClauseOperator_EnumTypeTransformer() => _instance ??= const FieldValueClauseOperator_EnumTypeTransformer._();

  const FieldValueClauseOperator_EnumTypeTransformer._();

  String encode(FieldValueClauseOperator_Enum data) => data._value;

  /// Returns the instance of [FieldValueClauseOperator_Enum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  FieldValueClauseOperator_Enum? decode(dynamic data, {bool allowNull = true}) {
    if (data is FieldValueClauseOperator_Enum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'=': return FieldValueClauseOperator_Enum.equal;
        case r'!=': return FieldValueClauseOperator_Enum.exclamationEqual;
        case r'>': return FieldValueClauseOperator_Enum.greaterThan;
        case r'<': return FieldValueClauseOperator_Enum.lessThan;
        case r'>=': return FieldValueClauseOperator_Enum.greaterThanEqual;
        case r'<=': return FieldValueClauseOperator_Enum.lessThanEqual;
        case r'in': return FieldValueClauseOperator_Enum.in_;
        case r'not in': return FieldValueClauseOperator_Enum.notIn;
        case r'~': return FieldValueClauseOperator_Enum.tilde;
        case r'~=': return FieldValueClauseOperator_Enum.tildeEqual;
        case r'is': return FieldValueClauseOperator_Enum.is_;
        case r'is not': return FieldValueClauseOperator_Enum.isNot;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static FieldValueClauseOperator_EnumTypeTransformer? _instance;
}


