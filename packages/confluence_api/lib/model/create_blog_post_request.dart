//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateBlogPostRequest {
  /// Returns a new [CreateBlogPostRequest] instance.
  CreateBlogPostRequest({
    required this.spaceId,
    this.status,
    this.title,
    this.body,
    this.createdAt,
  });

  /// ID of the space
  String spaceId;

  /// The status of the blog post, specifies if the blog post will be created as a new blog post or a draft
  CreateBlogPostRequestStatusEnum? status;

  /// Title of the blog post, required if creating non-draft.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? title;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CreateBlogPostRequestBody? body;

  /// Created date of the blog post in the format of \"yyyy-MM-ddTHH:mm:ss.SSSZ\".
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? createdAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateBlogPostRequest &&
    other.spaceId == spaceId &&
    other.status == status &&
    other.title == title &&
    other.body == body &&
    other.createdAt == createdAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (spaceId.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (body == null ? 0 : body!.hashCode) +
    (createdAt == null ? 0 : createdAt!.hashCode);

  @override
  String toString() => 'CreateBlogPostRequest[spaceId=$spaceId, status=$status, title=$title, body=$body, createdAt=$createdAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'spaceId'] = this.spaceId;
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    if (this.title != null) {
      json[r'title'] = this.title;
    } else {
      json[r'title'] = null;
    }
    if (this.body != null) {
      json[r'body'] = this.body;
    } else {
      json[r'body'] = null;
    }
    if (this.createdAt != null) {
      json[r'createdAt'] = this.createdAt;
    } else {
      json[r'createdAt'] = null;
    }
    return json;
  }

  /// Returns a new [CreateBlogPostRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateBlogPostRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'spaceId'), 'Required key "CreateBlogPostRequest[spaceId]" is missing from JSON.');
        assert(json[r'spaceId'] != null, 'Required key "CreateBlogPostRequest[spaceId]" has a null value in JSON.');
        return true;
      }());

      return CreateBlogPostRequest(
        spaceId: mapValueOfType<String>(json, r'spaceId')!,
        status: CreateBlogPostRequestStatusEnum.fromJson(json[r'status']),
        title: mapValueOfType<String>(json, r'title'),
        body: CreateBlogPostRequestBody.fromJson(json[r'body']),
        createdAt: mapValueOfType<String>(json, r'createdAt'),
      );
    }
    return null;
  }

  static List<CreateBlogPostRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateBlogPostRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateBlogPostRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateBlogPostRequest> mapFromJson(dynamic json) {
    final map = <String, CreateBlogPostRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateBlogPostRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateBlogPostRequest-objects as value to a dart map
  static Map<String, List<CreateBlogPostRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateBlogPostRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateBlogPostRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'spaceId',
  };
}

/// The status of the blog post, specifies if the blog post will be created as a new blog post or a draft
enum CreateBlogPostRequestStatusEnum {
  current._(r'current'),
  draft._(r'draft'),
  ;

  /// Instantiate a new enum with the provided value.
  const CreateBlogPostRequestStatusEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [CreateBlogPostRequestStatusEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static CreateBlogPostRequestStatusEnum? fromJson(dynamic value) => CreateBlogPostRequestStatusEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [CreateBlogPostRequestStatusEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<CreateBlogPostRequestStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateBlogPostRequestStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateBlogPostRequestStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CreateBlogPostRequestStatusEnum] to String,
/// and [decode] dynamic data back to [CreateBlogPostRequestStatusEnum].
class CreateBlogPostRequestStatusEnumTypeTransformer {
  factory CreateBlogPostRequestStatusEnumTypeTransformer() => _instance ??= const CreateBlogPostRequestStatusEnumTypeTransformer._();

  const CreateBlogPostRequestStatusEnumTypeTransformer._();

  String encode(CreateBlogPostRequestStatusEnum data) => data._value;

  /// Returns the instance of [CreateBlogPostRequestStatusEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CreateBlogPostRequestStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is CreateBlogPostRequestStatusEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'current': return CreateBlogPostRequestStatusEnum.current;
        case r'draft': return CreateBlogPostRequestStatusEnum.draft;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static CreateBlogPostRequestStatusEnumTypeTransformer? _instance;
}


