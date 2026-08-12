//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateCustomContentRequest {
  /// Returns a new [UpdateCustomContentRequest] instance.
  UpdateCustomContentRequest({
    required this.id,
    required this.type,
    required this.status,
    this.spaceId,
    this.pageId,
    this.blogPostId,
    this.customContentId,
    required this.title,
    required this.body,
    required this.version,
  });

  /// Id of custom content.
  String id;

  /// Type of custom content.
  String type;

  /// The status of the custom content.
  UpdateCustomContentRequestStatusEnum status;

  /// ID of the containing space (must be the same as the spaceId of the space the custom content was created in).
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? spaceId;

  /// ID of the containing page.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? pageId;

  /// ID of the containing Blog Post.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? blogPostId;

  /// ID of the containing custom content.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? customContentId;

  /// Title of the custom content.
  String title;

  CreateCustomContentRequestBody body;

  UpdateCustomContentRequestVersion version;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UpdateCustomContentRequest &&
    other.id == id &&
    other.type == type &&
    other.status == status &&
    other.spaceId == spaceId &&
    other.pageId == pageId &&
    other.blogPostId == blogPostId &&
    other.customContentId == customContentId &&
    other.title == title &&
    other.body == body &&
    other.version == version;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (type.hashCode) +
    (status.hashCode) +
    (spaceId == null ? 0 : spaceId!.hashCode) +
    (pageId == null ? 0 : pageId!.hashCode) +
    (blogPostId == null ? 0 : blogPostId!.hashCode) +
    (customContentId == null ? 0 : customContentId!.hashCode) +
    (title.hashCode) +
    (body.hashCode) +
    (version.hashCode);

  @override
  String toString() => 'UpdateCustomContentRequest[id=$id, type=$type, status=$status, spaceId=$spaceId, pageId=$pageId, blogPostId=$blogPostId, customContentId=$customContentId, title=$title, body=$body, version=$version]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'type'] = this.type;
      json[r'status'] = this.status;
    if (this.spaceId != null) {
      json[r'spaceId'] = this.spaceId;
    } else {
      json[r'spaceId'] = null;
    }
    if (this.pageId != null) {
      json[r'pageId'] = this.pageId;
    } else {
      json[r'pageId'] = null;
    }
    if (this.blogPostId != null) {
      json[r'blogPostId'] = this.blogPostId;
    } else {
      json[r'blogPostId'] = null;
    }
    if (this.customContentId != null) {
      json[r'customContentId'] = this.customContentId;
    } else {
      json[r'customContentId'] = null;
    }
      json[r'title'] = this.title;
      json[r'body'] = this.body;
      json[r'version'] = this.version;
    return json;
  }

  /// Returns a new [UpdateCustomContentRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateCustomContentRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "UpdateCustomContentRequest[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "UpdateCustomContentRequest[id]" has a null value in JSON.');
        assert(json.containsKey(r'type'), 'Required key "UpdateCustomContentRequest[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "UpdateCustomContentRequest[type]" has a null value in JSON.');
        assert(json.containsKey(r'status'), 'Required key "UpdateCustomContentRequest[status]" is missing from JSON.');
        assert(json[r'status'] != null, 'Required key "UpdateCustomContentRequest[status]" has a null value in JSON.');
        assert(json.containsKey(r'title'), 'Required key "UpdateCustomContentRequest[title]" is missing from JSON.');
        assert(json[r'title'] != null, 'Required key "UpdateCustomContentRequest[title]" has a null value in JSON.');
        assert(json.containsKey(r'body'), 'Required key "UpdateCustomContentRequest[body]" is missing from JSON.');
        assert(json[r'body'] != null, 'Required key "UpdateCustomContentRequest[body]" has a null value in JSON.');
        assert(json.containsKey(r'version'), 'Required key "UpdateCustomContentRequest[version]" is missing from JSON.');
        assert(json[r'version'] != null, 'Required key "UpdateCustomContentRequest[version]" has a null value in JSON.');
        return true;
      }());

      return UpdateCustomContentRequest(
        id: mapValueOfType<String>(json, r'id')!,
        type: mapValueOfType<String>(json, r'type')!,
        status: UpdateCustomContentRequestStatusEnum.fromJson(json[r'status'])!,
        spaceId: mapValueOfType<String>(json, r'spaceId'),
        pageId: mapValueOfType<String>(json, r'pageId'),
        blogPostId: mapValueOfType<String>(json, r'blogPostId'),
        customContentId: mapValueOfType<String>(json, r'customContentId'),
        title: mapValueOfType<String>(json, r'title')!,
        body: CreateCustomContentRequestBody.fromJson(json[r'body'])!,
        version: UpdateCustomContentRequestVersion.fromJson(json[r'version'])!,
      );
    }
    return null;
  }

  static List<UpdateCustomContentRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdateCustomContentRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateCustomContentRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateCustomContentRequest> mapFromJson(dynamic json) {
    final map = <String, UpdateCustomContentRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateCustomContentRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateCustomContentRequest-objects as value to a dart map
  static Map<String, List<UpdateCustomContentRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UpdateCustomContentRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdateCustomContentRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'type',
    'status',
    'title',
    'body',
    'version',
  };
}

/// The status of the custom content.
enum UpdateCustomContentRequestStatusEnum {
  current._(r'current'),
  ;

  /// Instantiate a new enum with the provided value.
  const UpdateCustomContentRequestStatusEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [UpdateCustomContentRequestStatusEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static UpdateCustomContentRequestStatusEnum? fromJson(dynamic value) => UpdateCustomContentRequestStatusEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [UpdateCustomContentRequestStatusEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<UpdateCustomContentRequestStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdateCustomContentRequestStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateCustomContentRequestStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [UpdateCustomContentRequestStatusEnum] to String,
/// and [decode] dynamic data back to [UpdateCustomContentRequestStatusEnum].
class UpdateCustomContentRequestStatusEnumTypeTransformer {
  factory UpdateCustomContentRequestStatusEnumTypeTransformer() => _instance ??= const UpdateCustomContentRequestStatusEnumTypeTransformer._();

  const UpdateCustomContentRequestStatusEnumTypeTransformer._();

  String encode(UpdateCustomContentRequestStatusEnum data) => data._value;

  /// Returns the instance of [UpdateCustomContentRequestStatusEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  UpdateCustomContentRequestStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is UpdateCustomContentRequestStatusEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'current': return UpdateCustomContentRequestStatusEnum.current;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static UpdateCustomContentRequestStatusEnumTypeTransformer? _instance;
}


