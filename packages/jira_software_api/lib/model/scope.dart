//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Scope {
  /// Returns a new [Scope] instance.
  Scope({
    this.project,
    this.type,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IssueBeanTransitionsInnerToAllOfScopeAllOfProject? project;

  /// The type of scope.
  ScopeTypeEnum? type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Scope &&
    other.project == project &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (project == null ? 0 : project!.hashCode) +
    (type == null ? 0 : type!.hashCode);

  @override
  String toString() => 'Scope[project=$project, type=$type]';

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

  /// Returns a new [Scope] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Scope? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return Scope(
        project: IssueBeanTransitionsInnerToAllOfScopeAllOfProject.fromJson(json[r'project']),
        type: ScopeTypeEnum.fromJson(json[r'type']),
      );
    }
    return null;
  }

  static List<Scope> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Scope>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Scope.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Scope> mapFromJson(dynamic json) {
    final map = <String, Scope>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Scope.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Scope-objects as value to a dart map
  static Map<String, List<Scope>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Scope>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Scope.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The type of scope.
enum ScopeTypeEnum {
  PROJECT._(r'PROJECT'),
  TEMPLATE._(r'TEMPLATE'),
  ;

  /// Instantiate a new enum with the provided value.
  const ScopeTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ScopeTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ScopeTypeEnum? fromJson(dynamic value) => ScopeTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ScopeTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ScopeTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ScopeTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ScopeTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ScopeTypeEnum] to String,
/// and [decode] dynamic data back to [ScopeTypeEnum].
class ScopeTypeEnumTypeTransformer {
  factory ScopeTypeEnumTypeTransformer() => _instance ??= const ScopeTypeEnumTypeTransformer._();

  const ScopeTypeEnumTypeTransformer._();

  String encode(ScopeTypeEnum data) => data._value;

  /// Returns the instance of [ScopeTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ScopeTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is ScopeTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'PROJECT': return ScopeTypeEnum.PROJECT;
        case r'TEMPLATE': return ScopeTypeEnum.TEMPLATE;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ScopeTypeEnumTypeTransformer? _instance;
}


