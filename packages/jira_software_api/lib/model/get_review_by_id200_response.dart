//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetReviewById200Response {
  /// Returns a new [GetReviewById200Response] instance.
  GetReviewById200Response({
    required this.schemaVersion,
    required this.id,
    required this.updateSequenceNumber,
    this.reviews = const [],
    required this.summary,
    required this.description,
    required this.url,
    required this.createdDate,
    required this.lastUpdated,
    required this.status,
    this.associations = const [],
  });

  /// The PostIncidentReviewData schema version used for this post-incident review data.  Placeholder to support potential schema changes in the future. 
  GetReviewById200ResponseSchemaVersionEnum schemaVersion;

  /// The identifier for the Review. Must be unique for a given Provider. 
  String id;

  /// An ID used to apply an ordering to updates for this Review in the case of out-of-order receipt of update requests.  This can be any monotonically increasing number. A suggested implementation is to use epoch millis from the Provider system, but other alternatives are valid (e.g. a Provider could store a counter against each Review and increment that on each update to Jira).  Updates for a Review that are received with an updateSqeuenceId lower than what is currently stored will be ignored. 
  int updateSequenceNumber;

  /// The IDs of the Incidents covered by this Review. Must be unique for a given Provider. 
  List<String> reviews;

  /// The human-readable summary for the Post-Incident Review. Will be shown in the UI.  If not provided, will use the ID for display. 
  String summary;

  /// A description of the review in Markdown format. Will be shown in the UI and used when creating Jira Issues. 
  String description;

  /// A URL users can use to link to a summary view of this review, if appropriate.  This could be any location that makes sense in the Provider system (e.g. if the summary information comes from a specific project, it might make sense to link the user to the review in that project). 
  String url;

  /// The timestamp to present to the user that shows when the Review was raised.  Expected format is an RFC3339 formatted string. 
  DateTime createdDate;

  /// The last-updated timestamp to present to the user the last time the Review was updated.  Expected format is an RFC3339 formatted string. 
  DateTime lastUpdated;

  /// The current status of the Post-Incident Review. 
  GetReviewById200ResponseStatusEnum status;

  /// The IDs of the Jira issues related to this Incident. Must be unique for a given Provider. 
  List<Associations> associations;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetReviewById200Response &&
    other.schemaVersion == schemaVersion &&
    other.id == id &&
    other.updateSequenceNumber == updateSequenceNumber &&
    _deepEquality.equals(other.reviews, reviews) &&
    other.summary == summary &&
    other.description == description &&
    other.url == url &&
    other.createdDate == createdDate &&
    other.lastUpdated == lastUpdated &&
    other.status == status &&
    _deepEquality.equals(other.associations, associations);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (schemaVersion.hashCode) +
    (id.hashCode) +
    (updateSequenceNumber.hashCode) +
    (reviews.hashCode) +
    (summary.hashCode) +
    (description.hashCode) +
    (url.hashCode) +
    (createdDate.hashCode) +
    (lastUpdated.hashCode) +
    (status.hashCode) +
    (associations.hashCode);

  @override
  String toString() => 'GetReviewById200Response[schemaVersion=$schemaVersion, id=$id, updateSequenceNumber=$updateSequenceNumber, reviews=$reviews, summary=$summary, description=$description, url=$url, createdDate=$createdDate, lastUpdated=$lastUpdated, status=$status, associations=$associations]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'schemaVersion'] = this.schemaVersion;
      json[r'id'] = this.id;
      json[r'updateSequenceNumber'] = this.updateSequenceNumber;
      json[r'reviews'] = this.reviews;
      json[r'summary'] = this.summary;
      json[r'description'] = this.description;
      json[r'url'] = this.url;
      json[r'createdDate'] = this.createdDate.toUtc().toIso8601String();
      json[r'lastUpdated'] = this.lastUpdated.toUtc().toIso8601String();
      json[r'status'] = this.status;
      json[r'associations'] = this.associations;
    return json;
  }

  /// Returns a new [GetReviewById200Response] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetReviewById200Response? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'schemaVersion'), 'Required key "GetReviewById200Response[schemaVersion]" is missing from JSON.');
        assert(json[r'schemaVersion'] != null, 'Required key "GetReviewById200Response[schemaVersion]" has a null value in JSON.');
        assert(json.containsKey(r'id'), 'Required key "GetReviewById200Response[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "GetReviewById200Response[id]" has a null value in JSON.');
        assert(json.containsKey(r'updateSequenceNumber'), 'Required key "GetReviewById200Response[updateSequenceNumber]" is missing from JSON.');
        assert(json[r'updateSequenceNumber'] != null, 'Required key "GetReviewById200Response[updateSequenceNumber]" has a null value in JSON.');
        assert(json.containsKey(r'reviews'), 'Required key "GetReviewById200Response[reviews]" is missing from JSON.');
        assert(json[r'reviews'] != null, 'Required key "GetReviewById200Response[reviews]" has a null value in JSON.');
        assert(json.containsKey(r'summary'), 'Required key "GetReviewById200Response[summary]" is missing from JSON.');
        assert(json[r'summary'] != null, 'Required key "GetReviewById200Response[summary]" has a null value in JSON.');
        assert(json.containsKey(r'description'), 'Required key "GetReviewById200Response[description]" is missing from JSON.');
        assert(json[r'description'] != null, 'Required key "GetReviewById200Response[description]" has a null value in JSON.');
        assert(json.containsKey(r'url'), 'Required key "GetReviewById200Response[url]" is missing from JSON.');
        assert(json[r'url'] != null, 'Required key "GetReviewById200Response[url]" has a null value in JSON.');
        assert(json.containsKey(r'createdDate'), 'Required key "GetReviewById200Response[createdDate]" is missing from JSON.');
        assert(json[r'createdDate'] != null, 'Required key "GetReviewById200Response[createdDate]" has a null value in JSON.');
        assert(json.containsKey(r'lastUpdated'), 'Required key "GetReviewById200Response[lastUpdated]" is missing from JSON.');
        assert(json[r'lastUpdated'] != null, 'Required key "GetReviewById200Response[lastUpdated]" has a null value in JSON.');
        assert(json.containsKey(r'status'), 'Required key "GetReviewById200Response[status]" is missing from JSON.');
        assert(json[r'status'] != null, 'Required key "GetReviewById200Response[status]" has a null value in JSON.');
        return true;
      }());

      return GetReviewById200Response(
        schemaVersion: GetReviewById200ResponseSchemaVersionEnum.fromJson(json[r'schemaVersion'])!,
        id: mapValueOfType<String>(json, r'id')!,
        updateSequenceNumber: mapValueOfType<int>(json, r'updateSequenceNumber')!,
        reviews: json[r'reviews'] is Iterable
            ? (json[r'reviews'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        summary: mapValueOfType<String>(json, r'summary')!,
        description: mapValueOfType<String>(json, r'description')!,
        url: mapValueOfType<String>(json, r'url')!,
        createdDate: mapDateTime(json, r'createdDate', r'')!,
        lastUpdated: mapDateTime(json, r'lastUpdated', r'')!,
        status: GetReviewById200ResponseStatusEnum.fromJson(json[r'status'])!,
        associations: Associations.listFromJson(json[r'associations']),
      );
    }
    return null;
  }

  static List<GetReviewById200Response> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetReviewById200Response>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetReviewById200Response.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetReviewById200Response> mapFromJson(dynamic json) {
    final map = <String, GetReviewById200Response>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetReviewById200Response.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetReviewById200Response-objects as value to a dart map
  static Map<String, List<GetReviewById200Response>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetReviewById200Response>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetReviewById200Response.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'schemaVersion',
    'id',
    'updateSequenceNumber',
    'reviews',
    'summary',
    'description',
    'url',
    'createdDate',
    'lastUpdated',
    'status',
  };
}

