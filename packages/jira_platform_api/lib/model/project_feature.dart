//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProjectFeature {
  /// Returns a new [ProjectFeature] instance.
  ProjectFeature({
    this.feature,
    this.imageUri,
    this.localisedDescription,
    this.localisedName,
    this.prerequisites = const [],
    this.projectId,
    this.state,
    this.toggleLocked,
  });

  /// The key of the feature.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? feature;

  /// URI for the image representing the feature.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? imageUri;

  /// Localized display description for the feature.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? localisedDescription;

  /// Localized display name for the feature.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? localisedName;

  /// List of keys of the features required to enable the feature.
  List<String> prerequisites;

  /// The ID of the project.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? projectId;

  /// The state of the feature. When updating the state of a feature, only ENABLED and DISABLED are supported. Responses can contain all values
  ProjectFeatureStateEnum? state;

  /// Whether the state of the feature can be updated.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? toggleLocked;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProjectFeature &&
    other.feature == feature &&
    other.imageUri == imageUri &&
    other.localisedDescription == localisedDescription &&
    other.localisedName == localisedName &&
    _deepEquality.equals(other.prerequisites, prerequisites) &&
    other.projectId == projectId &&
    other.state == state &&
    other.toggleLocked == toggleLocked;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (feature == null ? 0 : feature!.hashCode) +
    (imageUri == null ? 0 : imageUri!.hashCode) +
    (localisedDescription == null ? 0 : localisedDescription!.hashCode) +
    (localisedName == null ? 0 : localisedName!.hashCode) +
    (prerequisites.hashCode) +
    (projectId == null ? 0 : projectId!.hashCode) +
    (state == null ? 0 : state!.hashCode) +
    (toggleLocked == null ? 0 : toggleLocked!.hashCode);

  @override
  String toString() => 'ProjectFeature[feature=$feature, imageUri=$imageUri, localisedDescription=$localisedDescription, localisedName=$localisedName, prerequisites=$prerequisites, projectId=$projectId, state=$state, toggleLocked=$toggleLocked]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.feature != null) {
      json[r'feature'] = this.feature;
    } else {
      json[r'feature'] = null;
    }
    if (this.imageUri != null) {
      json[r'imageUri'] = this.imageUri;
    } else {
      json[r'imageUri'] = null;
    }
    if (this.localisedDescription != null) {
      json[r'localisedDescription'] = this.localisedDescription;
    } else {
      json[r'localisedDescription'] = null;
    }
    if (this.localisedName != null) {
      json[r'localisedName'] = this.localisedName;
    } else {
      json[r'localisedName'] = null;
    }
      json[r'prerequisites'] = this.prerequisites;
    if (this.projectId != null) {
      json[r'projectId'] = this.projectId;
    } else {
      json[r'projectId'] = null;
    }
    if (this.state != null) {
      json[r'state'] = this.state;
    } else {
      json[r'state'] = null;
    }
    if (this.toggleLocked != null) {
      json[r'toggleLocked'] = this.toggleLocked;
    } else {
      json[r'toggleLocked'] = null;
    }
    return json;
  }

  /// Returns a new [ProjectFeature] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProjectFeature? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ProjectFeature(
        feature: mapValueOfType<String>(json, r'feature'),
        imageUri: mapValueOfType<String>(json, r'imageUri'),
        localisedDescription: mapValueOfType<String>(json, r'localisedDescription'),
        localisedName: mapValueOfType<String>(json, r'localisedName'),
        prerequisites: json[r'prerequisites'] is Iterable
            ? (json[r'prerequisites'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        projectId: mapValueOfType<int>(json, r'projectId'),
        state: ProjectFeatureStateEnum.fromJson(json[r'state']),
        toggleLocked: mapValueOfType<bool>(json, r'toggleLocked'),
      );
    }
    return null;
  }

  static List<ProjectFeature> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectFeature>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectFeature.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProjectFeature> mapFromJson(dynamic json) {
    final map = <String, ProjectFeature>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProjectFeature.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProjectFeature-objects as value to a dart map
  static Map<String, List<ProjectFeature>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProjectFeature>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProjectFeature.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The state of the feature. When updating the state of a feature, only ENABLED and DISABLED are supported. Responses can contain all values
enum ProjectFeatureStateEnum {
  ENABLED._(r'ENABLED'),
  DISABLED._(r'DISABLED'),
  COMING_SOON._(r'COMING_SOON'),
  ;

  /// Instantiate a new enum with the provided value.
  const ProjectFeatureStateEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ProjectFeatureStateEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ProjectFeatureStateEnum? fromJson(dynamic value) => ProjectFeatureStateEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ProjectFeatureStateEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ProjectFeatureStateEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectFeatureStateEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectFeatureStateEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ProjectFeatureStateEnum] to String,
/// and [decode] dynamic data back to [ProjectFeatureStateEnum].
class ProjectFeatureStateEnumTypeTransformer {
  factory ProjectFeatureStateEnumTypeTransformer() => _instance ??= const ProjectFeatureStateEnumTypeTransformer._();

  const ProjectFeatureStateEnumTypeTransformer._();

  String encode(ProjectFeatureStateEnum data) => data._value;

  /// Returns the instance of [ProjectFeatureStateEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ProjectFeatureStateEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is ProjectFeatureStateEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'ENABLED': return ProjectFeatureStateEnum.ENABLED;
        case r'DISABLED': return ProjectFeatureStateEnum.DISABLED;
        case r'COMING_SOON': return ProjectFeatureStateEnum.COMING_SOON;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ProjectFeatureStateEnumTypeTransformer? _instance;
}


