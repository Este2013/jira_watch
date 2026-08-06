//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Incident {
  /// Returns a new [Incident] instance.
  Incident({
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
  IncidentSchemaVersionEnum schemaVersion;

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
  IncidentStatusEnum status;

  /// The IDs of the Jira issues related to this Incident. Must be unique for a given Provider. 
  List<Associations> associations;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Incident &&
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
  String toString() => 'Incident[schemaVersion=$schemaVersion, id=$id, updateSequenceNumber=$updateSequenceNumber, affectedComponents=$affectedComponents, summary=$summary, description=$description, url=$url, createdDate=$createdDate, lastUpdated=$lastUpdated, severity=$severity, status=$status, associations=$associations]';

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

  /// Returns a new [Incident] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Incident? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'schemaVersion'), 'Required key "Incident[schemaVersion]" is missing from JSON.');
        assert(json[r'schemaVersion'] != null, 'Required key "Incident[schemaVersion]" has a null value in JSON.');
        assert(json.containsKey(r'id'), 'Required key "Incident[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "Incident[id]" has a null value in JSON.');
        assert(json.containsKey(r'updateSequenceNumber'), 'Required key "Incident[updateSequenceNumber]" is missing from JSON.');
        assert(json[r'updateSequenceNumber'] != null, 'Required key "Incident[updateSequenceNumber]" has a null value in JSON.');
        assert(json.containsKey(r'affectedComponents'), 'Required key "Incident[affectedComponents]" is missing from JSON.');
        assert(json[r'affectedComponents'] != null, 'Required key "Incident[affectedComponents]" has a null value in JSON.');
        assert(json.containsKey(r'summary'), 'Required key "Incident[summary]" is missing from JSON.');
        assert(json[r'summary'] != null, 'Required key "Incident[summary]" has a null value in JSON.');
        assert(json.containsKey(r'description'), 'Required key "Incident[description]" is missing from JSON.');
        assert(json[r'description'] != null, 'Required key "Incident[description]" has a null value in JSON.');
        assert(json.containsKey(r'url'), 'Required key "Incident[url]" is missing from JSON.');
        assert(json[r'url'] != null, 'Required key "Incident[url]" has a null value in JSON.');
        assert(json.containsKey(r'createdDate'), 'Required key "Incident[createdDate]" is missing from JSON.');
        assert(json[r'createdDate'] != null, 'Required key "Incident[createdDate]" has a null value in JSON.');
        assert(json.containsKey(r'lastUpdated'), 'Required key "Incident[lastUpdated]" is missing from JSON.');
        assert(json[r'lastUpdated'] != null, 'Required key "Incident[lastUpdated]" has a null value in JSON.');
        assert(json.containsKey(r'status'), 'Required key "Incident[status]" is missing from JSON.');
        assert(json[r'status'] != null, 'Required key "Incident[status]" has a null value in JSON.');
        return true;
      }());

      return Incident(
        schemaVersion: IncidentSchemaVersionEnum.fromJson(json[r'schemaVersion'])!,
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
        status: IncidentStatusEnum.fromJson(json[r'status'])!,
        associations: Associations.listFromJson(json[r'associations']),
      );
    }
    return null;
  }

  static List<Incident> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Incident>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Incident.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Incident> mapFromJson(dynamic json) {
    final map = <String, Incident>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Incident.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Incident-objects as value to a dart map
  static Map<String, List<Incident>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Incident>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Incident.listFromJson(entry.value, growable: growable,);
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
enum IncidentSchemaVersionEnum {
  n1period0._(r'1.0'),
  ;

  /// Instantiate a new enum with the provided value.
  const IncidentSchemaVersionEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [IncidentSchemaVersionEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static IncidentSchemaVersionEnum? fromJson(dynamic value) => IncidentSchemaVersionEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [IncidentSchemaVersionEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<IncidentSchemaVersionEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IncidentSchemaVersionEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IncidentSchemaVersionEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IncidentSchemaVersionEnum] to String,
/// and [decode] dynamic data back to [IncidentSchemaVersionEnum].
class IncidentSchemaVersionEnumTypeTransformer {
  factory IncidentSchemaVersionEnumTypeTransformer() => _instance ??= const IncidentSchemaVersionEnumTypeTransformer._();

  const IncidentSchemaVersionEnumTypeTransformer._();

  String encode(IncidentSchemaVersionEnum data) => data._value;

  /// Returns the instance of [IncidentSchemaVersionEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IncidentSchemaVersionEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is IncidentSchemaVersionEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'1.0': return IncidentSchemaVersionEnum.n1period0;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static IncidentSchemaVersionEnumTypeTransformer? _instance;
}


/// The current status of the Incident. 
enum IncidentStatusEnum {
  open._(r'open'),
  resolved._(r'resolved'),
  unknown._(r'unknown'),
  ;

  /// Instantiate a new enum with the provided value.
  const IncidentStatusEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [IncidentStatusEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static IncidentStatusEnum? fromJson(dynamic value) => IncidentStatusEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [IncidentStatusEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<IncidentStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IncidentStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IncidentStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IncidentStatusEnum] to String,
/// and [decode] dynamic data back to [IncidentStatusEnum].
class IncidentStatusEnumTypeTransformer {
  factory IncidentStatusEnumTypeTransformer() => _instance ??= const IncidentStatusEnumTypeTransformer._();

  const IncidentStatusEnumTypeTransformer._();

  String encode(IncidentStatusEnum data) => data._value;

  /// Returns the instance of [IncidentStatusEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IncidentStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is IncidentStatusEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'open': return IncidentStatusEnum.open;
        case r'resolved': return IncidentStatusEnum.resolved;
        case r'unknown': return IncidentStatusEnum.unknown;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static IncidentStatusEnumTypeTransformer? _instance;
}


