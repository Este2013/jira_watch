//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ContentIdToContentTypeResponse {
  /// Returns a new [ContentIdToContentTypeResponse] instance.
  ContentIdToContentTypeResponse({
    this.results = const {},
  });

  /// JSON object containing all requested content ids as keys and their associated content types as the values. Duplicate content ids in the request will be returned under a single key in the response. For built-in content types, the enumerations are as specified. Custom content ids will be mapped to their associated type.
  Map<String, String> results;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ContentIdToContentTypeResponse &&
    _deepEquality.equals(other.results, results);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (results.hashCode);

  @override
  String toString() => 'ContentIdToContentTypeResponse[results=$results]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'results'] = this.results;
    return json;
  }

  /// Returns a new [ContentIdToContentTypeResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ContentIdToContentTypeResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ContentIdToContentTypeResponse(
        results: mapCastOfType<String, String>(json, r'results') ?? const {},
      );
    }
    return null;
  }

  static List<ContentIdToContentTypeResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ContentIdToContentTypeResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ContentIdToContentTypeResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ContentIdToContentTypeResponse> mapFromJson(dynamic json) {
    final map = <String, ContentIdToContentTypeResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ContentIdToContentTypeResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ContentIdToContentTypeResponse-objects as value to a dart map
  static Map<String, List<ContentIdToContentTypeResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ContentIdToContentTypeResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ContentIdToContentTypeResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

