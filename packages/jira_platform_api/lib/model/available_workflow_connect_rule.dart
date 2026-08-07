//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AvailableWorkflowConnectRule {
  /// Returns a new [AvailableWorkflowConnectRule] instance.
  AvailableWorkflowConnectRule({
    this.addonKey,
    this.createUrl,
    this.description,
    this.editUrl,
    this.moduleKey,
    this.name,
    this.ruleKey,
    this.ruleType,
    this.viewUrl,
  });

  /// The add-on providing the rule.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? addonKey;

  /// The URL creation path segment defined in the Connect module.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? createUrl;

  /// The rule description.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The URL edit path segment defined in the Connect module.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? editUrl;

  /// The module providing the rule.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? moduleKey;

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
  AvailableWorkflowConnectRuleRuleTypeEnum? ruleType;

  /// The URL view path segment defined in the Connect module.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? viewUrl;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AvailableWorkflowConnectRule &&
    other.addonKey == addonKey &&
    other.createUrl == createUrl &&
    other.description == description &&
    other.editUrl == editUrl &&
    other.moduleKey == moduleKey &&
    other.name == name &&
    other.ruleKey == ruleKey &&
    other.ruleType == ruleType &&
    other.viewUrl == viewUrl;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (addonKey == null ? 0 : addonKey!.hashCode) +
    (createUrl == null ? 0 : createUrl!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (editUrl == null ? 0 : editUrl!.hashCode) +
    (moduleKey == null ? 0 : moduleKey!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (ruleKey == null ? 0 : ruleKey!.hashCode) +
    (ruleType == null ? 0 : ruleType!.hashCode) +
    (viewUrl == null ? 0 : viewUrl!.hashCode);

  @override
  String toString() => 'AvailableWorkflowConnectRule[addonKey=$addonKey, createUrl=$createUrl, description=$description, editUrl=$editUrl, moduleKey=$moduleKey, name=$name, ruleKey=$ruleKey, ruleType=$ruleType, viewUrl=$viewUrl]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.addonKey != null) {
      json[r'addonKey'] = this.addonKey;
    } else {
      json[r'addonKey'] = null;
    }
    if (this.createUrl != null) {
      json[r'createUrl'] = this.createUrl;
    } else {
      json[r'createUrl'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.editUrl != null) {
      json[r'editUrl'] = this.editUrl;
    } else {
      json[r'editUrl'] = null;
    }
    if (this.moduleKey != null) {
      json[r'moduleKey'] = this.moduleKey;
    } else {
      json[r'moduleKey'] = null;
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
    if (this.viewUrl != null) {
      json[r'viewUrl'] = this.viewUrl;
    } else {
      json[r'viewUrl'] = null;
    }
    return json;
  }

  /// Returns a new [AvailableWorkflowConnectRule] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AvailableWorkflowConnectRule? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return AvailableWorkflowConnectRule(
        addonKey: mapValueOfType<String>(json, r'addonKey'),
        createUrl: mapValueOfType<String>(json, r'createUrl'),
        description: mapValueOfType<String>(json, r'description'),
        editUrl: mapValueOfType<String>(json, r'editUrl'),
        moduleKey: mapValueOfType<String>(json, r'moduleKey'),
        name: mapValueOfType<String>(json, r'name'),
        ruleKey: mapValueOfType<String>(json, r'ruleKey'),
        ruleType: AvailableWorkflowConnectRuleRuleTypeEnum.fromJson(json[r'ruleType']),
        viewUrl: mapValueOfType<String>(json, r'viewUrl'),
      );
    }
    return null;
  }

  static List<AvailableWorkflowConnectRule> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AvailableWorkflowConnectRule>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AvailableWorkflowConnectRule.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AvailableWorkflowConnectRule> mapFromJson(dynamic json) {
    final map = <String, AvailableWorkflowConnectRule>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AvailableWorkflowConnectRule.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AvailableWorkflowConnectRule-objects as value to a dart map
  static Map<String, List<AvailableWorkflowConnectRule>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AvailableWorkflowConnectRule>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AvailableWorkflowConnectRule.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The rule type.
enum AvailableWorkflowConnectRuleRuleTypeEnum {
  condition._(r'Condition'),
  validator._(r'Validator'),
  function_._(r'Function'),
  screen._(r'Screen'),
  ;

  /// Instantiate a new enum with the provided value.
  const AvailableWorkflowConnectRuleRuleTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [AvailableWorkflowConnectRuleRuleTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static AvailableWorkflowConnectRuleRuleTypeEnum? fromJson(dynamic value) => AvailableWorkflowConnectRuleRuleTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [AvailableWorkflowConnectRuleRuleTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<AvailableWorkflowConnectRuleRuleTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AvailableWorkflowConnectRuleRuleTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AvailableWorkflowConnectRuleRuleTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [AvailableWorkflowConnectRuleRuleTypeEnum] to String,
/// and [decode] dynamic data back to [AvailableWorkflowConnectRuleRuleTypeEnum].
class AvailableWorkflowConnectRuleRuleTypeEnumTypeTransformer {
  factory AvailableWorkflowConnectRuleRuleTypeEnumTypeTransformer() => _instance ??= const AvailableWorkflowConnectRuleRuleTypeEnumTypeTransformer._();

  const AvailableWorkflowConnectRuleRuleTypeEnumTypeTransformer._();

  String encode(AvailableWorkflowConnectRuleRuleTypeEnum data) => data._value;

  /// Returns the instance of [AvailableWorkflowConnectRuleRuleTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  AvailableWorkflowConnectRuleRuleTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is AvailableWorkflowConnectRuleRuleTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'Condition': return AvailableWorkflowConnectRuleRuleTypeEnum.condition;
        case r'Validator': return AvailableWorkflowConnectRuleRuleTypeEnum.validator;
        case r'Function': return AvailableWorkflowConnectRuleRuleTypeEnum.function_;
        case r'Screen': return AvailableWorkflowConnectRuleRuleTypeEnum.screen;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static AvailableWorkflowConnectRuleRuleTypeEnumTypeTransformer? _instance;
}


