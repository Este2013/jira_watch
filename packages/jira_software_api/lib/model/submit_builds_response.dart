//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SubmitBuildsResponse {
  /// Returns a new [SubmitBuildsResponse] instance.
  SubmitBuildsResponse({
    this.acceptedBuilds = const [],
    this.rejectedBuilds = const [],
    this.unknownIssueKeys = const [],
    this.unknownAssociations = const [],
  });

  /// The keys of builds that have been accepted for submission. A build key is a composite key that consists of `pipelineId` and `buildNumber`.  A build may be rejected if it was only associated with unknown issue keys, or if the submitted data for that build does not match the required schema.  Note that a build that isn't updated due to it's `updateSequenceNumber` being out of order is not considered a failed submission. 
  List<BuildKey> acceptedBuilds;

  /// Details of builds that have not been accepted for submission.  A build may be rejected if it was only associated with unknown issue keys, or if the submitted data for the build does not match the required schema. 
  List<RejectedBuild> rejectedBuilds;

  /// Issue keys that are not known on this Jira instance (if any).  These may be invalid keys (e.g. `UTF-8` is sometimes incorrectly identified as a Jira issue key), or they may be for projects that no longer exist.  If a build has been associated with issue keys other than those in this array it will still be stored against those valid keys. If a build was only associated with issue keys deemed to be invalid it won't be persisted. 
  List<String> unknownIssueKeys;

  /// Associations that are not known on this Jira instance (if any).  These may be invalid keys (e.g. `UTF-8` is sometimes incorrectly identified as a Jira issue key), or they may be for projects that no longer exist.  If a build has been associated with any other association other than those in this array it will still be stored against those valid associations. If a build was only associated with the associations in this array, it is deemed to be invalid and it won't be persisted. 
  List<IssueIdOrKeysAssociation> unknownAssociations;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SubmitBuildsResponse &&
    _deepEquality.equals(other.acceptedBuilds, acceptedBuilds) &&
    _deepEquality.equals(other.rejectedBuilds, rejectedBuilds) &&
    _deepEquality.equals(other.unknownIssueKeys, unknownIssueKeys) &&
    _deepEquality.equals(other.unknownAssociations, unknownAssociations);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (acceptedBuilds.hashCode) +
    (rejectedBuilds.hashCode) +
    (unknownIssueKeys.hashCode) +
    (unknownAssociations.hashCode);

  @override
  String toString() => 'SubmitBuildsResponse[acceptedBuilds=$acceptedBuilds, rejectedBuilds=$rejectedBuilds, unknownIssueKeys=$unknownIssueKeys, unknownAssociations=$unknownAssociations]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'acceptedBuilds'] = this.acceptedBuilds;
      json[r'rejectedBuilds'] = this.rejectedBuilds;
      json[r'unknownIssueKeys'] = this.unknownIssueKeys;
      json[r'unknownAssociations'] = this.unknownAssociations;
    return json;
  }

  /// Returns a new [SubmitBuildsResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SubmitBuildsResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return SubmitBuildsResponse(
        acceptedBuilds: BuildKey.listFromJson(json[r'acceptedBuilds']),
        rejectedBuilds: RejectedBuild.listFromJson(json[r'rejectedBuilds']),
        unknownIssueKeys: json[r'unknownIssueKeys'] is Iterable
            ? (json[r'unknownIssueKeys'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        unknownAssociations: IssueIdOrKeysAssociation.listFromJson(json[r'unknownAssociations']),
      );
    }
    return null;
  }

  static List<SubmitBuildsResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SubmitBuildsResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SubmitBuildsResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SubmitBuildsResponse> mapFromJson(dynamic json) {
    final map = <String, SubmitBuildsResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SubmitBuildsResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SubmitBuildsResponse-objects as value to a dart map
  static Map<String, List<SubmitBuildsResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SubmitBuildsResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SubmitBuildsResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

