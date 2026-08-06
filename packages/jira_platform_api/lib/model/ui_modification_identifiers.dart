//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UiModificationIdentifiers {
  /// Returns a new [UiModificationIdentifiers] instance.
  UiModificationIdentifiers({
    required this.id,
    required this.self,
  });

  /// The ID of the UI modification.
  String id;

  /// The URL of the UI modification.
  String self;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UiModificationIdentifiers &&
    other.id == id &&
    other.self == self;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (self.hashCode);

  @override
  String toString() => 'UiModificationIdentifiers[id=$id, self=$self]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'self'] = this.self;
    return json;
  }

  /// Returns a new [UiModificationIdentifiers] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UiModificationIdentifiers? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "UiModificationIdentifiers[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "UiModificationIdentifiers[id]" has a null value in JSON.');
        assert(json.containsKey(r'self'), 'Required key "UiModificationIdentifiers[self]" is missing from JSON.');
        assert(json[r'self'] != null, 'Required key "UiModificationIdentifiers[self]" has a null value in JSON.');
        return true;
      }());

      return UiModificationIdentifiers(
        id: mapValueOfType<String>(json, r'id')!,
        self: mapValueOfType<String>(json, r'self')!,
      );
    }
    return null;
  }

  static List<UiModificationIdentifiers> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UiModificationIdentifiers>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UiModificationIdentifiers.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UiModificationIdentifiers> mapFromJson(dynamic json) {
    final map = <String, UiModificationIdentifiers>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UiModificationIdentifiers.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UiModificationIdentifiers-objects as value to a dart map
  static Map<String, List<UiModificationIdentifiers>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UiModificationIdentifiers>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UiModificationIdentifiers.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'self',
  };
}

