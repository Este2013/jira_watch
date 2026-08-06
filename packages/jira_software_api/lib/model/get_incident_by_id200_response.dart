//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetIncidentById200Response {
  /// Returns a new [GetIncidentById200Response] instance.
  GetIncidentById200Response({
    required this.schemaVersion,
    required this.id,
    required this.updateSequenceNumber,
    this.affectedComponents = const [],
    required this.summary,
    required this.description,
    required this.url,
    required this.createdDate,
    required this.lastUpdated,
    this.severity,
    required this.status,
    this.associations = const [],
  });

  /// The IncidentData schema version used for this incident data.  Placeholder to support potential schema changes in the future. 
  GetIncidentById200ResponseSchemaVersionEnum schemaVersion;

  /// The identifier for the Incident. Must be unique for a given Provider. 
  String id;

  /// An ID used to apply an ordering to updates for this Incident in the case of out-of-order receipt of update requests.  This can be any monotonically increasing number. A suggested implementation is to use epoch millis from the Provider system, but other alternatives are valid (e.g. a Provider could store a counter against each Incident and increment that on each update to Jira).  Updates for a Incident that are received with an updateSqeuenceId lower than what is currently stored will be ignored. 
  int updateSequenceNumber;

  /// The IDs of the Components impacted by this Incident. Must be unique for a given Provider. 
  List<String> affectedComponents;

  /// The human-readable summary for the Incident. Will be shown in the UI.  If not provided, will use the ID for display. 
  String summary;

  /// A description of the issue in Markdown format. Will be shown in the UI and used when creating Jira Issues. 
  String description;

  /// A URL users can use to link to a summary view of this incident, if appropriate.  This could be any location that makes sense in the Provider system (e.g. if the summary information comes from a specific project, it might make sense to link the user to the incident in that project). 
  String url;

  /// The timestamp to present to the user that shows when the Incident was raised.  Expected format is an RFC3339 formatted string. 
  DateTime createdDate;

  /// The last-updated timestamp to present to the user the last time the Incident was updated.  Expected format is an RFC3339 formatted string. 
  DateTime lastUpdated;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IncidentSeverity? severity;

  /// The current status of the Incident. 
  GetIncidentById200ResponseStatusEnum status;

  /// The IDs of the Jira issues related to this Incident. Must be unique for a given Provider. 
  List<Associations> associations;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetIncidentById200Response &&
    other.schemaVersion == schemaVersion &&
    other.id == id &&
    other.updateSequenceNumber == updateSequenceNumber &&
    _deepEquality.equals(other.affectedComponents, affectedComponents) &&
    other.summary == summary &&
    other.description == description &&
    other.url == url &&
    other.createdDate == createdDate &&
    other.lastUpdated == lastUpdated &&
    other.severity == severity &&
    other.status == status &&
    _deepEquality.equals(other.associations, associations);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (schemaVersion.hashCode) +
    (id.hashCode) +
    (updateSequenceNumber.hashCode) +
    (affectedComponents.hashCode) +
    (summary.hashCode) +
    (description.hashCode) +
    (url.hashCode) +
    (createdDate.hashCode) +
    (lastUpdated.hashCode) +
    (severity == null ? 0 : severity!.hashCode) +
    (status.hashCode) +
    (associations.hashCode);

  @override
  String toString() => 'GetIncidentById200Response[schemaVersion=$schemaVersion, id=$id, updateSequenceNumber=$updateSequenceNumber, affectedComponents=$affectedComponents, summary=$summary, description=$description, url=$url, createdDate=$createdDate, lastUpdated=$lastUpdated, severity=$severity, status=$status, associations=$associations]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'schemaVersion'] = this.schemaVersion;
      json[r'id'] = this.id;
      json[r'updateSequenceNumber'] = this.updateSequenceNumber;
      json[r'affectedComponents'] = this.affectedComponents;
      json[r'summary'] = this.summary;
      json[r'description'] = this.description;
      json[r'url'] = this.url;
      json[r'createdDate'] = this.createdDate.toUtc().toIso8601String();
      json[r'lastUpdated'] = this.lastUpdated.toUtc().toIso8601String();
    if (this.severity != null) {
      json[r'severity'] = this.severity;
    } else {
      json[r'severity'] = null;
    }
      json[r'status'] = this.status;
      json[r'associations'] = this.associations;
    return json;
  }

  /// Returns a new [GetIncidentById200Response] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetIncidentById200Response? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'schemaVersion'), 'Required key "GetIncidentById200Response[schemaVersion]" is missing from JSON.');
        assert(json[r'schemaVersion'] != null, 'Required key "GetIncidentById200Response[schemaVersion]" has a null value in JSON.');
        assert(json.containsKey(r'id'), 'Required key "GetIncidentById200Response[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "GetIncidentById200Response[id]" has a null value in JSON.');
        assert(json.containsKey(r'updateSequenceNumber'), 'Required key "GetIncidentById200Response[updateSequenceNumber]" is missing from JSON.');
        assert(json[r'updateSequenceNumber'] != null, 'Required key "GetIncidentById200Response[updateSequenceNumber]" has a null value in JSON.');
        assert(json.containsKey(r'affectedComponents'), 'Required key "GetIncidentById200Response[affectedComponents]" is missing from JSON.');
        assert(json[r'affectedComponents'] != null, 'Required key "GetIncidentById200Response[affectedComponents]" has a null value in JSON.');
        assert(json.containsKey(r'summary'), 'Required key "GetIncidentById200Response[summary]" is missing from JSON.');
        assert(json[r'summary'] != null, 'Required key "GetIncidentById200Response[summary]" has a null value in JSON.');
        assert(json.containsKey(r'description'), 'Required key "GetIncidentById200Response[description]" is missing from JSON.');
        assert(json[r'description'] != null, 'Required key "GetIncidentById200Response[description]" has a null value in JSON.');
        assert(json.containsKey(r'url'), 'Required key "GetIncidentById200Response[url]" is missing from JSON.');
        assert(json[r'url'] != null, 'Required key "GetIncidentById200Response[url]" has a null value in JSON.');
        assert(json.containsKey(r'createdDate'), 'Required key "GetIncidentById200Response[createdDate]" is missing from JSON.');
        assert(json[r'createdDate'] != null, 'Required key "GetIncidentById200Response[createdDate]" has a null value in JSON.');
        assert(json.containsKey(r'lastUpdated'), 'Required key "GetIncidentById200Response[lastUpdated]" is missing from JSON.');
        assert(json[r'lastUpdated'] != null, 'Required key "GetIncidentById200Response[lastUpdated]" has a null value in JSON.');
        assert(json.containsKey(r'status'), 'Required key "GetIncidentById200Response[status]" is missing from JSON.');
        assert(json[r'status'] != null, 'Required key "GetIncidentById200Response[status]" has a null value in JSON.');
        return true;
      }());

      return GetIncidentById200Response(
        schemaVersion: GetIncidentById200ResponseSchemaVersionEnum.fromJson(json[r'schemaVersion'])!,
        id: mapValueOfType<String>(json, r'id')!,
        updateSequenceNumber: mapValueOfType<int>(json, r'updateSequenceNumber')!,
        affectedComponents: json[r'affectedComponents'] is Iterable
            ? (json[r'affectedComponents'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        summary: mapValueOfType<String>(json, r'summary')!,
        description: mapValueOfType<String>(json, r'description')!,
        url: mapValueOfType<String>(json, r'url')!,
        createdDate: mapDateTime(json, r'createdDate', r'')!,
        lastUpdated: mapDateTime(json, r'lastUpdated', r'')!,
        severity: IncidentSeverity.fromJson(json[r'severity']),
        status: GetIncidentById200ResponseStatusEnum.fromJson(json[r'status'])!,
        associations: Associations.listFromJson(json[r'associations']),
      );
    }
    return null;
  }

  static List<GetIncidentById200Response> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetIncidentById200Response>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetIncidentById200Response.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetIncidentById200Response> mapFromJson(dynamic json) {
    final map = <String, GetIncidentById200Response>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetIncidentById200Response.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetIncidentById200Response-objects as value to a dart map
  static Map<String, List<GetIncidentById200Response>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetIncidentById200Response>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetIncidentById200Response.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'schemaVersion',
    'id',
    'updateSequenceNumber',
    'affectedComponents',
    'summary',
    'description',
    'url',
    'createdDate',
    'lastUpdated',
    'status',
  };
}

