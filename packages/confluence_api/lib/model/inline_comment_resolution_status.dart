//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

/// Inline comment resolution status
enum InlineCommentResolutionStatus {
  open._(r'open'),
  reopened._(r'reopened'),
  resolved._(r'resolved'),
  dangling._(r'dangling'),
  ;

  /// Instantiate a new enum with the provided value.
  const InlineCommentResolutionStatus._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [InlineCommentResolutionStatus] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static InlineCommentResolutionStatus? fromJson(dynamic value) => InlineCommentResolutionStatusTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [InlineCommentResolutionStatus]
  /// that were successfully decoded from the passed [JSON][json].
  static List<InlineCommentResolutionStatus> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <InlineCommentResolutionStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = InlineCommentResolutionStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [InlineCommentResolutionStatus] to String,
/// and [decode] dynamic data back to [InlineCommentResolutionStatus].
class InlineCommentResolutionStatusTypeTransformer {
  factory InlineCommentResolutionStatusTypeTransformer() => _instance ??= const InlineCommentResolutionStatusTypeTransformer._();

  const InlineCommentResolutionStatusTypeTransformer._();

  /// Encodes this enum as a value suitable for JSON.
  String encode(InlineCommentResolutionStatus data) => data._value;

  /// Returns the instance of [InlineCommentResolutionStatus] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  InlineCommentResolutionStatus? decode(dynamic data, {bool allowNull = true}) {
    if (data is InlineCommentResolutionStatus) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'open': return InlineCommentResolutionStatus.open;
        case r'reopened': return InlineCommentResolutionStatus.reopened;
        case r'resolved': return InlineCommentResolutionStatus.resolved;
        case r'dangling': return InlineCommentResolutionStatus.dangling;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static InlineCommentResolutionStatusTypeTransformer? _instance;
}

