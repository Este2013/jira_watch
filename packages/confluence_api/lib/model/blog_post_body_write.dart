//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BlogPostBodyWrite {
  /// Returns a new [BlogPostBodyWrite] instance.
  BlogPostBodyWrite({
    this.representation,
    this.value,
  });

  /// Type of content representation used for the value field.
  BlogPostBodyWriteRepresentationEnum? representation;

  /// Body of the blog post, in the format found in the representation field.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BlogPostBodyWrite &&
    other.representation == representation &&
    other.value == value;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (representation == null ? 0 : representation!.hashCode) +
    (value == null ? 0 : value!.hashCode);

  @override
  String toString() => 'BlogPostBodyWrite[representation=$representation, value=$value]';

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
    return json;
  }

  /// Returns a new [BlogPostBodyWrite] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BlogPostBodyWrite? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return BlogPostBodyWrite(
        representation: BlogPostBodyWriteRepresentationEnum.fromJson(json[r'representation']),
        value: mapValueOfType<String>(json, r'value'),
      );
    }
    return null;
  }

  static List<BlogPostBodyWrite> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BlogPostBodyWrite>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BlogPostBodyWrite.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BlogPostBodyWrite> mapFromJson(dynamic json) {
    final map = <String, BlogPostBodyWrite>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BlogPostBodyWrite.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BlogPostBodyWrite-objects as value to a dart map
  static Map<String, List<BlogPostBodyWrite>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BlogPostBodyWrite>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BlogPostBodyWrite.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// Type of content representation used for the value field.
enum BlogPostBodyWriteRepresentationEnum {
  storage._(r'storage'),
  atlasDocFormat._(r'atlas_doc_format'),
  wiki._(r'wiki'),
  ;

  /// Instantiate a new enum with the provided value.
  const BlogPostBodyWriteRepresentationEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [BlogPostBodyWriteRepresentationEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static BlogPostBodyWriteRepresentationEnum? fromJson(dynamic value) => BlogPostBodyWriteRepresentationEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [BlogPostBodyWriteRepresentationEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<BlogPostBodyWriteRepresentationEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BlogPostBodyWriteRepresentationEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BlogPostBodyWriteRepresentationEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [BlogPostBodyWriteRepresentationEnum] to String,
/// and [decode] dynamic data back to [BlogPostBodyWriteRepresentationEnum].
class BlogPostBodyWriteRepresentationEnumTypeTransformer {
  factory BlogPostBodyWriteRepresentationEnumTypeTransformer() => _instance ??= const BlogPostBodyWriteRepresentationEnumTypeTransformer._();

  const BlogPostBodyWriteRepresentationEnumTypeTransformer._();

  String encode(BlogPostBodyWriteRepresentationEnum data) => data._value;

  /// Returns the instance of [BlogPostBodyWriteRepresentationEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  BlogPostBodyWriteRepresentationEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is BlogPostBodyWriteRepresentationEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'storage': return BlogPostBodyWriteRepresentationEnum.storage;
        case r'atlas_doc_format': return BlogPostBodyWriteRepresentationEnum.atlasDocFormat;
        case r'wiki': return BlogPostBodyWriteRepresentationEnum.wiki;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static BlogPostBodyWriteRepresentationEnumTypeTransformer? _instance;
}


