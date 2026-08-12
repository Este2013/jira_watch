//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BulkTransitionPrincipalTypeAssignment {
  /// Returns a new [BulkTransitionPrincipalTypeAssignment] instance.
  BulkTransitionPrincipalTypeAssignment({
    required this.principalType,
    required this.removeAccess,
    this.roleId,
  });

  /// The type of principal.
  BulkTransitionPrincipalTypeAssignmentPrincipalTypeEnum principalType;

  /// Whether to remove access for this principal type instead of assigning a role.
  bool removeAccess;

  /// The UUID of the space role to assign. Required when removeAccess is false.
  String? roleId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BulkTransitionPrincipalTypeAssignment &&
    other.principalType == principalType &&
    other.removeAccess == removeAccess &&
    other.roleId == roleId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (principalType.hashCode) +
    (removeAccess.hashCode) +
    (roleId == null ? 0 : roleId!.hashCode);

  @override
  String toString() => 'BulkTransitionPrincipalTypeAssignment[principalType=$principalType, removeAccess=$removeAccess, roleId=$roleId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'principalType'] = this.principalType;
      json[r'removeAccess'] = this.removeAccess;
    if (this.roleId != null) {
      json[r'roleId'] = this.roleId;
    } else {
      json[r'roleId'] = null;
    }
    return json;
  }

  /// Returns a new [BulkTransitionPrincipalTypeAssignment] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BulkTransitionPrincipalTypeAssignment? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'principalType'), 'Required key "BulkTransitionPrincipalTypeAssignment[principalType]" is missing from JSON.');
        assert(json[r'principalType'] != null, 'Required key "BulkTransitionPrincipalTypeAssignment[principalType]" has a null value in JSON.');
        assert(json.containsKey(r'removeAccess'), 'Required key "BulkTransitionPrincipalTypeAssignment[removeAccess]" is missing from JSON.');
        assert(json[r'removeAccess'] != null, 'Required key "BulkTransitionPrincipalTypeAssignment[removeAccess]" has a null value in JSON.');
        return true;
      }());

      return BulkTransitionPrincipalTypeAssignment(
        principalType: BulkTransitionPrincipalTypeAssignmentPrincipalTypeEnum.fromJson(json[r'principalType'])!,
        removeAccess: mapValueOfType<bool>(json, r'removeAccess')!,
        roleId: mapValueOfType<String>(json, r'roleId'),
      );
    }
    return null;
  }

  static List<BulkTransitionPrincipalTypeAssignment> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BulkTransitionPrincipalTypeAssignment>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BulkTransitionPrincipalTypeAssignment.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BulkTransitionPrincipalTypeAssignment> mapFromJson(dynamic json) {
    final map = <String, BulkTransitionPrincipalTypeAssignment>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BulkTransitionPrincipalTypeAssignment.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BulkTransitionPrincipalTypeAssignment-objects as value to a dart map
  static Map<String, List<BulkTransitionPrincipalTypeAssignment>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BulkTransitionPrincipalTypeAssignment>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BulkTransitionPrincipalTypeAssignment.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'principalType',
    'removeAccess',
  };
}

/// The type of principal.
enum BulkTransitionPrincipalTypeAssignmentPrincipalTypeEnum {
  USER._(r'USER'),
  GROUP._(r'GROUP'),
  GUEST._(r'GUEST'),
  ANONYMOUS._(r'ANONYMOUS'),
  ALL_LICENSED_USERS_USER_CLASS._(r'ALL_LICENSED_USERS_USER_CLASS'),
  ALL_PRODUCT_ADMINS_USER_CLASS._(r'ALL_PRODUCT_ADMINS_USER_CLASS'),
  APP._(r'APP'),
  ;

  /// Instantiate a new enum with the provided value.
  const BulkTransitionPrincipalTypeAssignmentPrincipalTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [BulkTransitionPrincipalTypeAssignmentPrincipalTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static BulkTransitionPrincipalTypeAssignmentPrincipalTypeEnum? fromJson(dynamic value) => BulkTransitionPrincipalTypeAssignmentPrincipalTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [BulkTransitionPrincipalTypeAssignmentPrincipalTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<BulkTransitionPrincipalTypeAssignmentPrincipalTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BulkTransitionPrincipalTypeAssignmentPrincipalTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BulkTransitionPrincipalTypeAssignmentPrincipalTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [BulkTransitionPrincipalTypeAssignmentPrincipalTypeEnum] to String,
/// and [decode] dynamic data back to [BulkTransitionPrincipalTypeAssignmentPrincipalTypeEnum].
class BulkTransitionPrincipalTypeAssignmentPrincipalTypeEnumTypeTransformer {
  factory BulkTransitionPrincipalTypeAssignmentPrincipalTypeEnumTypeTransformer() => _instance ??= const BulkTransitionPrincipalTypeAssignmentPrincipalTypeEnumTypeTransformer._();

  const BulkTransitionPrincipalTypeAssignmentPrincipalTypeEnumTypeTransformer._();

  String encode(BulkTransitionPrincipalTypeAssignmentPrincipalTypeEnum data) => data._value;

  /// Returns the instance of [BulkTransitionPrincipalTypeAssignmentPrincipalTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  BulkTransitionPrincipalTypeAssignmentPrincipalTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is BulkTransitionPrincipalTypeAssignmentPrincipalTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'USER': return BulkTransitionPrincipalTypeAssignmentPrincipalTypeEnum.USER;
        case r'GROUP': return BulkTransitionPrincipalTypeAssignmentPrincipalTypeEnum.GROUP;
        case r'GUEST': return BulkTransitionPrincipalTypeAssignmentPrincipalTypeEnum.GUEST;
        case r'ANONYMOUS': return BulkTransitionPrincipalTypeAssignmentPrincipalTypeEnum.ANONYMOUS;
        case r'ALL_LICENSED_USERS_USER_CLASS': return BulkTransitionPrincipalTypeAssignmentPrincipalTypeEnum.ALL_LICENSED_USERS_USER_CLASS;
        case r'ALL_PRODUCT_ADMINS_USER_CLASS': return BulkTransitionPrincipalTypeAssignmentPrincipalTypeEnum.ALL_PRODUCT_ADMINS_USER_CLASS;
        case r'APP': return BulkTransitionPrincipalTypeAssignmentPrincipalTypeEnum.APP;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static BulkTransitionPrincipalTypeAssignmentPrincipalTypeEnumTypeTransformer? _instance;
}


