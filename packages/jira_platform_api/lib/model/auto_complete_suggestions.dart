//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AutoCompleteSuggestions {
  /// Returns a new [AutoCompleteSuggestions] instance.
  AutoCompleteSuggestions({
    this.results = const [],
  });

  /// The list of suggested item.
  List<AutoCompleteSuggestion> results;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AutoCompleteSuggestions &&
    _deepEquality.equals(other.results, results);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (results.hashCode);

  @override
  String toString() => 'AutoCompleteSuggestions[results=$results]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'results'] = this.results;
    return json;
  }

  /// Returns a new [AutoCompleteSuggestions] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AutoCompleteSuggestions? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return AutoCompleteSuggestions(
        results: AutoCompleteSuggestion.listFromJson(json[r'results']),
      );
    }
    return null;
  }

  static List<AutoCompleteSuggestions> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AutoCompleteSuggestions>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AutoCompleteSuggestions.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AutoCompleteSuggestions> mapFromJson(dynamic json) {
    final map = <String, AutoCompleteSuggestions>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AutoCompleteSuggestions.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AutoCompleteSuggestions-objects as value to a dart map
  static Map<String, List<AutoCompleteSuggestions>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AutoCompleteSuggestions>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AutoCompleteSuggestions.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

