//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JqlQueryClause {
  /// Returns a new [JqlQueryClause] instance.
  JqlQueryClause({
    this.clauses = const [],
    required this.operator_,
    required this.field,
    required this.operand,
    this.predicates = const [],
  });

  /// The list of nested clauses.
  List<JqlQueryClause> clauses;

  /// The operator applied to the field.
  JqlQueryClauseOperator_Enum operator_;

  JqlQueryField field;

  JqlQueryClauseOperand operand;

  /// The list of time predicates.
  List<JqlQueryClauseTimePredicate> predicates;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JqlQueryClause &&
    _deepEquality.equals(other.clauses, clauses) &&
    other.operator_ == operator_ &&
    other.field == field &&
    other.operand == operand &&
    _deepEquality.equals(other.predicates, predicates);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (clauses.hashCode) +
    (operator_.hashCode) +
    (field.hashCode) +
    (operand.hashCode) +
    (predicates.hashCode);

  @override
  String toString() => 'JqlQueryClause[clauses=$clauses, operator_=$operator_, field=$field, operand=$operand, predicates=$predicates]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'clauses'] = this.clauses;
      json[r'operator'] = this.operator_;
      json[r'field'] = this.field;
      json[r'operand'] = this.operand;
      json[r'predicates'] = this.predicates;
    return json;
  }

  /// Returns a new [JqlQueryClause] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JqlQueryClause? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'clauses'), 'Required key "JqlQueryClause[clauses]" is missing from JSON.');
        assert(json[r'clauses'] != null, 'Required key "JqlQueryClause[clauses]" has a null value in JSON.');
        assert(json.containsKey(r'operator'), 'Required key "JqlQueryClause[operator]" is missing from JSON.');
        assert(json[r'operator'] != null, 'Required key "JqlQueryClause[operator]" has a null value in JSON.');
        assert(json.containsKey(r'field'), 'Required key "JqlQueryClause[field]" is missing from JSON.');
        assert(json[r'field'] != null, 'Required key "JqlQueryClause[field]" has a null value in JSON.');
        assert(json.containsKey(r'operand'), 'Required key "JqlQueryClause[operand]" is missing from JSON.');
        assert(json[r'operand'] != null, 'Required key "JqlQueryClause[operand]" has a null value in JSON.');
        assert(json.containsKey(r'predicates'), 'Required key "JqlQueryClause[predicates]" is missing from JSON.');
        assert(json[r'predicates'] != null, 'Required key "JqlQueryClause[predicates]" has a null value in JSON.');
        return true;
      }());

      return JqlQueryClause(
        clauses: JqlQueryClause.listFromJson(json[r'clauses']),
        operator_: JqlQueryClauseOperator_Enum.fromJson(json[r'operator'])!,
        field: JqlQueryField.fromJson(json[r'field'])!,
        operand: JqlQueryClauseOperand.fromJson(json[r'operand'])!,
        predicates: JqlQueryClauseTimePredicate.listFromJson(json[r'predicates']),
      );
    }
    return null;
  }

  static List<JqlQueryClause> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JqlQueryClause>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JqlQueryClause.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JqlQueryClause> mapFromJson(dynamic json) {
    final map = <String, JqlQueryClause>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JqlQueryClause.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JqlQueryClause-objects as value to a dart map
  static Map<String, List<JqlQueryClause>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JqlQueryClause>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JqlQueryClause.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'clauses',
    'operator',
    'field',
    'operand',
    'predicates',
  };
}

/// The operator applied to the field.
enum JqlQueryClauseOperator_Enum {
  changed._(r'changed'),
  ;

  /// Instantiate a new enum with the provided value.
  const JqlQueryClauseOperator_Enum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [JqlQueryClauseOperator_Enum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static JqlQueryClauseOperator_Enum? fromJson(dynamic value) => JqlQueryClauseOperator_EnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [JqlQueryClauseOperator_Enum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<JqlQueryClauseOperator_Enum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JqlQueryClauseOperator_Enum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JqlQueryClauseOperator_Enum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [JqlQueryClauseOperator_Enum] to String,
/// and [decode] dynamic data back to [JqlQueryClauseOperator_Enum].
class JqlQueryClauseOperator_EnumTypeTransformer {
  factory JqlQueryClauseOperator_EnumTypeTransformer() => _instance ??= const JqlQueryClauseOperator_EnumTypeTransformer._();

  const JqlQueryClauseOperator_EnumTypeTransformer._();

  String encode(JqlQueryClauseOperator_Enum data) => data._value;

  /// Returns the instance of [JqlQueryClauseOperator_Enum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  JqlQueryClauseOperator_Enum? decode(dynamic data, {bool allowNull = true}) {
    if (data is JqlQueryClauseOperator_Enum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'changed': return JqlQueryClauseOperator_Enum.changed;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static JqlQueryClauseOperator_EnumTypeTransformer? _instance;
}


