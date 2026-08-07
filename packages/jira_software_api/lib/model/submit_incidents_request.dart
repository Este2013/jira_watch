//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SubmitIncidentsRequest {
  /// Returns a new [SubmitIncidentsRequest] instance.
  SubmitIncidentsRequest({
    this.properties = const {},
    this.providerMetadata,
    this.incidents = const [],
    this.reviews = const [],
  });

  /// Properties assigned to incidents/components/review data that can then be used for delete / query operations.  Examples might be an account or user ID that can then be used to clean up data if an account is removed from the Provider system.  Properties are supplied as key/value pairs, and a maximum of 5 properties can be supplied, keys cannot contain ':' or start with '_'. 
  Map<String, String> properties;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProviderMetadata1? providerMetadata;

  List<Incident> incidents;

  List<Review> reviews;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SubmitIncidentsRequest &&
    _deepEquality.equals(other.properties, properties) &&
    other.providerMetadata == providerMetadata &&
    _deepEquality.equals(other.incidents, incidents) &&
    _deepEquality.equals(other.reviews, reviews);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (properties.hashCode) +
    (providerMetadata == null ? 0 : providerMetadata!.hashCode) +
    (incidents.hashCode) +
    (reviews.hashCode);

  @override
  String toString() => 'SubmitIncidentsRequest[properties=$properties, providerMetadata=$providerMetadata, incidents=$incidents, reviews=$reviews]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'properties'] = this.properties;
    if (this.providerMetadata != null) {
      json[r'providerMetadata'] = this.providerMetadata;
    } else {
      json[r'providerMetadata'] = null;
    }
      json[r'incidents'] = this.incidents;
      json[r'reviews'] = this.reviews;
    return json;
  }

  /// Returns a new [SubmitIncidentsRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SubmitIncidentsRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return SubmitIncidentsRequest(
        properties: mapCastOfType<String, String>(json, r'properties') ?? const {},
        providerMetadata: ProviderMetadata1.fromJson(json[r'providerMetadata']),
        incidents: Incident.listFromJson(json[r'incidents']),
        reviews: Review.listFromJson(json[r'reviews']),
      );
    }
    return null;
  }

  static List<SubmitIncidentsRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SubmitIncidentsRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SubmitIncidentsRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SubmitIncidentsRequest> mapFromJson(dynamic json) {
    final map = <String, SubmitIncidentsRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SubmitIncidentsRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SubmitIncidentsRequest-objects as value to a dart map
  static Map<String, List<SubmitIncidentsRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SubmitIncidentsRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SubmitIncidentsRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

