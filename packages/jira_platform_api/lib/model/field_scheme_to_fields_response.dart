//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FieldSchemeToFieldsResponse {
  /// Returns a new [FieldSchemeToFieldsResponse] instance.
  FieldSchemeToFieldsResponse({
    this.results = const [],
  });

  List<FieldSchemeToFieldsPartialFailure> results;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FieldSchemeToFieldsResponse &&
    _deepEquality.equals(other.results, results);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (results.hashCode);

  @override
  String toString() => 'FieldSchemeToFieldsResponse[results=$results]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'results'] = this.results;
    return json;
  }

  /// Returns a new [FieldSchemeToFieldsResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FieldSchemeToFieldsResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'results'), 'Required key "FieldSchemeToFieldsResponse[results]" is missing from JSON.');
        assert(json[r'results'] != null, 'Required key "FieldSchemeToFieldsResponse[results]" has a null value in JSON.');
        return true;
      }());

      return FieldSchemeToFieldsResponse(
        results: FieldSchemeToFieldsPartialFailure.listFromJson(json[r'results']),
      );
    }
    return null;
  }

  static List<FieldSchemeToFieldsResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldSchemeToFieldsResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldSchemeToFieldsResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FieldSchemeToFieldsResponse> mapFromJson(dynamic json) {
    final map = <String, FieldSchemeToFieldsResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FieldSchemeToFieldsResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FieldSchemeToFieldsResponse-objects as value to a dart map
  static Map<String, List<FieldSchemeToFieldsResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FieldSchemeToFieldsResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FieldSchemeToFieldsResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'results',
  };
}

