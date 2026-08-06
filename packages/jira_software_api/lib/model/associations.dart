//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Associations {
  /// Returns a new [Associations] instance.
  Associations({
    this.associationType,
    this.values = const [],
  });

  /// the type of the association being made
  AssociationsAssociationTypeEnum? associationType;

  List<String> values;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Associations &&
    other.associationType == associationType &&
    _deepEquality.equals(other.values, values);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (associationType == null ? 0 : associationType!.hashCode) +
    (values.hashCode);

  @override
  String toString() => 'Associations[associationType=$associationType, values=$values]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.associationType != null) {
      json[r'associationType'] = this.associationType;
    } else {
      json[r'associationType'] = null;
    }
      json[r'values'] = this.values;
    return json;
  }

  /// Returns a new [Associations] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Associations? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return Associations(
        associationType: AssociationsAssociationTypeEnum.fromJson(json[r'associationType']),
        values: json[r'values'] is Iterable
            ? (json[r'values'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<Associations> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Associations>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Associations.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Associations> mapFromJson(dynamic json) {
    final map = <String, Associations>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Associations.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Associations-objects as value to a dart map
  static Map<String, List<Associations>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Associations>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Associations.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// the type of the association being made
enum AssociationsAssociationTypeEnum {
  issueIdOrKeys._(r'issueIdOrKeys'),
  serviceIdOrKeys._(r'serviceIdOrKeys'),
  atiColonCloudColonCompassColonEventSource._(r'ati:cloud:compass:event-source'),
  ;

  /// Instantiate a new enum with the provided value.
  const AssociationsAssociationTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [AssociationsAssociationTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static AssociationsAssociationTypeEnum? fromJson(dynamic value) => AssociationsAssociationTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [AssociationsAssociationTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<AssociationsAssociationTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AssociationsAssociationTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AssociationsAssociationTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [AssociationsAssociationTypeEnum] to String,
/// and [decode] dynamic data back to [AssociationsAssociationTypeEnum].
class AssociationsAssociationTypeEnumTypeTransformer {
  factory AssociationsAssociationTypeEnumTypeTransformer() => _instance ??= const AssociationsAssociationTypeEnumTypeTransformer._();

  const AssociationsAssociationTypeEnumTypeTransformer._();

  String encode(AssociationsAssociationTypeEnum data) => data._value;

  /// Returns the instance of [AssociationsAssociationTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  AssociationsAssociationTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is AssociationsAssociationTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'issueIdOrKeys': return AssociationsAssociationTypeEnum.issueIdOrKeys;
        case r'serviceIdOrKeys': return AssociationsAssociationTypeEnum.serviceIdOrKeys;
        case r'ati:cloud:compass:event-source': return AssociationsAssociationTypeEnum.atiColonCloudColonCompassColonEventSource;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static AssociationsAssociationTypeEnumTypeTransformer? _instance;
}


