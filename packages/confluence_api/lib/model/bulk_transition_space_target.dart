//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BulkTransitionSpaceTarget {
  /// Returns a new [BulkTransitionSpaceTarget] instance.
  BulkTransitionSpaceTarget({
    required this.id,
    required this.key,
  });

  /// The space ID.
  String id;

  /// The space key.
  String key;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BulkTransitionSpaceTarget &&
    other.id == id &&
    other.key == key;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (key.hashCode);

  @override
  String toString() => 'BulkTransitionSpaceTarget[id=$id, key=$key]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'key'] = this.key;
    return json;
  }

  /// Returns a new [BulkTransitionSpaceTarget] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BulkTransitionSpaceTarget? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "BulkTransitionSpaceTarget[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "BulkTransitionSpaceTarget[id]" has a null value in JSON.');
        assert(json.containsKey(r'key'), 'Required key "BulkTransitionSpaceTarget[key]" is missing from JSON.');
        assert(json[r'key'] != null, 'Required key "BulkTransitionSpaceTarget[key]" has a null value in JSON.');
        return true;
      }());

      return BulkTransitionSpaceTarget(
        id: mapValueOfType<String>(json, r'id')!,
        key: mapValueOfType<String>(json, r'key')!,
      );
    }
    return null;
  }

  static List<BulkTransitionSpaceTarget> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BulkTransitionSpaceTarget>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BulkTransitionSpaceTarget.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BulkTransitionSpaceTarget> mapFromJson(dynamic json) {
    final map = <String, BulkTransitionSpaceTarget>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BulkTransitionSpaceTarget.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BulkTransitionSpaceTarget-objects as value to a dart map
  static Map<String, List<BulkTransitionSpaceTarget>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BulkTransitionSpaceTarget>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BulkTransitionSpaceTarget.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'key',
  };
}

