//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RedactionJobStatusResponse {
  /// Returns a new [RedactionJobStatusResponse] instance.
  RedactionJobStatusResponse({
    this.bulkRedactionResponse,
    this.jobStatus,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  BulkRedactionResponse? bulkRedactionResponse;

  RedactionJobStatusResponseJobStatusEnum? jobStatus;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RedactionJobStatusResponse &&
    other.bulkRedactionResponse == bulkRedactionResponse &&
    other.jobStatus == jobStatus;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (bulkRedactionResponse == null ? 0 : bulkRedactionResponse!.hashCode) +
    (jobStatus == null ? 0 : jobStatus!.hashCode);

  @override
  String toString() => 'RedactionJobStatusResponse[bulkRedactionResponse=$bulkRedactionResponse, jobStatus=$jobStatus]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.bulkRedactionResponse != null) {
      json[r'bulkRedactionResponse'] = this.bulkRedactionResponse;
    } else {
      json[r'bulkRedactionResponse'] = null;
    }
    if (this.jobStatus != null) {
      json[r'jobStatus'] = this.jobStatus;
    } else {
      json[r'jobStatus'] = null;
    }
    return json;
  }

  /// Returns a new [RedactionJobStatusResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RedactionJobStatusResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return RedactionJobStatusResponse(
        bulkRedactionResponse: BulkRedactionResponse.fromJson(json[r'bulkRedactionResponse']),
        jobStatus: RedactionJobStatusResponseJobStatusEnum.fromJson(json[r'jobStatus']),
      );
    }
    return null;
  }

  static List<RedactionJobStatusResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RedactionJobStatusResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RedactionJobStatusResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RedactionJobStatusResponse> mapFromJson(dynamic json) {
    final map = <String, RedactionJobStatusResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RedactionJobStatusResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RedactionJobStatusResponse-objects as value to a dart map
  static Map<String, List<RedactionJobStatusResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RedactionJobStatusResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RedactionJobStatusResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


enum RedactionJobStatusResponseJobStatusEnum {
  PENDING._(r'PENDING'),
  IN_PROGRESS._(r'IN_PROGRESS'),
  COMPLETED._(r'COMPLETED'),
  ;

  /// Instantiate a new enum with the provided value.
  const RedactionJobStatusResponseJobStatusEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [RedactionJobStatusResponseJobStatusEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static RedactionJobStatusResponseJobStatusEnum? fromJson(dynamic value) => RedactionJobStatusResponseJobStatusEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [RedactionJobStatusResponseJobStatusEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<RedactionJobStatusResponseJobStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RedactionJobStatusResponseJobStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RedactionJobStatusResponseJobStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [RedactionJobStatusResponseJobStatusEnum] to String,
/// and [decode] dynamic data back to [RedactionJobStatusResponseJobStatusEnum].
class RedactionJobStatusResponseJobStatusEnumTypeTransformer {
  factory RedactionJobStatusResponseJobStatusEnumTypeTransformer() => _instance ??= const RedactionJobStatusResponseJobStatusEnumTypeTransformer._();

  const RedactionJobStatusResponseJobStatusEnumTypeTransformer._();

  String encode(RedactionJobStatusResponseJobStatusEnum data) => data._value;

  /// Returns the instance of [RedactionJobStatusResponseJobStatusEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  RedactionJobStatusResponseJobStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is RedactionJobStatusResponseJobStatusEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'PENDING': return RedactionJobStatusResponseJobStatusEnum.PENDING;
        case r'IN_PROGRESS': return RedactionJobStatusResponseJobStatusEnum.IN_PROGRESS;
        case r'COMPLETED': return RedactionJobStatusResponseJobStatusEnum.COMPLETED;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static RedactionJobStatusResponseJobStatusEnumTypeTransformer? _instance;
}


