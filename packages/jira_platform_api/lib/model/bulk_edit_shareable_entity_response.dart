//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BulkEditShareableEntityResponse {
  /// Returns a new [BulkEditShareableEntityResponse] instance.
  BulkEditShareableEntityResponse({
    required this.action,
    this.entityErrors = const {},
  });

  /// Allowed action for bulk edit shareable entity
  BulkEditShareableEntityResponseActionEnum action;

  /// The mapping dashboard id to errors if any.
  Map<String, BulkEditActionError> entityErrors;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BulkEditShareableEntityResponse &&
    other.action == action &&
    _deepEquality.equals(other.entityErrors, entityErrors);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (action.hashCode) +
    (entityErrors.hashCode);

  @override
  String toString() => 'BulkEditShareableEntityResponse[action=$action, entityErrors=$entityErrors]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'action'] = this.action;
      json[r'entityErrors'] = this.entityErrors;
    return json;
  }

  /// Returns a new [BulkEditShareableEntityResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BulkEditShareableEntityResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'action'), 'Required key "BulkEditShareableEntityResponse[action]" is missing from JSON.');
        assert(json[r'action'] != null, 'Required key "BulkEditShareableEntityResponse[action]" has a null value in JSON.');
        return true;
      }());

      return BulkEditShareableEntityResponse(
        action: BulkEditShareableEntityResponseActionEnum.fromJson(json[r'action'])!,
        entityErrors: BulkEditActionError.mapFromJson(json[r'entityErrors']),
      );
    }
    return null;
  }

  static List<BulkEditShareableEntityResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BulkEditShareableEntityResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BulkEditShareableEntityResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BulkEditShareableEntityResponse> mapFromJson(dynamic json) {
    final map = <String, BulkEditShareableEntityResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BulkEditShareableEntityResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BulkEditShareableEntityResponse-objects as value to a dart map
  static Map<String, List<BulkEditShareableEntityResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BulkEditShareableEntityResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BulkEditShareableEntityResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'action',
  };
}

/// Allowed action for bulk edit shareable entity
enum BulkEditShareableEntityResponseActionEnum {
  changeOwner._(r'changeOwner'),
  changePermission._(r'changePermission'),
  addPermission._(r'addPermission'),
  removePermission._(r'removePermission'),
  ;

  /// Instantiate a new enum with the provided value.
  const BulkEditShareableEntityResponseActionEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [BulkEditShareableEntityResponseActionEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static BulkEditShareableEntityResponseActionEnum? fromJson(dynamic value) => BulkEditShareableEntityResponseActionEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [BulkEditShareableEntityResponseActionEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<BulkEditShareableEntityResponseActionEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BulkEditShareableEntityResponseActionEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BulkEditShareableEntityResponseActionEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [BulkEditShareableEntityResponseActionEnum] to String,
/// and [decode] dynamic data back to [BulkEditShareableEntityResponseActionEnum].
class BulkEditShareableEntityResponseActionEnumTypeTransformer {
  factory BulkEditShareableEntityResponseActionEnumTypeTransformer() => _instance ??= const BulkEditShareableEntityResponseActionEnumTypeTransformer._();

  const BulkEditShareableEntityResponseActionEnumTypeTransformer._();

  String encode(BulkEditShareableEntityResponseActionEnum data) => data._value;

  /// Returns the instance of [BulkEditShareableEntityResponseActionEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  BulkEditShareableEntityResponseActionEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is BulkEditShareableEntityResponseActionEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'changeOwner': return BulkEditShareableEntityResponseActionEnum.changeOwner;
        case r'changePermission': return BulkEditShareableEntityResponseActionEnum.changePermission;
        case r'addPermission': return BulkEditShareableEntityResponseActionEnum.addPermission;
        case r'removePermission': return BulkEditShareableEntityResponseActionEnum.removePermission;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static BulkEditShareableEntityResponseActionEnumTypeTransformer? _instance;
}


