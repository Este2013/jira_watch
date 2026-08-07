//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SpacePermissionAssignmentOperation {
  /// Returns a new [SpacePermissionAssignmentOperation] instance.
  SpacePermissionAssignmentOperation({
    this.key,
    this.targetType,
  });

  /// The type of operation.
  SpacePermissionAssignmentOperationKeyEnum? key;

  /// The type of entity the operation type targets.
  SpacePermissionAssignmentOperationTargetTypeEnum? targetType;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SpacePermissionAssignmentOperation &&
    other.key == key &&
    other.targetType == targetType;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (key == null ? 0 : key!.hashCode) +
    (targetType == null ? 0 : targetType!.hashCode);

  @override
  String toString() => 'SpacePermissionAssignmentOperation[key=$key, targetType=$targetType]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.key != null) {
      json[r'key'] = this.key;
    } else {
      json[r'key'] = null;
    }
    if (this.targetType != null) {
      json[r'targetType'] = this.targetType;
    } else {
      json[r'targetType'] = null;
    }
    return json;
  }

  /// Returns a new [SpacePermissionAssignmentOperation] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SpacePermissionAssignmentOperation? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return SpacePermissionAssignmentOperation(
        key: SpacePermissionAssignmentOperationKeyEnum.fromJson(json[r'key']),
        targetType: SpacePermissionAssignmentOperationTargetTypeEnum.fromJson(json[r'targetType']),
      );
    }
    return null;
  }

  static List<SpacePermissionAssignmentOperation> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SpacePermissionAssignmentOperation>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SpacePermissionAssignmentOperation.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SpacePermissionAssignmentOperation> mapFromJson(dynamic json) {
    final map = <String, SpacePermissionAssignmentOperation>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SpacePermissionAssignmentOperation.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SpacePermissionAssignmentOperation-objects as value to a dart map
  static Map<String, List<SpacePermissionAssignmentOperation>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SpacePermissionAssignmentOperation>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SpacePermissionAssignmentOperation.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The type of operation.
enum SpacePermissionAssignmentOperationKeyEnum {
  use._(r'use'),
  create._(r'create'),
  read._(r'read'),
  update._(r'update'),
  delete._(r'delete'),
  copy._(r'copy'),
  move._(r'move'),
  export_._(r'export'),
  purge._(r'purge'),
  purgeVersion._(r'purge_version'),
  administer._(r'administer'),
  restore._(r'restore'),
  createSpace._(r'create_space'),
  restrictContent._(r'restrict_content'),
  archive._(r'archive'),
  ;

  /// Instantiate a new enum with the provided value.
  const SpacePermissionAssignmentOperationKeyEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [SpacePermissionAssignmentOperationKeyEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static SpacePermissionAssignmentOperationKeyEnum? fromJson(dynamic value) => SpacePermissionAssignmentOperationKeyEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [SpacePermissionAssignmentOperationKeyEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<SpacePermissionAssignmentOperationKeyEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SpacePermissionAssignmentOperationKeyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SpacePermissionAssignmentOperationKeyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SpacePermissionAssignmentOperationKeyEnum] to String,
/// and [decode] dynamic data back to [SpacePermissionAssignmentOperationKeyEnum].
class SpacePermissionAssignmentOperationKeyEnumTypeTransformer {
  factory SpacePermissionAssignmentOperationKeyEnumTypeTransformer() => _instance ??= const SpacePermissionAssignmentOperationKeyEnumTypeTransformer._();

  const SpacePermissionAssignmentOperationKeyEnumTypeTransformer._();

  String encode(SpacePermissionAssignmentOperationKeyEnum data) => data._value;

  /// Returns the instance of [SpacePermissionAssignmentOperationKeyEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SpacePermissionAssignmentOperationKeyEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is SpacePermissionAssignmentOperationKeyEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'use': return SpacePermissionAssignmentOperationKeyEnum.use;
        case r'create': return SpacePermissionAssignmentOperationKeyEnum.create;
        case r'read': return SpacePermissionAssignmentOperationKeyEnum.read;
        case r'update': return SpacePermissionAssignmentOperationKeyEnum.update;
        case r'delete': return SpacePermissionAssignmentOperationKeyEnum.delete;
        case r'copy': return SpacePermissionAssignmentOperationKeyEnum.copy;
        case r'move': return SpacePermissionAssignmentOperationKeyEnum.move;
        case r'export': return SpacePermissionAssignmentOperationKeyEnum.export_;
        case r'purge': return SpacePermissionAssignmentOperationKeyEnum.purge;
        case r'purge_version': return SpacePermissionAssignmentOperationKeyEnum.purgeVersion;
        case r'administer': return SpacePermissionAssignmentOperationKeyEnum.administer;
        case r'restore': return SpacePermissionAssignmentOperationKeyEnum.restore;
        case r'create_space': return SpacePermissionAssignmentOperationKeyEnum.createSpace;
        case r'restrict_content': return SpacePermissionAssignmentOperationKeyEnum.restrictContent;
        case r'archive': return SpacePermissionAssignmentOperationKeyEnum.archive;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static SpacePermissionAssignmentOperationKeyEnumTypeTransformer? _instance;
}


/// The type of entity the operation type targets.
enum SpacePermissionAssignmentOperationTargetTypeEnum {
  page._(r'page'),
  blogpost._(r'blogpost'),
  comment._(r'comment'),
  attachment._(r'attachment'),
  whiteboard._(r'whiteboard'),
  database._(r'database'),
  embed._(r'embed'),
  folder._(r'folder'),
  space._(r'space'),
  application._(r'application'),
  userProfile._(r'userProfile'),
  ;

  /// Instantiate a new enum with the provided value.
  const SpacePermissionAssignmentOperationTargetTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [SpacePermissionAssignmentOperationTargetTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static SpacePermissionAssignmentOperationTargetTypeEnum? fromJson(dynamic value) => SpacePermissionAssignmentOperationTargetTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [SpacePermissionAssignmentOperationTargetTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<SpacePermissionAssignmentOperationTargetTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SpacePermissionAssignmentOperationTargetTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SpacePermissionAssignmentOperationTargetTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SpacePermissionAssignmentOperationTargetTypeEnum] to String,
/// and [decode] dynamic data back to [SpacePermissionAssignmentOperationTargetTypeEnum].
class SpacePermissionAssignmentOperationTargetTypeEnumTypeTransformer {
  factory SpacePermissionAssignmentOperationTargetTypeEnumTypeTransformer() => _instance ??= const SpacePermissionAssignmentOperationTargetTypeEnumTypeTransformer._();

  const SpacePermissionAssignmentOperationTargetTypeEnumTypeTransformer._();

  String encode(SpacePermissionAssignmentOperationTargetTypeEnum data) => data._value;

  /// Returns the instance of [SpacePermissionAssignmentOperationTargetTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SpacePermissionAssignmentOperationTargetTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is SpacePermissionAssignmentOperationTargetTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'page': return SpacePermissionAssignmentOperationTargetTypeEnum.page;
        case r'blogpost': return SpacePermissionAssignmentOperationTargetTypeEnum.blogpost;
        case r'comment': return SpacePermissionAssignmentOperationTargetTypeEnum.comment;
        case r'attachment': return SpacePermissionAssignmentOperationTargetTypeEnum.attachment;
        case r'whiteboard': return SpacePermissionAssignmentOperationTargetTypeEnum.whiteboard;
        case r'database': return SpacePermissionAssignmentOperationTargetTypeEnum.database;
        case r'embed': return SpacePermissionAssignmentOperationTargetTypeEnum.embed;
        case r'folder': return SpacePermissionAssignmentOperationTargetTypeEnum.folder;
        case r'space': return SpacePermissionAssignmentOperationTargetTypeEnum.space;
        case r'application': return SpacePermissionAssignmentOperationTargetTypeEnum.application;
        case r'userProfile': return SpacePermissionAssignmentOperationTargetTypeEnum.userProfile;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static SpacePermissionAssignmentOperationTargetTypeEnumTypeTransformer? _instance;
}


