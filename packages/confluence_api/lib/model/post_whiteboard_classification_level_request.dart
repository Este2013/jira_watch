//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PostWhiteboardClassificationLevelRequest {
  /// Returns a new [PostWhiteboardClassificationLevelRequest] instance.
  PostWhiteboardClassificationLevelRequest({
    required this.status,
  });

  /// Status of the content.
  PostWhiteboardClassificationLevelRequestStatusEnum status;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PostWhiteboardClassificationLevelRequest &&
    other.status == status;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (status.hashCode);

  @override
  String toString() => 'PostWhiteboardClassificationLevelRequest[status=$status]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'status'] = this.status;
    return json;
  }

  /// Returns a new [PostWhiteboardClassificationLevelRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PostWhiteboardClassificationLevelRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'status'), 'Required key "PostWhiteboardClassificationLevelRequest[status]" is missing from JSON.');
        assert(json[r'status'] != null, 'Required key "PostWhiteboardClassificationLevelRequest[status]" has a null value in JSON.');
        return true;
      }());

      return PostWhiteboardClassificationLevelRequest(
        status: PostWhiteboardClassificationLevelRequestStatusEnum.fromJson(json[r'status'])!,
      );
    }
    return null;
  }

  static List<PostWhiteboardClassificationLevelRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PostWhiteboardClassificationLevelRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PostWhiteboardClassificationLevelRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PostWhiteboardClassificationLevelRequest> mapFromJson(dynamic json) {
    final map = <String, PostWhiteboardClassificationLevelRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PostWhiteboardClassificationLevelRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PostWhiteboardClassificationLevelRequest-objects as value to a dart map
  static Map<String, List<PostWhiteboardClassificationLevelRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PostWhiteboardClassificationLevelRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PostWhiteboardClassificationLevelRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'status',
  };
}

/// Status of the content.
enum PostWhiteboardClassificationLevelRequestStatusEnum {
  current._(r'current'),
  ;

  /// Instantiate a new enum with the provided value.
  const PostWhiteboardClassificationLevelRequestStatusEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [PostWhiteboardClassificationLevelRequestStatusEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static PostWhiteboardClassificationLevelRequestStatusEnum? fromJson(dynamic value) => PostWhiteboardClassificationLevelRequestStatusEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [PostWhiteboardClassificationLevelRequestStatusEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<PostWhiteboardClassificationLevelRequestStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PostWhiteboardClassificationLevelRequestStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PostWhiteboardClassificationLevelRequestStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PostWhiteboardClassificationLevelRequestStatusEnum] to String,
/// and [decode] dynamic data back to [PostWhiteboardClassificationLevelRequestStatusEnum].
class PostWhiteboardClassificationLevelRequestStatusEnumTypeTransformer {
  factory PostWhiteboardClassificationLevelRequestStatusEnumTypeTransformer() => _instance ??= const PostWhiteboardClassificationLevelRequestStatusEnumTypeTransformer._();

  const PostWhiteboardClassificationLevelRequestStatusEnumTypeTransformer._();

  String encode(PostWhiteboardClassificationLevelRequestStatusEnum data) => data._value;

  /// Returns the instance of [PostWhiteboardClassificationLevelRequestStatusEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PostWhiteboardClassificationLevelRequestStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is PostWhiteboardClassificationLevelRequestStatusEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'current': return PostWhiteboardClassificationLevelRequestStatusEnum.current;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static PostWhiteboardClassificationLevelRequestStatusEnumTypeTransformer? _instance;
}


