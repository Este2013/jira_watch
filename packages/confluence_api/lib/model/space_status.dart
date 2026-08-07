//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

/// The status of the space.
enum SpaceStatus {
  current._(r'current'),
  archived._(r'archived'),
  ;

  /// Instantiate a new enum with the provided value.
  const SpaceStatus._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [SpaceStatus] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static SpaceStatus? fromJson(dynamic value) => SpaceStatusTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [SpaceStatus]
  /// that were successfully decoded from the passed [JSON][json].
  static List<SpaceStatus> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SpaceStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SpaceStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SpaceStatus] to String,
/// and [decode] dynamic data back to [SpaceStatus].
class SpaceStatusTypeTransformer {
  factory SpaceStatusTypeTransformer() => _instance ??= const SpaceStatusTypeTransformer._();

  const SpaceStatusTypeTransformer._();

  /// Encodes this enum as a value suitable for JSON.
  String encode(SpaceStatus data) => data._value;

  /// Returns the instance of [SpaceStatus] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SpaceStatus? decode(dynamic data, {bool allowNull = true}) {
    if (data is SpaceStatus) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'current': return SpaceStatus.current;
        case r'archived': return SpaceStatus.archived;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static SpaceStatusTypeTransformer? _instance;
}

