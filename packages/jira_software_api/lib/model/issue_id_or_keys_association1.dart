//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueIdOrKeysAssociation1 {
  /// Returns a new [IssueIdOrKeysAssociation1] instance.
  IssueIdOrKeysAssociation1({
    required this.associationType,
    this.values = const [],
  });

  /// Defines the association type. 
  IssueIdOrKeysAssociation1AssociationTypeEnum associationType;

  /// The Jira issue id or keys to associate the Security information with.  The number of values counted across all associationTypes (issueIdOrKeys) must not exceed a limit of 500. 
  List<String> values;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueIdOrKeysAssociation1 &&
    other.associationType == associationType &&
    _deepEquality.equals(other.values, values);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (associationType.hashCode) +
    (values.hashCode);

  @override
  String toString() => 'IssueIdOrKeysAssociation1[associationType=$associationType, values=$values]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'associationType'] = this.associationType;
      json[r'values'] = this.values;
    return json;
  }

  /// Returns a new [IssueIdOrKeysAssociation1] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueIdOrKeysAssociation1? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'associationType'), 'Required key "IssueIdOrKeysAssociation1[associationType]" is missing from JSON.');
        assert(json[r'associationType'] != null, 'Required key "IssueIdOrKeysAssociation1[associationType]" has a null value in JSON.');
        assert(json.containsKey(r'values'), 'Required key "IssueIdOrKeysAssociation1[values]" is missing from JSON.');
        assert(json[r'values'] != null, 'Required key "IssueIdOrKeysAssociation1[values]" has a null value in JSON.');
        return true;
      }());

      return IssueIdOrKeysAssociation1(
        associationType: IssueIdOrKeysAssociation1AssociationTypeEnum.fromJson(json[r'associationType'])!,
        values: json[r'values'] is Iterable
            ? (json[r'values'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<IssueIdOrKeysAssociation1> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueIdOrKeysAssociation1>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueIdOrKeysAssociation1.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueIdOrKeysAssociation1> mapFromJson(dynamic json) {
    final map = <String, IssueIdOrKeysAssociation1>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueIdOrKeysAssociation1.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueIdOrKeysAssociation1-objects as value to a dart map
  static Map<String, List<IssueIdOrKeysAssociation1>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueIdOrKeysAssociation1>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueIdOrKeysAssociation1.listFromJson(entry.value, growable: growable,);
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
enum IssueIdOrKeysAssociation1AssociationTypeEnum {
  issueIdOrKeys._(r'issueIdOrKeys'),
  ;

  /// Instantiate a new enum with the provided value.
  const IssueIdOrKeysAssociation1AssociationTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [IssueIdOrKeysAssociation1AssociationTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static IssueIdOrKeysAssociation1AssociationTypeEnum? fromJson(dynamic value) => IssueIdOrKeysAssociation1AssociationTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [IssueIdOrKeysAssociation1AssociationTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<IssueIdOrKeysAssociation1AssociationTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueIdOrKeysAssociation1AssociationTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueIdOrKeysAssociation1AssociationTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IssueIdOrKeysAssociation1AssociationTypeEnum] to String,
/// and [decode] dynamic data back to [IssueIdOrKeysAssociation1AssociationTypeEnum].
class IssueIdOrKeysAssociation1AssociationTypeEnumTypeTransformer {
  factory IssueIdOrKeysAssociation1AssociationTypeEnumTypeTransformer() => _instance ??= const IssueIdOrKeysAssociation1AssociationTypeEnumTypeTransformer._();

  const IssueIdOrKeysAssociation1AssociationTypeEnumTypeTransformer._();

  String encode(IssueIdOrKeysAssociation1AssociationTypeEnum data) => data._value;

  /// Returns the instance of [IssueIdOrKeysAssociation1AssociationTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IssueIdOrKeysAssociation1AssociationTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is IssueIdOrKeysAssociation1AssociationTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'issueIdOrKeys': return IssueIdOrKeysAssociation1AssociationTypeEnum.issueIdOrKeys;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static IssueIdOrKeysAssociation1AssociationTypeEnumTypeTransformer? _instance;
}


