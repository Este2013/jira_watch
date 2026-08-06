//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JiraLabelPropertiesInputJackson1 {
  /// Returns a new [JiraLabelPropertiesInputJackson1] instance.
  JiraLabelPropertiesInputJackson1({
    this.color,
    this.name,
  });

  JiraLabelPropertiesInputJackson1ColorEnum? color;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JiraLabelPropertiesInputJackson1 &&
    other.color == color &&
    other.name == name;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (color == null ? 0 : color!.hashCode) +
    (name == null ? 0 : name!.hashCode);

  @override
  String toString() => 'JiraLabelPropertiesInputJackson1[color=$color, name=$name]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.color != null) {
      json[r'color'] = this.color;
    } else {
      json[r'color'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    return json;
  }

  /// Returns a new [JiraLabelPropertiesInputJackson1] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JiraLabelPropertiesInputJackson1? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return JiraLabelPropertiesInputJackson1(
        color: JiraLabelPropertiesInputJackson1ColorEnum.fromJson(json[r'color']),
        name: mapValueOfType<String>(json, r'name'),
      );
    }
    return null;
  }

  static List<JiraLabelPropertiesInputJackson1> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JiraLabelPropertiesInputJackson1>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JiraLabelPropertiesInputJackson1.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JiraLabelPropertiesInputJackson1> mapFromJson(dynamic json) {
    final map = <String, JiraLabelPropertiesInputJackson1>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JiraLabelPropertiesInputJackson1.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JiraLabelPropertiesInputJackson1-objects as value to a dart map
  static Map<String, List<JiraLabelPropertiesInputJackson1>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JiraLabelPropertiesInputJackson1>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JiraLabelPropertiesInputJackson1.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


enum JiraLabelPropertiesInputJackson1ColorEnum {
  GREY_LIGHTEST._(r'GREY_LIGHTEST'),
  GREY_LIGHTER._(r'GREY_LIGHTER'),
  GREY._(r'GREY'),
  GREY_DARKER._(r'GREY_DARKER'),
  GREY_DARKEST._(r'GREY_DARKEST'),
  PURPLE_LIGHTEST._(r'PURPLE_LIGHTEST'),
  PURPLE_LIGHTER._(r'PURPLE_LIGHTER'),
  PURPLE._(r'PURPLE'),
  PURPLE_DARKER._(r'PURPLE_DARKER'),
  PURPLE_DARKEST._(r'PURPLE_DARKEST'),
  BLUE_LIGHTEST._(r'BLUE_LIGHTEST'),
  BLUE_LIGHTER._(r'BLUE_LIGHTER'),
  BLUE._(r'BLUE'),
  BLUE_DARKER._(r'BLUE_DARKER'),
  BLUE_DARKEST._(r'BLUE_DARKEST'),
  TEAL_LIGHTEST._(r'TEAL_LIGHTEST'),
  TEAL_LIGHTER._(r'TEAL_LIGHTER'),
  TEAL._(r'TEAL'),
  TEAL_DARKER._(r'TEAL_DARKER'),
  TEAL_DARKEST._(r'TEAL_DARKEST'),
  GREEN_LIGHTEST._(r'GREEN_LIGHTEST'),
  GREEN_LIGHTER._(r'GREEN_LIGHTER'),
  GREEN._(r'GREEN'),
  GREEN_DARKER._(r'GREEN_DARKER'),
  GREEN_DARKEST._(r'GREEN_DARKEST'),
  LIME_LIGHTEST._(r'LIME_LIGHTEST'),
  LIME_LIGHTER._(r'LIME_LIGHTER'),
  LIME._(r'LIME'),
  LIME_DARKER._(r'LIME_DARKER'),
  LIME_DARKEST._(r'LIME_DARKEST'),
  YELLOW_LIGHTEST._(r'YELLOW_LIGHTEST'),
  YELLOW_LIGHTER._(r'YELLOW_LIGHTER'),
  YELLOW._(r'YELLOW'),
  YELLOW_DARKER._(r'YELLOW_DARKER'),
  YELLOW_DARKEST._(r'YELLOW_DARKEST'),
  ORANGE_LIGHTEST._(r'ORANGE_LIGHTEST'),
  ORANGE_LIGHTER._(r'ORANGE_LIGHTER'),
  ORANGE._(r'ORANGE'),
  ORANGE_DARKER._(r'ORANGE_DARKER'),
  ORANGE_DARKEST._(r'ORANGE_DARKEST'),
  RED_LIGHTEST._(r'RED_LIGHTEST'),
  RED_LIGHTER._(r'RED_LIGHTER'),
  RED._(r'RED'),
  RED_DARKER._(r'RED_DARKER'),
  RED_DARKEST._(r'RED_DARKEST'),
  MAGENTA_LIGHTEST._(r'MAGENTA_LIGHTEST'),
  MAGENTA_LIGHTER._(r'MAGENTA_LIGHTER'),
  MAGENTA._(r'MAGENTA'),
  MAGENTA_DARKER._(r'MAGENTA_DARKER'),
  MAGENTA_DARKEST._(r'MAGENTA_DARKEST'),
  ;

  /// Instantiate a new enum with the provided value.
  const JiraLabelPropertiesInputJackson1ColorEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [JiraLabelPropertiesInputJackson1ColorEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static JiraLabelPropertiesInputJackson1ColorEnum? fromJson(dynamic value) => JiraLabelPropertiesInputJackson1ColorEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [JiraLabelPropertiesInputJackson1ColorEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<JiraLabelPropertiesInputJackson1ColorEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JiraLabelPropertiesInputJackson1ColorEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JiraLabelPropertiesInputJackson1ColorEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [JiraLabelPropertiesInputJackson1ColorEnum] to String,
/// and [decode] dynamic data back to [JiraLabelPropertiesInputJackson1ColorEnum].
class JiraLabelPropertiesInputJackson1ColorEnumTypeTransformer {
  factory JiraLabelPropertiesInputJackson1ColorEnumTypeTransformer() => _instance ??= const JiraLabelPropertiesInputJackson1ColorEnumTypeTransformer._();

  const JiraLabelPropertiesInputJackson1ColorEnumTypeTransformer._();

  String encode(JiraLabelPropertiesInputJackson1ColorEnum data) => data._value;

  /// Returns the instance of [JiraLabelPropertiesInputJackson1ColorEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  JiraLabelPropertiesInputJackson1ColorEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is JiraLabelPropertiesInputJackson1ColorEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'GREY_LIGHTEST': return JiraLabelPropertiesInputJackson1ColorEnum.GREY_LIGHTEST;
        case r'GREY_LIGHTER': return JiraLabelPropertiesInputJackson1ColorEnum.GREY_LIGHTER;
        case r'GREY': return JiraLabelPropertiesInputJackson1ColorEnum.GREY;
        case r'GREY_DARKER': return JiraLabelPropertiesInputJackson1ColorEnum.GREY_DARKER;
        case r'GREY_DARKEST': return JiraLabelPropertiesInputJackson1ColorEnum.GREY_DARKEST;
        case r'PURPLE_LIGHTEST': return JiraLabelPropertiesInputJackson1ColorEnum.PURPLE_LIGHTEST;
        case r'PURPLE_LIGHTER': return JiraLabelPropertiesInputJackson1ColorEnum.PURPLE_LIGHTER;
        case r'PURPLE': return JiraLabelPropertiesInputJackson1ColorEnum.PURPLE;
        case r'PURPLE_DARKER': return JiraLabelPropertiesInputJackson1ColorEnum.PURPLE_DARKER;
        case r'PURPLE_DARKEST': return JiraLabelPropertiesInputJackson1ColorEnum.PURPLE_DARKEST;
        case r'BLUE_LIGHTEST': return JiraLabelPropertiesInputJackson1ColorEnum.BLUE_LIGHTEST;
        case r'BLUE_LIGHTER': return JiraLabelPropertiesInputJackson1ColorEnum.BLUE_LIGHTER;
        case r'BLUE': return JiraLabelPropertiesInputJackson1ColorEnum.BLUE;
        case r'BLUE_DARKER': return JiraLabelPropertiesInputJackson1ColorEnum.BLUE_DARKER;
        case r'BLUE_DARKEST': return JiraLabelPropertiesInputJackson1ColorEnum.BLUE_DARKEST;
        case r'TEAL_LIGHTEST': return JiraLabelPropertiesInputJackson1ColorEnum.TEAL_LIGHTEST;
        case r'TEAL_LIGHTER': return JiraLabelPropertiesInputJackson1ColorEnum.TEAL_LIGHTER;
        case r'TEAL': return JiraLabelPropertiesInputJackson1ColorEnum.TEAL;
        case r'TEAL_DARKER': return JiraLabelPropertiesInputJackson1ColorEnum.TEAL_DARKER;
        case r'TEAL_DARKEST': return JiraLabelPropertiesInputJackson1ColorEnum.TEAL_DARKEST;
        case r'GREEN_LIGHTEST': return JiraLabelPropertiesInputJackson1ColorEnum.GREEN_LIGHTEST;
        case r'GREEN_LIGHTER': return JiraLabelPropertiesInputJackson1ColorEnum.GREEN_LIGHTER;
        case r'GREEN': return JiraLabelPropertiesInputJackson1ColorEnum.GREEN;
        case r'GREEN_DARKER': return JiraLabelPropertiesInputJackson1ColorEnum.GREEN_DARKER;
        case r'GREEN_DARKEST': return JiraLabelPropertiesInputJackson1ColorEnum.GREEN_DARKEST;
        case r'LIME_LIGHTEST': return JiraLabelPropertiesInputJackson1ColorEnum.LIME_LIGHTEST;
        case r'LIME_LIGHTER': return JiraLabelPropertiesInputJackson1ColorEnum.LIME_LIGHTER;
        case r'LIME': return JiraLabelPropertiesInputJackson1ColorEnum.LIME;
        case r'LIME_DARKER': return JiraLabelPropertiesInputJackson1ColorEnum.LIME_DARKER;
        case r'LIME_DARKEST': return JiraLabelPropertiesInputJackson1ColorEnum.LIME_DARKEST;
        case r'YELLOW_LIGHTEST': return JiraLabelPropertiesInputJackson1ColorEnum.YELLOW_LIGHTEST;
        case r'YELLOW_LIGHTER': return JiraLabelPropertiesInputJackson1ColorEnum.YELLOW_LIGHTER;
        case r'YELLOW': return JiraLabelPropertiesInputJackson1ColorEnum.YELLOW;
        case r'YELLOW_DARKER': return JiraLabelPropertiesInputJackson1ColorEnum.YELLOW_DARKER;
        case r'YELLOW_DARKEST': return JiraLabelPropertiesInputJackson1ColorEnum.YELLOW_DARKEST;
        case r'ORANGE_LIGHTEST': return JiraLabelPropertiesInputJackson1ColorEnum.ORANGE_LIGHTEST;
        case r'ORANGE_LIGHTER': return JiraLabelPropertiesInputJackson1ColorEnum.ORANGE_LIGHTER;
        case r'ORANGE': return JiraLabelPropertiesInputJackson1ColorEnum.ORANGE;
        case r'ORANGE_DARKER': return JiraLabelPropertiesInputJackson1ColorEnum.ORANGE_DARKER;
        case r'ORANGE_DARKEST': return JiraLabelPropertiesInputJackson1ColorEnum.ORANGE_DARKEST;
        case r'RED_LIGHTEST': return JiraLabelPropertiesInputJackson1ColorEnum.RED_LIGHTEST;
        case r'RED_LIGHTER': return JiraLabelPropertiesInputJackson1ColorEnum.RED_LIGHTER;
        case r'RED': return JiraLabelPropertiesInputJackson1ColorEnum.RED;
        case r'RED_DARKER': return JiraLabelPropertiesInputJackson1ColorEnum.RED_DARKER;
        case r'RED_DARKEST': return JiraLabelPropertiesInputJackson1ColorEnum.RED_DARKEST;
        case r'MAGENTA_LIGHTEST': return JiraLabelPropertiesInputJackson1ColorEnum.MAGENTA_LIGHTEST;
        case r'MAGENTA_LIGHTER': return JiraLabelPropertiesInputJackson1ColorEnum.MAGENTA_LIGHTER;
        case r'MAGENTA': return JiraLabelPropertiesInputJackson1ColorEnum.MAGENTA;
        case r'MAGENTA_DARKER': return JiraLabelPropertiesInputJackson1ColorEnum.MAGENTA_DARKER;
        case r'MAGENTA_DARKEST': return JiraLabelPropertiesInputJackson1ColorEnum.MAGENTA_DARKEST;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static JiraLabelPropertiesInputJackson1ColorEnumTypeTransformer? _instance;
}


