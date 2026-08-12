//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

/// The sort fields for comments. The default sort direction is ascending. To sort in descending order, append a `-` character before the sort field. For example, `fieldName` or `-fieldName`.
enum CommentSortOrder {
  createdDate._(r'created-date'),
  createdDate2._(r'-created-date'),
  modifiedDate._(r'modified-date'),
  modifiedDate2._(r'-modified-date'),
  ;

  /// Instantiate a new enum with the provided value.
  const CommentSortOrder._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [CommentSortOrder] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static CommentSortOrder? fromJson(dynamic value) => CommentSortOrderTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [CommentSortOrder]
  /// that were successfully decoded from the passed [JSON][json].
  static List<CommentSortOrder> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CommentSortOrder>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CommentSortOrder.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CommentSortOrder] to String,
/// and [decode] dynamic data back to [CommentSortOrder].
class CommentSortOrderTypeTransformer {
  factory CommentSortOrderTypeTransformer() => _instance ??= const CommentSortOrderTypeTransformer._();

  const CommentSortOrderTypeTransformer._();

  /// Encodes this enum as a value suitable for JSON.
  String encode(CommentSortOrder data) => data._value;

  /// Returns the instance of [CommentSortOrder] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CommentSortOrder? decode(dynamic data, {bool allowNull = true}) {
    if (data is CommentSortOrder) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'created-date': return CommentSortOrder.createdDate;
        case r'-created-date': return CommentSortOrder.createdDate2;
        case r'modified-date': return CommentSortOrder.modifiedDate;
        case r'-modified-date': return CommentSortOrder.modifiedDate2;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static CommentSortOrderTypeTransformer? _instance;
}

