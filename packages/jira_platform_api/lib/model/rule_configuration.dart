//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RuleConfiguration {
  /// Returns a new [RuleConfiguration] instance.
  RuleConfiguration({
    this.disabled = false,
    this.tag,
    required this.value,
  });

  /// Whether the rule is disabled.
  bool disabled;

  /// A tag used to filter rules in [Get workflow transition rule configurations](https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-workflow-transition-rules/#api-rest-api-3-workflow-rule-config-get).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? tag;

  /// Configuration of the rule, as it is stored by the Connect or the Forge app on the rule configuration page.
  String value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RuleConfiguration &&
    other.disabled == disabled &&
    other.tag == tag &&
    other.value == value;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (disabled.hashCode) +
    (tag == null ? 0 : tag!.hashCode) +
    (value.hashCode);

  @override
  String toString() => 'RuleConfiguration[disabled=$disabled, tag=$tag, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'disabled'] = this.disabled;
    if (this.tag != null) {
      json[r'tag'] = this.tag;
    } else {
      json[r'tag'] = null;
    }
      json[r'value'] = this.value;
    return json;
  }

  /// Returns a new [RuleConfiguration] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RuleConfiguration? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'value'), 'Required key "RuleConfiguration[value]" is missing from JSON.');
        assert(json[r'value'] != null, 'Required key "RuleConfiguration[value]" has a null value in JSON.');
        return true;
      }());

      return RuleConfiguration(
        disabled: mapValueOfType<bool>(json, r'disabled') ?? false,
        tag: mapValueOfType<String>(json, r'tag'),
        value: mapValueOfType<String>(json, r'value')!,
      );
    }
    return null;
  }

  static List<RuleConfiguration> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RuleConfiguration>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RuleConfiguration.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RuleConfiguration> mapFromJson(dynamic json) {
    final map = <String, RuleConfiguration>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RuleConfiguration.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RuleConfiguration-objects as value to a dart map
  static Map<String, List<RuleConfiguration>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RuleConfiguration>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RuleConfiguration.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'value',
  };
}

