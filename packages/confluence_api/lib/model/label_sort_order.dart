//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

/// The sort fields for labels. The default sort direction is ascending. To sort in descending order, append a `-` character before the sort field. For example, `fieldName` or `-fieldName`.
enum LabelSortOrder {
  createdDate._(r'created-date'),
  createdDate2._(r'-created-date'),
  id._(r'id'),
  id2._(r'-id'),
  name._(r'name'),
  name2._(r'-name'),
  ;

  /// Instantiate a new enum with the provided value.
  const LabelSortOrder._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [LabelSortOrder] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static LabelSortOrder? fromJson(dynamic value) => LabelSortOrderTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [LabelSortOrder]
  /// that were successfully decoded from the passed [JSON][json].
  static List<LabelSortOrder> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <LabelSortOrder>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = LabelSortOrder.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [LabelSortOrder] to String,
/// and [decode] dynamic data back to [LabelSortOrder].
class LabelSortOrderTypeTransformer {
  factory LabelSortOrderTypeTransformer() => _instance ??= const LabelSortOrderTypeTransformer._();

  const LabelSortOrderTypeTransformer._();

  /// Encodes this enum as a value suitable for JSON.
  String encode(LabelSortOrder data) => data._value;

  /// Returns the instance of [LabelSortOrder] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  LabelSortOrder? decode(dynamic data, {bool allowNull = true}) {
    if (data is LabelSortOrder) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'created-date': return LabelSortOrder.createdDate;
        case r'-created-date': return LabelSortOrder.createdDate2;
        case r'id': return LabelSortOrder.id;
        case r'-id': return LabelSortOrder.id2;
        case r'name': return LabelSortOrder.name;
        case r'-name': return LabelSortOrder.name2;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static LabelSortOrderTypeTransformer? _instance;
}

