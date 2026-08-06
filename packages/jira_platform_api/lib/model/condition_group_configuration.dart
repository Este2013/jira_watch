//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ConditionGroupConfiguration {
  /// Returns a new [ConditionGroupConfiguration] instance.
  ConditionGroupConfiguration({
    this.conditionGroups = const [],
    this.conditions = const [],
    this.operation,
  });

  /// The nested conditions of the condition group.
  List<ConditionGroupConfiguration> conditionGroups;

  /// The rules for this condition.
  List<WorkflowRuleConfiguration> conditions;

  /// Determines how the conditions in the group are evaluated. Accepts either `ANY` or `ALL`. If `ANY` is used, at least one condition in the group must be true for the group to evaluate to true. If `ALL` is used, all conditions in the group must be true for the group to evaluate to true.
  ConditionGroupConfigurationOperationEnum? operation;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ConditionGroupConfiguration &&
    _deepEquality.equals(other.conditionGroups, conditionGroups) &&
    _deepEquality.equals(other.conditions, conditions) &&
    other.operation == operation;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (conditionGroups.hashCode) +
    (conditions.hashCode) +
    (operation == null ? 0 : operation!.hashCode);

  @override
  String toString() => 'ConditionGroupConfiguration[conditionGroups=$conditionGroups, conditions=$conditions, operation=$operation]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'conditionGroups'] = this.conditionGroups;
      json[r'conditions'] = this.conditions;
    if (this.operation != null) {
      json[r'operation'] = this.operation;
    } else {
      json[r'operation'] = null;
    }
    return json;
  }

  /// Returns a new [ConditionGroupConfiguration] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ConditionGroupConfiguration? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ConditionGroupConfiguration(
        conditionGroups: ConditionGroupConfiguration.listFromJson(json[r'conditionGroups']),
        conditions: WorkflowRuleConfiguration.listFromJson(json[r'conditions']),
        operation: ConditionGroupConfigurationOperationEnum.fromJson(json[r'operation']),
      );
    }
    return null;
  }

  static List<ConditionGroupConfiguration> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ConditionGroupConfiguration>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ConditionGroupConfiguration.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ConditionGroupConfiguration> mapFromJson(dynamic json) {
    final map = <String, ConditionGroupConfiguration>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ConditionGroupConfiguration.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ConditionGroupConfiguration-objects as value to a dart map
  static Map<String, List<ConditionGroupConfiguration>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ConditionGroupConfiguration>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ConditionGroupConfiguration.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// Determines how the conditions in the group are evaluated. Accepts either `ANY` or `ALL`. If `ANY` is used, at least one condition in the group must be true for the group to evaluate to true. If `ALL` is used, all conditions in the group must be true for the group to evaluate to true.
enum ConditionGroupConfigurationOperationEnum {
  ANY._(r'ANY'),
  ALL._(r'ALL'),
  ;

  /// Instantiate a new enum with the provided value.
  const ConditionGroupConfigurationOperationEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ConditionGroupConfigurationOperationEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ConditionGroupConfigurationOperationEnum? fromJson(dynamic value) => ConditionGroupConfigurationOperationEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ConditionGroupConfigurationOperationEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ConditionGroupConfigurationOperationEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ConditionGroupConfigurationOperationEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ConditionGroupConfigurationOperationEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ConditionGroupConfigurationOperationEnum] to String,
/// and [decode] dynamic data back to [ConditionGroupConfigurationOperationEnum].
class ConditionGroupConfigurationOperationEnumTypeTransformer {
  factory ConditionGroupConfigurationOperationEnumTypeTransformer() => _instance ??= const ConditionGroupConfigurationOperationEnumTypeTransformer._();

  const ConditionGroupConfigurationOperationEnumTypeTransformer._();

  String encode(ConditionGroupConfigurationOperationEnum data) => data._value;

  /// Returns the instance of [ConditionGroupConfigurationOperationEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ConditionGroupConfigurationOperationEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is ConditionGroupConfigurationOperationEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'ANY': return ConditionGroupConfigurationOperationEnum.ANY;
        case r'ALL': return ConditionGroupConfigurationOperationEnum.ALL;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ConditionGroupConfigurationOperationEnumTypeTransformer? _instance;
}


