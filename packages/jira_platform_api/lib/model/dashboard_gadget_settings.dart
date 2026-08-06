//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DashboardGadgetSettings {
  /// Returns a new [DashboardGadgetSettings] instance.
  DashboardGadgetSettings({
    this.color,
    this.ignoreUriAndModuleKeyValidation,
    this.moduleKey,
    this.position,
    this.title,
    this.uri,
  });

  /// The color of the gadget. Should be one of `blue`, `red`, `yellow`, `green`, `cyan`, `purple`, `gray`, or `white`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? color;

  /// Whether to ignore the validation of module key and URI. For example, when a gadget is created that is a part of an application that isn't installed.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? ignoreUriAndModuleKeyValidation;

  /// The module key of the gadget type. Can't be provided with `uri`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? moduleKey;

  /// The position of the gadget. When the gadget is placed into the position, other gadgets in the same column are moved down to accommodate it.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DashboardGadgetPosition? position;

  /// The title of the gadget.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? title;

  /// The URI of the gadget type. Can't be provided with `moduleKey`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? uri;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DashboardGadgetSettings &&
    other.color == color &&
    other.ignoreUriAndModuleKeyValidation == ignoreUriAndModuleKeyValidation &&
    other.moduleKey == moduleKey &&
    other.position == position &&
    other.title == title &&
    other.uri == uri;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (color == null ? 0 : color!.hashCode) +
    (ignoreUriAndModuleKeyValidation == null ? 0 : ignoreUriAndModuleKeyValidation!.hashCode) +
    (moduleKey == null ? 0 : moduleKey!.hashCode) +
    (position == null ? 0 : position!.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (uri == null ? 0 : uri!.hashCode);

  @override
  String toString() => 'DashboardGadgetSettings[color=$color, ignoreUriAndModuleKeyValidation=$ignoreUriAndModuleKeyValidation, moduleKey=$moduleKey, position=$position, title=$title, uri=$uri]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.color != null) {
      json[r'color'] = this.color;
    } else {
      json[r'color'] = null;
    }
    if (this.ignoreUriAndModuleKeyValidation != null) {
      json[r'ignoreUriAndModuleKeyValidation'] = this.ignoreUriAndModuleKeyValidation;
    } else {
      json[r'ignoreUriAndModuleKeyValidation'] = null;
    }
    if (this.moduleKey != null) {
      json[r'moduleKey'] = this.moduleKey;
    } else {
      json[r'moduleKey'] = null;
    }
    if (this.position != null) {
      json[r'position'] = this.position;
    } else {
      json[r'position'] = null;
    }
    if (this.title != null) {
      json[r'title'] = this.title;
    } else {
      json[r'title'] = null;
    }
    if (this.uri != null) {
      json[r'uri'] = this.uri;
    } else {
      json[r'uri'] = null;
    }
    return json;
  }

  /// Returns a new [DashboardGadgetSettings] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DashboardGadgetSettings? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return DashboardGadgetSettings(
        color: mapValueOfType<String>(json, r'color'),
        ignoreUriAndModuleKeyValidation: mapValueOfType<bool>(json, r'ignoreUriAndModuleKeyValidation'),
        moduleKey: mapValueOfType<String>(json, r'moduleKey'),
        position: DashboardGadgetPosition.fromJson(json[r'position']),
        title: mapValueOfType<String>(json, r'title'),
        uri: mapValueOfType<String>(json, r'uri'),
      );
    }
    return null;
  }

  static List<DashboardGadgetSettings> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DashboardGadgetSettings>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DashboardGadgetSettings.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DashboardGadgetSettings> mapFromJson(dynamic json) {
    final map = <String, DashboardGadgetSettings>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DashboardGadgetSettings.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DashboardGadgetSettings-objects as value to a dart map
  static Map<String, List<DashboardGadgetSettings>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<DashboardGadgetSettings>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DashboardGadgetSettings.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

