//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

/// Content type of the parent, or null if there is no parent.
enum ParentContentType {
  page._(r'page'),
  whiteboard._(r'whiteboard'),
  database._(r'database'),
  embed._(r'embed'),
  folder._(r'folder'),
  ;

  /// Instantiate a new enum with the provided value.
  const ParentContentType._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ParentContentType] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ParentContentType? fromJson(dynamic value) => ParentContentTypeTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ParentContentType]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ParentContentType> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ParentContentType>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ParentContentType.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ParentContentType] to String,
/// and [decode] dynamic data back to [ParentContentType].
class ParentContentTypeTypeTransformer {
  factory ParentContentTypeTypeTransformer() => _instance ??= const ParentContentTypeTypeTransformer._();

  const ParentContentTypeTypeTransformer._();

  /// Encodes this enum as a value suitable for JSON.
  String encode(ParentContentType data) => data._value;

  /// Returns the instance of [ParentContentType] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ParentContentType? decode(dynamic data, {bool allowNull = true}) {
    if (data is ParentContentType) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'page': return ParentContentType.page;
        case r'whiteboard': return ParentContentType.whiteboard;
        case r'database': return ParentContentType.database;
        case r'embed': return ParentContentType.embed;
        case r'folder': return ParentContentType.folder;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ParentContentTypeTypeTransformer? _instance;
}

