//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FieldWasClause {
  /// Returns a new [FieldWasClause] instance.
  FieldWasClause({
    required this.field,
    required this.operand,
    required this.operator_,
    this.predicates = const [],
  });

  JqlQueryField field;

  JqlQueryClauseOperand operand;

  /// The operator between the field and operand.
  FieldWasClauseOperator_Enum operator_;

  /// The list of time predicates.
  List<JqlQueryClauseTimePredicate> predicates;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FieldWasClause &&
    other.field == field &&
    other.operand == operand &&
    other.operator_ == operator_ &&
    _deepEquality.equals(other.predicates, predicates);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (field.hashCode) +
    (operand.hashCode) +
    (operator_.hashCode) +
    (predicates.hashCode);

  @override
  String toString() => 'FieldWasClause[field=$field, operand=$operand, operator_=$operator_, predicates=$predicates]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'field'] = this.field;
      json[r'operand'] = this.operand;
      json[r'operator'] = this.operator_;
      json[r'predicates'] = this.predicates;
    return json;
  }

  /// Returns a new [FieldWasClause] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FieldWasClause? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'field'), 'Required key "FieldWasClause[field]" is missing from JSON.');
        assert(json[r'field'] != null, 'Required key "FieldWasClause[field]" has a null value in JSON.');
        assert(json.containsKey(r'operand'), 'Required key "FieldWasClause[operand]" is missing from JSON.');
        assert(json[r'operand'] != null, 'Required key "FieldWasClause[operand]" has a null value in JSON.');
        assert(json.containsKey(r'operator'), 'Required key "FieldWasClause[operator]" is missing from JSON.');
        assert(json[r'operator'] != null, 'Required key "FieldWasClause[operator]" has a null value in JSON.');
        assert(json.containsKey(r'predicates'), 'Required key "FieldWasClause[predicates]" is missing from JSON.');
        assert(json[r'predicates'] != null, 'Required key "FieldWasClause[predicates]" has a null value in JSON.');
        return true;
      }());

      return FieldWasClause(
        field: JqlQueryField.fromJson(json[r'field'])!,
        operand: JqlQueryClauseOperand.fromJson(json[r'operand'])!,
        operator_: FieldWasClauseOperator_Enum.fromJson(json[r'operator'])!,
        predicates: JqlQueryClauseTimePredicate.listFromJson(json[r'predicates']),
      );
    }
    return null;
  }

  static List<FieldWasClause> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldWasClause>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldWasClause.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FieldWasClause> mapFromJson(dynamic json) {
    final map = <String, FieldWasClause>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FieldWasClause.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FieldWasClause-objects as value to a dart map
  static Map<String, List<FieldWasClause>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FieldWasClause>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FieldWasClause.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'field',
    'operand',
    'operator',
    'predicates',
  };
}

/// The operator between the field and operand.
enum FieldWasClauseOperator_Enum {
  was._(r'was'),
  wasIn._(r'was in'),
  wasNotIn._(r'was not in'),
  wasNot._(r'was not'),
  ;

  /// Instantiate a new enum with the provided value.
  const FieldWasClauseOperator_Enum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [FieldWasClauseOperator_Enum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static FieldWasClauseOperator_Enum? fromJson(dynamic value) => FieldWasClauseOperator_EnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [FieldWasClauseOperator_Enum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<FieldWasClauseOperator_Enum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldWasClauseOperator_Enum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldWasClauseOperator_Enum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [FieldWasClauseOperator_Enum] to String,
/// and [decode] dynamic data back to [FieldWasClauseOperator_Enum].
class FieldWasClauseOperator_EnumTypeTransformer {
  factory FieldWasClauseOperator_EnumTypeTransformer() => _instance ??= const FieldWasClauseOperator_EnumTypeTransformer._();

  const FieldWasClauseOperator_EnumTypeTransformer._();

  String encode(FieldWasClauseOperator_Enum data) => data._value;

  /// Returns the instance of [FieldWasClauseOperator_Enum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  FieldWasClauseOperator_Enum? decode(dynamic data, {bool allowNull = true}) {
    if (data is FieldWasClauseOperator_Enum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'was': return FieldWasClauseOperator_Enum.was;
        case r'was in': return FieldWasClauseOperator_Enum.wasIn;
        case r'was not in': return FieldWasClauseOperator_Enum.wasNotIn;
        case r'was not': return FieldWasClauseOperator_Enum.wasNot;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static FieldWasClauseOperator_EnumTypeTransformer? _instance;
}


