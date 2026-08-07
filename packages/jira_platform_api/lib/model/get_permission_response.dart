//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetPermissionResponse {
  /// Returns a new [GetPermissionResponse] instance.
  GetPermissionResponse({
    required this.holder,
    required this.type,
  });

  /// The permission holder.
  GetPermissionHolderResponse holder;

  /// The permission type. This is \"View\" or \"Edit\".
  GetPermissionResponseTypeEnum type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetPermissionResponse &&
    other.holder == holder &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (holder.hashCode) +
    (type.hashCode);

  @override
  String toString() => 'GetPermissionResponse[holder=$holder, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'holder'] = this.holder;
      json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [GetPermissionResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetPermissionResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'holder'), 'Required key "GetPermissionResponse[holder]" is missing from JSON.');
        assert(json[r'holder'] != null, 'Required key "GetPermissionResponse[holder]" has a null value in JSON.');
        assert(json.containsKey(r'type'), 'Required key "GetPermissionResponse[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "GetPermissionResponse[type]" has a null value in JSON.');
        return true;
      }());

      return GetPermissionResponse(
        holder: GetPermissionHolderResponse.fromJson(json[r'holder'])!,
        type: GetPermissionResponseTypeEnum.fromJson(json[r'type'])!,
      );
    }
    return null;
  }

  static List<GetPermissionResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetPermissionResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetPermissionResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetPermissionResponse> mapFromJson(dynamic json) {
    final map = <String, GetPermissionResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetPermissionResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetPermissionResponse-objects as value to a dart map
  static Map<String, List<GetPermissionResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetPermissionResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetPermissionResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'holder',
    'type',
  };
}

/// The permission type. This is \"View\" or \"Edit\".
enum GetPermissionResponseTypeEnum {
  view._(r'View'),
  edit._(r'Edit'),
  ;

  /// Instantiate a new enum with the provided value.
  const GetPermissionResponseTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [GetPermissionResponseTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static GetPermissionResponseTypeEnum? fromJson(dynamic value) => GetPermissionResponseTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [GetPermissionResponseTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<GetPermissionResponseTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetPermissionResponseTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetPermissionResponseTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [GetPermissionResponseTypeEnum] to String,
/// and [decode] dynamic data back to [GetPermissionResponseTypeEnum].
class GetPermissionResponseTypeEnumTypeTransformer {
  factory GetPermissionResponseTypeEnumTypeTransformer() => _instance ??= const GetPermissionResponseTypeEnumTypeTransformer._();

  const GetPermissionResponseTypeEnumTypeTransformer._();

  String encode(GetPermissionResponseTypeEnum data) => data._value;

  /// Returns the instance of [GetPermissionResponseTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  GetPermissionResponseTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is GetPermissionResponseTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'View': return GetPermissionResponseTypeEnum.view;
        case r'Edit': return GetPermissionResponseTypeEnum.edit;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static GetPermissionResponseTypeEnumTypeTransformer? _instance;
}


