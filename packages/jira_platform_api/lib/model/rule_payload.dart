//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RulePayload {
  /// Returns a new [RulePayload] instance.
  RulePayload({
    this.parameters = const {},
    this.ruleKey,
  });

  /// The parameters of the rule
  Map<String, String> parameters;

  /// The key of the rule. See https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-workflows/\\#api-rest-api-3-workflows-capabilities-get
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? ruleKey;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RulePayload &&
    _deepEquality.equals(other.parameters, parameters) &&
    other.ruleKey == ruleKey;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (parameters.hashCode) +
    (ruleKey == null ? 0 : ruleKey!.hashCode);

  @override
  String toString() => 'RulePayload[parameters=$parameters, ruleKey=$ruleKey]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'parameters'] = this.parameters;
    if (this.ruleKey != null) {
      json[r'ruleKey'] = this.ruleKey;
    } else {
      json[r'ruleKey'] = null;
    }
    return json;
  }

  /// Returns a new [RulePayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RulePayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return RulePayload(
        parameters: mapCastOfType<String, String>(json, r'parameters') ?? const {},
        ruleKey: mapValueOfType<String>(json, r'ruleKey'),
      );
    }
    return null;
  }

  static List<RulePayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RulePayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RulePayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RulePayload> mapFromJson(dynamic json) {
    final map = <String, RulePayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RulePayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RulePayload-objects as value to a dart map
  static Map<String, List<RulePayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RulePayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RulePayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

