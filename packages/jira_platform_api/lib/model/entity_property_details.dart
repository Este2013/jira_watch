//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class EntityPropertyDetails {
  /// Returns a new [EntityPropertyDetails] instance.
  EntityPropertyDetails({
    required this.entityId,
    required this.key,
    required this.value,
  });

  /// The entity property ID.
  num entityId;

  /// The entity property key.
  String key;

  /// The new value of the entity property.
  String value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is EntityPropertyDetails &&
    other.entityId == entityId &&
    other.key == key &&
    other.value == value;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (entityId.hashCode) +
    (key.hashCode) +
    (value.hashCode);

  @override
  String toString() => 'EntityPropertyDetails[entityId=$entityId, key=$key, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'entityId'] = this.entityId;
      json[r'key'] = this.key;
      json[r'value'] = this.value;
    return json;
  }

  /// Returns a new [EntityPropertyDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static EntityPropertyDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'entityId'), 'Required key "EntityPropertyDetails[entityId]" is missing from JSON.');
        assert(json[r'entityId'] != null, 'Required key "EntityPropertyDetails[entityId]" has a null value in JSON.');
        assert(json.containsKey(r'key'), 'Required key "EntityPropertyDetails[key]" is missing from JSON.');
        assert(json[r'key'] != null, 'Required key "EntityPropertyDetails[key]" has a null value in JSON.');
        assert(json.containsKey(r'value'), 'Required key "EntityPropertyDetails[value]" is missing from JSON.');
        assert(json[r'value'] != null, 'Required key "EntityPropertyDetails[value]" has a null value in JSON.');
        return true;
      }());

      return EntityPropertyDetails(
        entityId: num.parse('${json[r'entityId']}'),
        key: mapValueOfType<String>(json, r'key')!,
        value: mapValueOfType<String>(json, r'value')!,
      );
    }
    return null;
  }

  static List<EntityPropertyDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <EntityPropertyDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = EntityPropertyDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, EntityPropertyDetails> mapFromJson(dynamic json) {
    final map = <String, EntityPropertyDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = EntityPropertyDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of EntityPropertyDetails-objects as value to a dart map
  static Map<String, List<EntityPropertyDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<EntityPropertyDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = EntityPropertyDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'entityId',
    'key',
    'value',
  };
}

