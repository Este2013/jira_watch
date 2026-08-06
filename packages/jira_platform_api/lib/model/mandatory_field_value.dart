//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class MandatoryFieldValue {
  /// Returns a new [MandatoryFieldValue] instance.
  MandatoryFieldValue({
    this.retain = true,
    this.type,
    this.value = const [],
  });

  /// If `true`, will try to retain original non-null issue field values on move.
  bool? retain;

  /// Will treat as `MandatoryFieldValue` if type is `raw` or `empty`
  MandatoryFieldValueTypeEnum? type;

  /// Value for each field. Provide a `list of strings` for non-ADF fields.
  List<String> value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is MandatoryFieldValue &&
    other.retain == retain &&
    other.type == type &&
    _deepEquality.equals(other.value, value);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (retain == null ? 0 : retain!.hashCode) +
    (type == null ? 0 : type!.hashCode) +
    (value.hashCode);

  @override
  String toString() => 'MandatoryFieldValue[retain=$retain, type=$type, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.retain != null) {
      json[r'retain'] = this.retain;
    } else {
      json[r'retain'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
      json[r'value'] = this.value;
    return json;
  }

  /// Returns a new [MandatoryFieldValue] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static MandatoryFieldValue? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'value'), 'Required key "MandatoryFieldValue[value]" is missing from JSON.');
        assert(json[r'value'] != null, 'Required key "MandatoryFieldValue[value]" has a null value in JSON.');
        return true;
      }());

      return MandatoryFieldValue(
        retain: mapValueOfType<bool>(json, r'retain') ?? true,
        type: MandatoryFieldValueTypeEnum.fromJson(json[r'type']),
        value: json[r'value'] is Iterable
            ? (json[r'value'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<MandatoryFieldValue> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <MandatoryFieldValue>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MandatoryFieldValue.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, MandatoryFieldValue> mapFromJson(dynamic json) {
    final map = <String, MandatoryFieldValue>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MandatoryFieldValue.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of MandatoryFieldValue-objects as value to a dart map
  static Map<String, List<MandatoryFieldValue>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<MandatoryFieldValue>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = MandatoryFieldValue.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'value',
  };
}

/// Will treat as `MandatoryFieldValue` if type is `raw` or `empty`
enum MandatoryFieldValueTypeEnum {
  adf._(r'adf'),
  raw._(r'raw'),
  ;

  /// Instantiate a new enum with the provided value.
  const MandatoryFieldValueTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [MandatoryFieldValueTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static MandatoryFieldValueTypeEnum? fromJson(dynamic value) => MandatoryFieldValueTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [MandatoryFieldValueTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<MandatoryFieldValueTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <MandatoryFieldValueTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MandatoryFieldValueTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [MandatoryFieldValueTypeEnum] to String,
/// and [decode] dynamic data back to [MandatoryFieldValueTypeEnum].
class MandatoryFieldValueTypeEnumTypeTransformer {
  factory MandatoryFieldValueTypeEnumTypeTransformer() => _instance ??= const MandatoryFieldValueTypeEnumTypeTransformer._();

  const MandatoryFieldValueTypeEnumTypeTransformer._();

  String encode(MandatoryFieldValueTypeEnum data) => data._value;

  /// Returns the instance of [MandatoryFieldValueTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  MandatoryFieldValueTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is MandatoryFieldValueTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'adf': return MandatoryFieldValueTypeEnum.adf;
        case r'raw': return MandatoryFieldValueTypeEnum.raw;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static MandatoryFieldValueTypeEnumTypeTransformer? _instance;
}


