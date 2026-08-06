//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FieldChangedClause {
  /// Returns a new [FieldChangedClause] instance.
  FieldChangedClause({
    required this.field,
    required this.operator_,
    this.predicates = const [],
  });

  JqlQueryField field;

  /// The operator applied to the field.
  FieldChangedClauseOperator_Enum operator_;

  /// The list of time predicates.
  List<JqlQueryClauseTimePredicate> predicates;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FieldChangedClause &&
    other.field == field &&
    other.operator_ == operator_ &&
    _deepEquality.equals(other.predicates, predicates);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (field.hashCode) +
    (operator_.hashCode) +
    (predicates.hashCode);

  @override
  String toString() => 'FieldChangedClause[field=$field, operator_=$operator_, predicates=$predicates]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'field'] = this.field;
      json[r'operator'] = this.operator_;
      json[r'predicates'] = this.predicates;
    return json;
  }

  /// Returns a new [FieldChangedClause] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FieldChangedClause? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'field'), 'Required key "FieldChangedClause[field]" is missing from JSON.');
        assert(json[r'field'] != null, 'Required key "FieldChangedClause[field]" has a null value in JSON.');
        assert(json.containsKey(r'operator'), 'Required key "FieldChangedClause[operator]" is missing from JSON.');
        assert(json[r'operator'] != null, 'Required key "FieldChangedClause[operator]" has a null value in JSON.');
        assert(json.containsKey(r'predicates'), 'Required key "FieldChangedClause[predicates]" is missing from JSON.');
        assert(json[r'predicates'] != null, 'Required key "FieldChangedClause[predicates]" has a null value in JSON.');
        return true;
      }());

      return FieldChangedClause(
        field: JqlQueryField.fromJson(json[r'field'])!,
        operator_: FieldChangedClauseOperator_Enum.fromJson(json[r'operator'])!,
        predicates: JqlQueryClauseTimePredicate.listFromJson(json[r'predicates']),
      );
    }
    return null;
  }

  static List<FieldChangedClause> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldChangedClause>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldChangedClause.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FieldChangedClause> mapFromJson(dynamic json) {
    final map = <String, FieldChangedClause>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FieldChangedClause.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FieldChangedClause-objects as value to a dart map
  static Map<String, List<FieldChangedClause>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FieldChangedClause>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FieldChangedClause.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'field',
    'operator',
    'predicates',
  };
}

/// The operator applied to the field.
enum FieldChangedClauseOperator_Enum {
  changed._(r'changed'),
  ;

  /// Instantiate a new enum with the provided value.
  const FieldChangedClauseOperator_Enum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [FieldChangedClauseOperator_Enum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static FieldChangedClauseOperator_Enum? fromJson(dynamic value) => FieldChangedClauseOperator_EnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [FieldChangedClauseOperator_Enum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<FieldChangedClauseOperator_Enum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldChangedClauseOperator_Enum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldChangedClauseOperator_Enum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [FieldChangedClauseOperator_Enum] to String,
/// and [decode] dynamic data back to [FieldChangedClauseOperator_Enum].
class FieldChangedClauseOperator_EnumTypeTransformer {
  factory FieldChangedClauseOperator_EnumTypeTransformer() => _instance ??= const FieldChangedClauseOperator_EnumTypeTransformer._();

  const FieldChangedClauseOperator_EnumTypeTransformer._();

  String encode(FieldChangedClauseOperator_Enum data) => data._value;

  /// Returns the instance of [FieldChangedClauseOperator_Enum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  FieldChangedClauseOperator_Enum? decode(dynamic data, {bool allowNull = true}) {
    if (data is FieldChangedClauseOperator_Enum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'changed': return FieldChangedClauseOperator_Enum.changed;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static FieldChangedClauseOperator_EnumTypeTransformer? _instance;
}


