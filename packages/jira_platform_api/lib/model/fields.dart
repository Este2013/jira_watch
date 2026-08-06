//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Fields {
  /// Returns a new [Fields] instance.
  Fields({
    this.retain = true,
    this.type,
    this.value,
  });

  /// If `true`, will try to retain original non-null issue field values on move.
  bool? retain;

  FieldsTypeEnum? type;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Fields &&
    other.retain == retain &&
    other.type == type &&
    other.value == value;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (retain == null ? 0 : retain!.hashCode) +
    (type == null ? 0 : type!.hashCode) +
    (value == null ? 0 : value!.hashCode);

  @override
  String toString() => 'Fields[retain=$retain, type=$type, value=$value]';

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
    if (this.value != null) {
      json[r'value'] = this.value;
    } else {
      json[r'value'] = null;
    }
    return json;
  }

  /// Returns a new [Fields] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Fields? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return Fields(
        retain: mapValueOfType<bool>(json, r'retain') ?? true,
        type: FieldsTypeEnum.fromJson(json[r'type']),
        value: mapValueOfType<Object>(json, r'value'),
      );
    }
    return null;
  }

  static List<Fields> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Fields>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Fields.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Fields> mapFromJson(dynamic json) {
    final map = <String, Fields>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Fields.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Fields-objects as value to a dart map
  static Map<String, List<Fields>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Fields>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Fields.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


enum FieldsTypeEnum {
  adf._(r'adf'),
  raw._(r'raw'),
  ;

  /// Instantiate a new enum with the provided value.
  const FieldsTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [FieldsTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static FieldsTypeEnum? fromJson(dynamic value) => FieldsTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [FieldsTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<FieldsTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldsTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldsTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [FieldsTypeEnum] to String,
/// and [decode] dynamic data back to [FieldsTypeEnum].
class FieldsTypeEnumTypeTransformer {
  factory FieldsTypeEnumTypeTransformer() => _instance ??= const FieldsTypeEnumTypeTransformer._();

  const FieldsTypeEnumTypeTransformer._();

  String encode(FieldsTypeEnum data) => data._value;

  /// Returns the instance of [FieldsTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  FieldsTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is FieldsTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'adf': return FieldsTypeEnum.adf;
        case r'raw': return FieldsTypeEnum.raw;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static FieldsTypeEnumTypeTransformer? _instance;
}


