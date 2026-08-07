//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class EnableAdminKeyRequest {
  /// Returns a new [EnableAdminKeyRequest] instance.
  EnableAdminKeyRequest({
    this.durationInMinutes,
  });

  /// The requested duration of admin key access in minutes, up to a maximum of 60 minutes, after which the issued admin key will automatically expire.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? durationInMinutes;

  @override
  bool operator ==(Object other) => identical(this, other) || other is EnableAdminKeyRequest &&
    other.durationInMinutes == durationInMinutes;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (durationInMinutes == null ? 0 : durationInMinutes!.hashCode);

  @override
  String toString() => 'EnableAdminKeyRequest[durationInMinutes=$durationInMinutes]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.durationInMinutes != null) {
      json[r'durationInMinutes'] = this.durationInMinutes;
    } else {
      json[r'durationInMinutes'] = null;
    }
    return json;
  }

  /// Returns a new [EnableAdminKeyRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static EnableAdminKeyRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return EnableAdminKeyRequest(
        durationInMinutes: mapValueOfType<int>(json, r'durationInMinutes'),
      );
    }
    return null;
  }

  static List<EnableAdminKeyRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <EnableAdminKeyRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = EnableAdminKeyRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, EnableAdminKeyRequest> mapFromJson(dynamic json) {
    final map = <String, EnableAdminKeyRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = EnableAdminKeyRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of EnableAdminKeyRequest-objects as value to a dart map
  static Map<String, List<EnableAdminKeyRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<EnableAdminKeyRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = EnableAdminKeyRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

