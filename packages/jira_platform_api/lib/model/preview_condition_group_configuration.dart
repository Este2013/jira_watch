//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PreviewConditionGroupConfiguration {
  /// Returns a new [PreviewConditionGroupConfiguration] instance.
  PreviewConditionGroupConfiguration({
    this.conditionGroups = const [],
    this.conditions = const [],
    this.operation,
  });

  /// The nested conditions of the condition group.
  List<PreviewConditionGroupConfiguration> conditionGroups;

  /// The rules for this condition.
  List<PreviewRuleConfiguration> conditions;

  /// Determines how the conditions in the group are evaluated. Accepts either `ANY` or `ALL`. If `ANY` is used, at least one condition in the group must be true for the group to evaluate to true. If `ALL` is used, all conditions in the group must be true for the group to evaluate to true.
  PreviewConditionGroupConfigurationOperationEnum? operation;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PreviewConditionGroupConfiguration &&
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
  String toString() => 'PreviewConditionGroupConfiguration[conditionGroups=$conditionGroups, conditions=$conditions, operation=$operation]';

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

  /// Returns a new [PreviewConditionGroupConfiguration] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PreviewConditionGroupConfiguration? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return PreviewConditionGroupConfiguration(
        conditionGroups: PreviewConditionGroupConfiguration.listFromJson(json[r'conditionGroups']),
        conditions: PreviewRuleConfiguration.listFromJson(json[r'conditions']),
        operation: PreviewConditionGroupConfigurationOperationEnum.fromJson(json[r'operation']),
      );
    }
    return null;
  }

  static List<PreviewConditionGroupConfiguration> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PreviewConditionGroupConfiguration>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PreviewConditionGroupConfiguration.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PreviewConditionGroupConfiguration> mapFromJson(dynamic json) {
    final map = <String, PreviewConditionGroupConfiguration>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PreviewConditionGroupConfiguration.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PreviewConditionGroupConfiguration-objects as value to a dart map
  static Map<String, List<PreviewConditionGroupConfiguration>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PreviewConditionGroupConfiguration>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PreviewConditionGroupConfiguration.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// Determines how the conditions in the group are evaluated. Accepts either `ANY` or `ALL`. If `ANY` is used, at least one condition in the group must be true for the group to evaluate to true. If `ALL` is used, all conditions in the group must be true for the group to evaluate to true.
enum PreviewConditionGroupConfigurationOperationEnum {
  ANY._(r'ANY'),
  ALL._(r'ALL'),
  ;

  /// Instantiate a new enum with the provided value.
  const PreviewConditionGroupConfigurationOperationEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [PreviewConditionGroupConfigurationOperationEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static PreviewConditionGroupConfigurationOperationEnum? fromJson(dynamic value) => PreviewConditionGroupConfigurationOperationEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [PreviewConditionGroupConfigurationOperationEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<PreviewConditionGroupConfigurationOperationEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PreviewConditionGroupConfigurationOperationEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PreviewConditionGroupConfigurationOperationEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PreviewConditionGroupConfigurationOperationEnum] to String,
/// and [decode] dynamic data back to [PreviewConditionGroupConfigurationOperationEnum].
class PreviewConditionGroupConfigurationOperationEnumTypeTransformer {
  factory PreviewConditionGroupConfigurationOperationEnumTypeTransformer() => _instance ??= const PreviewConditionGroupConfigurationOperationEnumTypeTransformer._();

  const PreviewConditionGroupConfigurationOperationEnumTypeTransformer._();

  String encode(PreviewConditionGroupConfigurationOperationEnum data) => data._value;

  /// Returns the instance of [PreviewConditionGroupConfigurationOperationEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PreviewConditionGroupConfigurationOperationEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is PreviewConditionGroupConfigurationOperationEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'ANY': return PreviewConditionGroupConfigurationOperationEnum.ANY;
        case r'ALL': return PreviewConditionGroupConfigurationOperationEnum.ALL;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static PreviewConditionGroupConfigurationOperationEnumTypeTransformer? _instance;
}


