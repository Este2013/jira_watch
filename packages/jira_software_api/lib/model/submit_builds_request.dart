//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SubmitBuildsRequest {
  /// Returns a new [SubmitBuildsRequest] instance.
  SubmitBuildsRequest({
    this.properties = const {},
    this.builds = const [],
    this.providerMetadata,
  });

  /// Properties assigned to build data that can then be used for delete / query operations.  Examples might be an account or user ID that can then be used to clean up data if an account is removed from the Provider system.  Note that these properties will never be returned with build data. They are not intended for use as metadata to associate with a build. Internally they are stored as a hash so that personal information etc. is never stored within Jira.  Properties are supplied as key/value pairs, a maximum of 5 properties can be supplied, and keys must not contain ':' or start with '_'. 
  Map<String, String> properties;

  /// A list of builds to submit to Jira.  Each build may be associated with one or more Jira issue keys, and will be associated with any properties included in this request. 
  List<BuildData> builds;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProviderMetadata? providerMetadata;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SubmitBuildsRequest &&
    _deepEquality.equals(other.properties, properties) &&
    _deepEquality.equals(other.builds, builds) &&
    other.providerMetadata == providerMetadata;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (properties.hashCode) +
    (builds.hashCode) +
    (providerMetadata == null ? 0 : providerMetadata!.hashCode);

  @override
  String toString() => 'SubmitBuildsRequest[properties=$properties, builds=$builds, providerMetadata=$providerMetadata]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'properties'] = this.properties;
      json[r'builds'] = this.builds;
    if (this.providerMetadata != null) {
      json[r'providerMetadata'] = this.providerMetadata;
    } else {
      json[r'providerMetadata'] = null;
    }
    return json;
  }

  /// Returns a new [SubmitBuildsRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SubmitBuildsRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'builds'), 'Required key "SubmitBuildsRequest[builds]" is missing from JSON.');
        assert(json[r'builds'] != null, 'Required key "SubmitBuildsRequest[builds]" has a null value in JSON.');
        return true;
      }());

      return SubmitBuildsRequest(
        properties: mapCastOfType<String, String>(json, r'properties') ?? const {},
        builds: BuildData.listFromJson(json[r'builds']),
        providerMetadata: ProviderMetadata.fromJson(json[r'providerMetadata']),
      );
    }
    return null;
  }

  static List<SubmitBuildsRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SubmitBuildsRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SubmitBuildsRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SubmitBuildsRequest> mapFromJson(dynamic json) {
    final map = <String, SubmitBuildsRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SubmitBuildsRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SubmitBuildsRequest-objects as value to a dart map
  static Map<String, List<SubmitBuildsRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SubmitBuildsRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SubmitBuildsRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'builds',
  };
}

