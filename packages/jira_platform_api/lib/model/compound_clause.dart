//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CompoundClause {
  /// Returns a new [CompoundClause] instance.
  CompoundClause({
    this.clauses = const [],
    required this.operator_,
  });

  /// The list of nested clauses.
  List<JqlQueryClause> clauses;

  /// The operator between the clauses.
  CompoundClauseOperator_Enum operator_;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CompoundClause &&
    _deepEquality.equals(other.clauses, clauses) &&
    other.operator_ == operator_;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (clauses.hashCode) +
    (operator_.hashCode);

  @override
  String toString() => 'CompoundClause[clauses=$clauses, operator_=$operator_]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'clauses'] = this.clauses;
      json[r'operator'] = this.operator_;
    return json;
  }

  /// Returns a new [CompoundClause] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CompoundClause? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'clauses'), 'Required key "CompoundClause[clauses]" is missing from JSON.');
        assert(json[r'clauses'] != null, 'Required key "CompoundClause[clauses]" has a null value in JSON.');
        assert(json.containsKey(r'operator'), 'Required key "CompoundClause[operator]" is missing from JSON.');
        assert(json[r'operator'] != null, 'Required key "CompoundClause[operator]" has a null value in JSON.');
        return true;
      }());

      return CompoundClause(
        clauses: JqlQueryClause.listFromJson(json[r'clauses']),
        operator_: CompoundClauseOperator_Enum.fromJson(json[r'operator'])!,
      );
    }
    return null;
  }

  static List<CompoundClause> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CompoundClause>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CompoundClause.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CompoundClause> mapFromJson(dynamic json) {
    final map = <String, CompoundClause>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CompoundClause.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CompoundClause-objects as value to a dart map
  static Map<String, List<CompoundClause>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CompoundClause>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CompoundClause.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'clauses',
    'operator',
  };
}

/// The operator between the clauses.
enum CompoundClauseOperator_Enum {
  and._(r'and'),
  or._(r'or'),
  not._(r'not'),
  ;

  /// Instantiate a new enum with the provided value.
  const CompoundClauseOperator_Enum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [CompoundClauseOperator_Enum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static CompoundClauseOperator_Enum? fromJson(dynamic value) => CompoundClauseOperator_EnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [CompoundClauseOperator_Enum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<CompoundClauseOperator_Enum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CompoundClauseOperator_Enum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CompoundClauseOperator_Enum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CompoundClauseOperator_Enum] to String,
/// and [decode] dynamic data back to [CompoundClauseOperator_Enum].
class CompoundClauseOperator_EnumTypeTransformer {
  factory CompoundClauseOperator_EnumTypeTransformer() => _instance ??= const CompoundClauseOperator_EnumTypeTransformer._();

  const CompoundClauseOperator_EnumTypeTransformer._();

  String encode(CompoundClauseOperator_Enum data) => data._value;

  /// Returns the instance of [CompoundClauseOperator_Enum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CompoundClauseOperator_Enum? decode(dynamic data, {bool allowNull = true}) {
    if (data is CompoundClauseOperator_Enum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'and': return CompoundClauseOperator_Enum.and;
        case r'or': return CompoundClauseOperator_Enum.or;
        case r'not': return CompoundClauseOperator_Enum.not;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static CompoundClauseOperator_EnumTypeTransformer? _instance;
}


