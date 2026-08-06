//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TaskProgress {
  /// Returns a new [TaskProgress] instance.
  TaskProgress({
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
    this.submitted,
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
  DateTime? finished;

  /// The ID of the task.
  String id;

  /// A timestamp recording when the task progress was last updated.
  DateTime lastUpdate;

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
  Object? result;

  /// The URL of the task.
  String self;

  /// A timestamp recording when the task was started.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? started;

  /// The status of the task.
  TaskProgressStatusEnum status;

  /// A timestamp recording when the task was submitted.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? submitted;

  /// The ID of the user who submitted the task.
  int submittedBy;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TaskProgress &&
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
    (submitted == null ? 0 : submitted!.hashCode) +
    (submittedBy.hashCode);

  @override
  String toString() => 'TaskProgress[description=$description, elapsedRuntime=$elapsedRuntime, finished=$finished, id=$id, lastUpdate=$lastUpdate, message=$message, progress=$progress, result=$result, self=$self, started=$started, status=$status, submitted=$submitted, submittedBy=$submittedBy]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
      json[r'elapsedRuntime'] = this.elapsedRuntime;
    if (this.finished != null) {
      json[r'finished'] = this.finished!.toUtc().toIso8601String();
    } else {
      json[r'finished'] = null;
    }
      json[r'id'] = this.id;
      json[r'lastUpdate'] = this.lastUpdate.toUtc().toIso8601String();
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
      json[r'started'] = this.started!.toUtc().toIso8601String();
    } else {
      json[r'started'] = null;
    }
      json[r'status'] = this.status;
    if (this.submitted != null) {
      json[r'submitted'] = this.submitted!.toUtc().toIso8601String();
    } else {
      json[r'submitted'] = null;
    }
      json[r'submittedBy'] = this.submittedBy;
    return json;
  }

  /// Returns a new [TaskProgress] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TaskProgress? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'elapsedRuntime'), 'Required key "TaskProgress[elapsedRuntime]" is missing from JSON.');
        assert(json[r'elapsedRuntime'] != null, 'Required key "TaskProgress[elapsedRuntime]" has a null value in JSON.');
        assert(json.containsKey(r'id'), 'Required key "TaskProgress[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "TaskProgress[id]" has a null value in JSON.');
        assert(json.containsKey(r'lastUpdate'), 'Required key "TaskProgress[lastUpdate]" is missing from JSON.');
        assert(json[r'lastUpdate'] != null, 'Required key "TaskProgress[lastUpdate]" has a null value in JSON.');
        assert(json.containsKey(r'progress'), 'Required key "TaskProgress[progress]" is missing from JSON.');
        assert(json[r'progress'] != null, 'Required key "TaskProgress[progress]" has a null value in JSON.');
        assert(json.containsKey(r'self'), 'Required key "TaskProgress[self]" is missing from JSON.');
        assert(json[r'self'] != null, 'Required key "TaskProgress[self]" has a null value in JSON.');
        assert(json.containsKey(r'status'), 'Required key "TaskProgress[status]" is missing from JSON.');
        assert(json[r'status'] != null, 'Required key "TaskProgress[status]" has a null value in JSON.');
        assert(json.containsKey(r'submittedBy'), 'Required key "TaskProgress[submittedBy]" is missing from JSON.');
        assert(json[r'submittedBy'] != null, 'Required key "TaskProgress[submittedBy]" has a null value in JSON.');
        return true;
      }());

      return TaskProgress(
        description: mapValueOfType<String>(json, r'description'),
        elapsedRuntime: mapValueOfType<int>(json, r'elapsedRuntime')!,
        finished: mapDateTime(json, r'finished', r''),
        id: mapValueOfType<String>(json, r'id')!,
        lastUpdate: mapDateTime(json, r'lastUpdate', r'')!,
        message: mapValueOfType<String>(json, r'message'),
        progress: mapValueOfType<int>(json, r'progress')!,
        result: mapValueOfType<Object>(json, r'result'),
        self: mapValueOfType<String>(json, r'self')!,
        started: mapDateTime(json, r'started', r''),
        status: TaskProgressStatusEnum.fromJson(json[r'status'])!,
        submitted: mapDateTime(json, r'submitted', r''),
        submittedBy: mapValueOfType<int>(json, r'submittedBy')!,
      );
    }
    return null;
  }

  static List<TaskProgress> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TaskProgress>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TaskProgress.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TaskProgress> mapFromJson(dynamic json) {
    final map = <String, TaskProgress>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TaskProgress.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TaskProgress-objects as value to a dart map
  static Map<String, List<TaskProgress>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TaskProgress>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TaskProgress.listFromJson(entry.value, growable: growable,);
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
    'submittedBy',
  };
}

/// The status of the task.
enum TaskProgressStatusEnum {
  ENQUEUED._(r'ENQUEUED'),
  RUNNING._(r'RUNNING'),
  COMPLETE._(r'COMPLETE'),
  FAILED._(r'FAILED'),
  CANCEL_REQUESTED._(r'CANCEL_REQUESTED'),
  CANCELLED._(r'CANCELLED'),
  DEAD._(r'DEAD'),
  ;

  /// Instantiate a new enum with the provided value.
  const TaskProgressStatusEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [TaskProgressStatusEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static TaskProgressStatusEnum? fromJson(dynamic value) => TaskProgressStatusEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [TaskProgressStatusEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<TaskProgressStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TaskProgressStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TaskProgressStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [TaskProgressStatusEnum] to String,
/// and [decode] dynamic data back to [TaskProgressStatusEnum].
class TaskProgressStatusEnumTypeTransformer {
  factory TaskProgressStatusEnumTypeTransformer() => _instance ??= const TaskProgressStatusEnumTypeTransformer._();

  const TaskProgressStatusEnumTypeTransformer._();

  String encode(TaskProgressStatusEnum data) => data._value;

  /// Returns the instance of [TaskProgressStatusEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  TaskProgressStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is TaskProgressStatusEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'ENQUEUED': return TaskProgressStatusEnum.ENQUEUED;
        case r'RUNNING': return TaskProgressStatusEnum.RUNNING;
        case r'COMPLETE': return TaskProgressStatusEnum.COMPLETE;
        case r'FAILED': return TaskProgressStatusEnum.FAILED;
        case r'CANCEL_REQUESTED': return TaskProgressStatusEnum.CANCEL_REQUESTED;
        case r'CANCELLED': return TaskProgressStatusEnum.CANCELLED;
        case r'DEAD': return TaskProgressStatusEnum.DEAD;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static TaskProgressStatusEnumTypeTransformer? _instance;
}


