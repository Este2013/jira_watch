//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TaskProgressBeanRemoveOptionFromIssuesResult {
  /// Returns a new [TaskProgressBeanRemoveOptionFromIssuesResult] instance.
  TaskProgressBeanRemoveOptionFromIssuesResult({
    this.description,
    required this.elapsedRuntime,
    this.finished,
    required this.id,
    required this.lastUpdate,
    this.message,
    required this.progress,
    this.result,
    required this.self,
    this.started,
    required this.status,
    required this.submitted,
    required this.submittedBy,
  });

  /// The description of the task.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The execution time of the task, in milliseconds.
  int elapsedRuntime;

  /// A timestamp recording when the task was finished.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? finished;

  /// The ID of the task.
  String id;

  /// A timestamp recording when the task progress was last updated.
  int lastUpdate;

  /// Information about the progress of the task.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

  /// The progress of the task, as a percentage complete.
  int progress;

  /// The result of the task execution.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  RemoveOptionFromIssuesResult? result;

  /// The URL of the task.
  String self;

  /// A timestamp recording when the task was started.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? started;

  /// The status of the task.
  TaskProgressBeanRemoveOptionFromIssuesResultStatusEnum status;

  /// A timestamp recording when the task was submitted.
  int submitted;

  /// The ID of the user who submitted the task.
  int submittedBy;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TaskProgressBeanRemoveOptionFromIssuesResult &&
    other.description == description &&
    other.elapsedRuntime == elapsedRuntime &&
    other.finished == finished &&
    other.id == id &&
    other.lastUpdate == lastUpdate &&
    other.message == message &&
    other.progress == progress &&
    other.result == result &&
    other.self == self &&
    other.started == started &&
    other.status == status &&
    other.submitted == submitted &&
    other.submittedBy == submittedBy;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (elapsedRuntime.hashCode) +
    (finished == null ? 0 : finished!.hashCode) +
    (id.hashCode) +
    (lastUpdate.hashCode) +
    (message == null ? 0 : message!.hashCode) +
    (progress.hashCode) +
    (result == null ? 0 : result!.hashCode) +
    (self.hashCode) +
    (started == null ? 0 : started!.hashCode) +
    (status.hashCode) +
    (submitted.hashCode) +
    (submittedBy.hashCode);

  @override
  String toString() => 'TaskProgressBeanRemoveOptionFromIssuesResult[description=$description, elapsedRuntime=$elapsedRuntime, finished=$finished, id=$id, lastUpdate=$lastUpdate, message=$message, progress=$progress, result=$result, self=$self, started=$started, status=$status, submitted=$submitted, submittedBy=$submittedBy]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
      json[r'elapsedRuntime'] = this.elapsedRuntime;
    if (this.finished != null) {
      json[r'finished'] = this.finished;
    } else {
      json[r'finished'] = null;
    }
      json[r'id'] = this.id;
      json[r'lastUpdate'] = this.lastUpdate;
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
      json[r'progress'] = this.progress;
    if (this.result != null) {
      json[r'result'] = this.result;
    } else {
      json[r'result'] = null;
    }
      json[r'self'] = this.self;
    if (this.started != null) {
      json[r'started'] = this.started;
    } else {
      json[r'started'] = null;
    }
      json[r'status'] = this.status;
      json[r'submitted'] = this.submitted;
      json[r'submittedBy'] = this.submittedBy;
    return json;
  }

  /// Returns a new [TaskProgressBeanRemoveOptionFromIssuesResult] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TaskProgressBeanRemoveOptionFromIssuesResult? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'elapsedRuntime'), 'Required key "TaskProgressBeanRemoveOptionFromIssuesResult[elapsedRuntime]" is missing from JSON.');
        assert(json[r'elapsedRuntime'] != null, 'Required key "TaskProgressBeanRemoveOptionFromIssuesResult[elapsedRuntime]" has a null value in JSON.');
        assert(json.containsKey(r'id'), 'Required key "TaskProgressBeanRemoveOptionFromIssuesResult[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "TaskProgressBeanRemoveOptionFromIssuesResult[id]" has a null value in JSON.');
        assert(json.containsKey(r'lastUpdate'), 'Required key "TaskProgressBeanRemoveOptionFromIssuesResult[lastUpdate]" is missing from JSON.');
        assert(json[r'lastUpdate'] != null, 'Required key "TaskProgressBeanRemoveOptionFromIssuesResult[lastUpdate]" has a null value in JSON.');
        assert(json.containsKey(r'progress'), 'Required key "TaskProgressBeanRemoveOptionFromIssuesResult[progress]" is missing from JSON.');
        assert(json[r'progress'] != null, 'Required key "TaskProgressBeanRemoveOptionFromIssuesResult[progress]" has a null value in JSON.');
        assert(json.containsKey(r'self'), 'Required key "TaskProgressBeanRemoveOptionFromIssuesResult[self]" is missing from JSON.');
        assert(json[r'self'] != null, 'Required key "TaskProgressBeanRemoveOptionFromIssuesResult[self]" has a null value in JSON.');
        assert(json.containsKey(r'status'), 'Required key "TaskProgressBeanRemoveOptionFromIssuesResult[status]" is missing from JSON.');
        assert(json[r'status'] != null, 'Required key "TaskProgressBeanRemoveOptionFromIssuesResult[status]" has a null value in JSON.');
        assert(json.containsKey(r'submitted'), 'Required key "TaskProgressBeanRemoveOptionFromIssuesResult[submitted]" is missing from JSON.');
        assert(json[r'submitted'] != null, 'Required key "TaskProgressBeanRemoveOptionFromIssuesResult[submitted]" has a null value in JSON.');
        assert(json.containsKey(r'submittedBy'), 'Required key "TaskProgressBeanRemoveOptionFromIssuesResult[submittedBy]" is missing from JSON.');
        assert(json[r'submittedBy'] != null, 'Required key "TaskProgressBeanRemoveOptionFromIssuesResult[submittedBy]" has a null value in JSON.');
        return true;
      }());

      return TaskProgressBeanRemoveOptionFromIssuesResult(
        description: mapValueOfType<String>(json, r'description'),
        elapsedRuntime: mapValueOfType<int>(json, r'elapsedRuntime')!,
        finished: mapValueOfType<int>(json, r'finished'),
        id: mapValueOfType<String>(json, r'id')!,
        lastUpdate: mapValueOfType<int>(json, r'lastUpdate')!,
        message: mapValueOfType<String>(json, r'message'),
        progress: mapValueOfType<int>(json, r'progress')!,
        result: RemoveOptionFromIssuesResult.fromJson(json[r'result']),
        self: mapValueOfType<String>(json, r'self')!,
        started: mapValueOfType<int>(json, r'started'),
        status: TaskProgressBeanRemoveOptionFromIssuesResultStatusEnum.fromJson(json[r'status'])!,
        submitted: mapValueOfType<int>(json, r'submitted')!,
        submittedBy: mapValueOfType<int>(json, r'submittedBy')!,
      );
    }
    return null;
  }

  static List<TaskProgressBeanRemoveOptionFromIssuesResult> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TaskProgressBeanRemoveOptionFromIssuesResult>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TaskProgressBeanRemoveOptionFromIssuesResult.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TaskProgressBeanRemoveOptionFromIssuesResult> mapFromJson(dynamic json) {
    final map = <String, TaskProgressBeanRemoveOptionFromIssuesResult>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TaskProgressBeanRemoveOptionFromIssuesResult.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TaskProgressBeanRemoveOptionFromIssuesResult-objects as value to a dart map
  static Map<String, List<TaskProgressBeanRemoveOptionFromIssuesResult>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TaskProgressBeanRemoveOptionFromIssuesResult>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TaskProgressBeanRemoveOptionFromIssuesResult.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'elapsedRuntime',
    'id',
    'lastUpdate',
    'progress',
    'self',
    'status',
    'submitted',
    'submittedBy',
  };
}

