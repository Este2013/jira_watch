//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SubmitRemoteLinksRequest {
  /// Returns a new [SubmitRemoteLinksRequest] instance.
  SubmitRemoteLinksRequest({
    this.properties = const {},
    this.remoteLinks = const [],
    this.providerMetadata,
  });

  /// Properties assigned to Remote Link data that can then be used for delete / query operations.  Examples might be an account or user ID that can then be used to clean up data if an account is removed from the Provider system.  Properties are supplied as key/value pairs, a maximum of 5 properties can be supplied, and keys must not contain ':' or start with '_'. 
  Map<String, String> properties;

  /// A list of Remote Links to submit to Jira.  Each Remote Link may be associated with one or more Jira issue keys, and will be associated with any properties included in this request. 
  List<RemoteLinkData> remoteLinks;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProviderMetadata? providerMetadata;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SubmitRemoteLinksRequest &&
    _deepEquality.equals(other.properties, properties) &&
    _deepEquality.equals(other.remoteLinks, remoteLinks) &&
    other.providerMetadata == providerMetadata;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (properties.hashCode) +
    (remoteLinks.hashCode) +
    (providerMetadata == null ? 0 : providerMetadata!.hashCode);

  @override
  String toString() => 'SubmitRemoteLinksRequest[properties=$properties, remoteLinks=$remoteLinks, providerMetadata=$providerMetadata]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'properties'] = this.properties;
      json[r'remoteLinks'] = this.remoteLinks;
    if (this.providerMetadata != null) {
      json[r'providerMetadata'] = this.providerMetadata;
    } else {
      json[r'providerMetadata'] = null;
    }
    return json;
  }

  /// Returns a new [SubmitRemoteLinksRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SubmitRemoteLinksRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'remoteLinks'), 'Required key "SubmitRemoteLinksRequest[remoteLinks]" is missing from JSON.');
        assert(json[r'remoteLinks'] != null, 'Required key "SubmitRemoteLinksRequest[remoteLinks]" has a null value in JSON.');
        return true;
      }());

      return SubmitRemoteLinksRequest(
        properties: mapCastOfType<String, String>(json, r'properties') ?? const {},
        remoteLinks: RemoteLinkData.listFromJson(json[r'remoteLinks']),
        providerMetadata: ProviderMetadata.fromJson(json[r'providerMetadata']),
      );
    }
    return null;
  }

  static List<SubmitRemoteLinksRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SubmitRemoteLinksRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SubmitRemoteLinksRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SubmitRemoteLinksRequest> mapFromJson(dynamic json) {
    final map = <String, SubmitRemoteLinksRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SubmitRemoteLinksRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SubmitRemoteLinksRequest-objects as value to a dart map
  static Map<String, List<SubmitRemoteLinksRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SubmitRemoteLinksRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SubmitRemoteLinksRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'remoteLinks',
  };
}

