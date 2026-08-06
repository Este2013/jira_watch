//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class EntityAssociation {
  /// Returns a new [EntityAssociation] instance.
  EntityAssociation({
    required this.associationType,
    this.values = const [],
  });

  /// Defines the association type. Currently supported entities can be found in this field's value enums list. 
  EntityAssociationAssociationTypeEnum associationType;

  /// The entity keys that represent the entities to be associated. The number of values counted across all associationTypes must not exceed a limit of 500. 
  List<EntityAssociationValuesInner> values;

  @override
  bool operator ==(Object other) => identical(this, other) || other is EntityAssociation &&
    other.associationType == associationType &&
    _deepEquality.equals(other.values, values);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (associationType.hashCode) +
    (values.hashCode);

  @override
  String toString() => 'EntityAssociation[associationType=$associationType, values=$values]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'associationType'] = this.associationType;
      json[r'values'] = this.values;
    return json;
  }

  /// Returns a new [EntityAssociation] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static EntityAssociation? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'associationType'), 'Required key "EntityAssociation[associationType]" is missing from JSON.');
        assert(json[r'associationType'] != null, 'Required key "EntityAssociation[associationType]" has a null value in JSON.');
        assert(json.containsKey(r'values'), 'Required key "EntityAssociation[values]" is missing from JSON.');
        assert(json[r'values'] != null, 'Required key "EntityAssociation[values]" has a null value in JSON.');
        return true;
      }());

      return EntityAssociation(
        associationType: EntityAssociationAssociationTypeEnum.fromJson(json[r'associationType'])!,
        values: EntityAssociationValuesInner.listFromJson(json[r'values']),
      );
    }
    return null;
  }

  static List<EntityAssociation> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <EntityAssociation>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = EntityAssociation.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, EntityAssociation> mapFromJson(dynamic json) {
    final map = <String, EntityAssociation>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = EntityAssociation.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of EntityAssociation-objects as value to a dart map
  static Map<String, List<EntityAssociation>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<EntityAssociation>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = EntityAssociation.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'associationType',
    'values',
  };
}

/// Defines the association type. Currently supported entities can be found in this field's value enums list. 
enum EntityAssociationAssociationTypeEnum {
  commit._(r'commit'),
  repository._(r'repository'),
  ;

  /// Instantiate a new enum with the provided value.
  const EntityAssociationAssociationTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [EntityAssociationAssociationTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static EntityAssociationAssociationTypeEnum? fromJson(dynamic value) => EntityAssociationAssociationTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [EntityAssociationAssociationTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<EntityAssociationAssociationTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <EntityAssociationAssociationTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = EntityAssociationAssociationTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [EntityAssociationAssociationTypeEnum] to String,
/// and [decode] dynamic data back to [EntityAssociationAssociationTypeEnum].
class EntityAssociationAssociationTypeEnumTypeTransformer {
  factory EntityAssociationAssociationTypeEnumTypeTransformer() => _instance ??= const EntityAssociationAssociationTypeEnumTypeTransformer._();

  const EntityAssociationAssociationTypeEnumTypeTransformer._();

  String encode(EntityAssociationAssociationTypeEnum data) => data._value;

  /// Returns the instance of [EntityAssociationAssociationTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  EntityAssociationAssociationTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is EntityAssociationAssociationTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'commit': return EntityAssociationAssociationTypeEnum.commit;
        case r'repository': return EntityAssociationAssociationTypeEnum.repository;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static EntityAssociationAssociationTypeEnumTypeTransformer? _instance;
}


