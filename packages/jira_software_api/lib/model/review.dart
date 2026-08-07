//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Review {
  /// Returns a new [Review] instance.
  Review({
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
  ReviewSchemaVersionEnum schemaVersion;

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
  ReviewStatusEnum status;

  /// The IDs of the Jira issues related to this Incident. Must be unique for a given Provider. 
  List<Associations> associations;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Review &&
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
  String toString() => 'Review[schemaVersion=$schemaVersion, id=$id, updateSequenceNumber=$updateSequenceNumber, reviews=$reviews, summary=$summary, description=$description, url=$url, createdDate=$createdDate, lastUpdated=$lastUpdated, status=$status, associations=$associations]';

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

  /// Returns a new [Review] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Review? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'schemaVersion'), 'Required key "Review[schemaVersion]" is missing from JSON.');
        assert(json[r'schemaVersion'] != null, 'Required key "Review[schemaVersion]" has a null value in JSON.');
        assert(json.containsKey(r'id'), 'Required key "Review[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "Review[id]" has a null value in JSON.');
        assert(json.containsKey(r'updateSequenceNumber'), 'Required key "Review[updateSequenceNumber]" is missing from JSON.');
        assert(json[r'updateSequenceNumber'] != null, 'Required key "Review[updateSequenceNumber]" has a null value in JSON.');
        assert(json.containsKey(r'reviews'), 'Required key "Review[reviews]" is missing from JSON.');
        assert(json[r'reviews'] != null, 'Required key "Review[reviews]" has a null value in JSON.');
        assert(json.containsKey(r'summary'), 'Required key "Review[summary]" is missing from JSON.');
        assert(json[r'summary'] != null, 'Required key "Review[summary]" has a null value in JSON.');
        assert(json.containsKey(r'description'), 'Required key "Review[description]" is missing from JSON.');
        assert(json[r'description'] != null, 'Required key "Review[description]" has a null value in JSON.');
        assert(json.containsKey(r'url'), 'Required key "Review[url]" is missing from JSON.');
        assert(json[r'url'] != null, 'Required key "Review[url]" has a null value in JSON.');
        assert(json.containsKey(r'createdDate'), 'Required key "Review[createdDate]" is missing from JSON.');
        assert(json[r'createdDate'] != null, 'Required key "Review[createdDate]" has a null value in JSON.');
        assert(json.containsKey(r'lastUpdated'), 'Required key "Review[lastUpdated]" is missing from JSON.');
        assert(json[r'lastUpdated'] != null, 'Required key "Review[lastUpdated]" has a null value in JSON.');
        assert(json.containsKey(r'status'), 'Required key "Review[status]" is missing from JSON.');
        assert(json[r'status'] != null, 'Required key "Review[status]" has a null value in JSON.');
        return true;
      }());

      return Review(
        schemaVersion: ReviewSchemaVersionEnum.fromJson(json[r'schemaVersion'])!,
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
        status: ReviewStatusEnum.fromJson(json[r'status'])!,
        associations: Associations.listFromJson(json[r'associations']),
      );
    }
    return null;
  }

  static List<Review> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Review>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Review.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Review> mapFromJson(dynamic json) {
    final map = <String, Review>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Review.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Review-objects as value to a dart map
  static Map<String, List<Review>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Review>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Review.listFromJson(entry.value, growable: growable,);
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
enum ReviewSchemaVersionEnum {
  n1period0._(r'1.0'),
  ;

  /// Instantiate a new enum with the provided value.
  const ReviewSchemaVersionEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ReviewSchemaVersionEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ReviewSchemaVersionEnum? fromJson(dynamic value) => ReviewSchemaVersionEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ReviewSchemaVersionEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ReviewSchemaVersionEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ReviewSchemaVersionEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ReviewSchemaVersionEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ReviewSchemaVersionEnum] to String,
/// and [decode] dynamic data back to [ReviewSchemaVersionEnum].
class ReviewSchemaVersionEnumTypeTransformer {
  factory ReviewSchemaVersionEnumTypeTransformer() => _instance ??= const ReviewSchemaVersionEnumTypeTransformer._();

  const ReviewSchemaVersionEnumTypeTransformer._();

  String encode(ReviewSchemaVersionEnum data) => data._value;

  /// Returns the instance of [ReviewSchemaVersionEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ReviewSchemaVersionEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is ReviewSchemaVersionEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'1.0': return ReviewSchemaVersionEnum.n1period0;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ReviewSchemaVersionEnumTypeTransformer? _instance;
}


/// The current status of the Post-Incident Review. 
enum ReviewStatusEnum {
  inProgress._(r'in progress'),
  outstandingActions._(r'outstanding actions'),
  completed._(r'completed'),
  unknown._(r'unknown'),
  ;

  /// Instantiate a new enum with the provided value.
  const ReviewStatusEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ReviewStatusEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ReviewStatusEnum? fromJson(dynamic value) => ReviewStatusEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ReviewStatusEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ReviewStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ReviewStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ReviewStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ReviewStatusEnum] to String,
/// and [decode] dynamic data back to [ReviewStatusEnum].
class ReviewStatusEnumTypeTransformer {
  factory ReviewStatusEnumTypeTransformer() => _instance ??= const ReviewStatusEnumTypeTransformer._();

  const ReviewStatusEnumTypeTransformer._();

  String encode(ReviewStatusEnum data) => data._value;

  /// Returns the instance of [ReviewStatusEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ReviewStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is ReviewStatusEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'in progress': return ReviewStatusEnum.inProgress;
        case r'outstanding actions': return ReviewStatusEnum.outstandingActions;
        case r'completed': return ReviewStatusEnum.completed;
        case r'unknown': return ReviewStatusEnum.unknown;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ReviewStatusEnumTypeTransformer? _instance;
}


