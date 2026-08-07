//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

/// The sort fields for pages. The default sort direction is ascending. To sort in descending order, append a `-` character before the sort field. For example, `fieldName` or `-fieldName`.
enum PageSortOrder {
  id._(r'id'),
  id2._(r'-id'),
  createdDate._(r'created-date'),
  createdDate2._(r'-created-date'),
  modifiedDate._(r'modified-date'),
  modifiedDate2._(r'-modified-date'),
  title._(r'title'),
  title2._(r'-title'),
  ;

  /// Instantiate a new enum with the provided value.
  const PageSortOrder._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [PageSortOrder] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static PageSortOrder? fromJson(dynamic value) => PageSortOrderTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [PageSortOrder]
  /// that were successfully decoded from the passed [JSON][json].
  static List<PageSortOrder> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PageSortOrder>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PageSortOrder.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PageSortOrder] to String,
/// and [decode] dynamic data back to [PageSortOrder].
class PageSortOrderTypeTransformer {
  factory PageSortOrderTypeTransformer() => _instance ??= const PageSortOrderTypeTransformer._();

  const PageSortOrderTypeTransformer._();

  /// Encodes this enum as a value suitable for JSON.
  String encode(PageSortOrder data) => data._value;

  /// Returns the instance of [PageSortOrder] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PageSortOrder? decode(dynamic data, {bool allowNull = true}) {
    if (data is PageSortOrder) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'id': return PageSortOrder.id;
        case r'-id': return PageSortOrder.id2;
        case r'created-date': return PageSortOrder.createdDate;
        case r'-created-date': return PageSortOrder.createdDate2;
        case r'modified-date': return PageSortOrder.modifiedDate;
        case r'-modified-date': return PageSortOrder.modifiedDate2;
        case r'title': return PageSortOrder.title;
        case r'-title': return PageSortOrder.title2;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static PageSortOrderTypeTransformer? _instance;
}

