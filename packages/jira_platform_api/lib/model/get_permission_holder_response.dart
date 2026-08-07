//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetPermissionHolderResponse {
  /// Returns a new [GetPermissionHolderResponse] instance.
  GetPermissionHolderResponse({
    required this.type,
    required this.value,
  });

  /// The permission holder type. This is \"Group\" or \"AccountId\".
  GetPermissionHolderResponseTypeEnum type;

  /// The permission holder value. This is a group name if the type is \"Group\" or an account ID if the type is \"AccountId\".
  String value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetPermissionHolderResponse &&
    other.type == type &&
    other.value == value;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (type.hashCode) +
    (value.hashCode);

  @override
  String toString() => 'GetPermissionHolderResponse[type=$type, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'type'] = this.type;
      json[r'value'] = this.value;
    return json;
  }

  /// Returns a new [GetPermissionHolderResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetPermissionHolderResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'type'), 'Required key "GetPermissionHolderResponse[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "GetPermissionHolderResponse[type]" has a null value in JSON.');
        assert(json.containsKey(r'value'), 'Required key "GetPermissionHolderResponse[value]" is missing from JSON.');
        assert(json[r'value'] != null, 'Required key "GetPermissionHolderResponse[value]" has a null value in JSON.');
        return true;
      }());

      return GetPermissionHolderResponse(
        type: GetPermissionHolderResponseTypeEnum.fromJson(json[r'type'])!,
        value: mapValueOfType<String>(json, r'value')!,
      );
    }
    return null;
  }

  static List<GetPermissionHolderResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetPermissionHolderResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetPermissionHolderResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetPermissionHolderResponse> mapFromJson(dynamic json) {
    final map = <String, GetPermissionHolderResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetPermissionHolderResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetPermissionHolderResponse-objects as value to a dart map
  static Map<String, List<GetPermissionHolderResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetPermissionHolderResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetPermissionHolderResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'type',
    'value',
  };
}

/// The permission holder type. This is \"Group\" or \"AccountId\".
enum GetPermissionHolderResponseTypeEnum {
  group._(r'Group'),
  accountId._(r'AccountId'),
  ;

  /// Instantiate a new enum with the provided value.
  const GetPermissionHolderResponseTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [GetPermissionHolderResponseTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static GetPermissionHolderResponseTypeEnum? fromJson(dynamic value) => GetPermissionHolderResponseTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [GetPermissionHolderResponseTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<GetPermissionHolderResponseTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetPermissionHolderResponseTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetPermissionHolderResponseTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [GetPermissionHolderResponseTypeEnum] to String,
/// and [decode] dynamic data back to [GetPermissionHolderResponseTypeEnum].
class GetPermissionHolderResponseTypeEnumTypeTransformer {
  factory GetPermissionHolderResponseTypeEnumTypeTransformer() => _instance ??= const GetPermissionHolderResponseTypeEnumTypeTransformer._();

  const GetPermissionHolderResponseTypeEnumTypeTransformer._();

  String encode(GetPermissionHolderResponseTypeEnum data) => data._value;

  /// Returns the instance of [GetPermissionHolderResponseTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  GetPermissionHolderResponseTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is GetPermissionHolderResponseTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'Group': return GetPermissionHolderResponseTypeEnum.group;
        case r'AccountId': return GetPermissionHolderResponseTypeEnum.accountId;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static GetPermissionHolderResponseTypeEnumTypeTransformer? _instance;
}