/// The status of the task.
enum TaskProgressBeanRemoveOptionFromIssuesResultStatusEnum {
  ENQUEUED._(r'ENQUEUED'),
  RUNNING._(r'RUNNING'),
  COMPLETE._(r'COMPLETE'),
  FAILED._(r'FAILED'),
  CANCEL_REQUESTED._(r'CANCEL_REQUESTED'),
  CANCELLED._(r'CANCELLED'),
  DEAD._(r'DEAD'),
  ;

  /// Instantiate a new enum with the provided value.
  const TaskProgressBeanRemoveOptionFromIssuesResultStatusEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [TaskProgressBeanRemoveOptionFromIssuesResultStatusEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static TaskProgressBeanRemoveOptionFromIssuesResultStatusEnum? fromJson(dynamic value) => TaskProgressBeanRemoveOptionFromIssuesResultStatusEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [TaskProgressBeanRemoveOptionFromIssuesResultStatusEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<TaskProgressBeanRemoveOptionFromIssuesResultStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TaskProgressBeanRemoveOptionFromIssuesResultStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TaskProgressBeanRemoveOptionFromIssuesResultStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [TaskProgressBeanRemoveOptionFromIssuesResultStatusEnum] to String,
/// and [decode] dynamic data back to [TaskProgressBeanRemoveOptionFromIssuesResultStatusEnum].
class TaskProgressBeanRemoveOptionFromIssuesResultStatusEnumTypeTransformer {
  factory TaskProgressBeanRemoveOptionFromIssuesResultStatusEnumTypeTransformer() => _instance ??= const TaskProgressBeanRemoveOptionFromIssuesResultStatusEnumTypeTransformer._();

  const TaskProgressBeanRemoveOptionFromIssuesResultStatusEnumTypeTransformer._();

  String encode(TaskProgressBeanRemoveOptionFromIssuesResultStatusEnum data) => data._value;

  /// Returns the instance of [TaskProgressBeanRemoveOptionFromIssuesResultStatusEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  TaskProgressBeanRemoveOptionFromIssuesResultStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is TaskProgressBeanRemoveOptionFromIssuesResultStatusEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'ENQUEUED': return TaskProgressBeanRemoveOptionFromIssuesResultStatusEnum.ENQUEUED;
        case r'RUNNING': return TaskProgressBeanRemoveOptionFromIssuesResultStatusEnum.RUNNING;
        case r'COMPLETE': return TaskProgressBeanRemoveOptionFromIssuesResultStatusEnum.COMPLETE;
        case r'FAILED': return TaskProgressBeanRemoveOptionFromIssuesResultStatusEnum.FAILED;
        case r'CANCEL_REQUESTED': return TaskProgressBeanRemoveOptionFromIssuesResultStatusEnum.CANCEL_REQUESTED;
        case r'CANCELLED': return TaskProgressBeanRemoveOptionFromIssuesResultStatusEnum.CANCELLED;
        case r'DEAD': return TaskProgressBeanRemoveOptionFromIssuesResultStatusEnum.DEAD;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static TaskProgressBeanRemoveOptionFromIssuesResultStatusEnumTypeTransformer? _instance;
}


