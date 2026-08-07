//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BulkOperationProgress {
  /// Returns a new [BulkOperationProgress] instance.
  BulkOperationProgress({
    this.created,
    this.failedAccessibleIssues = const {},
    this.invalidOrInaccessibleIssueCount,
    this.processedAccessibleIssues = const [],
    this.progressPercent,
    this.started,
    this.status,
    this.submittedBy,
    this.taskId,
    this.totalIssueCount,
    this.updated,
  });

  /// A timestamp of when the task was submitted.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? created;

  /// Map of issue IDs for which the operation failed and that the user has permission to view, to their one or more reasons for failure. These reasons are open-ended text descriptions of the error and are not selected from a predefined list of standard reasons.
  Map<String, List<String>> failedAccessibleIssues;

  /// The number of issues that are either invalid or issues that the user doesn't have permission to view, regardless of the success or failure of the operation.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? invalidOrInaccessibleIssueCount;

  /// List of issue IDs for which the operation was successful and that the user has permission to view.
  List<int> processedAccessibleIssues;

  /// Progress of the task as a percentage.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? progressPercent;

  /// A timestamp of when the task was started.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? started;

  /// The status of the task.
  BulkOperationProgressStatusEnum? status;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  User? submittedBy;

  /// The ID of the task.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? taskId;

  /// The number of issues that the bulk operation was attempted on.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? totalIssueCount;

  /// A timestamp of when the task progress was last updated.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? updated;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BulkOperationProgress &&
    other.created == created &&
    _deepEquality.equals(other.failedAccessibleIssues, failedAccessibleIssues) &&
    other.invalidOrInaccessibleIssueCount == invalidOrInaccessibleIssueCount &&
    _deepEquality.equals(other.processedAccessibleIssues, processedAccessibleIssues) &&
    other.progressPercent == progressPercent &&
    other.started == started &&
    other.status == status &&
    other.submittedBy == submittedBy &&
    other.taskId == taskId &&
    other.totalIssueCount == totalIssueCount &&
    other.updated == updated;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (created == null ? 0 : created!.hashCode) +
    (failedAccessibleIssues.hashCode) +
    (invalidOrInaccessibleIssueCount == null ? 0 : invalidOrInaccessibleIssueCount!.hashCode) +
    (processedAccessibleIssues.hashCode) +
    (progressPercent == null ? 0 : progressPercent!.hashCode) +
    (started == null ? 0 : started!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (submittedBy == null ? 0 : submittedBy!.hashCode) +
    (taskId == null ? 0 : taskId!.hashCode) +
    (totalIssueCount == null ? 0 : totalIssueCount!.hashCode) +
    (updated == null ? 0 : updated!.hashCode);

  @override
  String toString() => 'BulkOperationProgress[created=$created, failedAccessibleIssues=$failedAccessibleIssues, invalidOrInaccessibleIssueCount=$invalidOrInaccessibleIssueCount, processedAccessibleIssues=$processedAccessibleIssues, progressPercent=$progressPercent, started=$started, status=$status, submittedBy=$submittedBy, taskId=$taskId, totalIssueCount=$totalIssueCount, updated=$updated]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.created != null) {
      json[r'created'] = this.created!.toUtc().toIso8601String();
    } else {
      json[r'created'] = null;
    }
      json[r'failedAccessibleIssues'] = this.failedAccessibleIssues;
    if (this.invalidOrInaccessibleIssueCount != null) {
      json[r'invalidOrInaccessibleIssueCount'] = this.invalidOrInaccessibleIssueCount;
    } else {
      json[r'invalidOrInaccessibleIssueCount'] = null;
    }
      json[r'processedAccessibleIssues'] = this.processedAccessibleIssues;
    if (this.progressPercent != null) {
      json[r'progressPercent'] = this.progressPercent;
    } else {
      json[r'progressPercent'] = null;
    }
    if (this.started != null) {
      json[r'started'] = this.started!.toUtc().toIso8601String();
    } else {
      json[r'started'] = null;
    }
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    if (this.submittedBy != null) {
      json[r'submittedBy'] = this.submittedBy;
    } else {
      json[r'submittedBy'] = null;
    }
    if (this.taskId != null) {
      json[r'taskId'] = this.taskId;
    } else {
      json[r'taskId'] = null;
    }
    if (this.totalIssueCount != null) {
      json[r'totalIssueCount'] = this.totalIssueCount;
    } else {
      json[r'totalIssueCount'] = null;
    }
    if (this.updated != null) {
      json[r'updated'] = this.updated!.toUtc().toIso8601String();
    } else {
      json[r'updated'] = null;
    }
    return json;
  }

  /// Returns a new [BulkOperationProgress] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BulkOperationProgress? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return BulkOperationProgress(
        created: mapDateTime(json, r'created', r''),
        failedAccessibleIssues: json[r'failedAccessibleIssues'] == null
          ? const {}
            : (json[r'failedAccessibleIssues'] as Map<String, dynamic>).map((k, v) => MapEntry(k, v == null ? const <String>[] : (v as List).map((value) => value as String).toList(growable: false))),
        invalidOrInaccessibleIssueCount: mapValueOfType<int>(json, r'invalidOrInaccessibleIssueCount'),
        processedAccessibleIssues: json[r'processedAccessibleIssues'] is Iterable
            ? (json[r'processedAccessibleIssues'] as Iterable).cast<int>().toList(growable: false)
            : const [],
        progressPercent: mapValueOfType<int>(json, r'progressPercent'),
        started: mapDateTime(json, r'started', r''),
        status: BulkOperationProgressStatusEnum.fromJson(json[r'status']),
        submittedBy: User.fromJson(json[r'submittedBy']),
        taskId: mapValueOfType<String>(json, r'taskId'),
        totalIssueCount: mapValueOfType<int>(json, r'totalIssueCount'),
        updated: mapDateTime(json, r'updated', r''),
      );
    }
    return null;
  }

  static List<BulkOperationProgress> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BulkOperationProgress>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BulkOperationProgress.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BulkOperationProgress> mapFromJson(dynamic json) {
    final map = <String, BulkOperationProgress>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BulkOperationProgress.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BulkOperationProgress-objects as value to a dart map
  static Map<String, List<BulkOperationProgress>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BulkOperationProgress>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BulkOperationProgress.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The status of the task.
enum BulkOperationProgressStatusEnum {
  ENQUEUED._(r'ENQUEUED'),
  RUNNING._(r'RUNNING'),
  COMPLETE._(r'COMPLETE'),
  FAILED._(r'FAILED'),
  CANCEL_REQUESTED._(r'CANCEL_REQUESTED'),
  CANCELLED._(r'CANCELLED'),
  DEAD._(r'DEAD'),
  ;

  /// Instantiate a new enum with the provided value.
  const BulkOperationProgressStatusEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [BulkOperationProgressStatusEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static BulkOperationProgressStatusEnum? fromJson(dynamic value) => BulkOperationProgressStatusEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [BulkOperationProgressStatusEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<BulkOperationProgressStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BulkOperationProgressStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BulkOperationProgressStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [BulkOperationProgressStatusEnum] to String,
/// and [decode] dynamic data back to [BulkOperationProgressStatusEnum].
class BulkOperationProgressStatusEnumTypeTransformer {
  factory BulkOperationProgressStatusEnumTypeTransformer() => _instance ??= const BulkOperationProgressStatusEnumTypeTransformer._();

  const BulkOperationProgressStatusEnumTypeTransformer._();

  String encode(BulkOperationProgressStatusEnum data) => data._value;

  /// Returns the instance of [BulkOperationProgressStatusEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  BulkOperationProgressStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is BulkOperationProgressStatusEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'ENQUEUED': return BulkOperationProgressStatusEnum.ENQUEUED;
        case r'RUNNING': return BulkOperationProgressStatusEnum.RUNNING;
        case r'COMPLETE': return BulkOperationProgressStatusEnum.COMPLETE;
        case r'FAILED': return BulkOperationProgressStatusEnum.FAILED;
        case r'CANCEL_REQUESTED': return BulkOperationProgressStatusEnum.CANCEL_REQUESTED;
        case r'CANCELLED': return BulkOperationProgressStatusEnum.CANCELLED;
        case r'DEAD': return BulkOperationProgressStatusEnum.DEAD;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static BulkOperationProgressStatusEnumTypeTransformer? _instance;
}


