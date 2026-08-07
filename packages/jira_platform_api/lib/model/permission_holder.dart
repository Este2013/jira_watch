//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PermissionHolder {
  /// Returns a new [PermissionHolder] instance.
  PermissionHolder({
    this.expand,
    this.parameter,
    required this.type,
    this.value,
  });

  /// Expand options that include additional permission holder details in the response.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? expand;

  /// As a group's name can change, use of `value` is recommended. The identifier associated withthe `type` value that defines the holder of the permission.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? parameter;

  /// The type of permission holder.
  String type;

  /// The identifier associated with the `type` value that defines the holder of the permission.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PermissionHolder &&
    other.expand == expand &&
    other.parameter == parameter &&
    other.type == type &&
    other.value == value;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (expand == null ? 0 : expand!.hashCode) +
    (parameter == null ? 0 : parameter!.hashCode) +
    (type.hashCode) +
    (value == null ? 0 : value!.hashCode);

  @override
  String toString() => 'PermissionHolder[expand=$expand, parameter=$parameter, type=$type, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.expand != null) {
      json[r'expand'] = this.expand;
    } else {
      json[r'expand'] = null;
    }
    if (this.parameter != null) {
      json[r'parameter'] = this.parameter;
    } else {
      json[r'parameter'] = null;
    }
      json[r'type'] = this.type;
    if (this.value != null) {
      json[r'value'] = this.value;
    } else {
      json[r'value'] = null;
    }
    return json;
  }

  /// Returns a new [PermissionHolder] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PermissionHolder? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'type'), 'Required key "PermissionHolder[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "PermissionHolder[type]" has a null value in JSON.');
        return true;
      }());

      return PermissionHolder(
        expand: mapValueOfType<String>(json, r'expand'),
        parameter: mapValueOfType<String>(json, r'parameter'),
        type: mapValueOfType<String>(json, r'type')!,
        value: mapValueOfType<String>(json, r'value'),
      );
    }
    return null;
  }

  static List<PermissionHolder> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PermissionHolder>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PermissionHolder.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PermissionHolder> mapFromJson(dynamic json) {
    final map = <String, PermissionHolder>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PermissionHolder.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PermissionHolder-objects as value to a dart map
  static Map<String, List<PermissionHolder>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PermissionHolder>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PermissionHolder.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'type',
  };
}

