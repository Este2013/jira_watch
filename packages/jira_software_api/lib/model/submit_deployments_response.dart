//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SubmitDeploymentsResponse {
  /// Returns a new [SubmitDeploymentsResponse] instance.
  SubmitDeploymentsResponse({
    this.acceptedDeployments = const [],
    this.rejectedDeployments = const [],
    this.unknownIssueKeys = const [],
    this.unknownAssociations = const [],
  });

  /// The keys of deployments that have been accepted for submission. A deployment key is a composite key that consists of `pipelineId`, `environmentId` and `deploymentSequenceNumber`.  A deployment may be rejected if it was only associated with unknown issue keys.  Note that a deployment that isn't updated due to it's updateSequenceNumber being out of order is not considered a failed submission. 
  List<DeploymentKey> acceptedDeployments;

  /// Details of deployments that have not been accepted for submission, usually due to a problem with the request data.  The object will contain the deployment key and any errors associated with that deployment that have prevented it being submitted. 
  List<RejectedDeployment> rejectedDeployments;

  /// Issue keys that are not known on this Jira instance (if any).  These may be invalid keys (e.g. `UTF-8` is sometimes incorrectly identified as a Jira issue key), or they may be for projects that no longer exist.  If a deployment has been associated with issue keys other than those in this array it will still be stored against those valid keys. If a deployment was only associated with issue keys deemed to be invalid it won't be persisted. 
  List<String> unknownIssueKeys;

  /// Associations (e.g. Issue Keys or Service IDs) that are not known on this Jira instance (if any).  These may be invalid keys (e.g. `UTF-8` is sometimes incorrectly identified as a Jira issue key), or they may be for projects that no longer exist.  If a deployment has been associated with any other association other than those in this array it will still be stored against those valid associations. If a deployment was only associated with the associations in this array, it is deemed to be invalid and it won't be persisted. 
  List<DeploymentDataAssociationsInner> unknownAssociations;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SubmitDeploymentsResponse &&
    _deepEquality.equals(other.acceptedDeployments, acceptedDeployments) &&
    _deepEquality.equals(other.rejectedDeployments, rejectedDeployments) &&
    _deepEquality.equals(other.unknownIssueKeys, unknownIssueKeys) &&
    _deepEquality.equals(other.unknownAssociations, unknownAssociations);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (acceptedDeployments.hashCode) +
    (rejectedDeployments.hashCode) +
    (unknownIssueKeys.hashCode) +
    (unknownAssociations.hashCode);

  @override
  String toString() => 'SubmitDeploymentsResponse[acceptedDeployments=$acceptedDeployments, rejectedDeployments=$rejectedDeployments, unknownIssueKeys=$unknownIssueKeys, unknownAssociations=$unknownAssociations]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'acceptedDeployments'] = this.acceptedDeployments;
      json[r'rejectedDeployments'] = this.rejectedDeployments;
      json[r'unknownIssueKeys'] = this.unknownIssueKeys;
      json[r'unknownAssociations'] = this.unknownAssociations;
    return json;
  }

  /// Returns a new [SubmitDeploymentsResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SubmitDeploymentsResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return SubmitDeploymentsResponse(
        acceptedDeployments: DeploymentKey.listFromJson(json[r'acceptedDeployments']),
        rejectedDeployments: RejectedDeployment.listFromJson(json[r'rejectedDeployments']),
        unknownIssueKeys: json[r'unknownIssueKeys'] is Iterable
            ? (json[r'unknownIssueKeys'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        unknownAssociations: DeploymentDataAssociationsInner.listFromJson(json[r'unknownAssociations']),
      );
    }
    return null;
  }

  static List<SubmitDeploymentsResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SubmitDeploymentsResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SubmitDeploymentsResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SubmitDeploymentsResponse> mapFromJson(dynamic json) {
    final map = <String, SubmitDeploymentsResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SubmitDeploymentsResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SubmitDeploymentsResponse-objects as value to a dart map
  static Map<String, List<SubmitDeploymentsResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SubmitDeploymentsResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SubmitDeploymentsResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

