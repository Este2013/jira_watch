//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateBlogPostRequest {
  /// Returns a new [UpdateBlogPostRequest] instance.
  UpdateBlogPostRequest({
    required this.id,
    required this.status,
    required this.title,
    this.spaceId,
    required this.body,
    required this.version,
    this.createdAt,
  });

  /// Id of the blog post.
  String id;

  /// The updated status of the blog post.  Note, if you change the status of a blog post from 'current' to 'draft' and it has an existing draft, the existing draft will be deleted in favor of the updated draft. Additionally, this endpoint can be used to restore a 'trashed' or 'deleted' blog post to 'current' status. For restoration, blog post contents will not be updated and only the blog post status will be changed.
  UpdateBlogPostRequestStatusEnum status;

  /// Title of the blog post.
  String title;

  /// ID of the containing space.  This currently **does not support moving the blog post to a different space**.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? spaceId;

  CreateBlogPostRequestBody body;

  UpdateBlogPostRequestVersion version;

  /// Created date of the blog post in the format of \"yyyy-MM-ddTHH:mm:ss.SSSZ\".
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? createdAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UpdateBlogPostRequest &&
    other.id == id &&
    other.status == status &&
    other.title == title &&
    other.spaceId == spaceId &&
    other.body == body &&
    other.version == version &&
    other.createdAt == createdAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (status.hashCode) +
    (title.hashCode) +
    (spaceId == null ? 0 : spaceId!.hashCode) +
    (body.hashCode) +
    (version.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode);

  @override
  String toString() => 'UpdateBlogPostRequest[id=$id, status=$status, title=$title, spaceId=$spaceId, body=$body, version=$version, createdAt=$createdAt]';

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
      json[r'body'] = this.body;
      json[r'version'] = this.version;
    if (this.createdAt != null) {
      json[r'createdAt'] = this.createdAt;
    } else {
      json[r'createdAt'] = null;
    }
    return json;
  }

  /// Returns a new [UpdateBlogPostRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateBlogPostRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "UpdateBlogPostRequest[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "UpdateBlogPostRequest[id]" has a null value in JSON.');
        assert(json.containsKey(r'status'), 'Required key "UpdateBlogPostRequest[status]" is missing from JSON.');
        assert(json[r'status'] != null, 'Required key "UpdateBlogPostRequest[status]" has a null value in JSON.');
        assert(json.containsKey(r'title'), 'Required key "UpdateBlogPostRequest[title]" is missing from JSON.');
        assert(json[r'title'] != null, 'Required key "UpdateBlogPostRequest[title]" has a null value in JSON.');
        assert(json.containsKey(r'body'), 'Required key "UpdateBlogPostRequest[body]" is missing from JSON.');
        assert(json[r'body'] != null, 'Required key "UpdateBlogPostRequest[body]" has a null value in JSON.');
        assert(json.containsKey(r'version'), 'Required key "UpdateBlogPostRequest[version]" is missing from JSON.');
        assert(json[r'version'] != null, 'Required key "UpdateBlogPostRequest[version]" has a null value in JSON.');
        return true;
      }());

      return UpdateBlogPostRequest(
        id: mapValueOfType<String>(json, r'id')!,
        status: UpdateBlogPostRequestStatusEnum.fromJson(json[r'status'])!,
        title: mapValueOfType<String>(json, r'title')!,
        spaceId: mapValueOfType<String>(json, r'spaceId'),
        body: CreateBlogPostRequestBody.fromJson(json[r'body'])!,
        version: UpdateBlogPostRequestVersion.fromJson(json[r'version'])!,
        createdAt: mapValueOfType<String>(json, r'createdAt'),
      );
    }
    return null;
  }

  static List<UpdateBlogPostRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdateBlogPostRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateBlogPostRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateBlogPostRequest> mapFromJson(dynamic json) {
    final map = <String, UpdateBlogPostRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateBlogPostRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateBlogPostRequest-objects as value to a dart map
  static Map<String, List<UpdateBlogPostRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UpdateBlogPostRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdateBlogPostRequest.listFromJson(entry.value, growable: growable,);
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

/// The updated status of the blog post.  Note, if you change the status of a blog post from 'current' to 'draft' and it has an existing draft, the existing draft will be deleted in favor of the updated draft. Additionally, this endpoint can be used to restore a 'trashed' or 'deleted' blog post to 'current' status. For restoration, blog post contents will not be updated and only the blog post status will be changed.
enum UpdateBlogPostRequestStatusEnum {
  current._(r'current'),
  draft._(r'draft'),
  ;

  /// Instantiate a new enum with the provided value.
  const UpdateBlogPostRequestStatusEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [UpdateBlogPostRequestStatusEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static UpdateBlogPostRequestStatusEnum? fromJson(dynamic value) => UpdateBlogPostRequestStatusEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [UpdateBlogPostRequestStatusEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<UpdateBlogPostRequestStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdateBlogPostRequestStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateBlogPostRequestStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [UpdateBlogPostRequestStatusEnum] to String,
/// and [decode] dynamic data back to [UpdateBlogPostRequestStatusEnum].
class UpdateBlogPostRequestStatusEnumTypeTransformer {
  factory UpdateBlogPostRequestStatusEnumTypeTransformer() => _instance ??= const UpdateBlogPostRequestStatusEnumTypeTransformer._();

  const UpdateBlogPostRequestStatusEnumTypeTransformer._();

  String encode(UpdateBlogPostRequestStatusEnum data) => data._value;

  /// Returns the instance of [UpdateBlogPostRequestStatusEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  UpdateBlogPostRequestStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is UpdateBlogPostRequestStatusEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'current': return UpdateBlogPostRequestStatusEnum.current;
        case r'draft': return UpdateBlogPostRequestStatusEnum.draft;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static UpdateBlogPostRequestStatusEnumTypeTransformer? _instance;
}


