//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TimeTrackingDetails {
  /// Returns a new [TimeTrackingDetails] instance.
  TimeTrackingDetails({
    this.originalEstimate,
    this.originalEstimateSeconds,
    this.remainingEstimate,
    this.remainingEstimateSeconds,
    this.timeSpent,
    this.timeSpentSeconds,
  });

  /// The original estimate of time needed for this issue in readable format.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? originalEstimate;

  /// The original estimate of time needed for this issue in seconds.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? originalEstimateSeconds;

  /// The remaining estimate of time needed for this issue in readable format.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? remainingEstimate;

  /// The remaining estimate of time needed for this issue in seconds.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? remainingEstimateSeconds;

  /// Time worked on this issue in readable format.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? timeSpent;

  /// Time worked on this issue in seconds.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? timeSpentSeconds;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TimeTrackingDetails &&
    other.originalEstimate == originalEstimate &&
    other.originalEstimateSeconds == originalEstimateSeconds &&
    other.remainingEstimate == remainingEstimate &&
    other.remainingEstimateSeconds == remainingEstimateSeconds &&
    other.timeSpent == timeSpent &&
    other.timeSpentSeconds == timeSpentSeconds;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (originalEstimate == null ? 0 : originalEstimate!.hashCode) +
    (originalEstimateSeconds == null ? 0 : originalEstimateSeconds!.hashCode) +
    (remainingEstimate == null ? 0 : remainingEstimate!.hashCode) +
    (remainingEstimateSeconds == null ? 0 : remainingEstimateSeconds!.hashCode) +
    (timeSpent == null ? 0 : timeSpent!.hashCode) +
    (timeSpentSeconds == null ? 0 : timeSpentSeconds!.hashCode);

  @override
  String toString() => 'TimeTrackingDetails[originalEstimate=$originalEstimate, originalEstimateSeconds=$originalEstimateSeconds, remainingEstimate=$remainingEstimate, remainingEstimateSeconds=$remainingEstimateSeconds, timeSpent=$timeSpent, timeSpentSeconds=$timeSpentSeconds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.originalEstimate != null) {
      json[r'originalEstimate'] = this.originalEstimate;
    } else {
      json[r'originalEstimate'] = null;
    }
    if (this.originalEstimateSeconds != null) {
      json[r'originalEstimateSeconds'] = this.originalEstimateSeconds;
    } else {
      json[r'originalEstimateSeconds'] = null;
    }
    if (this.remainingEstimate != null) {
      json[r'remainingEstimate'] = this.remainingEstimate;
    } else {
      json[r'remainingEstimate'] = null;
    }
    if (this.remainingEstimateSeconds != null) {
      json[r'remainingEstimateSeconds'] = this.remainingEstimateSeconds;
    } else {
      json[r'remainingEstimateSeconds'] = null;
    }
    if (this.timeSpent != null) {
      json[r'timeSpent'] = this.timeSpent;
    } else {
      json[r'timeSpent'] = null;
    }
    if (this.timeSpentSeconds != null) {
      json[r'timeSpentSeconds'] = this.timeSpentSeconds;
    } else {
      json[r'timeSpentSeconds'] = null;
    }
    return json;
  }

  /// Returns a new [TimeTrackingDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TimeTrackingDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return TimeTrackingDetails(
        originalEstimate: mapValueOfType<String>(json, r'originalEstimate'),
        originalEstimateSeconds: mapValueOfType<int>(json, r'originalEstimateSeconds'),
        remainingEstimate: mapValueOfType<String>(json, r'remainingEstimate'),
        remainingEstimateSeconds: mapValueOfType<int>(json, r'remainingEstimateSeconds'),
        timeSpent: mapValueOfType<String>(json, r'timeSpent'),
        timeSpentSeconds: mapValueOfType<int>(json, r'timeSpentSeconds'),
      );
    }
    return null;
  }

  static List<TimeTrackingDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TimeTrackingDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TimeTrackingDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TimeTrackingDetails> mapFromJson(dynamic json) {
    final map = <String, TimeTrackingDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TimeTrackingDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TimeTrackingDetails-objects as value to a dart map
  static Map<String, List<TimeTrackingDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TimeTrackingDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TimeTrackingDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

