//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class EntityAssociationValuesInner {
  /// Returns a new [EntityAssociationValuesInner] instance.
  EntityAssociationValuesInner({
    required this.commitHash,
    required this.repositoryId,
  });

  /// The hash for the Commit. 
  String commitHash;

  /// 
  String repositoryId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is EntityAssociationValuesInner &&
    other.commitHash == commitHash &&
    other.repositoryId == repositoryId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (commitHash.hashCode) +
    (repositoryId.hashCode);

  @override
  String toString() => 'EntityAssociationValuesInner[commitHash=$commitHash, repositoryId=$repositoryId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'commitHash'] = this.commitHash;
      json[r'repositoryId'] = this.repositoryId;
    return json;
  }

  /// Returns a new [EntityAssociationValuesInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static EntityAssociationValuesInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'commitHash'), 'Required key "EntityAssociationValuesInner[commitHash]" is missing from JSON.');
        assert(json[r'commitHash'] != null, 'Required key "EntityAssociationValuesInner[commitHash]" has a null value in JSON.');
        assert(json.containsKey(r'repositoryId'), 'Required key "EntityAssociationValuesInner[repositoryId]" is missing from JSON.');
        assert(json[r'repositoryId'] != null, 'Required key "EntityAssociationValuesInner[repositoryId]" has a null value in JSON.');
        return true;
      }());

      return EntityAssociationValuesInner(
        commitHash: mapValueOfType<String>(json, r'commitHash')!,
        repositoryId: mapValueOfType<String>(json, r'repositoryId')!,
      );
    }
    return null;
  }

  static List<EntityAssociationValuesInner> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <EntityAssociationValuesInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = EntityAssociationValuesInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, EntityAssociationValuesInner> mapFromJson(dynamic json) {
    final map = <String, EntityAssociationValuesInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = EntityAssociationValuesInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of EntityAssociationValuesInner-objects as value to a dart map
  static Map<String, List<EntityAssociationValuesInner>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<EntityAssociationValuesInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = EntityAssociationValuesInner.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'commitHash',
    'repositoryId',
  };
}

