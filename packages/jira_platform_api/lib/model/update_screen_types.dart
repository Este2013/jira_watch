//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateScreenTypes {
  /// Returns a new [UpdateScreenTypes] instance.
  UpdateScreenTypes({
    this.create,
    this.default_,
    this.edit,
    this.view,
  });

  /// The ID of the create screen. To remove the screen association, pass a null.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? create;

  /// The ID of the default screen. When specified, must include a screen ID as a default screen is required.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? default_;

  /// The ID of the edit screen. To remove the screen association, pass a null.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? edit;

  /// The ID of the view screen. To remove the screen association, pass a null.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? view;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UpdateScreenTypes &&
    other.create == create &&
    other.default_ == default_ &&
    other.edit == edit &&
    other.view == view;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (create == null ? 0 : create!.hashCode) +
    (default_ == null ? 0 : default_!.hashCode) +
    (edit == null ? 0 : edit!.hashCode) +
    (view == null ? 0 : view!.hashCode);

  @override
  String toString() => 'UpdateScreenTypes[create=$create, default_=$default_, edit=$edit, view=$view]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.create != null) {
      json[r'create'] = this.create;
    } else {
      json[r'create'] = null;
    }
    if (this.default_ != null) {
      json[r'default'] = this.default_;
    } else {
      json[r'default'] = null;
    }
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

  /// Returns a new [UpdateScreenTypes] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateScreenTypes? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return UpdateScreenTypes(
        create: mapValueOfType<String>(json, r'create'),
        default_: mapValueOfType<String>(json, r'default'),
        edit: mapValueOfType<String>(json, r'edit'),
        view: mapValueOfType<String>(json, r'view'),
      );
    }
    return null;
  }

  static List<UpdateScreenTypes> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdateScreenTypes>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateScreenTypes.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateScreenTypes> mapFromJson(dynamic json) {
    final map = <String, UpdateScreenTypes>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateScreenTypes.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateScreenTypes-objects as value to a dart map
  static Map<String, List<UpdateScreenTypes>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UpdateScreenTypes>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdateScreenTypes.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

