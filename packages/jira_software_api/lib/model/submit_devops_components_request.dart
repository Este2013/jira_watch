//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SubmitDevopsComponentsRequest {
  /// Returns a new [SubmitDevopsComponentsRequest] instance.
  SubmitDevopsComponentsRequest({
    this.properties = const {},
    this.devopsComponents = const [],
    this.providerMetadata,
  });

  /// Properties assigned to incidents/components/review data that can then be used for delete / query operations.  Examples might be an account or user ID that can then be used to clean up data if an account is removed from the Provider system.  Properties are supplied as key/value pairs, and a maximum of 5 properties can be supplied, keys cannot contain ':' or start with '_'. 
  Map<String, String> properties;

  List<Component> devopsComponents;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProviderMetadata1? providerMetadata;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SubmitDevopsComponentsRequest &&
    _deepEquality.equals(other.properties, properties) &&
    _deepEquality.equals(other.devopsComponents, devopsComponents) &&
    other.providerMetadata == providerMetadata;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (properties.hashCode) +
    (devopsComponents.hashCode) +
    (providerMetadata == null ? 0 : providerMetadata!.hashCode);

  @override
  String toString() => 'SubmitDevopsComponentsRequest[properties=$properties, devopsComponents=$devopsComponents, providerMetadata=$providerMetadata]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'properties'] = this.properties;
      json[r'devopsComponents'] = this.devopsComponents;
    if (this.providerMetadata != null) {
      json[r'providerMetadata'] = this.providerMetadata;
    } else {
      json[r'providerMetadata'] = null;
    }
    return json;
  }

  /// Returns a new [SubmitDevopsComponentsRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SubmitDevopsComponentsRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'devopsComponents'), 'Required key "SubmitDevopsComponentsRequest[devopsComponents]" is missing from JSON.');
        assert(json[r'devopsComponents'] != null, 'Required key "SubmitDevopsComponentsRequest[devopsComponents]" has a null value in JSON.');
        return true;
      }());

      return SubmitDevopsComponentsRequest(
        properties: mapCastOfType<String, String>(json, r'properties') ?? const {},
        devopsComponents: Component.listFromJson(json[r'devopsComponents']),
        providerMetadata: ProviderMetadata1.fromJson(json[r'providerMetadata']),
      );
    }
    return null;
  }

  static List<SubmitDevopsComponentsRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SubmitDevopsComponentsRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SubmitDevopsComponentsRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SubmitDevopsComponentsRequest> mapFromJson(dynamic json) {
    final map = <String, SubmitDevopsComponentsRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SubmitDevopsComponentsRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SubmitDevopsComponentsRequest-objects as value to a dart map
  static Map<String, List<SubmitDevopsComponentsRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SubmitDevopsComponentsRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SubmitDevopsComponentsRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'devopsComponents',
  };
}

