//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

/// The primary formats a body can be represented as. A subset of BodyRepresentation. These formats are the only allowed formats in certain use cases.
enum PrimaryBodyRepresentation {
  storage._(r'storage'),
  atlasDocFormat._(r'atlas_doc_format'),
  ;

  /// Instantiate a new enum with the provided value.
  const PrimaryBodyRepresentation._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [PrimaryBodyRepresentation] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static PrimaryBodyRepresentation? fromJson(dynamic value) => PrimaryBodyRepresentationTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [PrimaryBodyRepresentation]
  /// that were successfully decoded from the passed [JSON][json].
  static List<PrimaryBodyRepresentation> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PrimaryBodyRepresentation>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PrimaryBodyRepresentation.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PrimaryBodyRepresentation] to String,
/// and [decode] dynamic data back to [PrimaryBodyRepresentation].
class PrimaryBodyRepresentationTypeTransformer {
  factory PrimaryBodyRepresentationTypeTransformer() => _instance ??= const PrimaryBodyRepresentationTypeTransformer._();

  const PrimaryBodyRepresentationTypeTransformer._();

  /// Encodes this enum as a value suitable for JSON.
  String encode(PrimaryBodyRepresentation data) => data._value;

  /// Returns the instance of [PrimaryBodyRepresentation] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PrimaryBodyRepresentation? decode(dynamic data, {bool allowNull = true}) {
    if (data is PrimaryBodyRepresentation) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'storage': return PrimaryBodyRepresentation.storage;
        case r'atlas_doc_format': return PrimaryBodyRepresentation.atlasDocFormat;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static PrimaryBodyRepresentationTypeTransformer? _instance;
}

