//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetComponentById200Response {
  /// Returns a new [GetComponentById200Response] instance.
  GetComponentById200Response({
    required this.schemaVersion,
    required this.id,
    required this.updateSequenceNumber,
    required this.name,
    this.providerName,
    required this.description,
    required this.url,
    required this.avatarUrl,
    required this.tier,
    required this.componentType,
    required this.lastUpdated,
  });

  /// The DevOpsComponentData schema version used for this devops component data.  Placeholder to support potential schema changes in the future. 
  GetComponentById200ResponseSchemaVersionEnum schemaVersion;

  /// The identifier for the DevOps Component. Must be unique for a given Provider. 
  String id;

  /// An ID used to apply an ordering to updates for this DevOps Component in the case of out-of-order receipt of update requests.  This can be any monotonically increasing number. A suggested implementation is to use epoch millis from the Provider system, but other alternatives are valid (e.g. a Provider could store a counter against each DevOps Component and increment that on each update to Jira).  Updates for a DevOps Component that are received with an updateSqeuenceId lower than what is currently stored will be ignored. 
  int updateSequenceNumber;

  /// The human-readable name for the DevOps Component. Will be shown in the UI. 
  String name;

  /// The human-readable name for the Provider that owns this DevOps Component. Will be shown in the UI. 
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? providerName;

  /// A description of the DevOps Component in Markdown format. Will be shown in the UI. 
  String description;

  /// A URL users can use to link to a summary view of this devops component, if appropriate.  This could be any location that makes sense in the Provider system (e.g. if the summary information comes from a specific project, it might make sense to link the user to the component in that project). 
  String url;

  /// A URL to display a logo representing this devops component, if available. 
  String avatarUrl;

  /// The tier of the component. Will be shown in the UI. 
  GetComponentById200ResponseTierEnum tier;

  /// The type of the component. Will be shown in the UI. 
  GetComponentById200ResponseComponentTypeEnum componentType;

  /// The last-updated timestamp to present to the user the last time the DevOps Component was updated.  Expected format is an RFC3339 formatted string. 
  DateTime lastUpdated;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetComponentById200Response &&
    other.schemaVersion == schemaVersion &&
    other.id == id &&
    other.updateSequenceNumber == updateSequenceNumber &&
    other.name == name &&
    other.providerName == providerName &&
    other.description == description &&
    other.url == url &&
    other.avatarUrl == avatarUrl &&
    other.tier == tier &&
    other.componentType == componentType &&
    other.lastUpdated == lastUpdated;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (schemaVersion.hashCode) +
    (id.hashCode) +
    (updateSequenceNumber.hashCode) +
    (name.hashCode) +
    (providerName == null ? 0 : providerName!.hashCode) +
    (description.hashCode) +
    (url.hashCode) +
    (avatarUrl.hashCode) +
    (tier.hashCode) +
    (componentType.hashCode) +
    (lastUpdated.hashCode);

  @override
  String toString() => 'GetComponentById200Response[schemaVersion=$schemaVersion, id=$id, updateSequenceNumber=$updateSequenceNumber, name=$name, providerName=$providerName, description=$description, url=$url, avatarUrl=$avatarUrl, tier=$tier, componentType=$componentType, lastUpdated=$lastUpdated]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'schemaVersion'] = this.schemaVersion;
      json[r'id'] = this.id;
      json[r'updateSequenceNumber'] = this.updateSequenceNumber;
      json[r'name'] = this.name;
    if (this.providerName != null) {
      json[r'providerName'] = this.providerName;
    } else {
      json[r'providerName'] = null;
    }
      json[r'description'] = this.description;
      json[r'url'] = this.url;
      json[r'avatarUrl'] = this.avatarUrl;
      json[r'tier'] = this.tier;
      json[r'componentType'] = this.componentType;
      json[r'lastUpdated'] = this.lastUpdated.toUtc().toIso8601String();
    return json;
  }

  /// Returns a new [GetComponentById200Response] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetComponentById200Response? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'schemaVersion'), 'Required key "GetComponentById200Response[schemaVersion]" is missing from JSON.');
        assert(json[r'schemaVersion'] != null, 'Required key "GetComponentById200Response[schemaVersion]" has a null value in JSON.');
        assert(json.containsKey(r'id'), 'Required key "GetComponentById200Response[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "GetComponentById200Response[id]" has a null value in JSON.');
        assert(json.containsKey(r'updateSequenceNumber'), 'Required key "GetComponentById200Response[updateSequenceNumber]" is missing from JSON.');
        assert(json[r'updateSequenceNumber'] != null, 'Required key "GetComponentById200Response[updateSequenceNumber]" has a null value in JSON.');
        assert(json.containsKey(r'name'), 'Required key "GetComponentById200Response[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "GetComponentById200Response[name]" has a null value in JSON.');
        assert(json.containsKey(r'description'), 'Required key "GetComponentById200Response[description]" is missing from JSON.');
        assert(json[r'description'] != null, 'Required key "GetComponentById200Response[description]" has a null value in JSON.');
        assert(json.containsKey(r'url'), 'Required key "GetComponentById200Response[url]" is missing from JSON.');
        assert(json[r'url'] != null, 'Required key "GetComponentById200Response[url]" has a null value in JSON.');
        assert(json.containsKey(r'avatarUrl'), 'Required key "GetComponentById200Response[avatarUrl]" is missing from JSON.');
        assert(json[r'avatarUrl'] != null, 'Required key "GetComponentById200Response[avatarUrl]" has a null value in JSON.');
        assert(json.containsKey(r'tier'), 'Required key "GetComponentById200Response[tier]" is missing from JSON.');
        assert(json[r'tier'] != null, 'Required key "GetComponentById200Response[tier]" has a null value in JSON.');
        assert(json.containsKey(r'componentType'), 'Required key "GetComponentById200Response[componentType]" is missing from JSON.');
        assert(json[r'componentType'] != null, 'Required key "GetComponentById200Response[componentType]" has a null value in JSON.');
        assert(json.containsKey(r'lastUpdated'), 'Required key "GetComponentById200Response[lastUpdated]" is missing from JSON.');
        assert(json[r'lastUpdated'] != null, 'Required key "GetComponentById200Response[lastUpdated]" has a null value in JSON.');
        return true;
      }());

      return GetComponentById200Response(
        schemaVersion: GetComponentById200ResponseSchemaVersionEnum.fromJson(json[r'schemaVersion'])!,
        id: mapValueOfType<String>(json, r'id')!,
        updateSequenceNumber: mapValueOfType<int>(json, r'updateSequenceNumber')!,
        name: mapValueOfType<String>(json, r'name')!,
        providerName: mapValueOfType<String>(json, r'providerName'),
        description: mapValueOfType<String>(json, r'description')!,
        url: mapValueOfType<String>(json, r'url')!,
        avatarUrl: mapValueOfType<String>(json, r'avatarUrl')!,
        tier: GetComponentById200ResponseTierEnum.fromJson(json[r'tier'])!,
        componentType: GetComponentById200ResponseComponentTypeEnum.fromJson(json[r'componentType'])!,
        lastUpdated: mapDateTime(json, r'lastUpdated', r'')!,
      );
    }
    return null;
  }

  static List<GetComponentById200Response> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetComponentById200Response>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetComponentById200Response.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetComponentById200Response> mapFromJson(dynamic json) {
    final map = <String, GetComponentById200Response>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetComponentById200Response.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetComponentById200Response-objects as value to a dart map
  static Map<String, List<GetComponentById200Response>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetComponentById200Response>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetComponentById200Response.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'schemaVersion',
    'id',
    'updateSequenceNumber',
    'name',
    'description',
    'url',
    'avatarUrl',
    'tier',
    'componentType',
    'lastUpdated',
  };
}

