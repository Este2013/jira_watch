//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AppWorkflowTransitionRule {
  /// Returns a new [AppWorkflowTransitionRule] instance.
  AppWorkflowTransitionRule({
    required this.configuration,
    required this.id,
    required this.key,
    this.transition,
  });

  RuleConfiguration configuration;

  /// The ID of the transition rule.
  String id;

  /// The key of the rule, as defined in the Connect or the Forge app descriptor.
  String key;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  WorkflowTransition? transition;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AppWorkflowTransitionRule &&
    other.configuration == configuration &&
    other.id == id &&
    other.key == key &&
    other.transition == transition;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (configuration.hashCode) +
    (id.hashCode) +
    (key.hashCode) +
    (transition == null ? 0 : transition!.hashCode);

  @override
  String toString() => 'AppWorkflowTransitionRule[configuration=$configuration, id=$id, key=$key, transition=$transition]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'configuration'] = this.configuration;
      json[r'id'] = this.id;
      json[r'key'] = this.key;
    if (this.transition != null) {
      json[r'transition'] = this.transition;
    } else {
      json[r'transition'] = null;
    }
    return json;
  }

  /// Returns a new [AppWorkflowTransitionRule] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AppWorkflowTransitionRule? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'configuration'), 'Required key "AppWorkflowTransitionRule[configuration]" is missing from JSON.');
        assert(json[r'configuration'] != null, 'Required key "AppWorkflowTransitionRule[configuration]" has a null value in JSON.');
        assert(json.containsKey(r'id'), 'Required key "AppWorkflowTransitionRule[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "AppWorkflowTransitionRule[id]" has a null value in JSON.');
        assert(json.containsKey(r'key'), 'Required key "AppWorkflowTransitionRule[key]" is missing from JSON.');
        assert(json[r'key'] != null, 'Required key "AppWorkflowTransitionRule[key]" has a null value in JSON.');
        return true;
      }());

      return AppWorkflowTransitionRule(
        configuration: RuleConfiguration.fromJson(json[r'configuration'])!,
        id: mapValueOfType<String>(json, r'id')!,
        key: mapValueOfType<String>(json, r'key')!,
        transition: WorkflowTransition.fromJson(json[r'transition']),
      );
    }
    return null;
  }

  static List<AppWorkflowTransitionRule> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AppWorkflowTransitionRule>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AppWorkflowTransitionRule.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AppWorkflowTransitionRule> mapFromJson(dynamic json) {
    final map = <String, AppWorkflowTransitionRule>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AppWorkflowTransitionRule.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AppWorkflowTransitionRule-objects as value to a dart map
  static Map<String, List<AppWorkflowTransitionRule>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AppWorkflowTransitionRule>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AppWorkflowTransitionRule.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'configuration',
    'id',
    'key',
  };
}

