//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RolePayload {
  /// Returns a new [RolePayload] instance.
  RolePayload({
    this.defaultActors = const [],
    this.description,
    this.name,
    this.onConflict,
    this.pcri,
    this.type,
  });

  /// The default actors for the role. By adding default actors, the role will be added to any future projects created
  List<ProjectCreateResourceIdentifier> defaultActors;

  /// The description of the role
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The name of the role
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The strategy to use when there is a conflict with an existing project role. FAIL - Fail execution, this always needs to be unique; USE - Use the existing entity and ignore new entity parameters
  RolePayloadOnConflictEnum? onConflict;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectCreateResourceIdentifier? pcri;

  /// The type of the role. Only used by project-scoped project
  RolePayloadTypeEnum? type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RolePayload &&
    _deepEquality.equals(other.defaultActors, defaultActors) &&
    other.description == description &&
    other.name == name &&
    other.onConflict == onConflict &&
    other.pcri == pcri &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (defaultActors.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (onConflict == null ? 0 : onConflict!.hashCode) +
    (pcri == null ? 0 : pcri!.hashCode) +
    (type == null ? 0 : type!.hashCode);

  @override
  String toString() => 'RolePayload[defaultActors=$defaultActors, description=$description, name=$name, onConflict=$onConflict, pcri=$pcri, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'defaultActors'] = this.defaultActors;
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.onConflict != null) {
      json[r'onConflict'] = this.onConflict;
    } else {
      json[r'onConflict'] = null;
    }
    if (this.pcri != null) {
      json[r'pcri'] = this.pcri;
    } else {
      json[r'pcri'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    return json;
  }

  /// Returns a new [RolePayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RolePayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return RolePayload(
        defaultActors: ProjectCreateResourceIdentifier.listFromJson(json[r'defaultActors']),
        description: mapValueOfType<String>(json, r'description'),
        name: mapValueOfType<String>(json, r'name'),
        onConflict: RolePayloadOnConflictEnum.fromJson(json[r'onConflict']),
        pcri: ProjectCreateResourceIdentifier.fromJson(json[r'pcri']),
        type: RolePayloadTypeEnum.fromJson(json[r'type']),
      );
    }
    return null;
  }

  static List<RolePayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RolePayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RolePayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RolePayload> mapFromJson(dynamic json) {
    final map = <String, RolePayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RolePayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RolePayload-objects as value to a dart map
  static Map<String, List<RolePayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RolePayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RolePayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The strategy to use when there is a conflict with an existing project role. FAIL - Fail execution, this always needs to be unique; USE - Use the existing entity and ignore new entity parameters
enum RolePayloadOnConflictEnum {
  FAIL._(r'FAIL'),
  USE._(r'USE'),
  NEW._(r'NEW'),
  ;

  /// Instantiate a new enum with the provided value.
  const RolePayloadOnConflictEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [RolePayloadOnConflictEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static RolePayloadOnConflictEnum? fromJson(dynamic value) => RolePayloadOnConflictEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [RolePayloadOnConflictEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<RolePayloadOnConflictEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RolePayloadOnConflictEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RolePayloadOnConflictEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [RolePayloadOnConflictEnum] to String,
/// and [decode] dynamic data back to [RolePayloadOnConflictEnum].
class RolePayloadOnConflictEnumTypeTransformer {
  factory RolePayloadOnConflictEnumTypeTransformer() => _instance ??= const RolePayloadOnConflictEnumTypeTransformer._();

  const RolePayloadOnConflictEnumTypeTransformer._();

  String encode(RolePayloadOnConflictEnum data) => data._value;

  /// Returns the instance of [RolePayloadOnConflictEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  RolePayloadOnConflictEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is RolePayloadOnConflictEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'FAIL': return RolePayloadOnConflictEnum.FAIL;
        case r'USE': return RolePayloadOnConflictEnum.USE;
        case r'NEW': return RolePayloadOnConflictEnum.NEW;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static RolePayloadOnConflictEnumTypeTransformer? _instance;
}


/// The type of the role. Only used by project-scoped project
enum RolePayloadTypeEnum {
  HIDDEN._(r'HIDDEN'),
  VIEWABLE._(r'VIEWABLE'),
  AI_AGENT._(r'AI_AGENT'),
  EDITABLE._(r'EDITABLE'),
  GUEST._(r'GUEST'),
  ;

  /// Instantiate a new enum with the provided value.
  const RolePayloadTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [RolePayloadTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static RolePayloadTypeEnum? fromJson(dynamic value) => RolePayloadTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [RolePayloadTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<RolePayloadTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RolePayloadTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RolePayloadTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [RolePayloadTypeEnum] to String,
/// and [decode] dynamic data back to [RolePayloadTypeEnum].
class RolePayloadTypeEnumTypeTransformer {
  factory RolePayloadTypeEnumTypeTransformer() => _instance ??= const RolePayloadTypeEnumTypeTransformer._();

  const RolePayloadTypeEnumTypeTransformer._();

  String encode(RolePayloadTypeEnum data) => data._value;

  /// Returns the instance of [RolePayloadTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  RolePayloadTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is RolePayloadTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'HIDDEN': return RolePayloadTypeEnum.HIDDEN;
        case r'VIEWABLE': return RolePayloadTypeEnum.VIEWABLE;
        case r'AI_AGENT': return RolePayloadTypeEnum.AI_AGENT;
        case r'EDITABLE': return RolePayloadTypeEnum.EDITABLE;
        case r'GUEST': return RolePayloadTypeEnum.GUEST;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static RolePayloadTypeEnumTypeTransformer? _instance;
}


