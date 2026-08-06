//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class KeywordOperand {
  /// Returns a new [KeywordOperand] instance.
  KeywordOperand({
    required this.keyword,
  });

  /// The keyword that is the operand value.
  KeywordOperandKeywordEnum keyword;

  @override
  bool operator ==(Object other) => identical(this, other) || other is KeywordOperand &&
    other.keyword == keyword;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (keyword.hashCode);

  @override
  String toString() => 'KeywordOperand[keyword=$keyword]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'keyword'] = this.keyword;
    return json;
  }

  /// Returns a new [KeywordOperand] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static KeywordOperand? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'keyword'), 'Required key "KeywordOperand[keyword]" is missing from JSON.');
        assert(json[r'keyword'] != null, 'Required key "KeywordOperand[keyword]" has a null value in JSON.');
        return true;
      }());

      return KeywordOperand(
        keyword: KeywordOperandKeywordEnum.fromJson(json[r'keyword'])!,
      );
    }
    return null;
  }

  static List<KeywordOperand> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <KeywordOperand>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = KeywordOperand.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, KeywordOperand> mapFromJson(dynamic json) {
    final map = <String, KeywordOperand>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = KeywordOperand.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of KeywordOperand-objects as value to a dart map
  static Map<String, List<KeywordOperand>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<KeywordOperand>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = KeywordOperand.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'keyword',
  };
}

/// The keyword that is the operand value.
enum KeywordOperandKeywordEnum {
  empty._(r'empty'),
  ;

  /// Instantiate a new enum with the provided value.
  const KeywordOperandKeywordEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [KeywordOperandKeywordEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static KeywordOperandKeywordEnum? fromJson(dynamic value) => KeywordOperandKeywordEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [KeywordOperandKeywordEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<KeywordOperandKeywordEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <KeywordOperandKeywordEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = KeywordOperandKeywordEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [KeywordOperandKeywordEnum] to String,
/// and [decode] dynamic data back to [KeywordOperandKeywordEnum].
class KeywordOperandKeywordEnumTypeTransformer {
  factory KeywordOperandKeywordEnumTypeTransformer() => _instance ??= const KeywordOperandKeywordEnumTypeTransformer._();

  const KeywordOperandKeywordEnumTypeTransformer._();

  String encode(KeywordOperandKeywordEnum data) => data._value;

  /// Returns the instance of [KeywordOperandKeywordEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  KeywordOperandKeywordEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is KeywordOperandKeywordEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'empty': return KeywordOperandKeywordEnum.empty;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static KeywordOperandKeywordEnumTypeTransformer? _instance;
}


