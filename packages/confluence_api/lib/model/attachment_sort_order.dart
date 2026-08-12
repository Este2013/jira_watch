//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

/// The sort fields for attachments. The default sort direction is ascending. To sort in descending order, append a `-` character before the sort field. For example, `fieldName` or `-fieldName`.
enum AttachmentSortOrder {
  createdDate._(r'created-date'),
  createdDate2._(r'-created-date'),
  modifiedDate._(r'modified-date'),
  modifiedDate2._(r'-modified-date'),
  ;

  /// Instantiate a new enum with the provided value.
  const AttachmentSortOrder._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [AttachmentSortOrder] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static AttachmentSortOrder? fromJson(dynamic value) => AttachmentSortOrderTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [AttachmentSortOrder]
  /// that were successfully decoded from the passed [JSON][json].
  static List<AttachmentSortOrder> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AttachmentSortOrder>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AttachmentSortOrder.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [AttachmentSortOrder] to String,
/// and [decode] dynamic data back to [AttachmentSortOrder].
class AttachmentSortOrderTypeTransformer {
  factory AttachmentSortOrderTypeTransformer() => _instance ??= const AttachmentSortOrderTypeTransformer._();

  const AttachmentSortOrderTypeTransformer._();

  /// Encodes this enum as a value suitable for JSON.
  String encode(AttachmentSortOrder data) => data._value;

  /// Returns the instance of [AttachmentSortOrder] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  AttachmentSortOrder? decode(dynamic data, {bool allowNull = true}) {
    if (data is AttachmentSortOrder) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'created-date': return AttachmentSortOrder.createdDate;
        case r'-created-date': return AttachmentSortOrder.createdDate2;
        case r'modified-date': return AttachmentSortOrder.modifiedDate;
        case r'-modified-date': return AttachmentSortOrder.modifiedDate2;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static AttachmentSortOrderTypeTransformer? _instance;
}

