//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SubmitVulnerabilitiesRequest {
  /// Returns a new [SubmitVulnerabilitiesRequest] instance.
  SubmitVulnerabilitiesRequest({
    this.operationType,
    this.properties = const {},
    this.vulnerabilities = const [],
    this.providerMetadata,
  });

  /// Indicates the operation being performed by the provider system when sending this data. \"NORMAL\" - Data received during real-time, user-triggered actions (e.g. user closed or updated a vulnerability). \"SCAN\" - Data sent through some automated process (e.g. some periodically scheduled repository scan). \"BACKFILL\" - Data received while backfilling existing data (e.g. pushing historical vulnerabilities when re-connect a workspace). Default is \"NORMAL\". \"NORMAL\" traffic has higher priority but tighter rate limits, \"SCAN\" traffic has medium priority and looser limits, \"BACKFILL\" has lower priority and much looser limits 
  SubmitVulnerabilitiesRequestOperationTypeEnum? operationType;

  /// Properties assigned to vulnerability data that can then be used for delete / query operations.  Examples might be an account or user ID that can then be used to clean up data if an account is removed from the Provider system.  Properties are supplied as key/value pairs, and a maximum of 5 properties can be supplied, keys cannot contain ':' or start with '_'. 
  Map<String, String> properties;

  List<VulnerabilityDetails> vulnerabilities;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProviderMetadata? providerMetadata;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SubmitVulnerabilitiesRequest &&
    other.operationType == operationType &&
    _deepEquality.equals(other.properties, properties) &&
    _deepEquality.equals(other.vulnerabilities, vulnerabilities) &&
    other.providerMetadata == providerMetadata;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (operationType == null ? 0 : operationType!.hashCode) +
    (properties.hashCode) +
    (vulnerabilities.hashCode) +
    (providerMetadata == null ? 0 : providerMetadata!.hashCode);

  @override
  String toString() => 'SubmitVulnerabilitiesRequest[operationType=$operationType, properties=$properties, vulnerabilities=$vulnerabilities, providerMetadata=$providerMetadata]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.operationType != null) {
      json[r'operationType'] = this.operationType;
    } else {
      json[r'operationType'] = null;
    }
      json[r'properties'] = this.properties;
      json[r'vulnerabilities'] = this.vulnerabilities;
    if (this.providerMetadata != null) {
      json[r'providerMetadata'] = this.providerMetadata;
    } else {
      json[r'providerMetadata'] = null;
    }
    return json;
  }

  /// Returns a new [SubmitVulnerabilitiesRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SubmitVulnerabilitiesRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'vulnerabilities'), 'Required key "SubmitVulnerabilitiesRequest[vulnerabilities]" is missing from JSON.');
        assert(json[r'vulnerabilities'] != null, 'Required key "SubmitVulnerabilitiesRequest[vulnerabilities]" has a null value in JSON.');
        return true;
      }());

      return SubmitVulnerabilitiesRequest(
        operationType: SubmitVulnerabilitiesRequestOperationTypeEnum.fromJson(json[r'operationType']),
        properties: mapCastOfType<String, String>(json, r'properties') ?? const {},
        vulnerabilities: VulnerabilityDetails.listFromJson(json[r'vulnerabilities']),
        providerMetadata: ProviderMetadata.fromJson(json[r'providerMetadata']),
      );
    }
    return null;
  }

  static List<SubmitVulnerabilitiesRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SubmitVulnerabilitiesRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SubmitVulnerabilitiesRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SubmitVulnerabilitiesRequest> mapFromJson(dynamic json) {
    final map = <String, SubmitVulnerabilitiesRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SubmitVulnerabilitiesRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SubmitVulnerabilitiesRequest-objects as value to a dart map
  static Map<String, List<SubmitVulnerabilitiesRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SubmitVulnerabilitiesRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SubmitVulnerabilitiesRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'vulnerabilities',
  };
}

/// Indicates the operation being performed by the provider system when sending this data. \"NORMAL\" - Data received during real-time, user-triggered actions (e.g. user closed or updated a vulnerability). \"SCAN\" - Data sent through some automated process (e.g. some periodically scheduled repository scan). \"BACKFILL\" - Data received while backfilling existing data (e.g. pushing historical vulnerabilities when re-connect a workspace). Default is \"NORMAL\". \"NORMAL\" traffic has higher priority but tighter rate limits, \"SCAN\" traffic has medium priority and looser limits, \"BACKFILL\" has lower priority and much looser limits 
enum SubmitVulnerabilitiesRequestOperationTypeEnum {
  NORMAL._(r'NORMAL'),
  SCAN._(r'SCAN'),
  BACKFILL._(r'BACKFILL'),
  ;

  /// Instantiate a new enum with the provided value.
  const SubmitVulnerabilitiesRequestOperationTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [SubmitVulnerabilitiesRequestOperationTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static SubmitVulnerabilitiesRequestOperationTypeEnum? fromJson(dynamic value) => SubmitVulnerabilitiesRequestOperationTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [SubmitVulnerabilitiesRequestOperationTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<SubmitVulnerabilitiesRequestOperationTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SubmitVulnerabilitiesRequestOperationTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SubmitVulnerabilitiesRequestOperationTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SubmitVulnerabilitiesRequestOperationTypeEnum] to String,
/// and [decode] dynamic data back to [SubmitVulnerabilitiesRequestOperationTypeEnum].
class SubmitVulnerabilitiesRequestOperationTypeEnumTypeTransformer {
  factory SubmitVulnerabilitiesRequestOperationTypeEnumTypeTransformer() => _instance ??= const SubmitVulnerabilitiesRequestOperationTypeEnumTypeTransformer._();

  const SubmitVulnerabilitiesRequestOperationTypeEnumTypeTransformer._();

  String encode(SubmitVulnerabilitiesRequestOperationTypeEnum data) => data._value;

  /// Returns the instance of [SubmitVulnerabilitiesRequestOperationTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SubmitVulnerabilitiesRequestOperationTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is SubmitVulnerabilitiesRequestOperationTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'NORMAL': return SubmitVulnerabilitiesRequestOperationTypeEnum.NORMAL;
        case r'SCAN': return SubmitVulnerabilitiesRequestOperationTypeEnum.SCAN;
        case r'BACKFILL': return SubmitVulnerabilitiesRequestOperationTypeEnum.BACKFILL;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static SubmitVulnerabilitiesRequestOperationTypeEnumTypeTransformer? _instance;
}


