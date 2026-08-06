//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowStatusUpdate {
  /// Returns a new [WorkflowStatusUpdate] instance.
  WorkflowStatusUpdate({
    this.description,
    this.id,
    required this.name,
    required this.statusCategory,
    required this.statusReference,
  });

  /// The description of the status.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The ID of the status. When reusing an existing status, this field should be provided.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// The name of the status.
  String name;

  /// The category of the status.
  WorkflowStatusUpdateStatusCategoryEnum statusCategory;

  /// The reference of the status. If adding a new status to a team-managed workflow, this must be a UUID (for company-managed a UUID is not needed).
  String statusReference;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowStatusUpdate &&
    other.description == description &&
    other.id == id &&
    other.name == name &&
    other.statusCategory == statusCategory &&
    other.statusReference == statusReference;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (name.hashCode) +
    (statusCategory.hashCode) +
    (statusReference.hashCode);

  @override
  String toString() => 'WorkflowStatusUpdate[description=$description, id=$id, name=$name, statusCategory=$statusCategory, statusReference=$statusReference]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
      json[r'name'] = this.name;
      json[r'statusCategory'] = this.statusCategory;
      json[r'statusReference'] = this.statusReference;
    return json;
  }

  /// Returns a new [WorkflowStatusUpdate] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowStatusUpdate? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'name'), 'Required key "WorkflowStatusUpdate[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "WorkflowStatusUpdate[name]" has a null value in JSON.');
        assert(json.containsKey(r'statusCategory'), 'Required key "WorkflowStatusUpdate[statusCategory]" is missing from JSON.');
        assert(json[r'statusCategory'] != null, 'Required key "WorkflowStatusUpdate[statusCategory]" has a null value in JSON.');
        assert(json.containsKey(r'statusReference'), 'Required key "WorkflowStatusUpdate[statusReference]" is missing from JSON.');
        assert(json[r'statusReference'] != null, 'Required key "WorkflowStatusUpdate[statusReference]" has a null value in JSON.');
        return true;
      }());

      return WorkflowStatusUpdate(
        description: mapValueOfType<String>(json, r'description'),
        id: mapValueOfType<String>(json, r'id'),
        name: mapValueOfType<String>(json, r'name')!,
        statusCategory: WorkflowStatusUpdateStatusCategoryEnum.fromJson(json[r'statusCategory'])!,
        statusReference: mapValueOfType<String>(json, r'statusReference')!,
      );
    }
    return null;
  }

  static List<WorkflowStatusUpdate> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowStatusUpdate>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowStatusUpdate.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowStatusUpdate> mapFromJson(dynamic json) {
    final map = <String, WorkflowStatusUpdate>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowStatusUpdate.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowStatusUpdate-objects as value to a dart map
  static Map<String, List<WorkflowStatusUpdate>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowStatusUpdate>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowStatusUpdate.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
    'statusCategory',
    'statusReference',
  };
}

/// The category of the status.
enum WorkflowStatusUpdateStatusCategoryEnum {
  TODO._(r'TODO'),
  IN_PROGRESS._(r'IN_PROGRESS'),
  DONE._(r'DONE'),
  ;

  /// Instantiate a new enum with the provided value.
  const WorkflowStatusUpdateStatusCategoryEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [WorkflowStatusUpdateStatusCategoryEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static WorkflowStatusUpdateStatusCategoryEnum? fromJson(dynamic value) => WorkflowStatusUpdateStatusCategoryEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [WorkflowStatusUpdateStatusCategoryEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<WorkflowStatusUpdateStatusCategoryEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowStatusUpdateStatusCategoryEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowStatusUpdateStatusCategoryEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [WorkflowStatusUpdateStatusCategoryEnum] to String,
/// and [decode] dynamic data back to [WorkflowStatusUpdateStatusCategoryEnum].
class WorkflowStatusUpdateStatusCategoryEnumTypeTransformer {
  factory WorkflowStatusUpdateStatusCategoryEnumTypeTransformer() => _instance ??= const WorkflowStatusUpdateStatusCategoryEnumTypeTransformer._();

  const WorkflowStatusUpdateStatusCategoryEnumTypeTransformer._();

  String encode(WorkflowStatusUpdateStatusCategoryEnum data) => data._value;

  /// Returns the instance of [WorkflowStatusUpdateStatusCategoryEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  WorkflowStatusUpdateStatusCategoryEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is WorkflowStatusUpdateStatusCategoryEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'TODO': return WorkflowStatusUpdateStatusCategoryEnum.TODO;
        case r'IN_PROGRESS': return WorkflowStatusUpdateStatusCategoryEnum.IN_PROGRESS;
        case r'DONE': return WorkflowStatusUpdateStatusCategoryEnum.DONE;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static WorkflowStatusUpdateStatusCategoryEnumTypeTransformer? _instance;
}


