//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SubmitIncidentsResponse {
  /// Returns a new [SubmitIncidentsResponse] instance.
  SubmitIncidentsResponse({
    this.acceptedIncidents = const [],
    this.failedIncidents = const {},
    this.unknownProjectKeys = const [],
  });

  /// The IDs of Incidents that have been accepted for submission.  A Incident may be rejected if it was only associated with unknown project keys.  Note that a Incident that isn't updated due to it's updateSequenceNumber being out of order is not considered a failed submission. 
  List<String> acceptedIncidents;

  /// Details of Incidents that have not been accepted for submission, usually due to a problem with the request data.  The object (if present) will be keyed by Incident ID and include any errors associated with that Incident that have prevented it being submitted. 
  Map<String, List<ErrorMessage1>> failedIncidents;

  /// Project keys that are not known on this Jira instance (if any).  These may be invalid keys (e.g. `UTF` is sometimes incorrectly identified as a Jira project key), or they may be for projects that no longer exist.  If a Incident has been associated with project keys other than those in this array it will still be stored against those valid keys. If a Incident was only associated with project keys deemed to be invalid it won't be persisted. 
  List<String> unknownProjectKeys;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SubmitIncidentsResponse &&
    _deepEquality.equals(other.acceptedIncidents, acceptedIncidents) &&
    _deepEquality.equals(other.failedIncidents, failedIncidents) &&
    _deepEquality.equals(other.unknownProjectKeys, unknownProjectKeys);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (acceptedIncidents.hashCode) +
    (failedIncidents.hashCode) +
    (unknownProjectKeys.hashCode);

  @override
  String toString() => 'SubmitIncidentsResponse[acceptedIncidents=$acceptedIncidents, failedIncidents=$failedIncidents, unknownProjectKeys=$unknownProjectKeys]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'acceptedIncidents'] = this.acceptedIncidents;
      json[r'failedIncidents'] = this.failedIncidents;
      json[r'unknownProjectKeys'] = this.unknownProjectKeys;
    return json;
  }

  /// Returns a new [SubmitIncidentsResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SubmitIncidentsResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return SubmitIncidentsResponse(
        acceptedIncidents: json[r'acceptedIncidents'] is Iterable
            ? (json[r'acceptedIncidents'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        failedIncidents: json[r'failedIncidents'] == null
          ? const {}
            : ErrorMessage1.mapListFromJson(json[r'failedIncidents']),
        unknownProjectKeys: json[r'unknownProjectKeys'] is Iterable
            ? (json[r'unknownProjectKeys'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<SubmitIncidentsResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SubmitIncidentsResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SubmitIncidentsResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SubmitIncidentsResponse> mapFromJson(dynamic json) {
    final map = <String, SubmitIncidentsResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SubmitIncidentsResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SubmitIncidentsResponse-objects as value to a dart map
  static Map<String, List<SubmitIncidentsResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SubmitIncidentsResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SubmitIncidentsResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

