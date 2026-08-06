//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SecuritySchemeId {
  /// Returns a new [SecuritySchemeId] instance.
  SecuritySchemeId({
    required this.id,
  });

  /// The ID of the issue security scheme.
  String id;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SecuritySchemeId &&
    other.id == id;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode);

  @override
  String toString() => 'SecuritySchemeId[id=$id]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
    return json;
  }

  /// Returns a new [SecuritySchemeId] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SecuritySchemeId? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "SecuritySchemeId[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "SecuritySchemeId[id]" has a null value in JSON.');
        return true;
      }());

      return SecuritySchemeId(
        id: mapValueOfType<String>(json, r'id')!,
      );
    }
    return null;
  }

  static List<SecuritySchemeId> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SecuritySchemeId>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SecuritySchemeId.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SecuritySchemeId> mapFromJson(dynamic json) {
    final map = <String, SecuritySchemeId>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SecuritySchemeId.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SecuritySchemeId-objects as value to a dart map
  static Map<String, List<SecuritySchemeId>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SecuritySchemeId>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SecuritySchemeId.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
  };
}

