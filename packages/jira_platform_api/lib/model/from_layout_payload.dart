//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FromLayoutPayload {
  /// Returns a new [FromLayoutPayload] instance.
  FromLayoutPayload({
    this.fromPort,
    this.status,
    this.toPortOverride,
  });

  /// The port that the transition can be made from
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? fromPort;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectCreateResourceIdentifier? status;

  /// The port that the transition goes to
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? toPortOverride;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FromLayoutPayload &&
    other.fromPort == fromPort &&
    other.status == status &&
    other.toPortOverride == toPortOverride;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (fromPort == null ? 0 : fromPort!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (toPortOverride == null ? 0 : toPortOverride!.hashCode);

  @override
  String toString() => 'FromLayoutPayload[fromPort=$fromPort, status=$status, toPortOverride=$toPortOverride]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.fromPort != null) {
      json[r'fromPort'] = this.fromPort;
    } else {
      json[r'fromPort'] = null;
    }
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    if (this.toPortOverride != null) {
      json[r'toPortOverride'] = this.toPortOverride;
    } else {
      json[r'toPortOverride'] = null;
    }
    return json;
  }

  /// Returns a new [FromLayoutPayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FromLayoutPayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return FromLayoutPayload(
        fromPort: mapValueOfType<int>(json, r'fromPort'),
        status: ProjectCreateResourceIdentifier.fromJson(json[r'status']),
        toPortOverride: mapValueOfType<int>(json, r'toPortOverride'),
      );
    }
    return null;
  }

  static List<FromLayoutPayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FromLayoutPayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FromLayoutPayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FromLayoutPayload> mapFromJson(dynamic json) {
    final map = <String, FromLayoutPayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FromLayoutPayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FromLayoutPayload-objects as value to a dart map
  static Map<String, List<FromLayoutPayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FromLayoutPayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FromLayoutPayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

