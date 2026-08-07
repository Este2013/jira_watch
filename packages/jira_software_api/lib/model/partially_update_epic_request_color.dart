//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PartiallyUpdateEpicRequestColor {
  /// Returns a new [PartiallyUpdateEpicRequestColor] instance.
  PartiallyUpdateEpicRequestColor({
    this.key,
  });

  PartiallyUpdateEpicRequestColorKeyEnum? key;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PartiallyUpdateEpicRequestColor &&
    other.key == key;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (key == null ? 0 : key!.hashCode);

  @override
  String toString() => 'PartiallyUpdateEpicRequestColor[key=$key]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.key != null) {
      json[r'key'] = this.key;
    } else {
      json[r'key'] = null;
    }
    return json;
  }

  /// Returns a new [PartiallyUpdateEpicRequestColor] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PartiallyUpdateEpicRequestColor? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return PartiallyUpdateEpicRequestColor(
        key: PartiallyUpdateEpicRequestColorKeyEnum.fromJson(json[r'key']),
      );
    }
    return null;
  }

  static List<PartiallyUpdateEpicRequestColor> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PartiallyUpdateEpicRequestColor>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PartiallyUpdateEpicRequestColor.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PartiallyUpdateEpicRequestColor> mapFromJson(dynamic json) {
    final map = <String, PartiallyUpdateEpicRequestColor>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PartiallyUpdateEpicRequestColor.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PartiallyUpdateEpicRequestColor-objects as value to a dart map
  static Map<String, List<PartiallyUpdateEpicRequestColor>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PartiallyUpdateEpicRequestColor>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PartiallyUpdateEpicRequestColor.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


enum PartiallyUpdateEpicRequestColorKeyEnum {
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
  const PartiallyUpdateEpicRequestColorKeyEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [PartiallyUpdateEpicRequestColorKeyEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static PartiallyUpdateEpicRequestColorKeyEnum? fromJson(dynamic value) => PartiallyUpdateEpicRequestColorKeyEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [PartiallyUpdateEpicRequestColorKeyEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<PartiallyUpdateEpicRequestColorKeyEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PartiallyUpdateEpicRequestColorKeyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PartiallyUpdateEpicRequestColorKeyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PartiallyUpdateEpicRequestColorKeyEnum] to String,
/// and [decode] dynamic data back to [PartiallyUpdateEpicRequestColorKeyEnum].
class PartiallyUpdateEpicRequestColorKeyEnumTypeTransformer {
  factory PartiallyUpdateEpicRequestColorKeyEnumTypeTransformer() => _instance ??= const PartiallyUpdateEpicRequestColorKeyEnumTypeTransformer._();

  const PartiallyUpdateEpicRequestColorKeyEnumTypeTransformer._();

  String encode(PartiallyUpdateEpicRequestColorKeyEnum data) => data._value;

  /// Returns the instance of [PartiallyUpdateEpicRequestColorKeyEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PartiallyUpdateEpicRequestColorKeyEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is PartiallyUpdateEpicRequestColorKeyEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'color_1': return PartiallyUpdateEpicRequestColorKeyEnum.color1;
        case r'color_2': return PartiallyUpdateEpicRequestColorKeyEnum.color2;
        case r'color_3': return PartiallyUpdateEpicRequestColorKeyEnum.color3;
        case r'color_4': return PartiallyUpdateEpicRequestColorKeyEnum.color4;
        case r'color_5': return PartiallyUpdateEpicRequestColorKeyEnum.color5;
        case r'color_6': return PartiallyUpdateEpicRequestColorKeyEnum.color6;
        case r'color_7': return PartiallyUpdateEpicRequestColorKeyEnum.color7;
        case r'color_8': return PartiallyUpdateEpicRequestColorKeyEnum.color8;
        case r'color_9': return PartiallyUpdateEpicRequestColorKeyEnum.color9;
        case r'color_10': return PartiallyUpdateEpicRequestColorKeyEnum.color10;
        case r'color_11': return PartiallyUpdateEpicRequestColorKeyEnum.color11;
        case r'color_12': return PartiallyUpdateEpicRequestColorKeyEnum.color12;
        case r'color_13': return PartiallyUpdateEpicRequestColorKeyEnum.color13;
        case r'color_14': return PartiallyUpdateEpicRequestColorKeyEnum.color14;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static PartiallyUpdateEpicRequestColorKeyEnumTypeTransformer? _instance;
}


