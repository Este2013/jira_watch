//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FeatureFlagRollout {
  /// Returns a new [FeatureFlagRollout] instance.
  FeatureFlagRollout({
    this.percentage,
    this.text,
    this.rules,
  });

  /// If the Feature Flag rollout is a simple percentage rollout 
  ///
  /// Minimum value: 0
  /// Maximum value: 100
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? percentage;

  /// A text status to display that represents the rollout. This could be e.g. a named cohort. 
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? text;

  /// A count of the number of rules active for this Feature Flag in an environment. 
  ///
  /// Minimum value: 0
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? rules;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FeatureFlagRollout &&
    other.percentage == percentage &&
    other.text == text &&
    other.rules == rules;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (percentage == null ? 0 : percentage!.hashCode) +
    (text == null ? 0 : text!.hashCode) +
    (rules == null ? 0 : rules!.hashCode);

  @override
  String toString() => 'FeatureFlagRollout[percentage=$percentage, text=$text, rules=$rules]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.percentage != null) {
      json[r'percentage'] = this.percentage;
    } else {
      json[r'percentage'] = null;
    }
    if (this.text != null) {
      json[r'text'] = this.text;
    } else {
      json[r'text'] = null;
    }
    if (this.rules != null) {
      json[r'rules'] = this.rules;
    } else {
      json[r'rules'] = null;
    }
    return json;
  }

  /// Returns a new [FeatureFlagRollout] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FeatureFlagRollout? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return FeatureFlagRollout(
        percentage: num.parse('${json[r'percentage']}'),
        text: mapValueOfType<String>(json, r'text'),
        rules: mapValueOfType<int>(json, r'rules'),
      );
    }
    return null;
  }

  static List<FeatureFlagRollout> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FeatureFlagRollout>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FeatureFlagRollout.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FeatureFlagRollout> mapFromJson(dynamic json) {
    final map = <String, FeatureFlagRollout>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FeatureFlagRollout.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FeatureFlagRollout-objects as value to a dart map
  static Map<String, List<FeatureFlagRollout>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FeatureFlagRollout>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FeatureFlagRollout.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

