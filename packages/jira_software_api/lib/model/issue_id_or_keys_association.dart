//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueIdOrKeysAssociation {
  /// Returns a new [IssueIdOrKeysAssociation] instance.
  IssueIdOrKeysAssociation({
    required this.associationType,
    this.values = const [],
  });

  /// Defines the association type. 
  IssueIdOrKeysAssociationAssociationTypeEnum associationType;

  /// The Jira issue keys or IDs to associate the entity with.  The number of values counted across all associationTypes must not exceed a limit of 500. 
  List<String> values;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueIdOrKeysAssociation &&
    other.associationType == associationType &&
    _deepEquality.equals(other.values, values);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (associationType.hashCode) +
    (values.hashCode);

  @override
  String toString() => 'IssueIdOrKeysAssociation[associationType=$associationType, values=$values]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'associationType'] = this.associationType;
      json[r'values'] = this.values;
    return json;
  }

  /// Returns a new [IssueIdOrKeysAssociation] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueIdOrKeysAssociation? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'associationType'), 'Required key "IssueIdOrKeysAssociation[associationType]" is missing from JSON.');
        assert(json[r'associationType'] != null, 'Required key "IssueIdOrKeysAssociation[associationType]" has a null value in JSON.');
        assert(json.containsKey(r'values'), 'Required key "IssueIdOrKeysAssociation[values]" is missing from JSON.');
        assert(json[r'values'] != null, 'Required key "IssueIdOrKeysAssociation[values]" has a null value in JSON.');
        return true;
      }());

      return IssueIdOrKeysAssociation(
        associationType: IssueIdOrKeysAssociationAssociationTypeEnum.fromJson(json[r'associationType'])!,
        values: json[r'values'] is Iterable
            ? (json[r'values'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<IssueIdOrKeysAssociation> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueIdOrKeysAssociation>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueIdOrKeysAssociation.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueIdOrKeysAssociation> mapFromJson(dynamic json) {
    final map = <String, IssueIdOrKeysAssociation>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueIdOrKeysAssociation.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueIdOrKeysAssociation-objects as value to a dart map
  static Map<String, List<IssueIdOrKeysAssociation>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueIdOrKeysAssociation>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueIdOrKeysAssociation.listFromJson(entry.value, growable: growable,);
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
enum IssueIdOrKeysAssociationAssociationTypeEnum {
  issueKeys._(r'issueKeys'),
  issueIdOrKeys._(r'issueIdOrKeys'),
  ;

  /// Instantiate a new enum with the provided value.
  const IssueIdOrKeysAssociationAssociationTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [IssueIdOrKeysAssociationAssociationTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static IssueIdOrKeysAssociationAssociationTypeEnum? fromJson(dynamic value) => IssueIdOrKeysAssociationAssociationTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [IssueIdOrKeysAssociationAssociationTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<IssueIdOrKeysAssociationAssociationTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueIdOrKeysAssociationAssociationTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueIdOrKeysAssociationAssociationTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IssueIdOrKeysAssociationAssociationTypeEnum] to String,
/// and [decode] dynamic data back to [IssueIdOrKeysAssociationAssociationTypeEnum].
class IssueIdOrKeysAssociationAssociationTypeEnumTypeTransformer {
  factory IssueIdOrKeysAssociationAssociationTypeEnumTypeTransformer() => _instance ??= const IssueIdOrKeysAssociationAssociationTypeEnumTypeTransformer._();

  const IssueIdOrKeysAssociationAssociationTypeEnumTypeTransformer._();

  String encode(IssueIdOrKeysAssociationAssociationTypeEnum data) => data._value;

  /// Returns the instance of [IssueIdOrKeysAssociationAssociationTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IssueIdOrKeysAssociationAssociationTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is IssueIdOrKeysAssociationAssociationTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'issueKeys': return IssueIdOrKeysAssociationAssociationTypeEnum.issueKeys;
        case r'issueIdOrKeys': return IssueIdOrKeysAssociationAssociationTypeEnum.issueIdOrKeys;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static IssueIdOrKeysAssociationAssociationTypeEnumTypeTransformer? _instance;
}


