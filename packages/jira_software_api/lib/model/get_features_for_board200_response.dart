//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetFeaturesForBoard200Response {
  /// Returns a new [GetFeaturesForBoard200Response] instance.
  GetFeaturesForBoard200Response({
    this.features = const [],
  });

  List<GetFeaturesForBoard200ResponseFeaturesInner> features;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetFeaturesForBoard200Response &&
    _deepEquality.equals(other.features, features);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (features.hashCode);

  @override
  String toString() => 'GetFeaturesForBoard200Response[features=$features]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'features'] = this.features;
    return json;
  }

  /// Returns a new [GetFeaturesForBoard200Response] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetFeaturesForBoard200Response? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return GetFeaturesForBoard200Response(
        features: GetFeaturesForBoard200ResponseFeaturesInner.listFromJson(json[r'features']),
      );
    }
    return null;
  }

  static List<GetFeaturesForBoard200Response> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetFeaturesForBoard200Response>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetFeaturesForBoard200Response.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetFeaturesForBoard200Response> mapFromJson(dynamic json) {
    final map = <String, GetFeaturesForBoard200Response>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetFeaturesForBoard200Response.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetFeaturesForBoard200Response-objects as value to a dart map
  static Map<String, List<GetFeaturesForBoard200Response>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetFeaturesForBoard200Response>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetFeaturesForBoard200Response.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

