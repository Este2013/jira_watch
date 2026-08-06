//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AvailableWorkflowSystemRule {
  /// Returns a new [AvailableWorkflowSystemRule] instance.
  AvailableWorkflowSystemRule({
    required this.description,
    this.incompatibleRuleKeys = const [],
    required this.isAvailableForInitialTransition,
    required this.isVisible,
    required this.name,
    required this.ruleKey,
    required this.ruleType,
  });

  /// The rule description.
  String description;

  /// List of rules that conflict with this one.
  List<String> incompatibleRuleKeys;

  /// Whether the rule can be added added to an initial transition.
  bool isAvailableForInitialTransition;

  /// Whether the rule is visible.
  bool isVisible;

  /// The rule name.
  String name;

  /// The rule key.
  String ruleKey;

  /// The rule type.
  AvailableWorkflowSystemRuleRuleTypeEnum ruleType;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AvailableWorkflowSystemRule &&
    other.description == description &&
    _deepEquality.equals(other.incompatibleRuleKeys, incompatibleRuleKeys) &&
    other.isAvailableForInitialTransition == isAvailableForInitialTransition &&
    other.isVisible == isVisible &&
    other.name == name &&
    other.ruleKey == ruleKey &&
    other.ruleType == ruleType;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description.hashCode) +
    (incompatibleRuleKeys.hashCode) +
    (isAvailableForInitialTransition.hashCode) +
    (isVisible.hashCode) +
    (name.hashCode) +
    (ruleKey.hashCode) +
    (ruleType.hashCode);

  @override
  String toString() => 'AvailableWorkflowSystemRule[description=$description, incompatibleRuleKeys=$incompatibleRuleKeys, isAvailableForInitialTransition=$isAvailableForInitialTransition, isVisible=$isVisible, name=$name, ruleKey=$ruleKey, ruleType=$ruleType]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'description'] = this.description;
      json[r'incompatibleRuleKeys'] = this.incompatibleRuleKeys;
      json[r'isAvailableForInitialTransition'] = this.isAvailableForInitialTransition;
      json[r'isVisible'] = this.isVisible;
      json[r'name'] = this.name;
      json[r'ruleKey'] = this.ruleKey;
      json[r'ruleType'] = this.ruleType;
    return json;
  }

  /// Returns a new [AvailableWorkflowSystemRule] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AvailableWorkflowSystemRule? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'description'), 'Required key "AvailableWorkflowSystemRule[description]" is missing from JSON.');
        assert(json[r'description'] != null, 'Required key "AvailableWorkflowSystemRule[description]" has a null value in JSON.');
        assert(json.containsKey(r'incompatibleRuleKeys'), 'Required key "AvailableWorkflowSystemRule[incompatibleRuleKeys]" is missing from JSON.');
        assert(json[r'incompatibleRuleKeys'] != null, 'Required key "AvailableWorkflowSystemRule[incompatibleRuleKeys]" has a null value in JSON.');
        assert(json.containsKey(r'isAvailableForInitialTransition'), 'Required key "AvailableWorkflowSystemRule[isAvailableForInitialTransition]" is missing from JSON.');
        assert(json[r'isAvailableForInitialTransition'] != null, 'Required key "AvailableWorkflowSystemRule[isAvailableForInitialTransition]" has a null value in JSON.');
        assert(json.containsKey(r'isVisible'), 'Required key "AvailableWorkflowSystemRule[isVisible]" is missing from JSON.');
        assert(json[r'isVisible'] != null, 'Required key "AvailableWorkflowSystemRule[isVisible]" has a null value in JSON.');
        assert(json.containsKey(r'name'), 'Required key "AvailableWorkflowSystemRule[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "AvailableWorkflowSystemRule[name]" has a null value in JSON.');
        assert(json.containsKey(r'ruleKey'), 'Required key "AvailableWorkflowSystemRule[ruleKey]" is missing from JSON.');
        assert(json[r'ruleKey'] != null, 'Required key "AvailableWorkflowSystemRule[ruleKey]" has a null value in JSON.');
        assert(json.containsKey(r'ruleType'), 'Required key "AvailableWorkflowSystemRule[ruleType]" is missing from JSON.');
        assert(json[r'ruleType'] != null, 'Required key "AvailableWorkflowSystemRule[ruleType]" has a null value in JSON.');
        return true;
      }());

      return AvailableWorkflowSystemRule(
        description: mapValueOfType<String>(json, r'description')!,
        incompatibleRuleKeys: json[r'incompatibleRuleKeys'] is Iterable
            ? (json[r'incompatibleRuleKeys'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        isAvailableForInitialTransition: mapValueOfType<bool>(json, r'isAvailableForInitialTransition')!,
        isVisible: mapValueOfType<bool>(json, r'isVisible')!,
        name: mapValueOfType<String>(json, r'name')!,
        ruleKey: mapValueOfType<String>(json, r'ruleKey')!,
        ruleType: AvailableWorkflowSystemRuleRuleTypeEnum.fromJson(json[r'ruleType'])!,
      );
    }
    return null;
  }

  static List<AvailableWorkflowSystemRule> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AvailableWorkflowSystemRule>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AvailableWorkflowSystemRule.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AvailableWorkflowSystemRule> mapFromJson(dynamic json) {
    final map = <String, AvailableWorkflowSystemRule>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AvailableWorkflowSystemRule.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AvailableWorkflowSystemRule-objects as value to a dart map
  static Map<String, List<AvailableWorkflowSystemRule>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AvailableWorkflowSystemRule>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AvailableWorkflowSystemRule.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'description',
    'incompatibleRuleKeys',
    'isAvailableForInitialTransition',
    'isVisible',
    'name',
    'ruleKey',
    'ruleType',
  };
}

