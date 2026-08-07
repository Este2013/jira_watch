//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

/// The status of the content.
enum ContentStatus {
  current._(r'current'),
  draft._(r'draft'),
  archived._(r'archived'),
  historical._(r'historical'),
  trashed._(r'trashed'),
  deleted._(r'deleted'),
  any._(r'any'),
  ;

  /// Instantiate a new enum with the provided value.
  const ContentStatus._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ContentStatus] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ContentStatus? fromJson(dynamic value) => ContentStatusTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ContentStatus]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ContentStatus> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ContentStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ContentStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ContentStatus] to String,
/// and [decode] dynamic data back to [ContentStatus].
class ContentStatusTypeTransformer {
  factory ContentStatusTypeTransformer() => _instance ??= const ContentStatusTypeTransformer._();

  const ContentStatusTypeTransformer._();

  /// Encodes this enum as a value suitable for JSON.
  String encode(ContentStatus data) => data._value;

  /// Returns the instance of [ContentStatus] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ContentStatus? decode(dynamic data, {bool allowNull = true}) {
    if (data is ContentStatus) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'current': return ContentStatus.current;
        case r'draft': return ContentStatus.draft;
        case r'archived': return ContentStatus.archived;
        case r'historical': return ContentStatus.historical;
        case r'trashed': return ContentStatus.trashed;
        case r'deleted': return ContentStatus.deleted;
        case r'any': return ContentStatus.any;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ContentStatusTypeTransformer? _instance;
}

