//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PermissionPayloadDTO {
  /// Returns a new [PermissionPayloadDTO] instance.
  PermissionPayloadDTO({
    this.addAddonRole,
    this.description,
    this.grants = const [],
    this.name,
    this.onConflict,
    this.pcri,
  });

  /// Configuration to generate addon role. Default is false if null. Only applies to GLOBAL-scoped permission scheme
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? addAddonRole;

  /// The description of the permission scheme
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// List of permission grants
  List<PermissionGrantDTO> grants;

  /// The name of the permission scheme
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The strategy to use when there is a conflict with an existing permission scheme. FAIL - Fail execution, this always needs to be unique; USE - Use the existing entity and ignore new entity parameters; NEW - If the entity exist, try and create a new one with a different name
  PermissionPayloadDTOOnConflictEnum? onConflict;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectCreateResourceIdentifier? pcri;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PermissionPayloadDTO &&
    other.addAddonRole == addAddonRole &&
    other.description == description &&
    _deepEquality.equals(other.grants, grants) &&
    other.name == name &&
    other.onConflict == onConflict &&
    other.pcri == pcri;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (addAddonRole == null ? 0 : addAddonRole!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (grants.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (onConflict == null ? 0 : onConflict!.hashCode) +
    (pcri == null ? 0 : pcri!.hashCode);

  @override
  String toString() => 'PermissionPayloadDTO[addAddonRole=$addAddonRole, description=$description, grants=$grants, name=$name, onConflict=$onConflict, pcri=$pcri]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.addAddonRole != null) {
      json[r'addAddonRole'] = this.addAddonRole;
    } else {
      json[r'addAddonRole'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
      json[r'grants'] = this.grants;
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
    return json;
  }

  /// Returns a new [PermissionPayloadDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PermissionPayloadDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return PermissionPayloadDTO(
        addAddonRole: mapValueOfType<bool>(json, r'addAddonRole'),
        description: mapValueOfType<String>(json, r'description'),
        grants: PermissionGrantDTO.listFromJson(json[r'grants']),
        name: mapValueOfType<String>(json, r'name'),
        onConflict: PermissionPayloadDTOOnConflictEnum.fromJson(json[r'onConflict']),
        pcri: ProjectCreateResourceIdentifier.fromJson(json[r'pcri']),
      );
    }
    return null;
  }

  static List<PermissionPayloadDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PermissionPayloadDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PermissionPayloadDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PermissionPayloadDTO> mapFromJson(dynamic json) {
    final map = <String, PermissionPayloadDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PermissionPayloadDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PermissionPayloadDTO-objects as value to a dart map
  static Map<String, List<PermissionPayloadDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PermissionPayloadDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PermissionPayloadDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The strategy to use when there is a conflict with an existing permission scheme. FAIL - Fail execution, this always needs to be unique; USE - Use the existing entity and ignore new entity parameters; NEW - If the entity exist, try and create a new one with a different name
enum PermissionPayloadDTOOnConflictEnum {
  FAIL._(r'FAIL'),
  USE._(r'USE'),
  NEW._(r'NEW'),
  ;

  /// Instantiate a new enum with the provided value.
  const PermissionPayloadDTOOnConflictEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [PermissionPayloadDTOOnConflictEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static PermissionPayloadDTOOnConflictEnum? fromJson(dynamic value) => PermissionPayloadDTOOnConflictEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [PermissionPayloadDTOOnConflictEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<PermissionPayloadDTOOnConflictEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PermissionPayloadDTOOnConflictEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PermissionPayloadDTOOnConflictEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PermissionPayloadDTOOnConflictEnum] to String,
/// and [decode] dynamic data back to [PermissionPayloadDTOOnConflictEnum].
class PermissionPayloadDTOOnConflictEnumTypeTransformer {
  factory PermissionPayloadDTOOnConflictEnumTypeTransformer() => _instance ??= const PermissionPayloadDTOOnConflictEnumTypeTransformer._();

  const PermissionPayloadDTOOnConflictEnumTypeTransformer._();

  String encode(PermissionPayloadDTOOnConflictEnum data) => data._value;

  /// Returns the instance of [PermissionPayloadDTOOnConflictEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PermissionPayloadDTOOnConflictEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is PermissionPayloadDTOOnConflictEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'FAIL': return PermissionPayloadDTOOnConflictEnum.FAIL;
        case r'USE': return PermissionPayloadDTOOnConflictEnum.USE;
        case r'NEW': return PermissionPayloadDTOOnConflictEnum.NEW;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static PermissionPayloadDTOOnConflictEnumTypeTransformer? _instance;
}


