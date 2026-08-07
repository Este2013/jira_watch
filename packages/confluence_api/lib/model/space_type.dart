//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

/// The type of space.
enum SpaceType {
  global._(r'global'),
  collaboration._(r'collaboration'),
  knowledgeBase._(r'knowledge_base'),
  personal._(r'personal'),
  system._(r'system'),
  onboarding._(r'onboarding'),
  xflowSampleSpace._(r'xflow_sample_space'),
  ;

  /// Instantiate a new enum with the provided value.
  const SpaceType._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [SpaceType] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static SpaceType? fromJson(dynamic value) => SpaceTypeTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [SpaceType]
  /// that were successfully decoded from the passed [JSON][json].
  static List<SpaceType> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SpaceType>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SpaceType.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SpaceType] to String,
/// and [decode] dynamic data back to [SpaceType].
class SpaceTypeTypeTransformer {
  factory SpaceTypeTypeTransformer() => _instance ??= const SpaceTypeTypeTransformer._();

  const SpaceTypeTypeTransformer._();

  /// Encodes this enum as a value suitable for JSON.
  String encode(SpaceType data) => data._value;

  /// Returns the instance of [SpaceType] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SpaceType? decode(dynamic data, {bool allowNull = true}) {
    if (data is SpaceType) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'global': return SpaceType.global;
        case r'collaboration': return SpaceType.collaboration;
        case r'knowledge_base': return SpaceType.knowledgeBase;
        case r'personal': return SpaceType.personal;
        case r'system': return SpaceType.system;
        case r'onboarding': return SpaceType.onboarding;
        case r'xflow_sample_space': return SpaceType.xflowSampleSpace;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static SpaceTypeTypeTransformer? _instance;
}

