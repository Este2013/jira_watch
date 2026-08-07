//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PreviewRuleConfiguration {
  /// Returns a new [PreviewRuleConfiguration] instance.
  PreviewRuleConfiguration({
    this.id,
    this.parameters = const {},
    this.ruleKey,
  });

  /// A transient identifier for this element, unique within this response but not guaranteed to stable across requests.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// The parameters of the rule.
  Map<String, String> parameters;

  /// The rule key of the rule.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? ruleKey;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PreviewRuleConfiguration &&
    other.id == id &&
    _deepEquality.equals(other.parameters, parameters) &&
    other.ruleKey == ruleKey;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (parameters.hashCode) +
    (ruleKey == null ? 0 : ruleKey!.hashCode);

  @override
  String toString() => 'PreviewRuleConfiguration[id=$id, parameters=$parameters, ruleKey=$ruleKey]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
      json[r'parameters'] = this.parameters;
    if (this.ruleKey != null) {
      json[r'ruleKey'] = this.ruleKey;
    } else {
      json[r'ruleKey'] = null;
    }
    return json;
  }

  /// Returns a new [PreviewRuleConfiguration] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PreviewRuleConfiguration? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return PreviewRuleConfiguration(
        id: mapValueOfType<String>(json, r'id'),
        parameters: mapCastOfType<String, String>(json, r'parameters') ?? const {},
        ruleKey: mapValueOfType<String>(json, r'ruleKey'),
      );
    }
    return null;
  }

  static List<PreviewRuleConfiguration> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PreviewRuleConfiguration>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PreviewRuleConfiguration.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PreviewRuleConfiguration> mapFromJson(dynamic json) {
    final map = <String, PreviewRuleConfiguration>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PreviewRuleConfiguration.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PreviewRuleConfiguration-objects as value to a dart map
  static Map<String, List<PreviewRuleConfiguration>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PreviewRuleConfiguration>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PreviewRuleConfiguration.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

