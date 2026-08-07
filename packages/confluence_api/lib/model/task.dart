//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Task {
  /// Returns a new [Task] instance.
  Task({
    this.id,
    this.localId,
    this.spaceId,
    this.pageId,
    this.blogPostId,
    this.status,
    this.body,
    this.createdBy,
    this.assignedTo,
    this.completedBy,
    this.createdAt,
    this.updatedAt,
    this.dueAt,
    this.completedAt,
  });

  /// ID of the task.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// Local ID of the task. This ID is local to the corresponding page or blog post.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? localId;

  /// ID of the space the task is in.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? spaceId;

  /// ID of the page the task is in.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? pageId;

  /// ID of the blog post the task is in.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? blogPostId;

  /// Status of the task.
  TaskStatusEnum? status;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  TaskBodySingle? body;

  /// Account ID of the user who created this task.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? createdBy;

  /// Account ID of the user to whom this task is assigned.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? assignedTo;

  /// Account ID of the user who completed this task.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? completedBy;

  /// Date and time when the task was created. In format \"YYYY-MM-DDTHH:mm:ss.sssZ\".
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? createdAt;

  /// Date and time when the task was updated. In format \"YYYY-MM-DDTHH:mm:ss.sssZ\".
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? updatedAt;

  /// Date and time when the task is due. In format \"YYYY-MM-DDTHH:mm:ss.sssZ\".
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? dueAt;

  /// Date and time when the task was completed. In format \"YYYY-MM-DDTHH:mm:ss.sssZ\".
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? completedAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Task &&
    other.id == id &&
    other.localId == localId &&
    other.spaceId == spaceId &&
    other.pageId == pageId &&
    other.blogPostId == blogPostId &&
    other.status == status &&
    other.body == body &&
    other.createdBy == createdBy &&
    other.assignedTo == assignedTo &&
    other.completedBy == completedBy &&
    other.createdAt == createdAt &&
    other.updatedAt == updatedAt &&
    other.dueAt == dueAt &&
    other.completedAt == completedAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (localId == null ? 0 : localId!.hashCode) +
    (spaceId == null ? 0 : spaceId!.hashCode) +
    (pageId == null ? 0 : pageId!.hashCode) +
    (blogPostId == null ? 0 : blogPostId!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (body == null ? 0 : body!.hashCode) +
    (createdBy == null ? 0 : createdBy!.hashCode) +
    (assignedTo == null ? 0 : assignedTo!.hashCode) +
    (completedBy == null ? 0 : completedBy!.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode) +
    (updatedAt == null ? 0 : updatedAt!.hashCode) +
    (dueAt == null ? 0 : dueAt!.hashCode) +
    (completedAt == null ? 0 : completedAt!.hashCode);

  @override
  String toString() => 'Task[id=$id, localId=$localId, spaceId=$spaceId, pageId=$pageId, blogPostId=$blogPostId, status=$status, body=$body, createdBy=$createdBy, assignedTo=$assignedTo, completedBy=$completedBy, createdAt=$createdAt, updatedAt=$updatedAt, dueAt=$dueAt, completedAt=$completedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.localId != null) {
      json[r'localId'] = this.localId;
    } else {
      json[r'localId'] = null;
    }
    if (this.spaceId != null) {
      json[r'spaceId'] = this.spaceId;
    } else {
      json[r'spaceId'] = null;
    }
    if (this.pageId != null) {
      json[r'pageId'] = this.pageId;
    } else {
      json[r'pageId'] = null;
    }
    if (this.blogPostId != null) {
      json[r'blogPostId'] = this.blogPostId;
    } else {
      json[r'blogPostId'] = null;
    }
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    if (this.body != null) {
      json[r'body'] = this.body;
    } else {
      json[r'body'] = null;
    }
    if (this.createdBy != null) {
      json[r'createdBy'] = this.createdBy;
    } else {
      json[r'createdBy'] = null;
    }
    if (this.assignedTo != null) {
      json[r'assignedTo'] = this.assignedTo;
    } else {
      json[r'assignedTo'] = null;
    }
    if (this.completedBy != null) {
      json[r'completedBy'] = this.completedBy;
    } else {
      json[r'completedBy'] = null;
    }
    if (this.createdAt != null) {
      json[r'createdAt'] = this.createdAt!.toUtc().toIso8601String();
    } else {
      json[r'createdAt'] = null;
    }
    if (this.updatedAt != null) {
      json[r'updatedAt'] = this.updatedAt!.toUtc().toIso8601String();
    } else {
      json[r'updatedAt'] = null;
    }
    if (this.dueAt != null) {
      json[r'dueAt'] = this.dueAt!.toUtc().toIso8601String();
    } else {
      json[r'dueAt'] = null;
    }
    if (this.completedAt != null) {
      json[r'completedAt'] = this.completedAt!.toUtc().toIso8601String();
    } else {
      json[r'completedAt'] = null;
    }
    return json;
  }

  /// Returns a new [Task] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Task? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return Task(
        id: mapValueOfType<String>(json, r'id'),
        localId: mapValueOfType<String>(json, r'localId'),
        spaceId: mapValueOfType<String>(json, r'spaceId'),
        pageId: mapValueOfType<String>(json, r'pageId'),
        blogPostId: mapValueOfType<String>(json, r'blogPostId'),
        status: TaskStatusEnum.fromJson(json[r'status']),
        body: TaskBodySingle.fromJson(json[r'body']),
        createdBy: mapValueOfType<String>(json, r'createdBy'),
        assignedTo: mapValueOfType<String>(json, r'assignedTo'),
        completedBy: mapValueOfType<String>(json, r'completedBy'),
        createdAt: mapDateTime(json, r'createdAt', r''),
        updatedAt: mapDateTime(json, r'updatedAt', r''),
        dueAt: mapDateTime(json, r'dueAt', r''),
        completedAt: mapDateTime(json, r'completedAt', r''),
      );
    }
    return null;
  }

  static List<Task> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Task>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Task.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Task> mapFromJson(dynamic json) {
    final map = <String, Task>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Task.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Task-objects as value to a dart map
  static Map<String, List<Task>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Task>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Task.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// Status of the task.
enum TaskStatusEnum {
  complete._(r'complete'),
  incomplete._(r'incomplete'),
  ;

  /// Instantiate a new enum with the provided value.
  const TaskStatusEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [TaskStatusEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static TaskStatusEnum? fromJson(dynamic value) => TaskStatusEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [TaskStatusEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<TaskStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TaskStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TaskStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [TaskStatusEnum] to String,
/// and [decode] dynamic data back to [TaskStatusEnum].
class TaskStatusEnumTypeTransformer {
  factory TaskStatusEnumTypeTransformer() => _instance ??= const TaskStatusEnumTypeTransformer._();

  const TaskStatusEnumTypeTransformer._();

  String encode(TaskStatusEnum data) => data._value;

  /// Returns the instance of [TaskStatusEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  TaskStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is TaskStatusEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'complete': return TaskStatusEnum.complete;
        case r'incomplete': return TaskStatusEnum.incomplete;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static TaskStatusEnumTypeTransformer? _instance;
}


