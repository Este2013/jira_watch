//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


enum ClassificationLevelColor {
  RED._(r'RED'),
  RED_BOLD._(r'RED_BOLD'),
  ORANGE._(r'ORANGE'),
  YELLOW._(r'YELLOW'),
  GREEN._(r'GREEN'),
  BLUE._(r'BLUE'),
  NAVY._(r'NAVY'),
  TEAL._(r'TEAL'),
  PURPLE._(r'PURPLE'),
  GREY._(r'GREY'),
  LIME._(r'LIME'),
  ;

  /// Instantiate a new enum with the provided value.
  const ClassificationLevelColor._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ClassificationLevelColor] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ClassificationLevelColor? fromJson(dynamic value) => ClassificationLevelColorTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ClassificationLevelColor]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ClassificationLevelColor> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ClassificationLevelColor>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ClassificationLevelColor.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ClassificationLevelColor] to String,
/// and [decode] dynamic data back to [ClassificationLevelColor].
class ClassificationLevelColorTypeTransformer {
  factory ClassificationLevelColorTypeTransformer() => _instance ??= const ClassificationLevelColorTypeTransformer._();

  const ClassificationLevelColorTypeTransformer._();

  /// Encodes this enum as a value suitable for JSON.
  String encode(ClassificationLevelColor data) => data._value;

  /// Returns the instance of [ClassificationLevelColor] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ClassificationLevelColor? decode(dynamic data, {bool allowNull = true}) {
    if (data is ClassificationLevelColor) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'RED': return ClassificationLevelColor.RED;
        case r'RED_BOLD': return ClassificationLevelColor.RED_BOLD;
        case r'ORANGE': return ClassificationLevelColor.ORANGE;
        case r'YELLOW': return ClassificationLevelColor.YELLOW;
        case r'GREEN': return ClassificationLevelColor.GREEN;
        case r'BLUE': return ClassificationLevelColor.BLUE;
        case r'NAVY': return ClassificationLevelColor.NAVY;
        case r'TEAL': return ClassificationLevelColor.TEAL;
        case r'PURPLE': return ClassificationLevelColor.PURPLE;
        case r'GREY': return ClassificationLevelColor.GREY;
        case r'LIME': return ClassificationLevelColor.LIME;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ClassificationLevelColorTypeTransformer? _instance;
}

