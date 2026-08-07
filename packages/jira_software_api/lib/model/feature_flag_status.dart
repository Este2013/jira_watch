//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FeatureFlagStatus {
  /// Returns a new [FeatureFlagStatus] instance.
  FeatureFlagStatus({
    required this.enabled,
    this.defaultValue,
    this.rollout,
  });

  /// Whether the Feature Flag is enabled in the given environment (or in summary).  Enabled may imply a partial rollout, which can be described using the 'rollout' field. 
  bool enabled;

  /// The value served by this Feature Flag when it is disabled. This could be the actual value or an alias, as appropriate.  This value may be presented to the user in the UI. 
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? defaultValue;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  FeatureFlagRollout? rollout;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FeatureFlagStatus &&
    other.enabled == enabled &&
    other.defaultValue == defaultValue &&
    other.rollout == rollout;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (enabled.hashCode) +
    (defaultValue == null ? 0 : defaultValue!.hashCode) +
    (rollout == null ? 0 : rollout!.hashCode);

  @override
  String toString() => 'FeatureFlagStatus[enabled=$enabled, defaultValue=$defaultValue, rollout=$rollout]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'enabled'] = this.enabled;
    if (this.defaultValue != null) {
      json[r'defaultValue'] = this.defaultValue;
    } else {
      json[r'defaultValue'] = null;
    }
    if (this.rollout != null) {
      json[r'rollout'] = this.rollout;
    } else {
      json[r'rollout'] = null;
    }
    return json;
  }

  /// Returns a new [FeatureFlagStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FeatureFlagStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'enabled'), 'Required key "FeatureFlagStatus[enabled]" is missing from JSON.');
        assert(json[r'enabled'] != null, 'Required key "FeatureFlagStatus[enabled]" has a null value in JSON.');
        return true;
      }());

      return FeatureFlagStatus(
        enabled: mapValueOfType<bool>(json, r'enabled')!,
        defaultValue: mapValueOfType<String>(json, r'defaultValue'),
        rollout: FeatureFlagRollout.fromJson(json[r'rollout']),
      );
    }
    return null;
  }

  static List<FeatureFlagStatus> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FeatureFlagStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FeatureFlagStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FeatureFlagStatus> mapFromJson(dynamic json) {
    final map = <String, FeatureFlagStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FeatureFlagStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FeatureFlagStatus-objects as value to a dart map
  static Map<String, List<FeatureFlagStatus>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FeatureFlagStatus>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FeatureFlagStatus.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'enabled',
  };
}

