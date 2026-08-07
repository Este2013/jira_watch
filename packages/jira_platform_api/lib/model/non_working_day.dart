//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NonWorkingDay {
  /// Returns a new [NonWorkingDay] instance.
  NonWorkingDay({
    this.id,
    this.iso8601Date,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? iso8601Date;

  @override
  bool operator ==(Object other) => identical(this, other) || other is NonWorkingDay &&
    other.id == id &&
    other.iso8601Date == iso8601Date;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (iso8601Date == null ? 0 : iso8601Date!.hashCode);

  @override
  String toString() => 'NonWorkingDay[id=$id, iso8601Date=$iso8601Date]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.iso8601Date != null) {
      json[r'iso8601Date'] = this.iso8601Date;
    } else {
      json[r'iso8601Date'] = null;
    }
    return json;
  }

  /// Returns a new [NonWorkingDay] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NonWorkingDay? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return NonWorkingDay(
        id: mapValueOfType<int>(json, r'id'),
        iso8601Date: mapValueOfType<String>(json, r'iso8601Date'),
      );
    }
    return null;
  }

  static List<NonWorkingDay> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <NonWorkingDay>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NonWorkingDay.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NonWorkingDay> mapFromJson(dynamic json) {
    final map = <String, NonWorkingDay>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NonWorkingDay.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NonWorkingDay-objects as value to a dart map
  static Map<String, List<NonWorkingDay>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<NonWorkingDay>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = NonWorkingDay.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

