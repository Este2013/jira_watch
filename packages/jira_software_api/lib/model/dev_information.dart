//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DevInformation {
  /// Returns a new [DevInformation] instance.
  DevInformation({
    this.repositories = const [],
    this.preventTransitions,
    this.operationType,
    this.properties = const {},
    this.providerMetadata,
  });

  /// List of repositories containing development information. Must not contain duplicates. Maximum number of entities across all repositories is 1000.
  List<Repository> repositories;

  /// Flag to prevent automatic issue transitions and smart commits being fired, default is false.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? preventTransitions;

  /// Indicates the operation being performed by the provider system when sending this data. \"NORMAL\" - Data received during normal operation (e.g. a user pushing a branch). \"BACKFILL\" - Data received while backfilling existing data (e.g. indexing a newly connected account). Default is \"NORMAL\". Please note that \"BACKFILL\" operations have a much higher rate-limiting threshold but are also processed slower in comparison to \"NORMAL\" operations.
  DevInformationOperationTypeEnum? operationType;

  /// Arbitrary properties to tag the submitted repositories with. These properties can be used for delete operations to e.g. clean up all development information associated with an account in the event that the account is removed from the provider system. Note that these properties will never be returned with repository or entity data. They are not intended for use as metadata to associate with a repository. Maximum length of each key or value is 255 characters. Maximum allowed number of properties key/value pairs is 5. Properties keys cannot start with '_' character. Properties keys cannot contain ':' character. 
  Map<String, String> properties;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProviderMetadata? providerMetadata;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DevInformation &&
    _deepEquality.equals(other.repositories, repositories) &&
    other.preventTransitions == preventTransitions &&
    other.operationType == operationType &&
    _deepEquality.equals(other.properties, properties) &&
    other.providerMetadata == providerMetadata;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (repositories.hashCode) +
    (preventTransitions == null ? 0 : preventTransitions!.hashCode) +
    (operationType == null ? 0 : operationType!.hashCode) +
    (properties.hashCode) +
    (providerMetadata == null ? 0 : providerMetadata!.hashCode);

  @override
  String toString() => 'DevInformation[repositories=$repositories, preventTransitions=$preventTransitions, operationType=$operationType, properties=$properties, providerMetadata=$providerMetadata]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'repositories'] = this.repositories;
    if (this.preventTransitions != null) {
      json[r'preventTransitions'] = this.preventTransitions;
    } else {
      json[r'preventTransitions'] = null;
    }
    if (this.operationType != null) {
      json[r'operationType'] = this.operationType;
    } else {
      json[r'operationType'] = null;
    }
      json[r'properties'] = this.properties;
    if (this.providerMetadata != null) {
      json[r'providerMetadata'] = this.providerMetadata;
    } else {
      json[r'providerMetadata'] = null;
    }
    return json;
  }

  /// Returns a new [DevInformation] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DevInformation? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'repositories'), 'Required key "DevInformation[repositories]" is missing from JSON.');
        assert(json[r'repositories'] != null, 'Required key "DevInformation[repositories]" has a null value in JSON.');
        return true;
      }());

      return DevInformation(
        repositories: Repository.listFromJson(json[r'repositories']),
        preventTransitions: mapValueOfType<bool>(json, r'preventTransitions'),
        operationType: DevInformationOperationTypeEnum.fromJson(json[r'operationType']),
        properties: mapCastOfType<String, String>(json, r'properties') ?? const {},
        providerMetadata: ProviderMetadata.fromJson(json[r'providerMetadata']),
      );
    }
    return null;
  }

  static List<DevInformation> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DevInformation>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DevInformation.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DevInformation> mapFromJson(dynamic json) {
    final map = <String, DevInformation>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DevInformation.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DevInformation-objects as value to a dart map
  static Map<String, List<DevInformation>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<DevInformation>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DevInformation.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'repositories',
  };
}

/// Indicates the operation being performed by the provider system when sending this data. \"NORMAL\" - Data received during normal operation (e.g. a user pushing a branch). \"BACKFILL\" - Data received while backfilling existing data (e.g. indexing a newly connected account). Default is \"NORMAL\". Please note that \"BACKFILL\" operations have a much higher rate-limiting threshold but are also processed slower in comparison to \"NORMAL\" operations.
enum DevInformationOperationTypeEnum {
  NORMAL._(r'NORMAL'),
  BACKFILL._(r'BACKFILL'),
  ;

  /// Instantiate a new enum with the provided value.
  const DevInformationOperationTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [DevInformationOperationTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static DevInformationOperationTypeEnum? fromJson(dynamic value) => DevInformationOperationTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [DevInformationOperationTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<DevInformationOperationTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DevInformationOperationTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DevInformationOperationTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [DevInformationOperationTypeEnum] to String,
/// and [decode] dynamic data back to [DevInformationOperationTypeEnum].
class DevInformationOperationTypeEnumTypeTransformer {
  factory DevInformationOperationTypeEnumTypeTransformer() => _instance ??= const DevInformationOperationTypeEnumTypeTransformer._();

  const DevInformationOperationTypeEnumTypeTransformer._();

  String encode(DevInformationOperationTypeEnum data) => data._value;

  /// Returns the instance of [DevInformationOperationTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  DevInformationOperationTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is DevInformationOperationTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'NORMAL': return DevInformationOperationTypeEnum.NORMAL;
        case r'BACKFILL': return DevInformationOperationTypeEnum.BACKFILL;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static DevInformationOperationTypeEnumTypeTransformer? _instance;
}


