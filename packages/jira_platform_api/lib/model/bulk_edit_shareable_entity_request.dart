//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BulkEditShareableEntityRequest {
  /// Returns a new [BulkEditShareableEntityRequest] instance.
  BulkEditShareableEntityRequest({
    required this.action,
    this.changeOwnerDetails,
    this.entityIds = const [],
    this.extendAdminPermissions,
    this.permissionDetails,
  });

  /// Allowed action for bulk edit shareable entity
  BulkEditShareableEntityRequestActionEnum action;

  /// The details of change owner action.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  BulkChangeOwnerDetails? changeOwnerDetails;

  /// The id list of shareable entities to be changed.
  List<int> entityIds;

  /// Whether the actions are executed by users with Administer Jira global permission.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? extendAdminPermissions;

  /// The permission details to be changed.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  PermissionDetails? permissionDetails;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BulkEditShareableEntityRequest &&
    other.action == action &&
    other.changeOwnerDetails == changeOwnerDetails &&
    _deepEquality.equals(other.entityIds, entityIds) &&
    other.extendAdminPermissions == extendAdminPermissions &&
    other.permissionDetails == permissionDetails;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (action.hashCode) +
    (changeOwnerDetails == null ? 0 : changeOwnerDetails!.hashCode) +
    (entityIds.hashCode) +
    (extendAdminPermissions == null ? 0 : extendAdminPermissions!.hashCode) +
    (permissionDetails == null ? 0 : permissionDetails!.hashCode);

  @override
  String toString() => 'BulkEditShareableEntityRequest[action=$action, changeOwnerDetails=$changeOwnerDetails, entityIds=$entityIds, extendAdminPermissions=$extendAdminPermissions, permissionDetails=$permissionDetails]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'action'] = this.action;
    if (this.changeOwnerDetails != null) {
      json[r'changeOwnerDetails'] = this.changeOwnerDetails;
    } else {
      json[r'changeOwnerDetails'] = null;
    }
      json[r'entityIds'] = this.entityIds;
    if (this.extendAdminPermissions != null) {
      json[r'extendAdminPermissions'] = this.extendAdminPermissions;
    } else {
      json[r'extendAdminPermissions'] = null;
    }
    if (this.permissionDetails != null) {
      json[r'permissionDetails'] = this.permissionDetails;
    } else {
      json[r'permissionDetails'] = null;
    }
    return json;
  }

  /// Returns a new [BulkEditShareableEntityRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BulkEditShareableEntityRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'action'), 'Required key "BulkEditShareableEntityRequest[action]" is missing from JSON.');
        assert(json[r'action'] != null, 'Required key "BulkEditShareableEntityRequest[action]" has a null value in JSON.');
        assert(json.containsKey(r'entityIds'), 'Required key "BulkEditShareableEntityRequest[entityIds]" is missing from JSON.');
        assert(json[r'entityIds'] != null, 'Required key "BulkEditShareableEntityRequest[entityIds]" has a null value in JSON.');
        return true;
      }());

      return BulkEditShareableEntityRequest(
        action: BulkEditShareableEntityRequestActionEnum.fromJson(json[r'action'])!,
        changeOwnerDetails: BulkChangeOwnerDetails.fromJson(json[r'changeOwnerDetails']),
        entityIds: json[r'entityIds'] is Iterable
            ? (json[r'entityIds'] as Iterable).cast<int>().toList(growable: false)
            : const [],
        extendAdminPermissions: mapValueOfType<bool>(json, r'extendAdminPermissions'),
        permissionDetails: PermissionDetails.fromJson(json[r'permissionDetails']),
      );
    }
    return null;
  }

  static List<BulkEditShareableEntityRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BulkEditShareableEntityRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BulkEditShareableEntityRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BulkEditShareableEntityRequest> mapFromJson(dynamic json) {
    final map = <String, BulkEditShareableEntityRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BulkEditShareableEntityRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BulkEditShareableEntityRequest-objects as value to a dart map
  static Map<String, List<BulkEditShareableEntityRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BulkEditShareableEntityRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BulkEditShareableEntityRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'action',
    'entityIds',
  };
}

/// Allowed action for bulk edit shareable entity
enum BulkEditShareableEntityRequestActionEnum {
  changeOwner._(r'changeOwner'),
  changePermission._(r'changePermission'),
  addPermission._(r'addPermission'),
  removePermission._(r'removePermission'),
  ;

  /// Instantiate a new enum with the provided value.
  const BulkEditShareableEntityRequestActionEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [BulkEditShareableEntityRequestActionEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static BulkEditShareableEntityRequestActionEnum? fromJson(dynamic value) => BulkEditShareableEntityRequestActionEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [BulkEditShareableEntityRequestActionEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<BulkEditShareableEntityRequestActionEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BulkEditShareableEntityRequestActionEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BulkEditShareableEntityRequestActionEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [BulkEditShareableEntityRequestActionEnum] to String,
/// and [decode] dynamic data back to [BulkEditShareableEntityRequestActionEnum].
class BulkEditShareableEntityRequestActionEnumTypeTransformer {
  factory BulkEditShareableEntityRequestActionEnumTypeTransformer() => _instance ??= const BulkEditShareableEntityRequestActionEnumTypeTransformer._();

  const BulkEditShareableEntityRequestActionEnumTypeTransformer._();

  String encode(BulkEditShareableEntityRequestActionEnum data) => data._value;

  /// Returns the instance of [BulkEditShareableEntityRequestActionEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  BulkEditShareableEntityRequestActionEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is BulkEditShareableEntityRequestActionEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'changeOwner': return BulkEditShareableEntityRequestActionEnum.changeOwner;
        case r'changePermission': return BulkEditShareableEntityRequestActionEnum.changePermission;
        case r'addPermission': return BulkEditShareableEntityRequestActionEnum.addPermission;
        case r'removePermission': return BulkEditShareableEntityRequestActionEnum.removePermission;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static BulkEditShareableEntityRequestActionEnumTypeTransformer? _instance;
}