/// The rule type.
enum AvailableWorkflowSystemRuleRuleTypeEnum {
  condition._(r'Condition'),
  validator._(r'Validator'),
  function_._(r'Function'),
  screen._(r'Screen'),
  ;

  /// Instantiate a new enum with the provided value.
  const AvailableWorkflowSystemRuleRuleTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [AvailableWorkflowSystemRuleRuleTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static AvailableWorkflowSystemRuleRuleTypeEnum? fromJson(dynamic value) => AvailableWorkflowSystemRuleRuleTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [AvailableWorkflowSystemRuleRuleTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<AvailableWorkflowSystemRuleRuleTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AvailableWorkflowSystemRuleRuleTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AvailableWorkflowSystemRuleRuleTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [AvailableWorkflowSystemRuleRuleTypeEnum] to String,
/// and [decode] dynamic data back to [AvailableWorkflowSystemRuleRuleTypeEnum].
class AvailableWorkflowSystemRuleRuleTypeEnumTypeTransformer {
  factory AvailableWorkflowSystemRuleRuleTypeEnumTypeTransformer() => _instance ??= const AvailableWorkflowSystemRuleRuleTypeEnumTypeTransformer._();

  const AvailableWorkflowSystemRuleRuleTypeEnumTypeTransformer._();

  String encode(AvailableWorkflowSystemRuleRuleTypeEnum data) => data._value;

  /// Returns the instance of [AvailableWorkflowSystemRuleRuleTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  AvailableWorkflowSystemRuleRuleTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is AvailableWorkflowSystemRuleRuleTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'Condition': return AvailableWorkflowSystemRuleRuleTypeEnum.condition;
        case r'Validator': return AvailableWorkflowSystemRuleRuleTypeEnum.validator;
        case r'Function': return AvailableWorkflowSystemRuleRuleTypeEnum.function_;
        case r'Screen': return AvailableWorkflowSystemRuleRuleTypeEnum.screen;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static AvailableWorkflowSystemRuleRuleTypeEnumTypeTransformer? _instance;
}


