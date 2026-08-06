//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SubmitVulnerabilitiesResponse {
  /// Returns a new [SubmitVulnerabilitiesResponse] instance.
  SubmitVulnerabilitiesResponse({
    this.acceptedVulnerabilities = const [],
    this.failedVulnerabilities = const {},
    this.unknownAssociations = const [],
  });

  /// The IDs of Vulnerabilities that have been accepted for submission.  A Vulnerability may be rejected if it was only associated with unknown project keys.  Note that a Vulnerability that isn't updated due to it's updateSequenceNumber being out of order is not considered a failed submission. 
  List<String> acceptedVulnerabilities;

  /// Details of Vulnerabilities that have not been accepted for submission, usually due to a problem with the request data.  The object (if present) will be keyed by Vulnerability ID and include any errors associated with that Vulnerability that have prevented it being submitted. 
  Map<String, List<ErrorMessage1>> failedVulnerabilities;

  /// Associations (e.g. Service IDs) that are not known on this Jira instance (if any).  If a Vulnerability has been associated with any other association other than those in this array it will still be stored against those valid associations. If a Vulnerability was only associated with the associations in this array, it is deemed to be invalid and it won't be persisted. 
  List<VulnerabilityDetailsAddAssociationsInner> unknownAssociations;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SubmitVulnerabilitiesResponse &&
    _deepEquality.equals(other.acceptedVulnerabilities, acceptedVulnerabilities) &&
    _deepEquality.equals(other.failedVulnerabilities, failedVulnerabilities) &&
    _deepEquality.equals(other.unknownAssociations, unknownAssociations);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (acceptedVulnerabilities.hashCode) +
    (failedVulnerabilities.hashCode) +
    (unknownAssociations.hashCode);

  @override
  String toString() => 'SubmitVulnerabilitiesResponse[acceptedVulnerabilities=$acceptedVulnerabilities, failedVulnerabilities=$failedVulnerabilities, unknownAssociations=$unknownAssociations]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'acceptedVulnerabilities'] = this.acceptedVulnerabilities;
      json[r'failedVulnerabilities'] = this.failedVulnerabilities;
      json[r'unknownAssociations'] = this.unknownAssociations;
    return json;
  }

  /// Returns a new [SubmitVulnerabilitiesResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SubmitVulnerabilitiesResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return SubmitVulnerabilitiesResponse(
        acceptedVulnerabilities: json[r'acceptedVulnerabilities'] is Iterable
            ? (json[r'acceptedVulnerabilities'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        failedVulnerabilities: json[r'failedVulnerabilities'] == null
          ? const {}
            : ErrorMessage1.mapListFromJson(json[r'failedVulnerabilities']),
        unknownAssociations: VulnerabilityDetailsAddAssociationsInner.listFromJson(json[r'unknownAssociations']),
      );
    }
    return null;
  }

  static List<SubmitVulnerabilitiesResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SubmitVulnerabilitiesResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SubmitVulnerabilitiesResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SubmitVulnerabilitiesResponse> mapFromJson(dynamic json) {
    final map = <String, SubmitVulnerabilitiesResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SubmitVulnerabilitiesResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SubmitVulnerabilitiesResponse-objects as value to a dart map
  static Map<String, List<SubmitVulnerabilitiesResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SubmitVulnerabilitiesResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SubmitVulnerabilitiesResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

