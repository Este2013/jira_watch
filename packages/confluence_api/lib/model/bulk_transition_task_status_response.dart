//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BulkTransitionTaskStatusResponse {
  /// Returns a new [BulkTransitionTaskStatusResponse] instance.
  BulkTransitionTaskStatusResponse({
    required this.taskId,
    required this.status,
    this.errorMessage,
  });

  /// The ID of the task.
  String taskId;

  /// The current status of the task.
  BulkTransitionTaskStatusResponseStatusEnum status;

  /// Human-readable error message describing why the task failed. Only present when status is FAILED.
  String? errorMessage;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BulkTransitionTaskStatusResponse &&
    other.taskId == taskId &&
    other.status == status &&
    other.errorMessage == errorMessage;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (taskId.hashCode) +
    (status.hashCode) +
    (errorMessage == null ? 0 : errorMessage!.hashCode);

  @override
  String toString() => 'BulkTransitionTaskStatusResponse[taskId=$taskId, status=$status, errorMessage=$errorMessage]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'taskId'] = this.taskId;
      json[r'status'] = this.status;
    if (this.errorMessage != null) {
      json[r'errorMessage'] = this.errorMessage;
    } else {
      json[r'errorMessage'] = null;
    }
    return json;
  }

  /// Returns a new [BulkTransitionTaskStatusResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BulkTransitionTaskStatusResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'taskId'), 'Required key "BulkTransitionTaskStatusResponse[taskId]" is missing from JSON.');
        assert(json[r'taskId'] != null, 'Required key "BulkTransitionTaskStatusResponse[taskId]" has a null value in JSON.');
        assert(json.containsKey(r'status'), 'Required key "BulkTransitionTaskStatusResponse[status]" is missing from JSON.');
        assert(json[r'status'] != null, 'Required key "BulkTransitionTaskStatusResponse[status]" has a null value in JSON.');
        return true;
      }());

      return BulkTransitionTaskStatusResponse(
        taskId: mapValueOfType<String>(json, r'taskId')!,
        status: BulkTransitionTaskStatusResponseStatusEnum.fromJson(json[r'status'])!,
        errorMessage: mapValueOfType<String>(json, r'errorMessage'),
      );
    }
    return null;
  }

  static List<BulkTransitionTaskStatusResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BulkTransitionTaskStatusResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BulkTransitionTaskStatusResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BulkTransitionTaskStatusResponse> mapFromJson(dynamic json) {
    final map = <String, BulkTransitionTaskStatusResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BulkTransitionTaskStatusResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BulkTransitionTaskStatusResponse-objects as value to a dart map
  static Map<String, List<BulkTransitionTaskStatusResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BulkTransitionTaskStatusResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BulkTransitionTaskStatusResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'taskId',
    'status',
  };
}

/// The current status of the task.
enum BulkTransitionTaskStatusResponseStatusEnum {
  IN_PROGRESS._(r'IN_PROGRESS'),
  COMPLETED._(r'COMPLETED'),
  FAILED._(r'FAILED'),
  ;

  /// Instantiate a new enum with the provided value.
  const BulkTransitionTaskStatusResponseStatusEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [BulkTransitionTaskStatusResponseStatusEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static BulkTransitionTaskStatusResponseStatusEnum? fromJson(dynamic value) => BulkTransitionTaskStatusResponseStatusEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [BulkTransitionTaskStatusResponseStatusEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<BulkTransitionTaskStatusResponseStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BulkTransitionTaskStatusResponseStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BulkTransitionTaskStatusResponseStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [BulkTransitionTaskStatusResponseStatusEnum] to String,
/// and [decode] dynamic data back to [BulkTransitionTaskStatusResponseStatusEnum].
class BulkTransitionTaskStatusResponseStatusEnumTypeTransformer {
  factory BulkTransitionTaskStatusResponseStatusEnumTypeTransformer() => _instance ??= const BulkTransitionTaskStatusResponseStatusEnumTypeTransformer._();

  const BulkTransitionTaskStatusResponseStatusEnumTypeTransformer._();

  String encode(BulkTransitionTaskStatusResponseStatusEnum data) => data._value;

  /// Returns the instance of [BulkTransitionTaskStatusResponseStatusEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  BulkTransitionTaskStatusResponseStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is BulkTransitionTaskStatusResponseStatusEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'IN_PROGRESS': return BulkTransitionTaskStatusResponseStatusEnum.IN_PROGRESS;
        case r'COMPLETED': return BulkTransitionTaskStatusResponseStatusEnum.COMPLETED;
        case r'FAILED': return BulkTransitionTaskStatusResponseStatusEnum.FAILED;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static BulkTransitionTaskStatusResponseStatusEnumTypeTransformer? _instance;
}


