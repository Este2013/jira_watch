//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProjectArchetype {
  /// Returns a new [ProjectArchetype] instance.
  ProjectArchetype({
    this.realType,
    this.style,
    this.type,
  });

  ProjectArchetypeRealTypeEnum? realType;

  ProjectArchetypeStyleEnum? style;

  ProjectArchetypeTypeEnum? type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProjectArchetype &&
    other.realType == realType &&
    other.style == style &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (realType == null ? 0 : realType!.hashCode) +
    (style == null ? 0 : style!.hashCode) +
    (type == null ? 0 : type!.hashCode);

  @override
  String toString() => 'ProjectArchetype[realType=$realType, style=$style, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.realType != null) {
      json[r'realType'] = this.realType;
    } else {
      json[r'realType'] = null;
    }
    if (this.style != null) {
      json[r'style'] = this.style;
    } else {
      json[r'style'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    return json;
  }

  /// Returns a new [ProjectArchetype] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProjectArchetype? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ProjectArchetype(
        realType: ProjectArchetypeRealTypeEnum.fromJson(json[r'realType']),
        style: ProjectArchetypeStyleEnum.fromJson(json[r'style']),
        type: ProjectArchetypeTypeEnum.fromJson(json[r'type']),
      );
    }
    return null;
  }

  static List<ProjectArchetype> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectArchetype>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectArchetype.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProjectArchetype> mapFromJson(dynamic json) {
    final map = <String, ProjectArchetype>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProjectArchetype.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProjectArchetype-objects as value to a dart map
  static Map<String, List<ProjectArchetype>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProjectArchetype>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProjectArchetype.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


enum ProjectArchetypeRealTypeEnum {
  BUSINESS._(r'BUSINESS'),
  SOFTWARE._(r'SOFTWARE'),
  PRODUCT_DISCOVERY._(r'PRODUCT_DISCOVERY'),
  SERVICE_DESK._(r'SERVICE_DESK'),
  CUSTOMER_SERVICE._(r'CUSTOMER_SERVICE'),
  OPS._(r'OPS'),
  ;

  /// Instantiate a new enum with the provided value.
  const ProjectArchetypeRealTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ProjectArchetypeRealTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ProjectArchetypeRealTypeEnum? fromJson(dynamic value) => ProjectArchetypeRealTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ProjectArchetypeRealTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ProjectArchetypeRealTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectArchetypeRealTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectArchetypeRealTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ProjectArchetypeRealTypeEnum] to String,
/// and [decode] dynamic data back to [ProjectArchetypeRealTypeEnum].
class ProjectArchetypeRealTypeEnumTypeTransformer {
  factory ProjectArchetypeRealTypeEnumTypeTransformer() => _instance ??= const ProjectArchetypeRealTypeEnumTypeTransformer._();

  const ProjectArchetypeRealTypeEnumTypeTransformer._();

  String encode(ProjectArchetypeRealTypeEnum data) => data._value;

  /// Returns the instance of [ProjectArchetypeRealTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ProjectArchetypeRealTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is ProjectArchetypeRealTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'BUSINESS': return ProjectArchetypeRealTypeEnum.BUSINESS;
        case r'SOFTWARE': return ProjectArchetypeRealTypeEnum.SOFTWARE;
        case r'PRODUCT_DISCOVERY': return ProjectArchetypeRealTypeEnum.PRODUCT_DISCOVERY;
        case r'SERVICE_DESK': return ProjectArchetypeRealTypeEnum.SERVICE_DESK;
        case r'CUSTOMER_SERVICE': return ProjectArchetypeRealTypeEnum.CUSTOMER_SERVICE;
        case r'OPS': return ProjectArchetypeRealTypeEnum.OPS;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ProjectArchetypeRealTypeEnumTypeTransformer? _instance;
}



enum ProjectArchetypeStyleEnum {
  classic._(r'classic'),
  nextGen._(r'next-gen'),
  ;

  /// Instantiate a new enum with the provided value.
  const ProjectArchetypeStyleEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ProjectArchetypeStyleEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ProjectArchetypeStyleEnum? fromJson(dynamic value) => ProjectArchetypeStyleEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ProjectArchetypeStyleEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ProjectArchetypeStyleEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectArchetypeStyleEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectArchetypeStyleEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ProjectArchetypeStyleEnum] to String,
/// and [decode] dynamic data back to [ProjectArchetypeStyleEnum].
class ProjectArchetypeStyleEnumTypeTransformer {
  factory ProjectArchetypeStyleEnumTypeTransformer() => _instance ??= const ProjectArchetypeStyleEnumTypeTransformer._();

  const ProjectArchetypeStyleEnumTypeTransformer._();

  String encode(ProjectArchetypeStyleEnum data) => data._value;

  /// Returns the instance of [ProjectArchetypeStyleEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ProjectArchetypeStyleEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is ProjectArchetypeStyleEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'classic': return ProjectArchetypeStyleEnum.classic;
        case r'next-gen': return ProjectArchetypeStyleEnum.nextGen;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ProjectArchetypeStyleEnumTypeTransformer? _instance;
}



enum ProjectArchetypeTypeEnum {
  BUSINESS._(r'BUSINESS'),
  SOFTWARE._(r'SOFTWARE'),
  PRODUCT_DISCOVERY._(r'PRODUCT_DISCOVERY'),
  SERVICE_DESK._(r'SERVICE_DESK'),
  CUSTOMER_SERVICE._(r'CUSTOMER_SERVICE'),
  OPS._(r'OPS'),
  ;

  /// Instantiate a new enum with the provided value.
  const ProjectArchetypeTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ProjectArchetypeTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ProjectArchetypeTypeEnum? fromJson(dynamic value) => ProjectArchetypeTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ProjectArchetypeTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ProjectArchetypeTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectArchetypeTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectArchetypeTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ProjectArchetypeTypeEnum] to String,
/// and [decode] dynamic data back to [ProjectArchetypeTypeEnum].
class ProjectArchetypeTypeEnumTypeTransformer {
  factory ProjectArchetypeTypeEnumTypeTransformer() => _instance ??= const ProjectArchetypeTypeEnumTypeTransformer._();

  const ProjectArchetypeTypeEnumTypeTransformer._();

  String encode(ProjectArchetypeTypeEnum data) => data._value;

  /// Returns the instance of [ProjectArchetypeTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ProjectArchetypeTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is ProjectArchetypeTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'BUSINESS': return ProjectArchetypeTypeEnum.BUSINESS;
        case r'SOFTWARE': return ProjectArchetypeTypeEnum.SOFTWARE;
        case r'PRODUCT_DISCOVERY': return ProjectArchetypeTypeEnum.PRODUCT_DISCOVERY;
        case r'SERVICE_DESK': return ProjectArchetypeTypeEnum.SERVICE_DESK;
        case r'CUSTOMER_SERVICE': return ProjectArchetypeTypeEnum.CUSTOMER_SERVICE;
        case r'OPS': return ProjectArchetypeTypeEnum.OPS;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ProjectArchetypeTypeEnumTypeTransformer? _instance;
}


