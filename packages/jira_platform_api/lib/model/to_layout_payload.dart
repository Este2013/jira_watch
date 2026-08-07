//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ToLayoutPayload {
  /// Returns a new [ToLayoutPayload] instance.
  ToLayoutPayload({
    this.port,
    this.status,
  });

  /// Defines where the transition line will be connected to a status. Port 0 to 7 are acceptable values.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? port;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectCreateResourceIdentifier? status;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ToLayoutPayload &&
    other.port == port &&
    other.status == status;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (port == null ? 0 : port!.hashCode) +
    (status == null ? 0 : status!.hashCode);

  @override
  String toString() => 'ToLayoutPayload[port=$port, status=$status]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.port != null) {
      json[r'port'] = this.port;
    } else {
      json[r'port'] = null;
    }
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    return json;
  }

  /// Returns a new [ToLayoutPayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ToLayoutPayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ToLayoutPayload(
        port: mapValueOfType<int>(json, r'port'),
        status: ProjectCreateResourceIdentifier.fromJson(json[r'status']),
      );
    }
    return null;
  }

  static List<ToLayoutPayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ToLayoutPayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ToLayoutPayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ToLayoutPayload> mapFromJson(dynamic json) {
    final map = <String, ToLayoutPayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ToLayoutPayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ToLayoutPayload-objects as value to a dart map
  static Map<String, List<ToLayoutPayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ToLayoutPayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ToLayoutPayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

