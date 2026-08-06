//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DeploymentKey {
  /// Returns a new [DeploymentKey] instance.
  DeploymentKey({
    required this.pipelineId,
    required this.environmentId,
    required this.deploymentSequenceNumber,
  });

  /// The identifier of a pipeline, must be unique for the provider. 
  String pipelineId;

  /// The identifier of an environment, must be unique for the provider so that it can be shared across pipelines. 
  String environmentId;

  /// This is the identifier for the deployment. It must be unique for the specified pipeline and environment. It must be a monotonically increasing number, as this is used to sequence the deployments. 
  int deploymentSequenceNumber;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DeploymentKey &&
    other.pipelineId == pipelineId &&
    other.environmentId == environmentId &&
    other.deploymentSequenceNumber == deploymentSequenceNumber;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (pipelineId.hashCode) +
    (environmentId.hashCode) +
    (deploymentSequenceNumber.hashCode);

  @override
  String toString() => 'DeploymentKey[pipelineId=$pipelineId, environmentId=$environmentId, deploymentSequenceNumber=$deploymentSequenceNumber]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'pipelineId'] = this.pipelineId;
      json[r'environmentId'] = this.environmentId;
      json[r'deploymentSequenceNumber'] = this.deploymentSequenceNumber;
    return json;
  }

  /// Returns a new [DeploymentKey] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DeploymentKey? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'pipelineId'), 'Required key "DeploymentKey[pipelineId]" is missing from JSON.');
        assert(json[r'pipelineId'] != null, 'Required key "DeploymentKey[pipelineId]" has a null value in JSON.');
        assert(json.containsKey(r'environmentId'), 'Required key "DeploymentKey[environmentId]" is missing from JSON.');
        assert(json[r'environmentId'] != null, 'Required key "DeploymentKey[environmentId]" has a null value in JSON.');
        assert(json.containsKey(r'deploymentSequenceNumber'), 'Required key "DeploymentKey[deploymentSequenceNumber]" is missing from JSON.');
        assert(json[r'deploymentSequenceNumber'] != null, 'Required key "DeploymentKey[deploymentSequenceNumber]" has a null value in JSON.');
        return true;
      }());

      return DeploymentKey(
        pipelineId: mapValueOfType<String>(json, r'pipelineId')!,
        environmentId: mapValueOfType<String>(json, r'environmentId')!,
        deploymentSequenceNumber: mapValueOfType<int>(json, r'deploymentSequenceNumber')!,
      );
    }
    return null;
  }

  static List<DeploymentKey> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DeploymentKey>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DeploymentKey.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DeploymentKey> mapFromJson(dynamic json) {
    final map = <String, DeploymentKey>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DeploymentKey.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DeploymentKey-objects as value to a dart map
  static Map<String, List<DeploymentKey>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<DeploymentKey>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DeploymentKey.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'pipelineId',
    'environmentId',
    'deploymentSequenceNumber',
  };
}

