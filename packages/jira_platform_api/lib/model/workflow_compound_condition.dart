//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowCompoundCondition {
  /// Returns a new [WorkflowCompoundCondition] instance.
  WorkflowCompoundCondition({
    this.conditions = const [],
    required this.nodeType,
    required this.operator_,
  });

  /// The list of workflow conditions.
  List<WorkflowCondition> conditions;

  String nodeType;

  /// The compound condition operator.
  WorkflowCompoundConditionOperator_Enum operator_;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowCompoundCondition &&
    _deepEquality.equals(other.conditions, conditions) &&
    other.nodeType == nodeType &&
    other.operator_ == operator_;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (conditions.hashCode) +
    (nodeType.hashCode) +
    (operator_.hashCode);

  @override
  String toString() => 'WorkflowCompoundCondition[conditions=$conditions, nodeType=$nodeType, operator_=$operator_]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'conditions'] = this.conditions;
      json[r'nodeType'] = this.nodeType;
      json[r'operator'] = this.operator_;
    return json;
  }

  /// Returns a new [WorkflowCompoundCondition] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowCompoundCondition? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'conditions'), 'Required key "WorkflowCompoundCondition[conditions]" is missing from JSON.');
        assert(json[r'conditions'] != null, 'Required key "WorkflowCompoundCondition[conditions]" has a null value in JSON.');
        assert(json.containsKey(r'nodeType'), 'Required key "WorkflowCompoundCondition[nodeType]" is missing from JSON.');
        assert(json[r'nodeType'] != null, 'Required key "WorkflowCompoundCondition[nodeType]" has a null value in JSON.');
        assert(json.containsKey(r'operator'), 'Required key "WorkflowCompoundCondition[operator]" is missing from JSON.');
        assert(json[r'operator'] != null, 'Required key "WorkflowCompoundCondition[operator]" has a null value in JSON.');
        return true;
      }());

      return WorkflowCompoundCondition(
        conditions: WorkflowCondition.listFromJson(json[r'conditions']),
        nodeType: mapValueOfType<String>(json, r'nodeType')!,
        operator_: WorkflowCompoundConditionOperator_Enum.fromJson(json[r'operator'])!,
      );
    }
    return null;
  }

  static List<WorkflowCompoundCondition> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowCompoundCondition>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowCompoundCondition.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowCompoundCondition> mapFromJson(dynamic json) {
    final map = <String, WorkflowCompoundCondition>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowCompoundCondition.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowCompoundCondition-objects as value to a dart map
  static Map<String, List<WorkflowCompoundCondition>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowCompoundCondition>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowCompoundCondition.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'conditions',
    'nodeType',
    'operator',
  };
}

/// The compound condition operator.
enum WorkflowCompoundConditionOperator_Enum {
  AND._(r'AND'),
  OR._(r'OR'),
  ;

  /// Instantiate a new enum with the provided value.
  const WorkflowCompoundConditionOperator_Enum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [WorkflowCompoundConditionOperator_Enum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static WorkflowCompoundConditionOperator_Enum? fromJson(dynamic value) => WorkflowCompoundConditionOperator_EnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [WorkflowCompoundConditionOperator_Enum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<WorkflowCompoundConditionOperator_Enum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowCompoundConditionOperator_Enum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowCompoundConditionOperator_Enum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [WorkflowCompoundConditionOperator_Enum] to String,
/// and [decode] dynamic data back to [WorkflowCompoundConditionOperator_Enum].
class WorkflowCompoundConditionOperator_EnumTypeTransformer {
  factory WorkflowCompoundConditionOperator_EnumTypeTransformer() => _instance ??= const WorkflowCompoundConditionOperator_EnumTypeTransformer._();

  const WorkflowCompoundConditionOperator_EnumTypeTransformer._();

  String encode(WorkflowCompoundConditionOperator_Enum data) => data._value;

  /// Returns the instance of [WorkflowCompoundConditionOperator_Enum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  WorkflowCompoundConditionOperator_Enum? decode(dynamic data, {bool allowNull = true}) {
    if (data is WorkflowCompoundConditionOperator_Enum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'AND': return WorkflowCompoundConditionOperator_Enum.AND;
        case r'OR': return WorkflowCompoundConditionOperator_Enum.OR;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static WorkflowCompoundConditionOperator_EnumTypeTransformer? _instance;
}