/// The DevOpsComponentData schema version used for this devops component data.  Placeholder to support potential schema changes in the future. 
enum GetComponentById200ResponseSchemaVersionEnum {
  n1period0._(r'1.0'),
  ;

  /// Instantiate a new enum with the provided value.
  const GetComponentById200ResponseSchemaVersionEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [GetComponentById200ResponseSchemaVersionEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static GetComponentById200ResponseSchemaVersionEnum? fromJson(dynamic value) => GetComponentById200ResponseSchemaVersionEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [GetComponentById200ResponseSchemaVersionEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<GetComponentById200ResponseSchemaVersionEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetComponentById200ResponseSchemaVersionEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetComponentById200ResponseSchemaVersionEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [GetComponentById200ResponseSchemaVersionEnum] to String,
/// and [decode] dynamic data back to [GetComponentById200ResponseSchemaVersionEnum].
class GetComponentById200ResponseSchemaVersionEnumTypeTransformer {
  factory GetComponentById200ResponseSchemaVersionEnumTypeTransformer() => _instance ??= const GetComponentById200ResponseSchemaVersionEnumTypeTransformer._();

  const GetComponentById200ResponseSchemaVersionEnumTypeTransformer._();

  String encode(GetComponentById200ResponseSchemaVersionEnum data) => data._value;

  /// Returns the instance of [GetComponentById200ResponseSchemaVersionEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  GetComponentById200ResponseSchemaVersionEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is GetComponentById200ResponseSchemaVersionEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'1.0': return GetComponentById200ResponseSchemaVersionEnum.n1period0;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static GetComponentById200ResponseSchemaVersionEnumTypeTransformer? _instance;
}


/// The tier of the component. Will be shown in the UI. 
enum GetComponentById200ResponseTierEnum {
  tier1._(r'Tier 1'),
  tier2._(r'Tier 2'),
  tier3._(r'Tier 3'),
  tier4._(r'Tier 4'),
  ;

  /// Instantiate a new enum with the provided value.
  const GetComponentById200ResponseTierEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [GetComponentById200ResponseTierEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static GetComponentById200ResponseTierEnum? fromJson(dynamic value) => GetComponentById200ResponseTierEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [GetComponentById200ResponseTierEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<GetComponentById200ResponseTierEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetComponentById200ResponseTierEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetComponentById200ResponseTierEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [GetComponentById200ResponseTierEnum] to String,
/// and [decode] dynamic data back to [GetComponentById200ResponseTierEnum].
class GetComponentById200ResponseTierEnumTypeTransformer {
  factory GetComponentById200ResponseTierEnumTypeTransformer() => _instance ??= const GetComponentById200ResponseTierEnumTypeTransformer._();

  const GetComponentById200ResponseTierEnumTypeTransformer._();

  String encode(GetComponentById200ResponseTierEnum data) => data._value;

  /// Returns the instance of [GetComponentById200ResponseTierEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  GetComponentById200ResponseTierEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is GetComponentById200ResponseTierEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'Tier 1': return GetComponentById200ResponseTierEnum.tier1;
        case r'Tier 2': return GetComponentById200ResponseTierEnum.tier2;
        case r'Tier 3': return GetComponentById200ResponseTierEnum.tier3;
        case r'Tier 4': return GetComponentById200ResponseTierEnum.tier4;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static GetComponentById200ResponseTierEnumTypeTransformer? _instance;
}


/// The type of the component. Will be shown in the UI. 
enum GetComponentById200ResponseComponentTypeEnum {
  service._(r'Service'),
  application._(r'Application'),
  library_._(r'Library'),
  capability._(r'Capability'),
  cloudResource._(r'Cloud resource'),
  dataPipeline._(r'Data pipeline'),
  machineLearningModel._(r'Machine learning model'),
  uIElement._(r'UI element'),
  website._(r'Website'),
  other._(r'Other'),
  ;

  /// Instantiate a new enum with the provided value.
  const GetComponentById200ResponseComponentTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [GetComponentById200ResponseComponentTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static GetComponentById200ResponseComponentTypeEnum? fromJson(dynamic value) => GetComponentById200ResponseComponentTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [GetComponentById200ResponseComponentTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<GetComponentById200ResponseComponentTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetComponentById200ResponseComponentTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetComponentById200ResponseComponentTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [GetComponentById200ResponseComponentTypeEnum] to String,
/// and [decode] dynamic data back to [GetComponentById200ResponseComponentTypeEnum].
class GetComponentById200ResponseComponentTypeEnumTypeTransformer {
  factory GetComponentById200ResponseComponentTypeEnumTypeTransformer() => _instance ??= const GetComponentById200ResponseComponentTypeEnumTypeTransformer._();

  const GetComponentById200ResponseComponentTypeEnumTypeTransformer._();

  String encode(GetComponentById200ResponseComponentTypeEnum data) => data._value;

  /// Returns the instance of [GetComponentById200ResponseComponentTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  GetComponentById200ResponseComponentTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is GetComponentById200ResponseComponentTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'Service': return GetComponentById200ResponseComponentTypeEnum.service;
        case r'Application': return GetComponentById200ResponseComponentTypeEnum.application;
        case r'Library': return GetComponentById200ResponseComponentTypeEnum.library_;
        case r'Capability': return GetComponentById200ResponseComponentTypeEnum.capability;
        case r'Cloud resource': return GetComponentById200ResponseComponentTypeEnum.cloudResource;
        case r'Data pipeline': return GetComponentById200ResponseComponentTypeEnum.dataPipeline;
        case r'Machine learning model': return GetComponentById200ResponseComponentTypeEnum.machineLearningModel;
        case r'UI element': return GetComponentById200ResponseComponentTypeEnum.uIElement;
        case r'Website': return GetComponentById200ResponseComponentTypeEnum.website;
        case r'Other': return GetComponentById200ResponseComponentTypeEnum.other;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static GetComponentById200ResponseComponentTypeEnumTypeTransformer? _instance;
}


