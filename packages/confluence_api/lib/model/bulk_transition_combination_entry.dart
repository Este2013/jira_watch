//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BulkTransitionCombinationEntry {
  /// Returns a new [BulkTransitionCombinationEntry] instance.
  BulkTransitionCombinationEntry({
    required this.combinationId,
    required this.spaceCount,
    required this.principalCount,
    this.permissions = const [],
    this.principalTypes = const [],
  });

  /// The opaque id identifying this unique combination of space permissions. Pass directly to the bulk role-assignments or access-removals endpoints.
  String combinationId;

  /// Number of spaces that currently have this combination.
  int spaceCount;

  /// Number of principals (users / groups / etc.) that currently have this combination.
  int principalCount;

  /// The decoded space permissions that make up this combination.
  List<BulkTransitionDecodedPermission> permissions;

  /// The principal types that currently hold this combination and can be reassigned via the bulk role-assignments endpoint. Use this to know which `principalType` entries are valid to include in the bulk-assign request for this combination.
  List<BulkTransitionCombinationEntryPrincipalTypesEnum> principalTypes;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BulkTransitionCombinationEntry &&
    other.combinationId == combinationId &&
    other.spaceCount == spaceCount &&
    other.principalCount == principalCount &&
    _deepEquality.equals(other.permissions, permissions) &&
    _deepEquality.equals(other.principalTypes, principalTypes);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (combinationId.hashCode) +
    (spaceCount.hashCode) +
    (principalCount.hashCode) +
    (permissions.hashCode) +
    (principalTypes.hashCode);

  @override
  String toString() => 'BulkTransitionCombinationEntry[combinationId=$combinationId, spaceCount=$spaceCount, principalCount=$principalCount, permissions=$permissions, principalTypes=$principalTypes]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'combinationId'] = this.combinationId;
      json[r'spaceCount'] = this.spaceCount;
      json[r'principalCount'] = this.principalCount;
      json[r'permissions'] = this.permissions;
      json[r'principalTypes'] = this.principalTypes;
    return json;
  }

  /// Returns a new [BulkTransitionCombinationEntry] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BulkTransitionCombinationEntry? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'combinationId'), 'Required key "BulkTransitionCombinationEntry[combinationId]" is missing from JSON.');
        assert(json[r'combinationId'] != null, 'Required key "BulkTransitionCombinationEntry[combinationId]" has a null value in JSON.');
        assert(json.containsKey(r'spaceCount'), 'Required key "BulkTransitionCombinationEntry[spaceCount]" is missing from JSON.');
        assert(json[r'spaceCount'] != null, 'Required key "BulkTransitionCombinationEntry[spaceCount]" has a null value in JSON.');
        assert(json.containsKey(r'principalCount'), 'Required key "BulkTransitionCombinationEntry[principalCount]" is missing from JSON.');
        assert(json[r'principalCount'] != null, 'Required key "BulkTransitionCombinationEntry[principalCount]" has a null value in JSON.');
        assert(json.containsKey(r'permissions'), 'Required key "BulkTransitionCombinationEntry[permissions]" is missing from JSON.');
        assert(json[r'permissions'] != null, 'Required key "BulkTransitionCombinationEntry[permissions]" has a null value in JSON.');
        assert(json.containsKey(r'principalTypes'), 'Required key "BulkTransitionCombinationEntry[principalTypes]" is missing from JSON.');
        assert(json[r'principalTypes'] != null, 'Required key "BulkTransitionCombinationEntry[principalTypes]" has a null value in JSON.');
        return true;
      }());

      return BulkTransitionCombinationEntry(
        combinationId: mapValueOfType<String>(json, r'combinationId')!,
        spaceCount: mapValueOfType<int>(json, r'spaceCount')!,
        principalCount: mapValueOfType<int>(json, r'principalCount')!,
        permissions: BulkTransitionDecodedPermission.listFromJson(json[r'permissions']),
        principalTypes: BulkTransitionCombinationEntryPrincipalTypesEnum.listFromJson(json[r'principalTypes']),
      );
    }
    return null;
  }

  static List<BulkTransitionCombinationEntry> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BulkTransitionCombinationEntry>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BulkTransitionCombinationEntry.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BulkTransitionCombinationEntry> mapFromJson(dynamic json) {
    final map = <String, BulkTransitionCombinationEntry>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BulkTransitionCombinationEntry.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BulkTransitionCombinationEntry-objects as value to a dart map
  static Map<String, List<BulkTransitionCombinationEntry>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BulkTransitionCombinationEntry>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BulkTransitionCombinationEntry.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'combinationId',
    'spaceCount',
    'principalCount',
    'permissions',
    'principalTypes',
  };
}


