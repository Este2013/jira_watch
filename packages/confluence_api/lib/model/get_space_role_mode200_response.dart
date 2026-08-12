//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetSpaceRoleMode200Response {
  /// Returns a new [GetSpaceRoleMode200Response] instance.
  GetSpaceRoleMode200Response({
    this.mode,
  });

  /// The space role mode.
  GetSpaceRoleMode200ResponseModeEnum? mode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetSpaceRoleMode200Response &&
    other.mode == mode;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (mode == null ? 0 : mode!.hashCode);

  @override
  String toString() => 'GetSpaceRoleMode200Response[mode=$mode]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.mode != null) {
      json[r'mode'] = this.mode;
    } else {
      json[r'mode'] = null;
    }
    return json;
  }

  /// Returns a new [GetSpaceRoleMode200Response] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetSpaceRoleMode200Response? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return GetSpaceRoleMode200Response(
        mode: GetSpaceRoleMode200ResponseModeEnum.fromJson(json[r'mode']),
      );
    }
    return null;
  }

  static List<GetSpaceRoleMode200Response> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetSpaceRoleMode200Response>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetSpaceRoleMode200Response.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetSpaceRoleMode200Response> mapFromJson(dynamic json) {
    final map = <String, GetSpaceRoleMode200Response>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetSpaceRoleMode200Response.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetSpaceRoleMode200Response-objects as value to a dart map
  static Map<String, List<GetSpaceRoleMode200Response>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetSpaceRoleMode200Response>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetSpaceRoleMode200Response.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The space role mode.
enum GetSpaceRoleMode200ResponseModeEnum {
  PRE_ROLES._(r'PRE_ROLES'),
  ROLES_TRANSITION._(r'ROLES_TRANSITION'),
  ROLES._(r'ROLES'),
  ;

  /// Instantiate a new enum with the provided value.
  const GetSpaceRoleMode200ResponseModeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [GetSpaceRoleMode200ResponseModeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static GetSpaceRoleMode200ResponseModeEnum? fromJson(dynamic value) => GetSpaceRoleMode200ResponseModeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [GetSpaceRoleMode200ResponseModeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<GetSpaceRoleMode200ResponseModeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetSpaceRoleMode200ResponseModeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetSpaceRoleMode200ResponseModeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [GetSpaceRoleMode200ResponseModeEnum] to String,
/// and [decode] dynamic data back to [GetSpaceRoleMode200ResponseModeEnum].
class GetSpaceRoleMode200ResponseModeEnumTypeTransformer {
  factory GetSpaceRoleMode200ResponseModeEnumTypeTransformer() => _instance ??= const GetSpaceRoleMode200ResponseModeEnumTypeTransformer._();

  const GetSpaceRoleMode200ResponseModeEnumTypeTransformer._();

  String encode(GetSpaceRoleMode200ResponseModeEnum data) => data._value;

  /// Returns the instance of [GetSpaceRoleMode200ResponseModeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  GetSpaceRoleMode200ResponseModeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is GetSpaceRoleMode200ResponseModeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'PRE_ROLES': return GetSpaceRoleMode200ResponseModeEnum.PRE_ROLES;
        case r'ROLES_TRANSITION': return GetSpaceRoleMode200ResponseModeEnum.ROLES_TRANSITION;
        case r'ROLES': return GetSpaceRoleMode200ResponseModeEnum.ROLES;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static GetSpaceRoleMode200ResponseModeEnumTypeTransformer? _instance;
}


