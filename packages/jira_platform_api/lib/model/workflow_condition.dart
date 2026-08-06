//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowCondition {
  /// Returns a new [WorkflowCondition] instance.
  WorkflowCondition({
    this.configuration,
    required this.nodeType,
    required this.type,
    this.conditions = const [],
    required this.operator_,
  });

  /// EXPERIMENTAL. The configuration of the transition rule.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? configuration;

  String nodeType;

  /// The type of the transition rule.
  String type;

  /// The list of workflow conditions.
  List<WorkflowCondition> conditions;

  /// The compound condition operator.
  WorkflowConditionOperator_Enum operator_;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowCondition &&
    other.configuration == configuration &&
    other.nodeType == nodeType &&
    other.type == type &&
    _deepEquality.equals(other.conditions, conditions) &&
    other.operator_ == operator_;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (configuration == null ? 0 : configuration!.hashCode) +
    (nodeType.hashCode) +
    (type.hashCode) +
    (conditions.hashCode) +
    (operator_.hashCode);

  @override
  String toString() => 'WorkflowCondition[configuration=$configuration, nodeType=$nodeType, type=$type, conditions=$conditions, operator_=$operator_]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.configuration != null) {
      json[r'configuration'] = this.configuration;
    } else {
      json[r'configuration'] = null;
    }
      json[r'nodeType'] = this.nodeType;
      json[r'type'] = this.type;
      json[r'conditions'] = this.conditions;
      json[r'operator'] = this.operator_;
    return json;
  }

  /// Returns a new [WorkflowCondition] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowCondition? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'nodeType'), 'Required key "WorkflowCondition[nodeType]" is missing from JSON.');
        assert(json[r'nodeType'] != null, 'Required key "WorkflowCondition[nodeType]" has a null value in JSON.');
        assert(json.containsKey(r'type'), 'Required key "WorkflowCondition[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "WorkflowCondition[type]" has a null value in JSON.');
        assert(json.containsKey(r'conditions'), 'Required key "WorkflowCondition[conditions]" is missing from JSON.');
        assert(json[r'conditions'] != null, 'Required key "WorkflowCondition[conditions]" has a null value in JSON.');
        assert(json.containsKey(r'operator'), 'Required key "WorkflowCondition[operator]" is missing from JSON.');
        assert(json[r'operator'] != null, 'Required key "WorkflowCondition[operator]" has a null value in JSON.');
        return true;
      }());

      return WorkflowCondition(
        configuration: mapValueOfType<Object>(json, r'configuration'),
        nodeType: mapValueOfType<String>(json, r'nodeType')!,
        type: mapValueOfType<String>(json, r'type')!,
        conditions: WorkflowCondition.listFromJson(json[r'conditions']),
        operator_: WorkflowConditionOperator_Enum.fromJson(json[r'operator'])!,
      );
    }
    return null;
  }

  static List<WorkflowCondition> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowCondition>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowCondition.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowCondition> mapFromJson(dynamic json) {
    final map = <String, WorkflowCondition>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowCondition.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowCondition-objects as value to a dart map
  static Map<String, List<WorkflowCondition>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowCondition>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowCondition.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'nodeType',
    'type',
    'conditions',
    'operator',
  };
}

/// The compound condition operator.
enum WorkflowConditionOperator_Enum {
  AND._(r'AND'),
  OR._(r'OR'),
  ;

  /// Instantiate a new enum with the provided value.
  const WorkflowConditionOperator_Enum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [WorkflowConditionOperator_Enum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static WorkflowConditionOperator_Enum? fromJson(dynamic value) => WorkflowConditionOperator_EnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [WorkflowConditionOperator_Enum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<WorkflowConditionOperator_Enum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowConditionOperator_Enum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowConditionOperator_Enum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [WorkflowConditionOperator_Enum] to String,
/// and [decode] dynamic data back to [WorkflowConditionOperator_Enum].
class WorkflowConditionOperator_EnumTypeTransformer {
  factory WorkflowConditionOperator_EnumTypeTransformer() => _instance ??= const WorkflowConditionOperator_EnumTypeTransformer._();

  const WorkflowConditionOperator_EnumTypeTransformer._();

  String encode(WorkflowConditionOperator_Enum data) => data._value;

  /// Returns the instance of [WorkflowConditionOperator_Enum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  WorkflowConditionOperator_Enum? decode(dynamic data, {bool allowNull = true}) {
    if (data is WorkflowConditionOperator_Enum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'AND': return WorkflowConditionOperator_Enum.AND;
        case r'OR': return WorkflowConditionOperator_Enum.OR;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static WorkflowConditionOperator_EnumTypeTransformer? _instance;
}


