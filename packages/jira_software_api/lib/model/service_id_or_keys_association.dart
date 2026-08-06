//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ServiceIdOrKeysAssociation {
  /// Returns a new [ServiceIdOrKeysAssociation] instance.
  ServiceIdOrKeysAssociation({
    required this.associationType,
    this.values = const [],
  });

  /// Defines the association type. 
  ServiceIdOrKeysAssociationAssociationTypeEnum associationType;

  /// The service ID or keys to associate the entity with.  The number of values counted across all associationTypes must not exceed a limit of 500. 
  List<String> values;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ServiceIdOrKeysAssociation &&
    other.associationType == associationType &&
    _deepEquality.equals(other.values, values);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (associationType.hashCode) +
    (values.hashCode);

  @override
  String toString() => 'ServiceIdOrKeysAssociation[associationType=$associationType, values=$values]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'associationType'] = this.associationType;
      json[r'values'] = this.values;
    return json;
  }

  /// Returns a new [ServiceIdOrKeysAssociation] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ServiceIdOrKeysAssociation? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'associationType'), 'Required key "ServiceIdOrKeysAssociation[associationType]" is missing from JSON.');
        assert(json[r'associationType'] != null, 'Required key "ServiceIdOrKeysAssociation[associationType]" has a null value in JSON.');
        assert(json.containsKey(r'values'), 'Required key "ServiceIdOrKeysAssociation[values]" is missing from JSON.');
        assert(json[r'values'] != null, 'Required key "ServiceIdOrKeysAssociation[values]" has a null value in JSON.');
        return true;
      }());

      return ServiceIdOrKeysAssociation(
        associationType: ServiceIdOrKeysAssociationAssociationTypeEnum.fromJson(json[r'associationType'])!,
        values: json[r'values'] is Iterable
            ? (json[r'values'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<ServiceIdOrKeysAssociation> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ServiceIdOrKeysAssociation>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ServiceIdOrKeysAssociation.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ServiceIdOrKeysAssociation> mapFromJson(dynamic json) {
    final map = <String, ServiceIdOrKeysAssociation>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ServiceIdOrKeysAssociation.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ServiceIdOrKeysAssociation-objects as value to a dart map
  static Map<String, List<ServiceIdOrKeysAssociation>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ServiceIdOrKeysAssociation>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ServiceIdOrKeysAssociation.listFromJson(entry.value, growable: growable,);
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

/// Defines the association type. 
enum ServiceIdOrKeysAssociationAssociationTypeEnum {
  serviceIdOrKeys._(r'serviceIdOrKeys'),
  ;

  /// Instantiate a new enum with the provided value.
  const ServiceIdOrKeysAssociationAssociationTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ServiceIdOrKeysAssociationAssociationTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ServiceIdOrKeysAssociationAssociationTypeEnum? fromJson(dynamic value) => ServiceIdOrKeysAssociationAssociationTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ServiceIdOrKeysAssociationAssociationTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ServiceIdOrKeysAssociationAssociationTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ServiceIdOrKeysAssociationAssociationTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ServiceIdOrKeysAssociationAssociationTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ServiceIdOrKeysAssociationAssociationTypeEnum] to String,
/// and [decode] dynamic data back to [ServiceIdOrKeysAssociationAssociationTypeEnum].
class ServiceIdOrKeysAssociationAssociationTypeEnumTypeTransformer {
  factory ServiceIdOrKeysAssociationAssociationTypeEnumTypeTransformer() => _instance ??= const ServiceIdOrKeysAssociationAssociationTypeEnumTypeTransformer._();

  const ServiceIdOrKeysAssociationAssociationTypeEnumTypeTransformer._();

  String encode(ServiceIdOrKeysAssociationAssociationTypeEnum data) => data._value;

  /// Returns the instance of [ServiceIdOrKeysAssociationAssociationTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ServiceIdOrKeysAssociationAssociationTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is ServiceIdOrKeysAssociationAssociationTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'serviceIdOrKeys': return ServiceIdOrKeysAssociationAssociationTypeEnum.serviceIdOrKeys;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ServiceIdOrKeysAssociationAssociationTypeEnumTypeTransformer? _instance;
}


