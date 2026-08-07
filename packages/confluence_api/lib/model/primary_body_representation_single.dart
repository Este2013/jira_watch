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
enum PrimaryBodyRepresentationSingle {
  storage._(r'storage'),
  atlasDocFormat._(r'atlas_doc_format'),
  view._(r'view'),
  exportView._(r'export_view'),
  anonymousExportView._(r'anonymous_export_view'),
  styledView._(r'styled_view'),
  editor._(r'editor'),
  ;

  /// Instantiate a new enum with the provided value.
  const PrimaryBodyRepresentationSingle._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [PrimaryBodyRepresentationSingle] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static PrimaryBodyRepresentationSingle? fromJson(dynamic value) => PrimaryBodyRepresentationSingleTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [PrimaryBodyRepresentationSingle]
  /// that were successfully decoded from the passed [JSON][json].
  static List<PrimaryBodyRepresentationSingle> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PrimaryBodyRepresentationSingle>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PrimaryBodyRepresentationSingle.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PrimaryBodyRepresentationSingle] to String,
/// and [decode] dynamic data back to [PrimaryBodyRepresentationSingle].
class PrimaryBodyRepresentationSingleTypeTransformer {
  factory PrimaryBodyRepresentationSingleTypeTransformer() => _instance ??= const PrimaryBodyRepresentationSingleTypeTransformer._();

  const PrimaryBodyRepresentationSingleTypeTransformer._();

  /// Encodes this enum as a value suitable for JSON.
  String encode(PrimaryBodyRepresentationSingle data) => data._value;

  /// Returns the instance of [PrimaryBodyRepresentationSingle] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PrimaryBodyRepresentationSingle? decode(dynamic data, {bool allowNull = true}) {
    if (data is PrimaryBodyRepresentationSingle) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'storage': return PrimaryBodyRepresentationSingle.storage;
        case r'atlas_doc_format': return PrimaryBodyRepresentationSingle.atlasDocFormat;
        case r'view': return PrimaryBodyRepresentationSingle.view;
        case r'export_view': return PrimaryBodyRepresentationSingle.exportView;
        case r'anonymous_export_view': return PrimaryBodyRepresentationSingle.anonymousExportView;
        case r'styled_view': return PrimaryBodyRepresentationSingle.styledView;
        case r'editor': return PrimaryBodyRepresentationSingle.editor;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static PrimaryBodyRepresentationSingleTypeTransformer? _instance;
}

