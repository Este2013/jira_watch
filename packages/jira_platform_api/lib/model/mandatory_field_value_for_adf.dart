//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class MandatoryFieldValueForADF {
  /// Returns a new [MandatoryFieldValueForADF] instance.
  MandatoryFieldValueForADF({
    this.retain = true,
    required this.type,
    required this.value,
  });

  /// If `true`, will try to retain original non-null issue field values on move.
  bool? retain;

  /// Will treat as `MandatoryFieldValueForADF` if type is `adf`
  MandatoryFieldValueForADFTypeEnum type;

  /// Value for each field. Accepts Atlassian Document Format (ADF) for rich text fields like `description`, `environments`. For ADF format details, refer to: [Atlassian Document Format](https://developer.atlassian.com/cloud/jira/platform/apis/document/structure)
  Object value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is MandatoryFieldValueForADF &&
    other.retain == retain &&
    other.type == type &&
    other.value == value;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (retain == null ? 0 : retain!.hashCode) +
    (type.hashCode) +
    (value.hashCode);

  @override
  String toString() => 'MandatoryFieldValueForADF[retain=$retain, type=$type, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.retain != null) {
      json[r'retain'] = this.retain;
    } else {
      json[r'retain'] = null;
    }
      json[r'type'] = this.type;
      json[r'value'] = this.value;
    return json;
  }

  /// Returns a new [MandatoryFieldValueForADF] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static MandatoryFieldValueForADF? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'type'), 'Required key "MandatoryFieldValueForADF[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "MandatoryFieldValueForADF[type]" has a null value in JSON.');
        assert(json.containsKey(r'value'), 'Required key "MandatoryFieldValueForADF[value]" is missing from JSON.');
        assert(json[r'value'] != null, 'Required key "MandatoryFieldValueForADF[value]" has a null value in JSON.');
        return true;
      }());

      return MandatoryFieldValueForADF(
        retain: mapValueOfType<bool>(json, r'retain') ?? true,
        type: MandatoryFieldValueForADFTypeEnum.fromJson(json[r'type'])!,
        value: mapValueOfType<Object>(json, r'value')!,
      );
    }
    return null;
  }

  static List<MandatoryFieldValueForADF> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <MandatoryFieldValueForADF>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MandatoryFieldValueForADF.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, MandatoryFieldValueForADF> mapFromJson(dynamic json) {
    final map = <String, MandatoryFieldValueForADF>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MandatoryFieldValueForADF.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of MandatoryFieldValueForADF-objects as value to a dart map
  static Map<String, List<MandatoryFieldValueForADF>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<MandatoryFieldValueForADF>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = MandatoryFieldValueForADF.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'type',
    'value',
  };
}

/// Will treat as `MandatoryFieldValueForADF` if type is `adf`
enum MandatoryFieldValueForADFTypeEnum {
  adf._(r'adf'),
  raw._(r'raw'),
  ;

  /// Instantiate a new enum with the provided value.
  const MandatoryFieldValueForADFTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [MandatoryFieldValueForADFTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static MandatoryFieldValueForADFTypeEnum? fromJson(dynamic value) => MandatoryFieldValueForADFTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [MandatoryFieldValueForADFTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<MandatoryFieldValueForADFTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <MandatoryFieldValueForADFTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MandatoryFieldValueForADFTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [MandatoryFieldValueForADFTypeEnum] to String,
/// and [decode] dynamic data back to [MandatoryFieldValueForADFTypeEnum].
class MandatoryFieldValueForADFTypeEnumTypeTransformer {
  factory MandatoryFieldValueForADFTypeEnumTypeTransformer() => _instance ??= const MandatoryFieldValueForADFTypeEnumTypeTransformer._();

  const MandatoryFieldValueForADFTypeEnumTypeTransformer._();

  String encode(MandatoryFieldValueForADFTypeEnum data) => data._value;

  /// Returns the instance of [MandatoryFieldValueForADFTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  MandatoryFieldValueForADFTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is MandatoryFieldValueForADFTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'adf': return MandatoryFieldValueForADFTypeEnum.adf;
        case r'raw': return MandatoryFieldValueForADFTypeEnum.raw;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static MandatoryFieldValueForADFTypeEnumTypeTransformer? _instance;
}


