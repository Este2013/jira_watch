//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SubmitDevopsComponentsResponse {
  /// Returns a new [SubmitDevopsComponentsResponse] instance.
  SubmitDevopsComponentsResponse({
    this.acceptedComponents = const [],
    this.failedComponents = const {},
    this.unknownProjectKeys = const [],
  });

  /// The IDs of Components that have been accepted for submission.  A Component may be rejected if it was only associated with unknown project keys.  Note that a Component that isn't updated due to it's updateSequenceNumber being out of order is not considered a failed submission. 
  List<String> acceptedComponents;

  /// Details of Components that have not been accepted for submission, usually due to a problem with the request data.  The object (if present) will be keyed by Component ID and include any errors associated with that Component that have prevented it being submitted. 
  Map<String, List<ErrorMessage1>> failedComponents;

  /// Project keys that are not known on this Jira instance (if any).  These may be invalid keys (e.g. `UTF` is sometimes incorrectly identified as a Jira project key), or they may be for projects that no longer exist.  If a Component has been associated with project keys other than those in this array it will still be stored against those valid keys. If a Component was only associated with project keys deemed to be invalid it won't be persisted. 
  List<String> unknownProjectKeys;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SubmitDevopsComponentsResponse &&
    _deepEquality.equals(other.acceptedComponents, acceptedComponents) &&
    _deepEquality.equals(other.failedComponents, failedComponents) &&
    _deepEquality.equals(other.unknownProjectKeys, unknownProjectKeys);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (acceptedComponents.hashCode) +
    (failedComponents.hashCode) +
    (unknownProjectKeys.hashCode);

  @override
  String toString() => 'SubmitDevopsComponentsResponse[acceptedComponents=$acceptedComponents, failedComponents=$failedComponents, unknownProjectKeys=$unknownProjectKeys]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'acceptedComponents'] = this.acceptedComponents;
      json[r'failedComponents'] = this.failedComponents;
      json[r'unknownProjectKeys'] = this.unknownProjectKeys;
    return json;
  }

  /// Returns a new [SubmitDevopsComponentsResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SubmitDevopsComponentsResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return SubmitDevopsComponentsResponse(
        acceptedComponents: json[r'acceptedComponents'] is Iterable
            ? (json[r'acceptedComponents'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        failedComponents: json[r'failedComponents'] == null
          ? const {}
            : ErrorMessage1.mapListFromJson(json[r'failedComponents']),
        unknownProjectKeys: json[r'unknownProjectKeys'] is Iterable
            ? (json[r'unknownProjectKeys'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<SubmitDevopsComponentsResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SubmitDevopsComponentsResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SubmitDevopsComponentsResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SubmitDevopsComponentsResponse> mapFromJson(dynamic json) {
    final map = <String, SubmitDevopsComponentsResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SubmitDevopsComponentsResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SubmitDevopsComponentsResponse-objects as value to a dart map
  static Map<String, List<SubmitDevopsComponentsResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SubmitDevopsComponentsResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SubmitDevopsComponentsResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

