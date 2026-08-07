//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreatePermissionHolderRequest {
  /// Returns a new [CreatePermissionHolderRequest] instance.
  CreatePermissionHolderRequest({
    required this.type,
    required this.value,
  });

  /// The permission holder type. This must be \"Group\" or \"AccountId\".
  CreatePermissionHolderRequestTypeEnum type;

  /// The permission holder value. This must be a group name if the type is \"Group\" or an account ID if the type is \"AccountId\".
  String value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreatePermissionHolderRequest &&
    other.type == type &&
    other.value == value;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (type.hashCode) +
    (value.hashCode);

  @override
  String toString() => 'CreatePermissionHolderRequest[type=$type, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'type'] = this.type;
      json[r'value'] = this.value;
    return json;
  }

  /// Returns a new [CreatePermissionHolderRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreatePermissionHolderRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'type'), 'Required key "CreatePermissionHolderRequest[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "CreatePermissionHolderRequest[type]" has a null value in JSON.');
        assert(json.containsKey(r'value'), 'Required key "CreatePermissionHolderRequest[value]" is missing from JSON.');
        assert(json[r'value'] != null, 'Required key "CreatePermissionHolderRequest[value]" has a null value in JSON.');
        return true;
      }());

      return CreatePermissionHolderRequest(
        type: CreatePermissionHolderRequestTypeEnum.fromJson(json[r'type'])!,
        value: mapValueOfType<String>(json, r'value')!,
      );
    }
    return null;
  }

  static List<CreatePermissionHolderRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreatePermissionHolderRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreatePermissionHolderRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreatePermissionHolderRequest> mapFromJson(dynamic json) {
    final map = <String, CreatePermissionHolderRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreatePermissionHolderRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreatePermissionHolderRequest-objects as value to a dart map
  static Map<String, List<CreatePermissionHolderRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreatePermissionHolderRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreatePermissionHolderRequest.listFromJson(entry.value, growable: growable,);
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

/// The permission holder type. This must be \"Group\" or \"AccountId\".
enum CreatePermissionHolderRequestTypeEnum {
  group._(r'Group'),
  accountId._(r'AccountId'),
  ;

  /// Instantiate a new enum with the provided value.
  const CreatePermissionHolderRequestTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [CreatePermissionHolderRequestTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static CreatePermissionHolderRequestTypeEnum? fromJson(dynamic value) => CreatePermissionHolderRequestTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [CreatePermissionHolderRequestTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<CreatePermissionHolderRequestTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreatePermissionHolderRequestTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreatePermissionHolderRequestTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CreatePermissionHolderRequestTypeEnum] to String,
/// and [decode] dynamic data back to [CreatePermissionHolderRequestTypeEnum].
class CreatePermissionHolderRequestTypeEnumTypeTransformer {
  factory CreatePermissionHolderRequestTypeEnumTypeTransformer() => _instance ??= const CreatePermissionHolderRequestTypeEnumTypeTransformer._();

  const CreatePermissionHolderRequestTypeEnumTypeTransformer._();

  String encode(CreatePermissionHolderRequestTypeEnum data) => data._value;

  /// Returns the instance of [CreatePermissionHolderRequestTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CreatePermissionHolderRequestTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is CreatePermissionHolderRequestTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'Group': return CreatePermissionHolderRequestTypeEnum.group;
        case r'AccountId': return CreatePermissionHolderRequestTypeEnum.accountId;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static CreatePermissionHolderRequestTypeEnumTypeTransformer? _instance;
}


