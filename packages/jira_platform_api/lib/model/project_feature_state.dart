//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProjectFeatureState {
  /// Returns a new [ProjectFeatureState] instance.
  ProjectFeatureState({
    this.state,
  });

  /// The feature state.
  ProjectFeatureStateStateEnum? state;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProjectFeatureState &&
    other.state == state;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (state == null ? 0 : state!.hashCode);

  @override
  String toString() => 'ProjectFeatureState[state=$state]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.state != null) {
      json[r'state'] = this.state;
    } else {
      json[r'state'] = null;
    }
    return json;
  }

  /// Returns a new [ProjectFeatureState] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProjectFeatureState? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ProjectFeatureState(
        state: ProjectFeatureStateStateEnum.fromJson(json[r'state']),
      );
    }
    return null;
  }

  static List<ProjectFeatureState> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectFeatureState>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectFeatureState.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProjectFeatureState> mapFromJson(dynamic json) {
    final map = <String, ProjectFeatureState>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProjectFeatureState.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProjectFeatureState-objects as value to a dart map
  static Map<String, List<ProjectFeatureState>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProjectFeatureState>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProjectFeatureState.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The feature state.
enum ProjectFeatureStateStateEnum {
  ENABLED._(r'ENABLED'),
  DISABLED._(r'DISABLED'),
  COMING_SOON._(r'COMING_SOON'),
  ;

  /// Instantiate a new enum with the provided value.
  const ProjectFeatureStateStateEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ProjectFeatureStateStateEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ProjectFeatureStateStateEnum? fromJson(dynamic value) => ProjectFeatureStateStateEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ProjectFeatureStateStateEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ProjectFeatureStateStateEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectFeatureStateStateEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectFeatureStateStateEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ProjectFeatureStateStateEnum] to String,
/// and [decode] dynamic data back to [ProjectFeatureStateStateEnum].
class ProjectFeatureStateStateEnumTypeTransformer {
  factory ProjectFeatureStateStateEnumTypeTransformer() => _instance ??= const ProjectFeatureStateStateEnumTypeTransformer._();

  const ProjectFeatureStateStateEnumTypeTransformer._();

  String encode(ProjectFeatureStateStateEnum data) => data._value;

  /// Returns the instance of [ProjectFeatureStateStateEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ProjectFeatureStateStateEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is ProjectFeatureStateStateEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'ENABLED': return ProjectFeatureStateStateEnum.ENABLED;
        case r'DISABLED': return ProjectFeatureStateStateEnum.DISABLED;
        case r'COMING_SOON': return ProjectFeatureStateStateEnum.COMING_SOON;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ProjectFeatureStateStateEnumTypeTransformer? _instance;
}


