//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowScope {
  /// Returns a new [WorkflowScope] instance.
  WorkflowScope({
    this.project,
    this.type,
  });

  ProjectId? project;

  /// The scope of the workflow. `GLOBAL` for company-managed projects and `PROJECT` for team-managed projects.
  WorkflowScopeTypeEnum? type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowScope &&
    other.project == project &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (project == null ? 0 : project!.hashCode) +
    (type == null ? 0 : type!.hashCode);

  @override
  String toString() => 'WorkflowScope[project=$project, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.project != null) {
      json[r'project'] = this.project;
    } else {
      json[r'project'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    return json;
  }

  /// Returns a new [WorkflowScope] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowScope? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return WorkflowScope(
        project: ProjectId.fromJson(json[r'project']),
        type: WorkflowScopeTypeEnum.fromJson(json[r'type']),
      );
    }
    return null;
  }

  static List<WorkflowScope> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowScope>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowScope.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowScope> mapFromJson(dynamic json) {
    final map = <String, WorkflowScope>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowScope.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowScope-objects as value to a dart map
  static Map<String, List<WorkflowScope>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowScope>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowScope.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The scope of the workflow. `GLOBAL` for company-managed projects and `PROJECT` for team-managed projects.
enum WorkflowScopeTypeEnum {
  PROJECT._(r'PROJECT'),
  GLOBAL._(r'GLOBAL'),
  ;

  /// Instantiate a new enum with the provided value.
  const WorkflowScopeTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [WorkflowScopeTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static WorkflowScopeTypeEnum? fromJson(dynamic value) => WorkflowScopeTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [WorkflowScopeTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<WorkflowScopeTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowScopeTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowScopeTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [WorkflowScopeTypeEnum] to String,
/// and [decode] dynamic data back to [WorkflowScopeTypeEnum].
class WorkflowScopeTypeEnumTypeTransformer {
  factory WorkflowScopeTypeEnumTypeTransformer() => _instance ??= const WorkflowScopeTypeEnumTypeTransformer._();

  const WorkflowScopeTypeEnumTypeTransformer._();

  String encode(WorkflowScopeTypeEnum data) => data._value;

  /// Returns the instance of [WorkflowScopeTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  WorkflowScopeTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is WorkflowScopeTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'PROJECT': return WorkflowScopeTypeEnum.PROJECT;
        case r'GLOBAL': return WorkflowScopeTypeEnum.GLOBAL;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static WorkflowScopeTypeEnumTypeTransformer? _instance;
}