/// The IncidentData schema version used for this incident data.  Placeholder to support potential schema changes in the future. 
enum GetIncidentById200ResponseSchemaVersionEnum {
  n1period0._(r'1.0'),
  ;

  /// Instantiate a new enum with the provided value.
  const GetIncidentById200ResponseSchemaVersionEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [GetIncidentById200ResponseSchemaVersionEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static GetIncidentById200ResponseSchemaVersionEnum? fromJson(dynamic value) => GetIncidentById200ResponseSchemaVersionEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [GetIncidentById200ResponseSchemaVersionEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<GetIncidentById200ResponseSchemaVersionEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetIncidentById200ResponseSchemaVersionEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetIncidentById200ResponseSchemaVersionEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [GetIncidentById200ResponseSchemaVersionEnum] to String,
/// and [decode] dynamic data back to [GetIncidentById200ResponseSchemaVersionEnum].
class GetIncidentById200ResponseSchemaVersionEnumTypeTransformer {
  factory GetIncidentById200ResponseSchemaVersionEnumTypeTransformer() => _instance ??= const GetIncidentById200ResponseSchemaVersionEnumTypeTransformer._();

  const GetIncidentById200ResponseSchemaVersionEnumTypeTransformer._();

  String encode(GetIncidentById200ResponseSchemaVersionEnum data) => data._value;

  /// Returns the instance of [GetIncidentById200ResponseSchemaVersionEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  GetIncidentById200ResponseSchemaVersionEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is GetIncidentById200ResponseSchemaVersionEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'1.0': return GetIncidentById200ResponseSchemaVersionEnum.n1period0;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static GetIncidentById200ResponseSchemaVersionEnumTypeTransformer? _instance;
}


/// The current status of the Incident. 
enum GetIncidentById200ResponseStatusEnum {
  open._(r'open'),
  resolved._(r'resolved'),
  unknown._(r'unknown'),
  ;

  /// Instantiate a new enum with the provided value.
  const GetIncidentById200ResponseStatusEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [GetIncidentById200ResponseStatusEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static GetIncidentById200ResponseStatusEnum? fromJson(dynamic value) => GetIncidentById200ResponseStatusEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [GetIncidentById200ResponseStatusEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<GetIncidentById200ResponseStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetIncidentById200ResponseStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetIncidentById200ResponseStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [GetIncidentById200ResponseStatusEnum] to String,
/// and [decode] dynamic data back to [GetIncidentById200ResponseStatusEnum].
class GetIncidentById200ResponseStatusEnumTypeTransformer {
  factory GetIncidentById200ResponseStatusEnumTypeTransformer() => _instance ??= const GetIncidentById200ResponseStatusEnumTypeTransformer._();

  const GetIncidentById200ResponseStatusEnumTypeTransformer._();

  String encode(GetIncidentById200ResponseStatusEnum data) => data._value;

  /// Returns the instance of [GetIncidentById200ResponseStatusEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  GetIncidentById200ResponseStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is GetIncidentById200ResponseStatusEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'open': return GetIncidentById200ResponseStatusEnum.open;
        case r'resolved': return GetIncidentById200ResponseStatusEnum.resolved;
        case r'unknown': return GetIncidentById200ResponseStatusEnum.unknown;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static GetIncidentById200ResponseStatusEnumTypeTransformer? _instance;
}


