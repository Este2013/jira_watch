//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ScreenTypes {
  /// Returns a new [ScreenTypes] instance.
  ScreenTypes({
    this.create,
    required this.default_,
    this.edit,
    this.view,
  });

  /// The ID of the create screen.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? create;

  /// The ID of the default screen. Required when creating a screen scheme.
  int default_;

  /// The ID of the edit screen.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? edit;

  /// The ID of the view screen.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? view;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ScreenTypes &&
    other.create == create &&
    other.default_ == default_ &&
    other.edit == edit &&
    other.view == view;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (create == null ? 0 : create!.hashCode) +
    (default_.hashCode) +
    (edit == null ? 0 : edit!.hashCode) +
    (view == null ? 0 : view!.hashCode);

  @override
  String toString() => 'ScreenTypes[create=$create, default_=$default_, edit=$edit, view=$view]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.create != null) {
      json[r'create'] = this.create;
    } else {
      json[r'create'] = null;
    }
      json[r'default'] = this.default_;
    if (this.edit != null) {
      json[r'edit'] = this.edit;
    } else {
      json[r'edit'] = null;
    }
    if (this.view != null) {
      json[r'view'] = this.view;
    } else {
      json[r'view'] = null;
    }
    return json;
  }

  /// Returns a new [ScreenTypes] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ScreenTypes? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'default'), 'Required key "ScreenTypes[default]" is missing from JSON.');
        assert(json[r'default'] != null, 'Required key "ScreenTypes[default]" has a null value in JSON.');
        return true;
      }());

      return ScreenTypes(
        create: mapValueOfType<int>(json, r'create'),
        default_: mapValueOfType<int>(json, r'default')!,
        edit: mapValueOfType<int>(json, r'edit'),
        view: mapValueOfType<int>(json, r'view'),
      );
    }
    return null;
  }

  static List<ScreenTypes> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ScreenTypes>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ScreenTypes.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ScreenTypes> mapFromJson(dynamic json) {
    final map = <String, ScreenTypes>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ScreenTypes.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ScreenTypes-objects as value to a dart map
  static Map<String, List<ScreenTypes>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ScreenTypes>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ScreenTypes.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'default',
  };
}

