//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SubmitDeploymentsResponse1 {
  /// Returns a new [SubmitDeploymentsResponse1] instance.
  SubmitDeploymentsResponse1({
    this.deploymentSequenceNumber,
    this.pipelineId,
    this.environmentId,
    this.updatedTimestamp,
    this.gatingStatus,
    this.details = const [],
  });

  /// This is the identifier for the Deployment. 
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? deploymentSequenceNumber;

  /// The ID of the Deployment's pipeline. 
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? pipelineId;

  /// The ID of the Deployment's environment. 
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? environmentId;

  /// Time the deployment gating status was updated. 
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? updatedTimestamp;

  /// The gating status 
  SubmitDeploymentsResponse1GatingStatusEnum? gatingStatus;

  List<SubmitDeploymentsResponse1DetailsInner> details;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SubmitDeploymentsResponse1 &&
    other.deploymentSequenceNumber == deploymentSequenceNumber &&
    other.pipelineId == pipelineId &&
    other.environmentId == environmentId &&
    other.updatedTimestamp == updatedTimestamp &&
    other.gatingStatus == gatingStatus &&
    _deepEquality.equals(other.details, details);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (deploymentSequenceNumber == null ? 0 : deploymentSequenceNumber!.hashCode) +
    (pipelineId == null ? 0 : pipelineId!.hashCode) +
    (environmentId == null ? 0 : environmentId!.hashCode) +
    (updatedTimestamp == null ? 0 : updatedTimestamp!.hashCode) +
    (gatingStatus == null ? 0 : gatingStatus!.hashCode) +
    (details.hashCode);

  @override
  String toString() => 'SubmitDeploymentsResponse1[deploymentSequenceNumber=$deploymentSequenceNumber, pipelineId=$pipelineId, environmentId=$environmentId, updatedTimestamp=$updatedTimestamp, gatingStatus=$gatingStatus, details=$details]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.deploymentSequenceNumber != null) {
      json[r'deploymentSequenceNumber'] = this.deploymentSequenceNumber;
    } else {
      json[r'deploymentSequenceNumber'] = null;
    }
    if (this.pipelineId != null) {
      json[r'pipelineId'] = this.pipelineId;
    } else {
      json[r'pipelineId'] = null;
    }
    if (this.environmentId != null) {
      json[r'environmentId'] = this.environmentId;
    } else {
      json[r'environmentId'] = null;
    }
    if (this.updatedTimestamp != null) {
      json[r'updatedTimestamp'] = this.updatedTimestamp!.toUtc().toIso8601String();
    } else {
      json[r'updatedTimestamp'] = null;
    }
    if (this.gatingStatus != null) {
      json[r'gatingStatus'] = this.gatingStatus;
    } else {
      json[r'gatingStatus'] = null;
    }
      json[r'details'] = this.details;
    return json;
  }

  /// Returns a new [SubmitDeploymentsResponse1] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SubmitDeploymentsResponse1? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return SubmitDeploymentsResponse1(
        deploymentSequenceNumber: mapValueOfType<int>(json, r'deploymentSequenceNumber'),
        pipelineId: mapValueOfType<String>(json, r'pipelineId'),
        environmentId: mapValueOfType<String>(json, r'environmentId'),
        updatedTimestamp: mapDateTime(json, r'updatedTimestamp', r''),
        gatingStatus: SubmitDeploymentsResponse1GatingStatusEnum.fromJson(json[r'gatingStatus']),
        details: SubmitDeploymentsResponse1DetailsInner.listFromJson(json[r'details']),
      );
    }
    return null;
  }

  static List<SubmitDeploymentsResponse1> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SubmitDeploymentsResponse1>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SubmitDeploymentsResponse1.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SubmitDeploymentsResponse1> mapFromJson(dynamic json) {
    final map = <String, SubmitDeploymentsResponse1>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SubmitDeploymentsResponse1.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SubmitDeploymentsResponse1-objects as value to a dart map
  static Map<String, List<SubmitDeploymentsResponse1>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SubmitDeploymentsResponse1>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SubmitDeploymentsResponse1.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The gating status 
enum SubmitDeploymentsResponse1GatingStatusEnum {
  allowed._(r'allowed'),
  prevented._(r'prevented'),
  awaiting._(r'awaiting'),
  invalid._(r'invalid'),
  ;

  /// Instantiate a new enum with the provided value.
  const SubmitDeploymentsResponse1GatingStatusEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [SubmitDeploymentsResponse1GatingStatusEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static SubmitDeploymentsResponse1GatingStatusEnum? fromJson(dynamic value) => SubmitDeploymentsResponse1GatingStatusEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [SubmitDeploymentsResponse1GatingStatusEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<SubmitDeploymentsResponse1GatingStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SubmitDeploymentsResponse1GatingStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SubmitDeploymentsResponse1GatingStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SubmitDeploymentsResponse1GatingStatusEnum] to String,
/// and [decode] dynamic data back to [SubmitDeploymentsResponse1GatingStatusEnum].
class SubmitDeploymentsResponse1GatingStatusEnumTypeTransformer {
  factory SubmitDeploymentsResponse1GatingStatusEnumTypeTransformer() => _instance ??= const SubmitDeploymentsResponse1GatingStatusEnumTypeTransformer._();

  const SubmitDeploymentsResponse1GatingStatusEnumTypeTransformer._();

  String encode(SubmitDeploymentsResponse1GatingStatusEnum data) => data._value;

  /// Returns the instance of [SubmitDeploymentsResponse1GatingStatusEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SubmitDeploymentsResponse1GatingStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is SubmitDeploymentsResponse1GatingStatusEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'allowed': return SubmitDeploymentsResponse1GatingStatusEnum.allowed;
        case r'prevented': return SubmitDeploymentsResponse1GatingStatusEnum.prevented;
        case r'awaiting': return SubmitDeploymentsResponse1GatingStatusEnum.awaiting;
        case r'invalid': return SubmitDeploymentsResponse1GatingStatusEnum.invalid;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static SubmitDeploymentsResponse1GatingStatusEnumTypeTransformer? _instance;
}


