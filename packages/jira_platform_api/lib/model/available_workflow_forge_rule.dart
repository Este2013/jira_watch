//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AvailableWorkflowForgeRule {
  /// Returns a new [AvailableWorkflowForgeRule] instance.
  AvailableWorkflowForgeRule({
    this.description,
    this.id,
    this.name,
    this.ruleKey,
    this.ruleType,
  });

  /// The rule description.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The unique ARI of the forge rule type.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// The rule name.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The rule key.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? ruleKey;

  /// The rule type.
  AvailableWorkflowForgeRuleRuleTypeEnum? ruleType;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AvailableWorkflowForgeRule &&
    other.description == description &&
    other.id == id &&
    other.name == name &&
    other.ruleKey == ruleKey &&
    other.ruleType == ruleType;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (ruleKey == null ? 0 : ruleKey!.hashCode) +
    (ruleType == null ? 0 : ruleType!.hashCode);

  @override
  String toString() => 'AvailableWorkflowForgeRule[description=$description, id=$id, name=$name, ruleKey=$ruleKey, ruleType=$ruleType]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.ruleKey != null) {
      json[r'ruleKey'] = this.ruleKey;
    } else {
      json[r'ruleKey'] = null;
    }
    if (this.ruleType != null) {
      json[r'ruleType'] = this.ruleType;
    } else {
      json[r'ruleType'] = null;
    }
    return json;
  }

  /// Returns a new [AvailableWorkflowForgeRule] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AvailableWorkflowForgeRule? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return AvailableWorkflowForgeRule(
        description: mapValueOfType<String>(json, r'description'),
        id: mapValueOfType<String>(json, r'id'),
        name: mapValueOfType<String>(json, r'name'),
        ruleKey: mapValueOfType<String>(json, r'ruleKey'),
        ruleType: AvailableWorkflowForgeRuleRuleTypeEnum.fromJson(json[r'ruleType']),
      );
    }
    return null;
  }

  static List<AvailableWorkflowForgeRule> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AvailableWorkflowForgeRule>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AvailableWorkflowForgeRule.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AvailableWorkflowForgeRule> mapFromJson(dynamic json) {
    final map = <String, AvailableWorkflowForgeRule>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AvailableWorkflowForgeRule.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AvailableWorkflowForgeRule-objects as value to a dart map
  static Map<String, List<AvailableWorkflowForgeRule>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AvailableWorkflowForgeRule>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AvailableWorkflowForgeRule.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The rule type.
enum AvailableWorkflowForgeRuleRuleTypeEnum {
  condition._(r'Condition'),
  validator._(r'Validator'),
  function_._(r'Function'),
  screen._(r'Screen'),
  ;

  /// Instantiate a new enum with the provided value.
  const AvailableWorkflowForgeRuleRuleTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [AvailableWorkflowForgeRuleRuleTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static AvailableWorkflowForgeRuleRuleTypeEnum? fromJson(dynamic value) => AvailableWorkflowForgeRuleRuleTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [AvailableWorkflowForgeRuleRuleTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<AvailableWorkflowForgeRuleRuleTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AvailableWorkflowForgeRuleRuleTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AvailableWorkflowForgeRuleRuleTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [AvailableWorkflowForgeRuleRuleTypeEnum] to String,
/// and [decode] dynamic data back to [AvailableWorkflowForgeRuleRuleTypeEnum].
class AvailableWorkflowForgeRuleRuleTypeEnumTypeTransformer {
  factory AvailableWorkflowForgeRuleRuleTypeEnumTypeTransformer() => _instance ??= const AvailableWorkflowForgeRuleRuleTypeEnumTypeTransformer._();

  const AvailableWorkflowForgeRuleRuleTypeEnumTypeTransformer._();

  String encode(AvailableWorkflowForgeRuleRuleTypeEnum data) => data._value;

  /// Returns the instance of [AvailableWorkflowForgeRuleRuleTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  AvailableWorkflowForgeRuleRuleTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is AvailableWorkflowForgeRuleRuleTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'Condition': return AvailableWorkflowForgeRuleRuleTypeEnum.condition;
        case r'Validator': return AvailableWorkflowForgeRuleRuleTypeEnum.validator;
        case r'Function': return AvailableWorkflowForgeRuleRuleTypeEnum.function_;
        case r'Screen': return AvailableWorkflowForgeRuleRuleTypeEnum.screen;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static AvailableWorkflowForgeRuleRuleTypeEnumTypeTransformer? _instance;
}


