//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

/// The sort fields for blog posts. The default sort direction is ascending. To sort in descending order, append a `-` character before the sort field. For example, `fieldName` or `-fieldName`.
enum BlogPostSortOrder {
  id._(r'id'),
  id2._(r'-id'),
  createdDate._(r'created-date'),
  createdDate2._(r'-created-date'),
  modifiedDate._(r'modified-date'),
  modifiedDate2._(r'-modified-date'),
  ;

  /// Instantiate a new enum with the provided value.
  const BlogPostSortOrder._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [BlogPostSortOrder] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static BlogPostSortOrder? fromJson(dynamic value) => BlogPostSortOrderTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [BlogPostSortOrder]
  /// that were successfully decoded from the passed [JSON][json].
  static List<BlogPostSortOrder> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BlogPostSortOrder>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BlogPostSortOrder.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [BlogPostSortOrder] to String,
/// and [decode] dynamic data back to [BlogPostSortOrder].
class BlogPostSortOrderTypeTransformer {
  factory BlogPostSortOrderTypeTransformer() => _instance ??= const BlogPostSortOrderTypeTransformer._();

  const BlogPostSortOrderTypeTransformer._();

  /// Encodes this enum as a value suitable for JSON.
  String encode(BlogPostSortOrder data) => data._value;

  /// Returns the instance of [BlogPostSortOrder] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  BlogPostSortOrder? decode(dynamic data, {bool allowNull = true}) {
    if (data is BlogPostSortOrder) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'id': return BlogPostSortOrder.id;
        case r'-id': return BlogPostSortOrder.id2;
        case r'created-date': return BlogPostSortOrder.createdDate;
        case r'-created-date': return BlogPostSortOrder.createdDate2;
        case r'modified-date': return BlogPostSortOrder.modifiedDate;
        case r'-modified-date': return BlogPostSortOrder.modifiedDate2;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static BlogPostSortOrderTypeTransformer? _instance;
}

