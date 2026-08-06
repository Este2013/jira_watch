//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FieldConfigurationItem {
  /// Returns a new [FieldConfigurationItem] instance.
  FieldConfigurationItem({
    this.description,
    required this.id,
    this.isHidden,
    this.isRequired,
    this.renderer,
  });

  /// The description of the field within the field configuration.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The ID of the field within the field configuration.
  String id;

  /// Whether the field is hidden in the field configuration.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isHidden;

  /// Whether the field is required in the field configuration.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isRequired;

  /// The renderer type for the field within the field configuration.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? renderer;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FieldConfigurationItem &&
    other.description == description &&
    other.id == id &&
    other.isHidden == isHidden &&
    other.isRequired == isRequired &&
    other.renderer == renderer;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (id.hashCode) +
    (isHidden == null ? 0 : isHidden!.hashCode) +
    (isRequired == null ? 0 : isRequired!.hashCode) +
    (renderer == null ? 0 : renderer!.hashCode);

  @override
  String toString() => 'FieldConfigurationItem[description=$description, id=$id, isHidden=$isHidden, isRequired=$isRequired, renderer=$renderer]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
      json[r'id'] = this.id;
    if (this.isHidden != null) {
      json[r'isHidden'] = this.isHidden;
    } else {
      json[r'isHidden'] = null;
    }
    if (this.isRequired != null) {
      json[r'isRequired'] = this.isRequired;
    } else {
      json[r'isRequired'] = null;
    }
    if (this.renderer != null) {
      json[r'renderer'] = this.renderer;
    } else {
      json[r'renderer'] = null;
    }
    return json;
  }

  /// Returns a new [FieldConfigurationItem] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FieldConfigurationItem? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "FieldConfigurationItem[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "FieldConfigurationItem[id]" has a null value in JSON.');
        return true;
      }());

      return FieldConfigurationItem(
        description: mapValueOfType<String>(json, r'description'),
        id: mapValueOfType<String>(json, r'id')!,
        isHidden: mapValueOfType<bool>(json, r'isHidden'),
        isRequired: mapValueOfType<bool>(json, r'isRequired'),
        renderer: mapValueOfType<String>(json, r'renderer'),
      );
    }
    return null;
  }

  static List<FieldConfigurationItem> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldConfigurationItem>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldConfigurationItem.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FieldConfigurationItem> mapFromJson(dynamic json) {
    final map = <String, FieldConfigurationItem>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FieldConfigurationItem.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FieldConfigurationItem-objects as value to a dart map
  static Map<String, List<FieldConfigurationItem>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FieldConfigurationItem>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FieldConfigurationItem.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
  };
}

