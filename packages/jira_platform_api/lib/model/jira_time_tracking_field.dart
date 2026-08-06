//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JiraTimeTrackingField {
  /// Returns a new [JiraTimeTrackingField] instance.
  JiraTimeTrackingField({
    required this.timeRemaining,
  });

  String timeRemaining;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JiraTimeTrackingField &&
    other.timeRemaining == timeRemaining;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (timeRemaining.hashCode);

  @override
  String toString() => 'JiraTimeTrackingField[timeRemaining=$timeRemaining]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'timeRemaining'] = this.timeRemaining;
    return json;
  }

  /// Returns a new [JiraTimeTrackingField] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JiraTimeTrackingField? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'timeRemaining'), 'Required key "JiraTimeTrackingField[timeRemaining]" is missing from JSON.');
        assert(json[r'timeRemaining'] != null, 'Required key "JiraTimeTrackingField[timeRemaining]" has a null value in JSON.');
        return true;
      }());

      return JiraTimeTrackingField(
        timeRemaining: mapValueOfType<String>(json, r'timeRemaining')!,
      );
    }
    return null;
  }

  static List<JiraTimeTrackingField> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JiraTimeTrackingField>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JiraTimeTrackingField.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JiraTimeTrackingField> mapFromJson(dynamic json) {
    final map = <String, JiraTimeTrackingField>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JiraTimeTrackingField.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JiraTimeTrackingField-objects as value to a dart map
  static Map<String, List<JiraTimeTrackingField>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JiraTimeTrackingField>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JiraTimeTrackingField.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'timeRemaining',
  };
}

