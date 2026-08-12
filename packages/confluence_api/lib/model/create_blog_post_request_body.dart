//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateBlogPostRequestBody {
  /// Returns a new [CreateBlogPostRequestBody] instance.
  CreateBlogPostRequestBody({
    this.representation,
    this.value,
    this.storage,
    this.atlasDocFormat,
    this.wiki,
  });

  /// Type of content representation used for the value field.
  CreateBlogPostRequestBodyRepresentationEnum? representation;

  /// Body of the blog post, in the format found in the representation field.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? value;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  BlogPostBodyWrite? storage;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  BlogPostBodyWrite? atlasDocFormat;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  BlogPostBodyWrite? wiki;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateBlogPostRequestBody &&
    other.representation == representation &&
    other.value == value &&
    other.storage == storage &&
    other.atlasDocFormat == atlasDocFormat &&
    other.wiki == wiki;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (representation == null ? 0 : representation!.hashCode) +
    (value == null ? 0 : value!.hashCode) +
    (storage == null ? 0 : storage!.hashCode) +
    (atlasDocFormat == null ? 0 : atlasDocFormat!.hashCode) +
    (wiki == null ? 0 : wiki!.hashCode);

  @override
  String toString() => 'CreateBlogPostRequestBody[representation=$representation, value=$value, storage=$storage, atlasDocFormat=$atlasDocFormat, wiki=$wiki]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.representation != null) {
      json[r'representation'] = this.representation;
    } else {
      json[r'representation'] = null;
    }
    if (this.value != null) {
      json[r'value'] = this.value;
    } else {
      json[r'value'] = null;
    }
    if (this.storage != null) {
      json[r'storage'] = this.storage;
    } else {
      json[r'storage'] = null;
    }
    if (this.atlasDocFormat != null) {
      json[r'atlas_doc_format'] = this.atlasDocFormat;
    } else {
      json[r'atlas_doc_format'] = null;
    }
    if (this.wiki != null) {
      json[r'wiki'] = this.wiki;
    } else {
      json[r'wiki'] = null;
    }
    return json;
  }

  /// Returns a new [CreateBlogPostRequestBody] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateBlogPostRequestBody? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return CreateBlogPostRequestBody(
        representation: CreateBlogPostRequestBodyRepresentationEnum.fromJson(json[r'representation']),
        value: mapValueOfType<String>(json, r'value'),
        storage: BlogPostBodyWrite.fromJson(json[r'storage']),
        atlasDocFormat: BlogPostBodyWrite.fromJson(json[r'atlas_doc_format']),
        wiki: BlogPostBodyWrite.fromJson(json[r'wiki']),
      );
    }
    return null;
  }

  static List<CreateBlogPostRequestBody> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateBlogPostRequestBody>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateBlogPostRequestBody.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateBlogPostRequestBody> mapFromJson(dynamic json) {
    final map = <String, CreateBlogPostRequestBody>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateBlogPostRequestBody.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateBlogPostRequestBody-objects as value to a dart map
  static Map<String, List<CreateBlogPostRequestBody>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateBlogPostRequestBody>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateBlogPostRequestBody.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// Type of content representation used for the value field.
enum CreateBlogPostRequestBodyRepresentationEnum {
  storage._(r'storage'),
  atlasDocFormat._(r'atlas_doc_format'),
  wiki._(r'wiki'),
  ;

  /// Instantiate a new enum with the provided value.
  const CreateBlogPostRequestBodyRepresentationEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [CreateBlogPostRequestBodyRepresentationEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static CreateBlogPostRequestBodyRepresentationEnum? fromJson(dynamic value) => CreateBlogPostRequestBodyRepresentationEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [CreateBlogPostRequestBodyRepresentationEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<CreateBlogPostRequestBodyRepresentationEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateBlogPostRequestBodyRepresentationEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateBlogPostRequestBodyRepresentationEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CreateBlogPostRequestBodyRepresentationEnum] to String,
/// and [decode] dynamic data back to [CreateBlogPostRequestBodyRepresentationEnum].
class CreateBlogPostRequestBodyRepresentationEnumTypeTransformer {
  factory CreateBlogPostRequestBodyRepresentationEnumTypeTransformer() => _instance ??= const CreateBlogPostRequestBodyRepresentationEnumTypeTransformer._();

  const CreateBlogPostRequestBodyRepresentationEnumTypeTransformer._();

  String encode(CreateBlogPostRequestBodyRepresentationEnum data) => data._value;

  /// Returns the instance of [CreateBlogPostRequestBodyRepresentationEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CreateBlogPostRequestBodyRepresentationEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is CreateBlogPostRequestBodyRepresentationEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'storage': return CreateBlogPostRequestBodyRepresentationEnum.storage;
        case r'atlas_doc_format': return CreateBlogPostRequestBodyRepresentationEnum.atlasDocFormat;
        case r'wiki': return CreateBlogPostRequestBodyRepresentationEnum.wiki;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static CreateBlogPostRequestBodyRepresentationEnumTypeTransformer? _instance;
}


