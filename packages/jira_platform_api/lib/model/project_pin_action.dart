//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProjectPinAction {
  /// Returns a new [ProjectPinAction] instance.
  ProjectPinAction({
    required this.action,
    required this.projectIdOrKey,
  });

  /// The action to perform: PIN or UNPIN.
  ProjectPinActionActionEnum action;

  /// The project ID or key.
  String projectIdOrKey;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProjectPinAction &&
    other.action == action &&
    other.projectIdOrKey == projectIdOrKey;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (action.hashCode) +
    (projectIdOrKey.hashCode);

  @override
  String toString() => 'ProjectPinAction[action=$action, projectIdOrKey=$projectIdOrKey]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'action'] = this.action;
      json[r'projectIdOrKey'] = this.projectIdOrKey;
    return json;
  }

  /// Returns a new [ProjectPinAction] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProjectPinAction? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'action'), 'Required key "ProjectPinAction[action]" is missing from JSON.');
        assert(json[r'action'] != null, 'Required key "ProjectPinAction[action]" has a null value in JSON.');
        assert(json.containsKey(r'projectIdOrKey'), 'Required key "ProjectPinAction[projectIdOrKey]" is missing from JSON.');
        assert(json[r'projectIdOrKey'] != null, 'Required key "ProjectPinAction[projectIdOrKey]" has a null value in JSON.');
        return true;
      }());

      return ProjectPinAction(
        action: ProjectPinActionActionEnum.fromJson(json[r'action'])!,
        projectIdOrKey: mapValueOfType<String>(json, r'projectIdOrKey')!,
      );
    }
    return null;
  }

  static List<ProjectPinAction> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectPinAction>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectPinAction.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProjectPinAction> mapFromJson(dynamic json) {
    final map = <String, ProjectPinAction>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProjectPinAction.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProjectPinAction-objects as value to a dart map
  static Map<String, List<ProjectPinAction>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProjectPinAction>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProjectPinAction.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'action',
    'projectIdOrKey',
  };
}

/// The action to perform: PIN or UNPIN.
enum ProjectPinActionActionEnum {
  PIN._(r'PIN'),
  UNPIN._(r'UNPIN'),
  ;

  /// Instantiate a new enum with the provided value.
  const ProjectPinActionActionEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ProjectPinActionActionEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ProjectPinActionActionEnum? fromJson(dynamic value) => ProjectPinActionActionEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ProjectPinActionActionEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ProjectPinActionActionEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectPinActionActionEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectPinActionActionEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ProjectPinActionActionEnum] to String,
/// and [decode] dynamic data back to [ProjectPinActionActionEnum].
class ProjectPinActionActionEnumTypeTransformer {
  factory ProjectPinActionActionEnumTypeTransformer() => _instance ??= const ProjectPinActionActionEnumTypeTransformer._();

  const ProjectPinActionActionEnumTypeTransformer._();

  String encode(ProjectPinActionActionEnum data) => data._value;

  /// Returns the instance of [ProjectPinActionActionEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ProjectPinActionActionEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is ProjectPinActionActionEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'PIN': return ProjectPinActionActionEnum.PIN;
        case r'UNPIN': return ProjectPinActionActionEnum.UNPIN;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ProjectPinActionActionEnumTypeTransformer? _instance;
}


