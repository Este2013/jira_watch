//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Principal {
  /// Returns a new [Principal] instance.
  Principal({
    this.principalType,
    this.principalId,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  PrincipalType? principalType;

  /// The principal ID.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? principalId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Principal &&
    other.principalType == principalType &&
    other.principalId == principalId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (principalType == null ? 0 : principalType!.hashCode) +
    (principalId == null ? 0 : principalId!.hashCode);

  @override
  String toString() => 'Principal[principalType=$principalType, principalId=$principalId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.principalType != null) {
      json[r'principalType'] = this.principalType;
    } else {
      json[r'principalType'] = null;
    }
    if (this.principalId != null) {
      json[r'principalId'] = this.principalId;
    } else {
      json[r'principalId'] = null;
    }
    return json;
  }

  /// Returns a new [Principal] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Principal? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return Principal(
        principalType: PrincipalType.fromJson(json[r'principalType']),
        principalId: mapValueOfType<String>(json, r'principalId'),
      );
    }
    return null;
  }

  static List<Principal> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Principal>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Principal.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Principal> mapFromJson(dynamic json) {
    final map = <String, Principal>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Principal.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Principal-objects as value to a dart map
  static Map<String, List<Principal>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Principal>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Principal.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

