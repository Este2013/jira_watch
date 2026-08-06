//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ColorBean {
  /// Returns a new [ColorBean] instance.
  ColorBean({
    this.key,
  });

  ColorBeanKeyEnum? key;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ColorBean &&
    other.key == key;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (key == null ? 0 : key!.hashCode);

  @override
  String toString() => 'ColorBean[key=$key]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.key != null) {
      json[r'key'] = this.key;
    } else {
      json[r'key'] = null;
    }
    return json;
  }

  /// Returns a new [ColorBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ColorBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ColorBean(
        key: ColorBeanKeyEnum.fromJson(json[r'key']),
      );
    }
    return null;
  }

  static List<ColorBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ColorBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ColorBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ColorBean> mapFromJson(dynamic json) {
    final map = <String, ColorBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ColorBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ColorBean-objects as value to a dart map
  static Map<String, List<ColorBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ColorBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ColorBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


enum ColorBeanKeyEnum {
  color1._(r'color_1'),
  color2._(r'color_2'),
  color3._(r'color_3'),
  color4._(r'color_4'),
  color5._(r'color_5'),
  color6._(r'color_6'),
  color7._(r'color_7'),
  color8._(r'color_8'),
  color9._(r'color_9'),
  color10._(r'color_10'),
  color11._(r'color_11'),
  color12._(r'color_12'),
  color13._(r'color_13'),
  color14._(r'color_14'),
  ;

  /// Instantiate a new enum with the provided value.
  const ColorBeanKeyEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ColorBeanKeyEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ColorBeanKeyEnum? fromJson(dynamic value) => ColorBeanKeyEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ColorBeanKeyEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ColorBeanKeyEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ColorBeanKeyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ColorBeanKeyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ColorBeanKeyEnum] to String,
/// and [decode] dynamic data back to [ColorBeanKeyEnum].
class ColorBeanKeyEnumTypeTransformer {
  factory ColorBeanKeyEnumTypeTransformer() => _instance ??= const ColorBeanKeyEnumTypeTransformer._();

  const ColorBeanKeyEnumTypeTransformer._();

  String encode(ColorBeanKeyEnum data) => data._value;

  /// Returns the instance of [ColorBeanKeyEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ColorBeanKeyEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is ColorBeanKeyEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'color_1': return ColorBeanKeyEnum.color1;
        case r'color_2': return ColorBeanKeyEnum.color2;
        case r'color_3': return ColorBeanKeyEnum.color3;
        case r'color_4': return ColorBeanKeyEnum.color4;
        case r'color_5': return ColorBeanKeyEnum.color5;
        case r'color_6': return ColorBeanKeyEnum.color6;
        case r'color_7': return ColorBeanKeyEnum.color7;
        case r'color_8': return ColorBeanKeyEnum.color8;
        case r'color_9': return ColorBeanKeyEnum.color9;
        case r'color_10': return ColorBeanKeyEnum.color10;
        case r'color_11': return ColorBeanKeyEnum.color11;
        case r'color_12': return ColorBeanKeyEnum.color12;
        case r'color_13': return ColorBeanKeyEnum.color13;
        case r'color_14': return ColorBeanKeyEnum.color14;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ColorBeanKeyEnumTypeTransformer? _instance;
}


