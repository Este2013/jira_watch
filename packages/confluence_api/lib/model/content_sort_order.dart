//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

/// The sort fields for hierarchical content types. The default sort direction is ascending. To sort in descending order, append a `-` character before the sort field. For example, `fieldName` or `-fieldName`.
enum ContentSortOrder {
  createdDate._(r'created-date'),
  createdDate2._(r'-created-date'),
  id._(r'id'),
  id2._(r'-id'),
  modifiedDate._(r'modified-date'),
  modifiedDate2._(r'-modified-date'),
  childPosition._(r'child-position'),
  childPosition2._(r'-child-position'),
  title._(r'title'),
  title2._(r'-title'),
  ;

  /// Instantiate a new enum with the provided value.
  const ContentSortOrder._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ContentSortOrder] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ContentSortOrder? fromJson(dynamic value) => ContentSortOrderTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ContentSortOrder]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ContentSortOrder> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ContentSortOrder>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ContentSortOrder.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ContentSortOrder] to String,
/// and [decode] dynamic data back to [ContentSortOrder].
class ContentSortOrderTypeTransformer {
  factory ContentSortOrderTypeTransformer() => _instance ??= const ContentSortOrderTypeTransformer._();

  const ContentSortOrderTypeTransformer._();

  /// Encodes this enum as a value suitable for JSON.
  String encode(ContentSortOrder data) => data._value;

  /// Returns the instance of [ContentSortOrder] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ContentSortOrder? decode(dynamic data, {bool allowNull = true}) {
    if (data is ContentSortOrder) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'created-date': return ContentSortOrder.createdDate;
        case r'-created-date': return ContentSortOrder.createdDate2;
        case r'id': return ContentSortOrder.id;
        case r'-id': return ContentSortOrder.id2;
        case r'modified-date': return ContentSortOrder.modifiedDate;
        case r'-modified-date': return ContentSortOrder.modifiedDate2;
        case r'child-position': return ContentSortOrder.childPosition;
        case r'-child-position': return ContentSortOrder.childPosition2;
        case r'title': return ContentSortOrder.title;
        case r'-title': return ContentSortOrder.title2;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ContentSortOrderTypeTransformer? _instance;
}

