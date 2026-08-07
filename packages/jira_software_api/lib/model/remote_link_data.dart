//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RemoteLinkData {
  /// Returns a new [RemoteLinkData] instance.
  RemoteLinkData({
    this.schemaVersion,
    required this.id,
    required this.updateSequenceNumber,
    required this.displayName,
    required this.url,
    required this.type,
    this.description,
    required this.lastUpdated,
    this.associations = const [],
    this.status,
    this.actionIds = const [],
    this.attributeMap = const {},
  });

  /// The schema version used for this data.  Placeholder to support potential schema changes in the future. 
  RemoteLinkDataSchemaVersionEnum? schemaVersion;

  /// The identifier for the Remote Link. Must be unique for a given Provider. 
  String id;

  /// An ID used to apply an ordering to updates for this Remote Link in the case of out-of-order receipt of update requests.  It must be a monotonically increasing number. For example, epoch time could be one way to generate the `updateSequenceNumber`.  Updates for a Remote Link that is received with an `updateSqeuenceNumber` less than or equal to what is currently stored will be ignored. 
  int updateSequenceNumber;

  /// The human-readable name for the Remote Link.  Will be shown in the UI. 
  String displayName;

  /// The URL to this Remote Link in your system. 
  String url;

  /// The type of the Remote Link. The current supported types are 'document', 'alert', 'test', 'security', 'logFile', 'prototype', 'coverage', 'bugReport' and 'other' 
  RemoteLinkDataTypeEnum type;

  /// An optional description to attach to this Remote Link.  This may be anything that makes sense in your system. 
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The last-updated timestamp to present to the user as a summary of when Remote Link was last updated. 
  DateTime lastUpdated;

  /// The entities to associate the Remote Link information with. 
  List<RemoteLinkDataAssociationsInner> associations;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  RemoteLinkStatus? status;

  /// Optional list of actionIds. They are associated with the actions the provider is able to provide when they registered. Indicates which actions this Remote Link has.  If any actions have a templateUrl that requires string substitution, then `attributeMap` must be passed in. 
  List<String> actionIds;

  /// Map of key/values (string to string mapping). This is used to build the urls for actions from the templateUrl the provider registered their available actions with. 
  Map<String, String> attributeMap;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RemoteLinkData &&
    other.schemaVersion == schemaVersion &&
    other.id == id &&
    other.updateSequenceNumber == updateSequenceNumber &&
    other.displayName == displayName &&
    other.url == url &&
    other.type == type &&
    other.description == description &&
    other.lastUpdated == lastUpdated &&
    _deepEquality.equals(other.associations, associations) &&
    other.status == status &&
    _deepEquality.equals(other.actionIds, actionIds) &&
    _deepEquality.equals(other.attributeMap, attributeMap);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (schemaVersion == null ? 0 : schemaVersion!.hashCode) +
    (id.hashCode) +
    (updateSequenceNumber.hashCode) +
    (displayName.hashCode) +
    (url.hashCode) +
    (type.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (lastUpdated.hashCode) +
    (associations.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (actionIds.hashCode) +
    (attributeMap.hashCode);

  @override
  String toString() => 'RemoteLinkData[schemaVersion=$schemaVersion, id=$id, updateSequenceNumber=$updateSequenceNumber, displayName=$displayName, url=$url, type=$type, description=$description, lastUpdated=$lastUpdated, associations=$associations, status=$status, actionIds=$actionIds, attributeMap=$attributeMap]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.schemaVersion != null) {
      json[r'schemaVersion'] = this.schemaVersion;
    } else {
      json[r'schemaVersion'] = null;
    }
      json[r'id'] = this.id;
      json[r'updateSequenceNumber'] = this.updateSequenceNumber;
      json[r'displayName'] = this.displayName;
      json[r'url'] = this.url;
      json[r'type'] = this.type;
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
      json[r'lastUpdated'] = this.lastUpdated.toUtc().toIso8601String();
      json[r'associations'] = this.associations;
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
      json[r'actionIds'] = this.actionIds;
      json[r'attributeMap'] = this.attributeMap;
    return json;
  }

  /// Returns a new [RemoteLinkData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RemoteLinkData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "RemoteLinkData[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "RemoteLinkData[id]" has a null value in JSON.');
        assert(json.containsKey(r'updateSequenceNumber'), 'Required key "RemoteLinkData[updateSequenceNumber]" is missing from JSON.');
        assert(json[r'updateSequenceNumber'] != null, 'Required key "RemoteLinkData[updateSequenceNumber]" has a null value in JSON.');
        assert(json.containsKey(r'displayName'), 'Required key "RemoteLinkData[displayName]" is missing from JSON.');
        assert(json[r'displayName'] != null, 'Required key "RemoteLinkData[displayName]" has a null value in JSON.');
        assert(json.containsKey(r'url'), 'Required key "RemoteLinkData[url]" is missing from JSON.');
        assert(json[r'url'] != null, 'Required key "RemoteLinkData[url]" has a null value in JSON.');
        assert(json.containsKey(r'type'), 'Required key "RemoteLinkData[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "RemoteLinkData[type]" has a null value in JSON.');
        assert(json.containsKey(r'lastUpdated'), 'Required key "RemoteLinkData[lastUpdated]" is missing from JSON.');
        assert(json[r'lastUpdated'] != null, 'Required key "RemoteLinkData[lastUpdated]" has a null value in JSON.');
        return true;
      }());

      return RemoteLinkData(
        schemaVersion: RemoteLinkDataSchemaVersionEnum.fromJson(json[r'schemaVersion']),
        id: mapValueOfType<String>(json, r'id')!,
        updateSequenceNumber: mapValueOfType<int>(json, r'updateSequenceNumber')!,
        displayName: mapValueOfType<String>(json, r'displayName')!,
        url: mapValueOfType<String>(json, r'url')!,
        type: RemoteLinkDataTypeEnum.fromJson(json[r'type'])!,
        description: mapValueOfType<String>(json, r'description'),
        lastUpdated: mapDateTime(json, r'lastUpdated', r'')!,
        associations: RemoteLinkDataAssociationsInner.listFromJson(json[r'associations']),
        status: RemoteLinkStatus.fromJson(json[r'status']),
        actionIds: json[r'actionIds'] is Iterable
            ? (json[r'actionIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        attributeMap: mapCastOfType<String, String>(json, r'attributeMap') ?? const {},
      );
    }
    return null;
  }

  static List<RemoteLinkData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RemoteLinkData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RemoteLinkData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RemoteLinkData> mapFromJson(dynamic json) {
    final map = <String, RemoteLinkData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RemoteLinkData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RemoteLinkData-objects as value to a dart map
  static Map<String, List<RemoteLinkData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RemoteLinkData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RemoteLinkData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'updateSequenceNumber',
    'displayName',
    'url',
    'type',
    'lastUpdated',
  };
}

