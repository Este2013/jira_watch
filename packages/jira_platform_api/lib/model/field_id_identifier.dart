//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FieldIdIdentifier {
  /// Returns a new [FieldIdIdentifier] instance.
  FieldIdIdentifier({
    this.identifier,
    required this.type,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? identifier;

  String type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FieldIdIdentifier &&
    other.identifier == identifier &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (identifier == null ? 0 : identifier!.hashCode) +
    (type.hashCode);

  @override
  String toString() => 'FieldIdIdentifier[identifier=$identifier, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.identifier != null) {
      json[r'identifier'] = this.identifier;
    } else {
      json[r'identifier'] = null;
    }
      json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [FieldIdIdentifier] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FieldIdIdentifier? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'type'), 'Required key "FieldIdIdentifier[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "FieldIdIdentifier[type]" has a null value in JSON.');
        return true;
      }());

      return FieldIdIdentifier(
        identifier: mapValueOfType<String>(json, r'identifier'),
        type: mapValueOfType<String>(json, r'type')!,
      );
    }
    return null;
  }

  static List<FieldIdIdentifier> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldIdIdentifier>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldIdIdentifier.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FieldIdIdentifier> mapFromJson(dynamic json) {
    final map = <String, FieldIdIdentifier>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FieldIdIdentifier.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FieldIdIdentifier-objects as value to a dart map
  static Map<String, List<FieldIdIdentifier>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FieldIdIdentifier>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FieldIdIdentifier.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'type',
  };
}

