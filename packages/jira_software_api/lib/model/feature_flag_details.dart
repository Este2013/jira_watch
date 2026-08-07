//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FeatureFlagDetails {
  /// Returns a new [FeatureFlagDetails] instance.
  FeatureFlagDetails({
    required this.url,
    required this.lastUpdated,
    required this.environment,
    required this.status,
  });

  /// A URL users can use to link to this Feature Flag, in this environment. 
  String url;

  /// The last-updated timestamp for this Feature Flag, in this environment.  Expected format is an RFC3339 formatted string. 
  DateTime lastUpdated;

  EnvironmentDetails environment;

  FeatureFlagStatus status;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FeatureFlagDetails &&
    other.url == url &&
    other.lastUpdated == lastUpdated &&
    other.environment == environment &&
    other.status == status;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (url.hashCode) +
    (lastUpdated.hashCode) +
    (environment.hashCode) +
    (status.hashCode);

  @override
  String toString() => 'FeatureFlagDetails[url=$url, lastUpdated=$lastUpdated, environment=$environment, status=$status]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'url'] = this.url;
      json[r'lastUpdated'] = this.lastUpdated.toUtc().toIso8601String();
      json[r'environment'] = this.environment;
      json[r'status'] = this.status;
    return json;
  }

  /// Returns a new [FeatureFlagDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FeatureFlagDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'url'), 'Required key "FeatureFlagDetails[url]" is missing from JSON.');
        assert(json[r'url'] != null, 'Required key "FeatureFlagDetails[url]" has a null value in JSON.');
        assert(json.containsKey(r'lastUpdated'), 'Required key "FeatureFlagDetails[lastUpdated]" is missing from JSON.');
        assert(json[r'lastUpdated'] != null, 'Required key "FeatureFlagDetails[lastUpdated]" has a null value in JSON.');
        assert(json.containsKey(r'environment'), 'Required key "FeatureFlagDetails[environment]" is missing from JSON.');
        assert(json[r'environment'] != null, 'Required key "FeatureFlagDetails[environment]" has a null value in JSON.');
        assert(json.containsKey(r'status'), 'Required key "FeatureFlagDetails[status]" is missing from JSON.');
        assert(json[r'status'] != null, 'Required key "FeatureFlagDetails[status]" has a null value in JSON.');
        return true;
      }());

      return FeatureFlagDetails(
        url: mapValueOfType<String>(json, r'url')!,
        lastUpdated: mapDateTime(json, r'lastUpdated', r'')!,
        environment: EnvironmentDetails.fromJson(json[r'environment'])!,
        status: FeatureFlagStatus.fromJson(json[r'status'])!,
      );
    }
    return null;
  }

  static List<FeatureFlagDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FeatureFlagDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FeatureFlagDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FeatureFlagDetails> mapFromJson(dynamic json) {
    final map = <String, FeatureFlagDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FeatureFlagDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FeatureFlagDetails-objects as value to a dart map
  static Map<String, List<FeatureFlagDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FeatureFlagDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FeatureFlagDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'url',
    'lastUpdated',
    'environment',
    'status',
  };
}

