//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

/// The sort fields for child custom content. The default sort direction is ascending by id. To sort in descending order, append a `-` character before the sort field. For example, `fieldName` or `-fieldName`.
enum ChildCustomContentSortOrder {
  createdDate._(r'created-date'),
  createdDate2._(r'-created-date'),
  id._(r'id'),
  id2._(r'-id'),
  modifiedDate._(r'modified-date'),
  modifiedDate2._(r'-modified-date'),
  ;

  /// Instantiate a new enum with the provided value.
  const ChildCustomContentSortOrder._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ChildCustomContentSortOrder] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ChildCustomContentSortOrder? fromJson(dynamic value) => ChildCustomContentSortOrderTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ChildCustomContentSortOrder]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ChildCustomContentSortOrder> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ChildCustomContentSortOrder>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ChildCustomContentSortOrder.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ChildCustomContentSortOrder] to String,
/// and [decode] dynamic data back to [ChildCustomContentSortOrder].
class ChildCustomContentSortOrderTypeTransformer {
  factory ChildCustomContentSortOrderTypeTransformer() => _instance ??= const ChildCustomContentSortOrderTypeTransformer._();

  const ChildCustomContentSortOrderTypeTransformer._();

  /// Encodes this enum as a value suitable for JSON.
  String encode(ChildCustomContentSortOrder data) => data._value;

  /// Returns the instance of [ChildCustomContentSortOrder] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ChildCustomContentSortOrder? decode(dynamic data, {bool allowNull = true}) {
    if (data is ChildCustomContentSortOrder) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'created-date': return ChildCustomContentSortOrder.createdDate;
        case r'-created-date': return ChildCustomContentSortOrder.createdDate2;
        case r'id': return ChildCustomContentSortOrder.id;
        case r'-id': return ChildCustomContentSortOrder.id2;
        case r'modified-date': return ChildCustomContentSortOrder.modifiedDate;
        case r'-modified-date': return ChildCustomContentSortOrder.modifiedDate2;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ChildCustomContentSortOrderTypeTransformer? _instance;
}

