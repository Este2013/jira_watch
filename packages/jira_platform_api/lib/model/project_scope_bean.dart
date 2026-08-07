//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProjectScopeBean {
  /// Returns a new [ProjectScopeBean] instance.
  ProjectScopeBean({
    this.attributes = const [],
    this.id,
  });

  /// Defines the behavior of the option in the project.If notSelectable is set, the option cannot be set as the field's value. This is useful for archiving an option that has previously been selected but shouldn't be used anymore.If defaultValue is set, the option is selected by default.
  List<ProjectScopeBeanAttributesEnum> attributes;

  /// The ID of the project that the option's behavior applies to.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProjectScopeBean &&
    _deepEquality.equals(other.attributes, attributes) &&
    other.id == id;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (attributes.hashCode) +
    (id == null ? 0 : id!.hashCode);

  @override
  String toString() => 'ProjectScopeBean[attributes=$attributes, id=$id]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'attributes'] = this.attributes;
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    return json;
  }

  /// Returns a new [ProjectScopeBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProjectScopeBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ProjectScopeBean(
        attributes: ProjectScopeBeanAttributesEnum.listFromJson(json[r'attributes']),
        id: mapValueOfType<int>(json, r'id'),
      );
    }
    return null;
  }

  static List<ProjectScopeBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectScopeBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectScopeBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProjectScopeBean> mapFromJson(dynamic json) {
    final map = <String, ProjectScopeBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProjectScopeBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProjectScopeBean-objects as value to a dart map
  static Map<String, List<ProjectScopeBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProjectScopeBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProjectScopeBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


enum ProjectScopeBeanAttributesEnum {
  notSelectable._(r'notSelectable'),
  defaultValue._(r'defaultValue'),
  ;

  /// Instantiate a new enum with the provided value.
  const ProjectScopeBeanAttributesEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ProjectScopeBeanAttributesEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ProjectScopeBeanAttributesEnum? fromJson(dynamic value) => ProjectScopeBeanAttributesEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ProjectScopeBeanAttributesEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ProjectScopeBeanAttributesEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectScopeBeanAttributesEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectScopeBeanAttributesEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ProjectScopeBeanAttributesEnum] to String,
/// and [decode] dynamic data back to [ProjectScopeBeanAttributesEnum].
class ProjectScopeBeanAttributesEnumTypeTransformer {
  factory ProjectScopeBeanAttributesEnumTypeTransformer() => _instance ??= const ProjectScopeBeanAttributesEnumTypeTransformer._();

  const ProjectScopeBeanAttributesEnumTypeTransformer._();

  String encode(ProjectScopeBeanAttributesEnum data) => data._value;

  /// Returns the instance of [ProjectScopeBeanAttributesEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ProjectScopeBeanAttributesEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is ProjectScopeBeanAttributesEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'notSelectable': return ProjectScopeBeanAttributesEnum.notSelectable;
        case r'defaultValue': return ProjectScopeBeanAttributesEnum.defaultValue;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ProjectScopeBeanAttributesEnumTypeTransformer? _instance;
}