/// The PostIncidentReviewData schema version used for this post-incident review data.  Placeholder to support potential schema changes in the future. 
enum GetReviewById200ResponseSchemaVersionEnum {
  n1period0._(r'1.0'),
  ;

  /// Instantiate a new enum with the provided value.
  const GetReviewById200ResponseSchemaVersionEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [GetReviewById200ResponseSchemaVersionEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static GetReviewById200ResponseSchemaVersionEnum? fromJson(dynamic value) => GetReviewById200ResponseSchemaVersionEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [GetReviewById200ResponseSchemaVersionEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<GetReviewById200ResponseSchemaVersionEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetReviewById200ResponseSchemaVersionEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetReviewById200ResponseSchemaVersionEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [GetReviewById200ResponseSchemaVersionEnum] to String,
/// and [decode] dynamic data back to [GetReviewById200ResponseSchemaVersionEnum].
class GetReviewById200ResponseSchemaVersionEnumTypeTransformer {
  factory GetReviewById200ResponseSchemaVersionEnumTypeTransformer() => _instance ??= const GetReviewById200ResponseSchemaVersionEnumTypeTransformer._();

  const GetReviewById200ResponseSchemaVersionEnumTypeTransformer._();

  String encode(GetReviewById200ResponseSchemaVersionEnum data) => data._value;

  /// Returns the instance of [GetReviewById200ResponseSchemaVersionEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  GetReviewById200ResponseSchemaVersionEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is GetReviewById200ResponseSchemaVersionEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'1.0': return GetReviewById200ResponseSchemaVersionEnum.n1period0;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static GetReviewById200ResponseSchemaVersionEnumTypeTransformer? _instance;
}


/// The current status of the Post-Incident Review. 
enum GetReviewById200ResponseStatusEnum {
  inProgress._(r'in progress'),
  outstandingActions._(r'outstanding actions'),
  completed._(r'completed'),
  unknown._(r'unknown'),
  ;

  /// Instantiate a new enum with the provided value.
  const GetReviewById200ResponseStatusEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [GetReviewById200ResponseStatusEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static GetReviewById200ResponseStatusEnum? fromJson(dynamic value) => GetReviewById200ResponseStatusEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [GetReviewById200ResponseStatusEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<GetReviewById200ResponseStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetReviewById200ResponseStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetReviewById200ResponseStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [GetReviewById200ResponseStatusEnum] to String,
/// and [decode] dynamic data back to [GetReviewById200ResponseStatusEnum].
class GetReviewById200ResponseStatusEnumTypeTransformer {
  factory GetReviewById200ResponseStatusEnumTypeTransformer() => _instance ??= const GetReviewById200ResponseStatusEnumTypeTransformer._();

  const GetReviewById200ResponseStatusEnumTypeTransformer._();

  String encode(GetReviewById200ResponseStatusEnum data) => data._value;

  /// Returns the instance of [GetReviewById200ResponseStatusEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  GetReviewById200ResponseStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is GetReviewById200ResponseStatusEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'in progress': return GetReviewById200ResponseStatusEnum.inProgress;
        case r'outstanding actions': return GetReviewById200ResponseStatusEnum.outstandingActions;
        case r'completed': return GetReviewById200ResponseStatusEnum.completed;
        case r'unknown': return GetReviewById200ResponseStatusEnum.unknown;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static GetReviewById200ResponseStatusEnumTypeTransformer? _instance;
}


