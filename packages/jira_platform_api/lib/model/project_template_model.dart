//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProjectTemplateModel {
  /// Returns a new [ProjectTemplateModel] instance.
  ProjectTemplateModel({
    this.archetype,
    this.defaultBoardView,
    this.description,
    this.liveTemplateProjectIdReference,
    this.name,
    this.projectTemplateKey,
    this.snapshotTemplate = const {},
    this.templateGenerationOptions,
    this.type,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectArchetype? archetype;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? defaultBoardView;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? liveTemplateProjectIdReference;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectTemplateKey? projectTemplateKey;

  Map<String, Object> snapshotTemplate;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CustomTemplateOptions? templateGenerationOptions;

  ProjectTemplateModelTypeEnum? type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProjectTemplateModel &&
    other.archetype == archetype &&
    other.defaultBoardView == defaultBoardView &&
    other.description == description &&
    other.liveTemplateProjectIdReference == liveTemplateProjectIdReference &&
    other.name == name &&
    other.projectTemplateKey == projectTemplateKey &&
    _deepEquality.equals(other.snapshotTemplate, snapshotTemplate) &&
    other.templateGenerationOptions == templateGenerationOptions &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (archetype == null ? 0 : archetype!.hashCode) +
    (defaultBoardView == null ? 0 : defaultBoardView!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (liveTemplateProjectIdReference == null ? 0 : liveTemplateProjectIdReference!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (projectTemplateKey == null ? 0 : projectTemplateKey!.hashCode) +
    (snapshotTemplate.hashCode) +
    (templateGenerationOptions == null ? 0 : templateGenerationOptions!.hashCode) +
    (type == null ? 0 : type!.hashCode);

  @override
  String toString() => 'ProjectTemplateModel[archetype=$archetype, defaultBoardView=$defaultBoardView, description=$description, liveTemplateProjectIdReference=$liveTemplateProjectIdReference, name=$name, projectTemplateKey=$projectTemplateKey, snapshotTemplate=$snapshotTemplate, templateGenerationOptions=$templateGenerationOptions, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.archetype != null) {
      json[r'archetype'] = this.archetype;
    } else {
      json[r'archetype'] = null;
    }
    if (this.defaultBoardView != null) {
      json[r'defaultBoardView'] = this.defaultBoardView;
    } else {
      json[r'defaultBoardView'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.liveTemplateProjectIdReference != null) {
      json[r'liveTemplateProjectIdReference'] = this.liveTemplateProjectIdReference;
    } else {
      json[r'liveTemplateProjectIdReference'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.projectTemplateKey != null) {
      json[r'projectTemplateKey'] = this.projectTemplateKey;
    } else {
      json[r'projectTemplateKey'] = null;
    }
      json[r'snapshotTemplate'] = this.snapshotTemplate;
    if (this.templateGenerationOptions != null) {
      json[r'templateGenerationOptions'] = this.templateGenerationOptions;
    } else {
      json[r'templateGenerationOptions'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    return json;
  }

  /// Returns a new [ProjectTemplateModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProjectTemplateModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ProjectTemplateModel(
        archetype: ProjectArchetype.fromJson(json[r'archetype']),
        defaultBoardView: mapValueOfType<String>(json, r'defaultBoardView'),
        description: mapValueOfType<String>(json, r'description'),
        liveTemplateProjectIdReference: mapValueOfType<int>(json, r'liveTemplateProjectIdReference'),
        name: mapValueOfType<String>(json, r'name'),
        projectTemplateKey: ProjectTemplateKey.fromJson(json[r'projectTemplateKey']),
        snapshotTemplate: mapCastOfType<String, Object>(json, r'snapshotTemplate') ?? const {},
        templateGenerationOptions: CustomTemplateOptions.fromJson(json[r'templateGenerationOptions']),
        type: ProjectTemplateModelTypeEnum.fromJson(json[r'type']),
      );
    }
    return null;
  }

  static List<ProjectTemplateModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectTemplateModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectTemplateModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProjectTemplateModel> mapFromJson(dynamic json) {
    final map = <String, ProjectTemplateModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProjectTemplateModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProjectTemplateModel-objects as value to a dart map
  static Map<String, List<ProjectTemplateModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProjectTemplateModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProjectTemplateModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


enum ProjectTemplateModelTypeEnum {
  LIVE._(r'LIVE'),
  SNAPSHOT._(r'SNAPSHOT'),
  ;

  /// Instantiate a new enum with the provided value.
  const ProjectTemplateModelTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ProjectTemplateModelTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ProjectTemplateModelTypeEnum? fromJson(dynamic value) => ProjectTemplateModelTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ProjectTemplateModelTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ProjectTemplateModelTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectTemplateModelTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectTemplateModelTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ProjectTemplateModelTypeEnum] to String,
/// and [decode] dynamic data back to [ProjectTemplateModelTypeEnum].
class ProjectTemplateModelTypeEnumTypeTransformer {
  factory ProjectTemplateModelTypeEnumTypeTransformer() => _instance ??= const ProjectTemplateModelTypeEnumTypeTransformer._();

  const ProjectTemplateModelTypeEnumTypeTransformer._();

  String encode(ProjectTemplateModelTypeEnum data) => data._value;

  /// Returns the instance of [ProjectTemplateModelTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ProjectTemplateModelTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is ProjectTemplateModelTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'LIVE': return ProjectTemplateModelTypeEnum.LIVE;
        case r'SNAPSHOT': return ProjectTemplateModelTypeEnum.SNAPSHOT;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ProjectTemplateModelTypeEnumTypeTransformer? _instance;
}


