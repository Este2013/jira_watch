//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ConditionGroupPayload {
  /// Returns a new [ConditionGroupPayload] instance.
  ConditionGroupPayload({
    this.conditionGroup = const [],
    this.conditions = const [],
    this.operation,
  });

  /// The nested conditions of the condition group.
  List<ConditionGroupPayload> conditionGroup;

  /// The rules for this condition.
  List<RulePayload> conditions;

  /// Determines how the conditions in the group are evaluated. Accepts either `ANY` or `ALL`. If `ANY` is used, at least one condition in the group must be true for the group to evaluate to true. If `ALL` is used, all conditions in the group must be true for the group to evaluate to true.
  ConditionGroupPayloadOperationEnum? operation;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ConditionGroupPayload &&
    _deepEquality.equals(other.conditionGroup, conditionGroup) &&
    _deepEquality.equals(other.conditions, conditions) &&
    other.operation == operation;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (conditionGroup.hashCode) +
    (conditions.hashCode) +
    (operation == null ? 0 : operation!.hashCode);

  @override
  String toString() => 'ConditionGroupPayload[conditionGroup=$conditionGroup, conditions=$conditions, operation=$operation]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'conditionGroup'] = this.conditionGroup;
      json[r'conditions'] = this.conditions;
    if (this.operation != null) {
      json[r'operation'] = this.operation;
    } else {
      json[r'operation'] = null;
    }
    return json;
  }

  /// Returns a new [ConditionGroupPayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ConditionGroupPayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ConditionGroupPayload(
        conditionGroup: ConditionGroupPayload.listFromJson(json[r'conditionGroup']),
        conditions: RulePayload.listFromJson(json[r'conditions']),
        operation: ConditionGroupPayloadOperationEnum.fromJson(json[r'operation']),
      );
    }
    return null;
  }

  static List<ConditionGroupPayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ConditionGroupPayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ConditionGroupPayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ConditionGroupPayload> mapFromJson(dynamic json) {
    final map = <String, ConditionGroupPayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ConditionGroupPayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ConditionGroupPayload-objects as value to a dart map
  static Map<String, List<ConditionGroupPayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ConditionGroupPayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ConditionGroupPayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// Determines how the conditions in the group are evaluated. Accepts either `ANY` or `ALL`. If `ANY` is used, at least one condition in the group must be true for the group to evaluate to true. If `ALL` is used, all conditions in the group must be true for the group to evaluate to true.
enum ConditionGroupPayloadOperationEnum {
  ANY._(r'ANY'),
  ALL._(r'ALL'),
  ;

  /// Instantiate a new enum with the provided value.
  const ConditionGroupPayloadOperationEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ConditionGroupPayloadOperationEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ConditionGroupPayloadOperationEnum? fromJson(dynamic value) => ConditionGroupPayloadOperationEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ConditionGroupPayloadOperationEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ConditionGroupPayloadOperationEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ConditionGroupPayloadOperationEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ConditionGroupPayloadOperationEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ConditionGroupPayloadOperationEnum] to String,
/// and [decode] dynamic data back to [ConditionGroupPayloadOperationEnum].
class ConditionGroupPayloadOperationEnumTypeTransformer {
  factory ConditionGroupPayloadOperationEnumTypeTransformer() => _instance ??= const ConditionGroupPayloadOperationEnumTypeTransformer._();

  const ConditionGroupPayloadOperationEnumTypeTransformer._();

  String encode(ConditionGroupPayloadOperationEnum data) => data._value;

  /// Returns the instance of [ConditionGroupPayloadOperationEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ConditionGroupPayloadOperationEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is ConditionGroupPayloadOperationEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'ANY': return ConditionGroupPayloadOperationEnum.ANY;
        case r'ALL': return ConditionGroupPayloadOperationEnum.ALL;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ConditionGroupPayloadOperationEnumTypeTransformer? _instance;
}


