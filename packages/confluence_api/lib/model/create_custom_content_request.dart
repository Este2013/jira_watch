//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateCustomContentRequest {
  /// Returns a new [CreateCustomContentRequest] instance.
  CreateCustomContentRequest({
    required this.type,
    this.status,
    this.spaceId,
    this.pageId,
    this.blogPostId,
    this.customContentId,
    required this.title,
    required this.body,
  });

  /// Type of custom content.
  String type;

  /// The status of the custom content. Defaults to `current` when status not provided.
  CreateCustomContentRequestStatusEnum? status;

  /// ID of the containing space.
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

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateCustomContentRequest &&
    other.type == type &&
    other.status == status &&
    other.spaceId == spaceId &&
    other.pageId == pageId &&
    other.blogPostId == blogPostId &&
    other.customContentId == customContentId &&
    other.title == title &&
    other.body == body;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (type.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (spaceId == null ? 0 : spaceId!.hashCode) +
    (pageId == null ? 0 : pageId!.hashCode) +
    (blogPostId == null ? 0 : blogPostId!.hashCode) +
    (customContentId == null ? 0 : customContentId!.hashCode) +
    (title.hashCode) +
    (body.hashCode);

  @override
  String toString() => 'CreateCustomContentRequest[type=$type, status=$status, spaceId=$spaceId, pageId=$pageId, blogPostId=$blogPostId, customContentId=$customContentId, title=$title, body=$body]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'type'] = this.type;
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
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
    return json;
  }

  /// Returns a new [CreateCustomContentRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateCustomContentRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'type'), 'Required key "CreateCustomContentRequest[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "CreateCustomContentRequest[type]" has a null value in JSON.');
        assert(json.containsKey(r'title'), 'Required key "CreateCustomContentRequest[title]" is missing from JSON.');
        assert(json[r'title'] != null, 'Required key "CreateCustomContentRequest[title]" has a null value in JSON.');
        assert(json.containsKey(r'body'), 'Required key "CreateCustomContentRequest[body]" is missing from JSON.');
        assert(json[r'body'] != null, 'Required key "CreateCustomContentRequest[body]" has a null value in JSON.');
        return true;
      }());

      return CreateCustomContentRequest(
        type: mapValueOfType<String>(json, r'type')!,
        status: CreateCustomContentRequestStatusEnum.fromJson(json[r'status']),
        spaceId: mapValueOfType<String>(json, r'spaceId'),
        pageId: mapValueOfType<String>(json, r'pageId'),
        blogPostId: mapValueOfType<String>(json, r'blogPostId'),
        customContentId: mapValueOfType<String>(json, r'customContentId'),
        title: mapValueOfType<String>(json, r'title')!,
        body: CreateCustomContentRequestBody.fromJson(json[r'body'])!,
      );
    }
    return null;
  }

  static List<CreateCustomContentRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateCustomContentRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateCustomContentRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateCustomContentRequest> mapFromJson(dynamic json) {
    final map = <String, CreateCustomContentRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateCustomContentRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateCustomContentRequest-objects as value to a dart map
  static Map<String, List<CreateCustomContentRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateCustomContentRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateCustomContentRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'type',
    'title',
    'body',
  };
}

/// The status of the custom content. Defaults to `current` when status not provided.
enum CreateCustomContentRequestStatusEnum {
  current._(r'current'),
  draft._(r'draft'),
  ;

  /// Instantiate a new enum with the provided value.
  const CreateCustomContentRequestStatusEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [CreateCustomContentRequestStatusEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static CreateCustomContentRequestStatusEnum? fromJson(dynamic value) => CreateCustomContentRequestStatusEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [CreateCustomContentRequestStatusEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<CreateCustomContentRequestStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateCustomContentRequestStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateCustomContentRequestStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CreateCustomContentRequestStatusEnum] to String,
/// and [decode] dynamic data back to [CreateCustomContentRequestStatusEnum].
class CreateCustomContentRequestStatusEnumTypeTransformer {
  factory CreateCustomContentRequestStatusEnumTypeTransformer() => _instance ??= const CreateCustomContentRequestStatusEnumTypeTransformer._();

  const CreateCustomContentRequestStatusEnumTypeTransformer._();

  String encode(CreateCustomContentRequestStatusEnum data) => data._value;

  /// Returns the instance of [CreateCustomContentRequestStatusEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CreateCustomContentRequestStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is CreateCustomContentRequestStatusEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'current': return CreateCustomContentRequestStatusEnum.current;
        case r'draft': return CreateCustomContentRequestStatusEnum.draft;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static CreateCustomContentRequestStatusEnumTypeTransformer? _instance;
}


