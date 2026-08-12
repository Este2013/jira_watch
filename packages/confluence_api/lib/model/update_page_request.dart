//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdatePageRequest {
  /// Returns a new [UpdatePageRequest] instance.
  UpdatePageRequest({
    required this.id,
    required this.status,
    required this.title,
    this.spaceId,
    this.parentId,
    this.ownerId,
    required this.body,
    required this.version,
  });

  /// Id of the page.
  String id;

  /// The updated status of the page.  Note, if you change the status of a page from 'current' to 'draft' and it has an existing draft, the existing draft will be deleted in favor of the updated draft. Additionally, this endpoint can be used to restore a 'trashed' or 'deleted' page to 'current' status. For restoration, page contents will not be updated and only the page status will be changed.
  UpdatePageRequestStatusEnum status;

  /// Title of the page.
  String title;

  /// ID of the containing space.  This currently **does not support moving the page to a different space**.
  Object? spaceId;

  /// ID of the parent content.  This allows the page to be moved under a different parent within the same space.
  Object? parentId;

  /// Account ID of the page owner.  This allows page ownership to be transferred to another user.
  Object? ownerId;

  CreatePageRequestBody body;

  UpdatePageRequestVersion version;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UpdatePageRequest &&
    other.id == id &&
    other.status == status &&
    other.title == title &&
    other.spaceId == spaceId &&
    other.parentId == parentId &&
    other.ownerId == ownerId &&
    other.body == body &&
    other.version == version;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (status.hashCode) +
    (title.hashCode) +
    (spaceId == null ? 0 : spaceId!.hashCode) +
    (parentId == null ? 0 : parentId!.hashCode) +
    (ownerId == null ? 0 : ownerId!.hashCode) +
    (body.hashCode) +
    (version.hashCode);

  @override
  String toString() => 'UpdatePageRequest[id=$id, status=$status, title=$title, spaceId=$spaceId, parentId=$parentId, ownerId=$ownerId, body=$body, version=$version]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'status'] = this.status;
      json[r'title'] = this.title;
    if (this.spaceId != null) {
      json[r'spaceId'] = this.spaceId;
    } else {
      json[r'spaceId'] = null;
    }
    if (this.parentId != null) {
      json[r'parentId'] = this.parentId;
    } else {
      json[r'parentId'] = null;
    }
    if (this.ownerId != null) {
      json[r'ownerId'] = this.ownerId;
    } else {
      json[r'ownerId'] = null;
    }
      json[r'body'] = this.body;
      json[r'version'] = this.version;
    return json;
  }

  /// Returns a new [UpdatePageRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdatePageRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "UpdatePageRequest[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "UpdatePageRequest[id]" has a null value in JSON.');
        assert(json.containsKey(r'status'), 'Required key "UpdatePageRequest[status]" is missing from JSON.');
        assert(json[r'status'] != null, 'Required key "UpdatePageRequest[status]" has a null value in JSON.');
        assert(json.containsKey(r'title'), 'Required key "UpdatePageRequest[title]" is missing from JSON.');
        assert(json[r'title'] != null, 'Required key "UpdatePageRequest[title]" has a null value in JSON.');
        assert(json.containsKey(r'body'), 'Required key "UpdatePageRequest[body]" is missing from JSON.');
        assert(json[r'body'] != null, 'Required key "UpdatePageRequest[body]" has a null value in JSON.');
        assert(json.containsKey(r'version'), 'Required key "UpdatePageRequest[version]" is missing from JSON.');
        assert(json[r'version'] != null, 'Required key "UpdatePageRequest[version]" has a null value in JSON.');
        return true;
      }());

      return UpdatePageRequest(
        id: mapValueOfType<String>(json, r'id')!,
        status: UpdatePageRequestStatusEnum.fromJson(json[r'status'])!,
        title: mapValueOfType<String>(json, r'title')!,
        spaceId: mapValueOfType<Object>(json, r'spaceId'),
        parentId: mapValueOfType<Object>(json, r'parentId'),
        ownerId: mapValueOfType<Object>(json, r'ownerId'),
        body: CreatePageRequestBody.fromJson(json[r'body'])!,
        version: UpdatePageRequestVersion.fromJson(json[r'version'])!,
      );
    }
    return null;
  }

  static List<UpdatePageRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdatePageRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdatePageRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdatePageRequest> mapFromJson(dynamic json) {
    final map = <String, UpdatePageRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdatePageRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdatePageRequest-objects as value to a dart map
  static Map<String, List<UpdatePageRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UpdatePageRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdatePageRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'status',
    'title',
    'body',
    'version',
  };
}

/// The updated status of the page.  Note, if you change the status of a page from 'current' to 'draft' and it has an existing draft, the existing draft will be deleted in favor of the updated draft. Additionally, this endpoint can be used to restore a 'trashed' or 'deleted' page to 'current' status. For restoration, page contents will not be updated and only the page status will be changed.
enum UpdatePageRequestStatusEnum {
  current._(r'current'),
  draft._(r'draft'),
  ;

  /// Instantiate a new enum with the provided value.
  const UpdatePageRequestStatusEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [UpdatePageRequestStatusEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static UpdatePageRequestStatusEnum? fromJson(dynamic value) => UpdatePageRequestStatusEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [UpdatePageRequestStatusEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<UpdatePageRequestStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdatePageRequestStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdatePageRequestStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [UpdatePageRequestStatusEnum] to String,
/// and [decode] dynamic data back to [UpdatePageRequestStatusEnum].
class UpdatePageRequestStatusEnumTypeTransformer {
  factory UpdatePageRequestStatusEnumTypeTransformer() => _instance ??= const UpdatePageRequestStatusEnumTypeTransformer._();

  const UpdatePageRequestStatusEnumTypeTransformer._();

  String encode(UpdatePageRequestStatusEnum data) => data._value;

  /// Returns the instance of [UpdatePageRequestStatusEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  UpdatePageRequestStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is UpdatePageRequestStatusEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'current': return UpdatePageRequestStatusEnum.current;
        case r'draft': return UpdatePageRequestStatusEnum.draft;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static UpdatePageRequestStatusEnumTypeTransformer? _instance;
}


