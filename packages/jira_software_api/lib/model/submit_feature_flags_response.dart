//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SubmitFeatureFlagsResponse {
  /// Returns a new [SubmitFeatureFlagsResponse] instance.
  SubmitFeatureFlagsResponse({
    this.acceptedFeatureFlags = const [],
    this.failedFeatureFlags = const {},
    this.unknownIssueKeys = const [],
    this.unknownAssociations = const [],
  });

  /// The IDs of Feature Flags that have been accepted for submission.  A Feature Flag may be rejected if it was only associated with unknown issue keys.  Note that a Feature Flag that isn't updated due to it's updateSequenceId being out of order is not considered a failed submission. 
  List<String> acceptedFeatureFlags;

  /// Details of Feature Flags that have not been accepted for submission, usually due to a problem with the request data.  The object (if present) will be keyed by Feature Flag ID and include any errors associated with that Feature Flag that have prevented it being submitted. 
  Map<String, List<ErrorMessage1>> failedFeatureFlags;

  /// Issue keys that are not known on this Jira instance (if any).   These may be invalid keys (e.g. `UTF-8` is sometimes incorrectly identified as a Jira issue key), or they may be for projects that no longer exist.  If a Feature Flag has been associated with issue keys other than those in this array it will still be stored against those valid keys. If a Feature Flag was only associated with issue keys deemed to be invalid it won't be persisted. 
  List<String> unknownIssueKeys;

  /// Associations that are not known on this Jira instance (if any).  These may be invalid keys (e.g. `UTF-8` is sometimes incorrectly identified as a Jira issue key), or they may be for projects that no longer exist.  If a feature flag has been associated with any other association other than those in this array it will still be stored against those valid associations. If a feature flag was only associated with the associations in this array, it is deemed to be invalid and it won't be persisted. 
  List<IssueIdOrKeysAssociation> unknownAssociations;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SubmitFeatureFlagsResponse &&
    _deepEquality.equals(other.acceptedFeatureFlags, acceptedFeatureFlags) &&
    _deepEquality.equals(other.failedFeatureFlags, failedFeatureFlags) &&
    _deepEquality.equals(other.unknownIssueKeys, unknownIssueKeys) &&
    _deepEquality.equals(other.unknownAssociations, unknownAssociations);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (acceptedFeatureFlags.hashCode) +
    (failedFeatureFlags.hashCode) +
    (unknownIssueKeys.hashCode) +
    (unknownAssociations.hashCode);

  @override
  String toString() => 'SubmitFeatureFlagsResponse[acceptedFeatureFlags=$acceptedFeatureFlags, failedFeatureFlags=$failedFeatureFlags, unknownIssueKeys=$unknownIssueKeys, unknownAssociations=$unknownAssociations]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'acceptedFeatureFlags'] = this.acceptedFeatureFlags;
      json[r'failedFeatureFlags'] = this.failedFeatureFlags;
      json[r'unknownIssueKeys'] = this.unknownIssueKeys;
      json[r'unknownAssociations'] = this.unknownAssociations;
    return json;
  }

  /// Returns a new [SubmitFeatureFlagsResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SubmitFeatureFlagsResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return SubmitFeatureFlagsResponse(
        acceptedFeatureFlags: json[r'acceptedFeatureFlags'] is Iterable
            ? (json[r'acceptedFeatureFlags'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        failedFeatureFlags: json[r'failedFeatureFlags'] == null
          ? const {}
            : ErrorMessage1.mapListFromJson(json[r'failedFeatureFlags']),
        unknownIssueKeys: json[r'unknownIssueKeys'] is Iterable
            ? (json[r'unknownIssueKeys'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        unknownAssociations: IssueIdOrKeysAssociation.listFromJson(json[r'unknownAssociations']),
      );
    }
    return null;
  }

  static List<SubmitFeatureFlagsResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SubmitFeatureFlagsResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SubmitFeatureFlagsResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SubmitFeatureFlagsResponse> mapFromJson(dynamic json) {
    final map = <String, SubmitFeatureFlagsResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SubmitFeatureFlagsResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SubmitFeatureFlagsResponse-objects as value to a dart map
  static Map<String, List<SubmitFeatureFlagsResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SubmitFeatureFlagsResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SubmitFeatureFlagsResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