enum BulkTransitionCombinationEntryPrincipalTypesEnum {
  USER._(r'USER'),
  GROUP._(r'GROUP'),
  GUEST._(r'GUEST'),
  ANONYMOUS._(r'ANONYMOUS'),
  ALL_LICENSED_USERS_USER_CLASS._(r'ALL_LICENSED_USERS_USER_CLASS'),
  ALL_PRODUCT_ADMINS_USER_CLASS._(r'ALL_PRODUCT_ADMINS_USER_CLASS'),
  APP._(r'APP'),
  TEAM._(r'TEAM'),
  ;

  /// Instantiate a new enum with the provided value.
  const BulkTransitionCombinationEntryPrincipalTypesEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [BulkTransitionCombinationEntryPrincipalTypesEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static BulkTransitionCombinationEntryPrincipalTypesEnum? fromJson(dynamic value) => BulkTransitionCombinationEntryPrincipalTypesEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [BulkTransitionCombinationEntryPrincipalTypesEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<BulkTransitionCombinationEntryPrincipalTypesEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BulkTransitionCombinationEntryPrincipalTypesEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BulkTransitionCombinationEntryPrincipalTypesEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [BulkTransitionCombinationEntryPrincipalTypesEnum] to String,
/// and [decode] dynamic data back to [BulkTransitionCombinationEntryPrincipalTypesEnum].
class BulkTransitionCombinationEntryPrincipalTypesEnumTypeTransformer {
  factory BulkTransitionCombinationEntryPrincipalTypesEnumTypeTransformer() => _instance ??= const BulkTransitionCombinationEntryPrincipalTypesEnumTypeTransformer._();

  const BulkTransitionCombinationEntryPrincipalTypesEnumTypeTransformer._();

  String encode(BulkTransitionCombinationEntryPrincipalTypesEnum data) => data._value;

  /// Returns the instance of [BulkTransitionCombinationEntryPrincipalTypesEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  BulkTransitionCombinationEntryPrincipalTypesEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is BulkTransitionCombinationEntryPrincipalTypesEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'USER': return BulkTransitionCombinationEntryPrincipalTypesEnum.USER;
        case r'GROUP': return BulkTransitionCombinationEntryPrincipalTypesEnum.GROUP;
        case r'GUEST': return BulkTransitionCombinationEntryPrincipalTypesEnum.GUEST;
        case r'ANONYMOUS': return BulkTransitionCombinationEntryPrincipalTypesEnum.ANONYMOUS;
        case r'ALL_LICENSED_USERS_USER_CLASS': return BulkTransitionCombinationEntryPrincipalTypesEnum.ALL_LICENSED_USERS_USER_CLASS;
        case r'ALL_PRODUCT_ADMINS_USER_CLASS': return BulkTransitionCombinationEntryPrincipalTypesEnum.ALL_PRODUCT_ADMINS_USER_CLASS;
        case r'APP': return BulkTransitionCombinationEntryPrincipalTypesEnum.APP;
        case r'TEAM': return BulkTransitionCombinationEntryPrincipalTypesEnum.TEAM;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static BulkTransitionCombinationEntryPrincipalTypesEnumTypeTransformer? _instance;
}


