//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BulkTransitionTaskResponse {
  /// Returns a new [BulkTransitionTaskResponse] instance.
  BulkTransitionTaskResponse({
    required this.taskId,
    required this.status,
    required this.statusUrl,
  });

  /// The ID of the async task.
  String taskId;

  /// The current status of the task.
  BulkTransitionTaskResponseStatusEnum status;

  /// URL to poll for task progress.
  String statusUrl;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BulkTransitionTaskResponse &&
    other.taskId == taskId &&
    other.status == status &&
    other.statusUrl == statusUrl;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (taskId.hashCode) +
    (status.hashCode) +
    (statusUrl.hashCode);

  @override
  String toString() => 'BulkTransitionTaskResponse[taskId=$taskId, status=$status, statusUrl=$statusUrl]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'taskId'] = this.taskId;
      json[r'status'] = this.status;
      json[r'statusUrl'] = this.statusUrl;
    return json;
  }

  /// Returns a new [BulkTransitionTaskResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BulkTransitionTaskResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'taskId'), 'Required key "BulkTransitionTaskResponse[taskId]" is missing from JSON.');
        assert(json[r'taskId'] != null, 'Required key "BulkTransitionTaskResponse[taskId]" has a null value in JSON.');
        assert(json.containsKey(r'status'), 'Required key "BulkTransitionTaskResponse[status]" is missing from JSON.');
        assert(json[r'status'] != null, 'Required key "BulkTransitionTaskResponse[status]" has a null value in JSON.');
        assert(json.containsKey(r'statusUrl'), 'Required key "BulkTransitionTaskResponse[statusUrl]" is missing from JSON.');
        assert(json[r'statusUrl'] != null, 'Required key "BulkTransitionTaskResponse[statusUrl]" has a null value in JSON.');
        return true;
      }());

      return BulkTransitionTaskResponse(
        taskId: mapValueOfType<String>(json, r'taskId')!,
        status: BulkTransitionTaskResponseStatusEnum.fromJson(json[r'status'])!,
        statusUrl: mapValueOfType<String>(json, r'statusUrl')!,
      );
    }
    return null;
  }

  static List<BulkTransitionTaskResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BulkTransitionTaskResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BulkTransitionTaskResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BulkTransitionTaskResponse> mapFromJson(dynamic json) {
    final map = <String, BulkTransitionTaskResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BulkTransitionTaskResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BulkTransitionTaskResponse-objects as value to a dart map
  static Map<String, List<BulkTransitionTaskResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BulkTransitionTaskResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BulkTransitionTaskResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'taskId',
    'status',
    'statusUrl',
  };
}

/// The current status of the task.
enum BulkTransitionTaskResponseStatusEnum {
  IN_PROGRESS._(r'IN_PROGRESS'),
  COMPLETED._(r'COMPLETED'),
  FAILED._(r'FAILED'),
  ;

  /// Instantiate a new enum with the provided value.
  const BulkTransitionTaskResponseStatusEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [BulkTransitionTaskResponseStatusEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static BulkTransitionTaskResponseStatusEnum? fromJson(dynamic value) => BulkTransitionTaskResponseStatusEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [BulkTransitionTaskResponseStatusEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<BulkTransitionTaskResponseStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BulkTransitionTaskResponseStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BulkTransitionTaskResponseStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [BulkTransitionTaskResponseStatusEnum] to String,
/// and [decode] dynamic data back to [BulkTransitionTaskResponseStatusEnum].
class BulkTransitionTaskResponseStatusEnumTypeTransformer {
  factory BulkTransitionTaskResponseStatusEnumTypeTransformer() => _instance ??= const BulkTransitionTaskResponseStatusEnumTypeTransformer._();

  const BulkTransitionTaskResponseStatusEnumTypeTransformer._();

  String encode(BulkTransitionTaskResponseStatusEnum data) => data._value;

  /// Returns the instance of [BulkTransitionTaskResponseStatusEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  BulkTransitionTaskResponseStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is BulkTransitionTaskResponseStatusEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'IN_PROGRESS': return BulkTransitionTaskResponseStatusEnum.IN_PROGRESS;
        case r'COMPLETED': return BulkTransitionTaskResponseStatusEnum.COMPLETED;
        case r'FAILED': return BulkTransitionTaskResponseStatusEnum.FAILED;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static BulkTransitionTaskResponseStatusEnumTypeTransformer? _instance;
}


