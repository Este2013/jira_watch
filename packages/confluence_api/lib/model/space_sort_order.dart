//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

/// The sort fields for spaces. The default sort direction is ascending. To sort in descending order, append a `-` character before the sort field. For example, `fieldName` or `-fieldName`.
enum SpaceSortOrder {
  id._(r'id'),
  id2._(r'-id'),
  key._(r'key'),
  key2._(r'-key'),
  name._(r'name'),
  name2._(r'-name'),
  ;

  /// Instantiate a new enum with the provided value.
  const SpaceSortOrder._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [SpaceSortOrder] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static SpaceSortOrder? fromJson(dynamic value) => SpaceSortOrderTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [SpaceSortOrder]
  /// that were successfully decoded from the passed [JSON][json].
  static List<SpaceSortOrder> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SpaceSortOrder>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SpaceSortOrder.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SpaceSortOrder] to String,
/// and [decode] dynamic data back to [SpaceSortOrder].
class SpaceSortOrderTypeTransformer {
  factory SpaceSortOrderTypeTransformer() => _instance ??= const SpaceSortOrderTypeTransformer._();

  const SpaceSortOrderTypeTransformer._();

  /// Encodes this enum as a value suitable for JSON.
  String encode(SpaceSortOrder data) => data._value;

  /// Returns the instance of [SpaceSortOrder] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SpaceSortOrder? decode(dynamic data, {bool allowNull = true}) {
    if (data is SpaceSortOrder) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'id': return SpaceSortOrder.id;
        case r'-id': return SpaceSortOrder.id2;
        case r'key': return SpaceSortOrder.key;
        case r'-key': return SpaceSortOrder.key2;
        case r'name': return SpaceSortOrder.name;
        case r'-name': return SpaceSortOrder.name2;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static SpaceSortOrderTypeTransformer? _instance;
}

