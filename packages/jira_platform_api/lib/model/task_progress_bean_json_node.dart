//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TaskProgressBeanJsonNode {
  /// Returns a new [TaskProgressBeanJsonNode] instance.
  TaskProgressBeanJsonNode({
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
  JsonNode? result;

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
  TaskProgressBeanJsonNodeStatusEnum status;

  /// A timestamp recording when the task was submitted.
  int submitted;

  /// The ID of the user who submitted the task.
  int submittedBy;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TaskProgressBeanJsonNode &&
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
  String toString() => 'TaskProgressBeanJsonNode[description=$description, elapsedRuntime=$elapsedRuntime, finished=$finished, id=$id, lastUpdate=$lastUpdate, message=$message, progress=$progress, result=$result, self=$self, started=$started, status=$status, submitted=$submitted, submittedBy=$submittedBy]';

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

  /// Returns a new [TaskProgressBeanJsonNode] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TaskProgressBeanJsonNode? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'elapsedRuntime'), 'Required key "TaskProgressBeanJsonNode[elapsedRuntime]" is missing from JSON.');
        assert(json[r'elapsedRuntime'] != null, 'Required key "TaskProgressBeanJsonNode[elapsedRuntime]" has a null value in JSON.');
        assert(json.containsKey(r'id'), 'Required key "TaskProgressBeanJsonNode[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "TaskProgressBeanJsonNode[id]" has a null value in JSON.');
        assert(json.containsKey(r'lastUpdate'), 'Required key "TaskProgressBeanJsonNode[lastUpdate]" is missing from JSON.');
        assert(json[r'lastUpdate'] != null, 'Required key "TaskProgressBeanJsonNode[lastUpdate]" has a null value in JSON.');
        assert(json.containsKey(r'progress'), 'Required key "TaskProgressBeanJsonNode[progress]" is missing from JSON.');
        assert(json[r'progress'] != null, 'Required key "TaskProgressBeanJsonNode[progress]" has a null value in JSON.');
        assert(json.containsKey(r'self'), 'Required key "TaskProgressBeanJsonNode[self]" is missing from JSON.');
        assert(json[r'self'] != null, 'Required key "TaskProgressBeanJsonNode[self]" has a null value in JSON.');
        assert(json.containsKey(r'status'), 'Required key "TaskProgressBeanJsonNode[status]" is missing from JSON.');
        assert(json[r'status'] != null, 'Required key "TaskProgressBeanJsonNode[status]" has a null value in JSON.');
        assert(json.containsKey(r'submitted'), 'Required key "TaskProgressBeanJsonNode[submitted]" is missing from JSON.');
        assert(json[r'submitted'] != null, 'Required key "TaskProgressBeanJsonNode[submitted]" has a null value in JSON.');
        assert(json.containsKey(r'submittedBy'), 'Required key "TaskProgressBeanJsonNode[submittedBy]" is missing from JSON.');
        assert(json[r'submittedBy'] != null, 'Required key "TaskProgressBeanJsonNode[submittedBy]" has a null value in JSON.');
        return true;
      }());

      return TaskProgressBeanJsonNode(
        description: mapValueOfType<String>(json, r'description'),
        elapsedRuntime: mapValueOfType<int>(json, r'elapsedRuntime')!,
        finished: mapValueOfType<int>(json, r'finished'),
        id: mapValueOfType<String>(json, r'id')!,
        lastUpdate: mapValueOfType<int>(json, r'lastUpdate')!,
        message: mapValueOfType<String>(json, r'message'),
        progress: mapValueOfType<int>(json, r'progress')!,
        result: JsonNode.fromJson(json[r'result']),
        self: mapValueOfType<String>(json, r'self')!,
        started: mapValueOfType<int>(json, r'started'),
        status: TaskProgressBeanJsonNodeStatusEnum.fromJson(json[r'status'])!,
        submitted: mapValueOfType<int>(json, r'submitted')!,
        submittedBy: mapValueOfType<int>(json, r'submittedBy')!,
      );
    }
    return null;
  }

  static List<TaskProgressBeanJsonNode> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TaskProgressBeanJsonNode>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TaskProgressBeanJsonNode.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TaskProgressBeanJsonNode> mapFromJson(dynamic json) {
    final map = <String, TaskProgressBeanJsonNode>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TaskProgressBeanJsonNode.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TaskProgressBeanJsonNode-objects as value to a dart map
  static Map<String, List<TaskProgressBeanJsonNode>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TaskProgressBeanJsonNode>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TaskProgressBeanJsonNode.listFromJson(entry.value, growable: growable,);
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
enum TaskProgressBeanJsonNodeStatusEnum {
  ENQUEUED._(r'ENQUEUED'),
  RUNNING._(r'RUNNING'),
  COMPLETE._(r'COMPLETE'),
  FAILED._(r'FAILED'),
  CANCEL_REQUESTED._(r'CANCEL_REQUESTED'),
  CANCELLED._(r'CANCELLED'),
  DEAD._(r'DEAD'),
  ;

  /// Instantiate a new enum with the provided value.
  const TaskProgressBeanJsonNodeStatusEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [TaskProgressBeanJsonNodeStatusEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static TaskProgressBeanJsonNodeStatusEnum? fromJson(dynamic value) => TaskProgressBeanJsonNodeStatusEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [TaskProgressBeanJsonNodeStatusEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<TaskProgressBeanJsonNodeStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TaskProgressBeanJsonNodeStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TaskProgressBeanJsonNodeStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [TaskProgressBeanJsonNodeStatusEnum] to String,
/// and [decode] dynamic data back to [TaskProgressBeanJsonNodeStatusEnum].
class TaskProgressBeanJsonNodeStatusEnumTypeTransformer {
  factory TaskProgressBeanJsonNodeStatusEnumTypeTransformer() => _instance ??= const TaskProgressBeanJsonNodeStatusEnumTypeTransformer._();

  const TaskProgressBeanJsonNodeStatusEnumTypeTransformer._();

  String encode(TaskProgressBeanJsonNodeStatusEnum data) => data._value;

  /// Returns the instance of [TaskProgressBeanJsonNodeStatusEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  TaskProgressBeanJsonNodeStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is TaskProgressBeanJsonNodeStatusEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'ENQUEUED': return TaskProgressBeanJsonNodeStatusEnum.ENQUEUED;
        case r'RUNNING': return TaskProgressBeanJsonNodeStatusEnum.RUNNING;
        case r'COMPLETE': return TaskProgressBeanJsonNodeStatusEnum.COMPLETE;
        case r'FAILED': return TaskProgressBeanJsonNodeStatusEnum.FAILED;
        case r'CANCEL_REQUESTED': return TaskProgressBeanJsonNodeStatusEnum.CANCEL_REQUESTED;
        case r'CANCELLED': return TaskProgressBeanJsonNodeStatusEnum.CANCELLED;
        case r'DEAD': return TaskProgressBeanJsonNodeStatusEnum.DEAD;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static TaskProgressBeanJsonNodeStatusEnumTypeTransformer? _instance;
}


