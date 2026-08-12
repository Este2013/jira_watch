//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

/// The type of ancestor.
enum AncestorType {
  page._(r'page'),
  whiteboard._(r'whiteboard'),
  database._(r'database'),
  embed._(r'embed'),
  folder._(r'folder'),
  ;

  /// Instantiate a new enum with the provided value.
  const AncestorType._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [AncestorType] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static AncestorType? fromJson(dynamic value) => AncestorTypeTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [AncestorType]
  /// that were successfully decoded from the passed [JSON][json].
  static List<AncestorType> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AncestorType>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AncestorType.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [AncestorType] to String,
/// and [decode] dynamic data back to [AncestorType].
class AncestorTypeTypeTransformer {
  factory AncestorTypeTypeTransformer() => _instance ??= const AncestorTypeTypeTransformer._();

  const AncestorTypeTypeTransformer._();

  /// Encodes this enum as a value suitable for JSON.
  String encode(AncestorType data) => data._value;

  /// Returns the instance of [AncestorType] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  AncestorType? decode(dynamic data, {bool allowNull = true}) {
    if (data is AncestorType) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'page': return AncestorType.page;
        case r'whiteboard': return AncestorType.whiteboard;
        case r'database': return AncestorType.database;
        case r'embed': return AncestorType.embed;
        case r'folder': return AncestorType.folder;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static AncestorTypeTypeTransformer? _instance;
}

