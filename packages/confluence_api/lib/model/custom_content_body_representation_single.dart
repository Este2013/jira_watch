//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

/// The formats a custom content body can be represented as. A subset of BodyRepresentation.
enum CustomContentBodyRepresentationSingle {
  raw._(r'raw'),
  storage._(r'storage'),
  atlasDocFormat._(r'atlas_doc_format'),
  view._(r'view'),
  exportView._(r'export_view'),
  anonymousExportView._(r'anonymous_export_view'),
  ;

  /// Instantiate a new enum with the provided value.
  const CustomContentBodyRepresentationSingle._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [CustomContentBodyRepresentationSingle] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static CustomContentBodyRepresentationSingle? fromJson(dynamic value) => CustomContentBodyRepresentationSingleTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [CustomContentBodyRepresentationSingle]
  /// that were successfully decoded from the passed [JSON][json].
  static List<CustomContentBodyRepresentationSingle> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomContentBodyRepresentationSingle>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomContentBodyRepresentationSingle.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CustomContentBodyRepresentationSingle] to String,
/// and [decode] dynamic data back to [CustomContentBodyRepresentationSingle].
class CustomContentBodyRepresentationSingleTypeTransformer {
  factory CustomContentBodyRepresentationSingleTypeTransformer() => _instance ??= const CustomContentBodyRepresentationSingleTypeTransformer._();

  const CustomContentBodyRepresentationSingleTypeTransformer._();

  /// Encodes this enum as a value suitable for JSON.
  String encode(CustomContentBodyRepresentationSingle data) => data._value;

  /// Returns the instance of [CustomContentBodyRepresentationSingle] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CustomContentBodyRepresentationSingle? decode(dynamic data, {bool allowNull = true}) {
    if (data is CustomContentBodyRepresentationSingle) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'raw': return CustomContentBodyRepresentationSingle.raw;
        case r'storage': return CustomContentBodyRepresentationSingle.storage;
        case r'atlas_doc_format': return CustomContentBodyRepresentationSingle.atlasDocFormat;
        case r'view': return CustomContentBodyRepresentationSingle.view;
        case r'export_view': return CustomContentBodyRepresentationSingle.exportView;
        case r'anonymous_export_view': return CustomContentBodyRepresentationSingle.anonymousExportView;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static CustomContentBodyRepresentationSingleTypeTransformer? _instance;
}

