//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class StatusMigration {
  /// Returns a new [StatusMigration] instance.
  StatusMigration({
    required this.newStatusReference,
    required this.oldStatusReference,
  });

  /// The new status ID.
  String newStatusReference;

  /// The old status ID.
  String oldStatusReference;

  @override
  bool operator ==(Object other) => identical(this, other) || other is StatusMigration &&
    other.newStatusReference == newStatusReference &&
    other.oldStatusReference == oldStatusReference;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (newStatusReference.hashCode) +
    (oldStatusReference.hashCode);

  @override
  String toString() => 'StatusMigration[newStatusReference=$newStatusReference, oldStatusReference=$oldStatusReference]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'newStatusReference'] = this.newStatusReference;
      json[r'oldStatusReference'] = this.oldStatusReference;
    return json;
  }

  /// Returns a new [StatusMigration] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static StatusMigration? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'newStatusReference'), 'Required key "StatusMigration[newStatusReference]" is missing from JSON.');
        assert(json[r'newStatusReference'] != null, 'Required key "StatusMigration[newStatusReference]" has a null value in JSON.');
        assert(json.containsKey(r'oldStatusReference'), 'Required key "StatusMigration[oldStatusReference]" is missing from JSON.');
        assert(json[r'oldStatusReference'] != null, 'Required key "StatusMigration[oldStatusReference]" has a null value in JSON.');
        return true;
      }());

      return StatusMigration(
        newStatusReference: mapValueOfType<String>(json, r'newStatusReference')!,
        oldStatusReference: mapValueOfType<String>(json, r'oldStatusReference')!,
      );
    }
    return null;
  }

  static List<StatusMigration> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StatusMigration>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StatusMigration.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, StatusMigration> mapFromJson(dynamic json) {
    final map = <String, StatusMigration>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = StatusMigration.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of StatusMigration-objects as value to a dart map
  static Map<String, List<StatusMigration>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<StatusMigration>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = StatusMigration.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'newStatusReference',
    'oldStatusReference',
  };
}

