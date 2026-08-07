//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RejectedDeployment {
  /// Returns a new [RejectedDeployment] instance.
  RejectedDeployment({
    required this.key,
    this.errors = const [],
  });

  DeploymentKey key;

  /// The error messages for the rejected deployment
  List<ErrorMessage1> errors;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RejectedDeployment &&
    other.key == key &&
    _deepEquality.equals(other.errors, errors);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (key.hashCode) +
    (errors.hashCode);

  @override
  String toString() => 'RejectedDeployment[key=$key, errors=$errors]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'key'] = this.key;
      json[r'errors'] = this.errors;
    return json;
  }

  /// Returns a new [RejectedDeployment] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RejectedDeployment? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'key'), 'Required key "RejectedDeployment[key]" is missing from JSON.');
        assert(json[r'key'] != null, 'Required key "RejectedDeployment[key]" has a null value in JSON.');
        assert(json.containsKey(r'errors'), 'Required key "RejectedDeployment[errors]" is missing from JSON.');
        assert(json[r'errors'] != null, 'Required key "RejectedDeployment[errors]" has a null value in JSON.');
        return true;
      }());

      return RejectedDeployment(
        key: DeploymentKey.fromJson(json[r'key'])!,
        errors: ErrorMessage1.listFromJson(json[r'errors']),
      );
    }
    return null;
  }

  static List<RejectedDeployment> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RejectedDeployment>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RejectedDeployment.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RejectedDeployment> mapFromJson(dynamic json) {
    final map = <String, RejectedDeployment>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RejectedDeployment.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RejectedDeployment-objects as value to a dart map
  static Map<String, List<RejectedDeployment>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RejectedDeployment>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RejectedDeployment.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'key',
    'errors',
  };
}

