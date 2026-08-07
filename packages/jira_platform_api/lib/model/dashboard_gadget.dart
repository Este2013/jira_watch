//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DashboardGadget {
  /// Returns a new [DashboardGadget] instance.
  DashboardGadget({
    required this.color,
    required this.id,
    this.moduleKey,
    required this.position,
    required this.title,
    this.uri,
  });

  /// The color of the gadget. Should be one of `blue`, `red`, `yellow`, `green`, `cyan`, `purple`, `gray`, or `white`.
  DashboardGadgetColorEnum color;

  /// The ID of the gadget instance.
  int id;

  /// The module key of the gadget type.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? moduleKey;

  /// The position of the gadget.
  DashboardGadgetPosition position;

  /// The title of the gadget.
  String title;

  /// The URI of the gadget type.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? uri;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DashboardGadget &&
    other.color == color &&
    other.id == id &&
    other.moduleKey == moduleKey &&
    other.position == position &&
    other.title == title &&
    other.uri == uri;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (color.hashCode) +
    (id.hashCode) +
    (moduleKey == null ? 0 : moduleKey!.hashCode) +
    (position.hashCode) +
    (title.hashCode) +
    (uri == null ? 0 : uri!.hashCode);

  @override
  String toString() => 'DashboardGadget[color=$color, id=$id, moduleKey=$moduleKey, position=$position, title=$title, uri=$uri]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'color'] = this.color;
      json[r'id'] = this.id;
    if (this.moduleKey != null) {
      json[r'moduleKey'] = this.moduleKey;
    } else {
      json[r'moduleKey'] = null;
    }
      json[r'position'] = this.position;
      json[r'title'] = this.title;
    if (this.uri != null) {
      json[r'uri'] = this.uri;
    } else {
      json[r'uri'] = null;
    }
    return json;
  }

  /// Returns a new [DashboardGadget] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DashboardGadget? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'color'), 'Required key "DashboardGadget[color]" is missing from JSON.');
        assert(json[r'color'] != null, 'Required key "DashboardGadget[color]" has a null value in JSON.');
        assert(json.containsKey(r'id'), 'Required key "DashboardGadget[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "DashboardGadget[id]" has a null value in JSON.');
        assert(json.containsKey(r'position'), 'Required key "DashboardGadget[position]" is missing from JSON.');
        assert(json[r'position'] != null, 'Required key "DashboardGadget[position]" has a null value in JSON.');
        assert(json.containsKey(r'title'), 'Required key "DashboardGadget[title]" is missing from JSON.');
        assert(json[r'title'] != null, 'Required key "DashboardGadget[title]" has a null value in JSON.');
        return true;
      }());

      return DashboardGadget(
        color: DashboardGadgetColorEnum.fromJson(json[r'color'])!,
        id: mapValueOfType<int>(json, r'id')!,
        moduleKey: mapValueOfType<String>(json, r'moduleKey'),
        position: DashboardGadgetPosition.fromJson(json[r'position'])!,
        title: mapValueOfType<String>(json, r'title')!,
        uri: mapValueOfType<String>(json, r'uri'),
      );
    }
    return null;
  }

  static List<DashboardGadget> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DashboardGadget>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DashboardGadget.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DashboardGadget> mapFromJson(dynamic json) {
    final map = <String, DashboardGadget>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DashboardGadget.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DashboardGadget-objects as value to a dart map
  static Map<String, List<DashboardGadget>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<DashboardGadget>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DashboardGadget.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'color',
    'id',
    'position',
    'title',
  };
}

/// The color of the gadget. Should be one of `blue`, `red`, `yellow`, `green`, `cyan`, `purple`, `gray`, or `white`.
enum DashboardGadgetColorEnum {
  blue._(r'blue'),
  red._(r'red'),
  yellow._(r'yellow'),
  green._(r'green'),
  cyan._(r'cyan'),
  purple._(r'purple'),
  gray._(r'gray'),
  white._(r'white'),
  ;

  /// Instantiate a new enum with the provided value.
  const DashboardGadgetColorEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [DashboardGadgetColorEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static DashboardGadgetColorEnum? fromJson(dynamic value) => DashboardGadgetColorEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [DashboardGadgetColorEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<DashboardGadgetColorEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DashboardGadgetColorEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DashboardGadgetColorEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [DashboardGadgetColorEnum] to String,
/// and [decode] dynamic data back to [DashboardGadgetColorEnum].
class DashboardGadgetColorEnumTypeTransformer {
  factory DashboardGadgetColorEnumTypeTransformer() => _instance ??= const DashboardGadgetColorEnumTypeTransformer._();

  const DashboardGadgetColorEnumTypeTransformer._();

  String encode(DashboardGadgetColorEnum data) => data._value;

  /// Returns the instance of [DashboardGadgetColorEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  DashboardGadgetColorEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is DashboardGadgetColorEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'blue': return DashboardGadgetColorEnum.blue;
        case r'red': return DashboardGadgetColorEnum.red;
        case r'yellow': return DashboardGadgetColorEnum.yellow;
        case r'green': return DashboardGadgetColorEnum.green;
        case r'cyan': return DashboardGadgetColorEnum.cyan;
        case r'purple': return DashboardGadgetColorEnum.purple;
        case r'gray': return DashboardGadgetColorEnum.gray;
        case r'white': return DashboardGadgetColorEnum.white;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static DashboardGadgetColorEnumTypeTransformer? _instance;
}


