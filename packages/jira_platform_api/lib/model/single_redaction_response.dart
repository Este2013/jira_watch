//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SingleRedactionResponse {
  /// Returns a new [SingleRedactionResponse] instance.
  SingleRedactionResponse({
    required this.externalId,
    required this.successful,
  });

  /// An unique id for the redaction request
  String externalId;

  /// Indicates if redaction was success/failure
  bool successful;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SingleRedactionResponse &&
    other.externalId == externalId &&
    other.successful == successful;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (externalId.hashCode) +
    (successful.hashCode);

  @override
  String toString() => 'SingleRedactionResponse[externalId=$externalId, successful=$successful]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'externalId'] = this.externalId;
      json[r'successful'] = this.successful;
    return json;
  }

  /// Returns a new [SingleRedactionResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SingleRedactionResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'externalId'), 'Required key "SingleRedactionResponse[externalId]" is missing from JSON.');
        assert(json[r'externalId'] != null, 'Required key "SingleRedactionResponse[externalId]" has a null value in JSON.');
        assert(json.containsKey(r'successful'), 'Required key "SingleRedactionResponse[successful]" is missing from JSON.');
        assert(json[r'successful'] != null, 'Required key "SingleRedactionResponse[successful]" has a null value in JSON.');
        return true;
      }());

      return SingleRedactionResponse(
        externalId: mapValueOfType<String>(json, r'externalId')!,
        successful: mapValueOfType<bool>(json, r'successful')!,
      );
    }
    return null;
  }

  static List<SingleRedactionResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SingleRedactionResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SingleRedactionResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SingleRedactionResponse> mapFromJson(dynamic json) {
    final map = <String, SingleRedactionResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SingleRedactionResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SingleRedactionResponse-objects as value to a dart map
  static Map<String, List<SingleRedactionResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SingleRedactionResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SingleRedactionResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'externalId',
    'successful',
  };
}