/// The schema version used for this data.  Placeholder to support potential schema changes in the future. 
enum RemoteLinkDataSchemaVersionEnum {
  n1period0._(r'1.0'),
  ;

  /// Instantiate a new enum with the provided value.
  const RemoteLinkDataSchemaVersionEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [RemoteLinkDataSchemaVersionEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static RemoteLinkDataSchemaVersionEnum? fromJson(dynamic value) => RemoteLinkDataSchemaVersionEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [RemoteLinkDataSchemaVersionEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<RemoteLinkDataSchemaVersionEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RemoteLinkDataSchemaVersionEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RemoteLinkDataSchemaVersionEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [RemoteLinkDataSchemaVersionEnum] to String,
/// and [decode] dynamic data back to [RemoteLinkDataSchemaVersionEnum].
class RemoteLinkDataSchemaVersionEnumTypeTransformer {
  factory RemoteLinkDataSchemaVersionEnumTypeTransformer() => _instance ??= const RemoteLinkDataSchemaVersionEnumTypeTransformer._();

  const RemoteLinkDataSchemaVersionEnumTypeTransformer._();

  String encode(RemoteLinkDataSchemaVersionEnum data) => data._value;

  /// Returns the instance of [RemoteLinkDataSchemaVersionEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  RemoteLinkDataSchemaVersionEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is RemoteLinkDataSchemaVersionEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'1.0': return RemoteLinkDataSchemaVersionEnum.n1period0;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static RemoteLinkDataSchemaVersionEnumTypeTransformer? _instance;
}


/// The type of the Remote Link. The current supported types are 'document', 'alert', 'test', 'security', 'logFile', 'prototype', 'coverage', 'bugReport' and 'other' 
enum RemoteLinkDataTypeEnum {
  document._(r'document'),
  alert._(r'alert'),
  test._(r'test'),
  security._(r'security'),
  logFile._(r'logFile'),
  prototype._(r'prototype'),
  coverage._(r'coverage'),
  bugReport._(r'bugReport'),
  other._(r'other'),
  ;

  /// Instantiate a new enum with the provided value.
  const RemoteLinkDataTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [RemoteLinkDataTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static RemoteLinkDataTypeEnum? fromJson(dynamic value) => RemoteLinkDataTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [RemoteLinkDataTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<RemoteLinkDataTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RemoteLinkDataTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RemoteLinkDataTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [RemoteLinkDataTypeEnum] to String,
/// and [decode] dynamic data back to [RemoteLinkDataTypeEnum].
class RemoteLinkDataTypeEnumTypeTransformer {
  factory RemoteLinkDataTypeEnumTypeTransformer() => _instance ??= const RemoteLinkDataTypeEnumTypeTransformer._();

  const RemoteLinkDataTypeEnumTypeTransformer._();

  String encode(RemoteLinkDataTypeEnum data) => data._value;

  /// Returns the instance of [RemoteLinkDataTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  RemoteLinkDataTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is RemoteLinkDataTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'document': return RemoteLinkDataTypeEnum.document;
        case r'alert': return RemoteLinkDataTypeEnum.alert;
        case r'test': return RemoteLinkDataTypeEnum.test;
        case r'security': return RemoteLinkDataTypeEnum.security;
        case r'logFile': return RemoteLinkDataTypeEnum.logFile;
        case r'prototype': return RemoteLinkDataTypeEnum.prototype;
        case r'coverage': return RemoteLinkDataTypeEnum.coverage;
        case r'bugReport': return RemoteLinkDataTypeEnum.bugReport;
        case r'other': return RemoteLinkDataTypeEnum.other;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static RemoteLinkDataTypeEnumTypeTransformer? _instance;
}


