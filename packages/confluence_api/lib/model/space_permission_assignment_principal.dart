//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SpacePermissionAssignmentPrincipal {
  /// Returns a new [SpacePermissionAssignmentPrincipal] instance.
  SpacePermissionAssignmentPrincipal({
    this.type,
    this.id,
  });

  SpacePermissionAssignmentPrincipalTypeEnum? type;

  /// ID of the entity.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SpacePermissionAssignmentPrincipal &&
    other.type == type &&
    other.id == id;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (type == null ? 0 : type!.hashCode) +
    (id == null ? 0 : id!.hashCode);

  @override
  String toString() => 'SpacePermissionAssignmentPrincipal[type=$type, id=$id]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    return json;
  }

  /// Returns a new [SpacePermissionAssignmentPrincipal] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SpacePermissionAssignmentPrincipal? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return SpacePermissionAssignmentPrincipal(
        type: SpacePermissionAssignmentPrincipalTypeEnum.fromJson(json[r'type']),
        id: mapValueOfType<String>(json, r'id'),
      );
    }
    return null;
  }

  static List<SpacePermissionAssignmentPrincipal> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SpacePermissionAssignmentPrincipal>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SpacePermissionAssignmentPrincipal.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SpacePermissionAssignmentPrincipal> mapFromJson(dynamic json) {
    final map = <String, SpacePermissionAssignmentPrincipal>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SpacePermissionAssignmentPrincipal.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SpacePermissionAssignmentPrincipal-objects as value to a dart map
  static Map<String, List<SpacePermissionAssignmentPrincipal>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SpacePermissionAssignmentPrincipal>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SpacePermissionAssignmentPrincipal.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


enum SpacePermissionAssignmentPrincipalTypeEnum {
  user._(r'user'),
  group._(r'group'),
  role._(r'role'),
  ;

  /// Instantiate a new enum with the provided value.
  const SpacePermissionAssignmentPrincipalTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [SpacePermissionAssignmentPrincipalTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static SpacePermissionAssignmentPrincipalTypeEnum? fromJson(dynamic value) => SpacePermissionAssignmentPrincipalTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [SpacePermissionAssignmentPrincipalTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<SpacePermissionAssignmentPrincipalTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SpacePermissionAssignmentPrincipalTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SpacePermissionAssignmentPrincipalTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SpacePermissionAssignmentPrincipalTypeEnum] to String,
/// and [decode] dynamic data back to [SpacePermissionAssignmentPrincipalTypeEnum].
class SpacePermissionAssignmentPrincipalTypeEnumTypeTransformer {
  factory SpacePermissionAssignmentPrincipalTypeEnumTypeTransformer() => _instance ??= const SpacePermissionAssignmentPrincipalTypeEnumTypeTransformer._();

  const SpacePermissionAssignmentPrincipalTypeEnumTypeTransformer._();

  String encode(SpacePermissionAssignmentPrincipalTypeEnum data) => data._value;

  /// Returns the instance of [SpacePermissionAssignmentPrincipalTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SpacePermissionAssignmentPrincipalTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is SpacePermissionAssignmentPrincipalTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'user': return SpacePermissionAssignmentPrincipalTypeEnum.user;
        case r'group': return SpacePermissionAssignmentPrincipalTypeEnum.group;
        case r'role': return SpacePermissionAssignmentPrincipalTypeEnum.role;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static SpacePermissionAssignmentPrincipalTypeEnumTypeTransformer? _instance;
}


