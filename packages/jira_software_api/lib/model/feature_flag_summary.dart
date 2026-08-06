//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FeatureFlagSummary {
  /// Returns a new [FeatureFlagSummary] instance.
  FeatureFlagSummary({
    this.url,
    required this.status,
    required this.lastUpdated,
  });

  /// A URL users can use to link to a summary view of this flag, if appropriate.  This could be any location that makes sense in the Provider system (e.g. if the summary information comes from a specific environment, it might make sense to link the user to the flag in that environment). 
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? url;

  FeatureFlagStatus status;

  /// The last-updated timestamp to present to the user as a summary of the state of the Feature Flag.  Providers may choose to supply the last-updated timestamp from a specific environment, or the 'most recent' last-updated timestamp across all environments - whatever makes sense in the Provider system.  Expected format is an RFC3339 formatted string. 
  DateTime lastUpdated;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FeatureFlagSummary &&
    other.url == url &&
    other.status == status &&
    other.lastUpdated == lastUpdated;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (url == null ? 0 : url!.hashCode) +
    (status.hashCode) +
    (lastUpdated.hashCode);

  @override
  String toString() => 'FeatureFlagSummary[url=$url, status=$status, lastUpdated=$lastUpdated]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.url != null) {
      json[r'url'] = this.url;
    } else {
      json[r'url'] = null;
    }
      json[r'status'] = this.status;
      json[r'lastUpdated'] = this.lastUpdated.toUtc().toIso8601String();
    return json;
  }

  /// Returns a new [FeatureFlagSummary] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FeatureFlagSummary? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'status'), 'Required key "FeatureFlagSummary[status]" is missing from JSON.');
        assert(json[r'status'] != null, 'Required key "FeatureFlagSummary[status]" has a null value in JSON.');
        assert(json.containsKey(r'lastUpdated'), 'Required key "FeatureFlagSummary[lastUpdated]" is missing from JSON.');
        assert(json[r'lastUpdated'] != null, 'Required key "FeatureFlagSummary[lastUpdated]" has a null value in JSON.');
        return true;
      }());

      return FeatureFlagSummary(
        url: mapValueOfType<String>(json, r'url'),
        status: FeatureFlagStatus.fromJson(json[r'status'])!,
        lastUpdated: mapDateTime(json, r'lastUpdated', r'')!,
      );
    }
    return null;
  }

  static List<FeatureFlagSummary> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FeatureFlagSummary>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FeatureFlagSummary.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FeatureFlagSummary> mapFromJson(dynamic json) {
    final map = <String, FeatureFlagSummary>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FeatureFlagSummary.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FeatureFlagSummary-objects as value to a dart map
  static Map<String, List<FeatureFlagSummary>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FeatureFlagSummary>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FeatureFlagSummary.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'status',
    'lastUpdated',
  };
}

