//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JiraDateInput {
  /// Returns a new [JiraDateInput] instance.
  JiraDateInput({
    required this.formattedDate,
  });

  String formattedDate;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JiraDateInput &&
    other.formattedDate == formattedDate;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (formattedDate.hashCode);

  @override
  String toString() => 'JiraDateInput[formattedDate=$formattedDate]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'formattedDate'] = this.formattedDate;
    return json;
  }

  /// Returns a new [JiraDateInput] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JiraDateInput? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'formattedDate'), 'Required key "JiraDateInput[formattedDate]" is missing from JSON.');
        assert(json[r'formattedDate'] != null, 'Required key "JiraDateInput[formattedDate]" has a null value in JSON.');
        return true;
      }());

      return JiraDateInput(
        formattedDate: mapValueOfType<String>(json, r'formattedDate')!,
      );
    }
    return null;
  }

  static List<JiraDateInput> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JiraDateInput>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JiraDateInput.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JiraDateInput> mapFromJson(dynamic json) {
    final map = <String, JiraDateInput>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JiraDateInput.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JiraDateInput-objects as value to a dart map
  static Map<String, List<JiraDateInput>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JiraDateInput>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JiraDateInput.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'formattedDate',
  };
}

