//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ParsedJqlQueries {
  /// Returns a new [ParsedJqlQueries] instance.
  ParsedJqlQueries({
    this.queries = const [],
  });

  /// A list of parsed JQL queries.
  List<ParsedJqlQuery> queries;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ParsedJqlQueries &&
    _deepEquality.equals(other.queries, queries);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (queries.hashCode);

  @override
  String toString() => 'ParsedJqlQueries[queries=$queries]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'queries'] = this.queries;
    return json;
  }

  /// Returns a new [ParsedJqlQueries] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ParsedJqlQueries? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'queries'), 'Required key "ParsedJqlQueries[queries]" is missing from JSON.');
        assert(json[r'queries'] != null, 'Required key "ParsedJqlQueries[queries]" has a null value in JSON.');
        return true;
      }());

      return ParsedJqlQueries(
        queries: ParsedJqlQuery.listFromJson(json[r'queries']),
      );
    }
    return null;
  }

  static List<ParsedJqlQueries> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ParsedJqlQueries>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ParsedJqlQueries.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ParsedJqlQueries> mapFromJson(dynamic json) {
    final map = <String, ParsedJqlQueries>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ParsedJqlQueries.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ParsedJqlQueries-objects as value to a dart map
  static Map<String, List<ParsedJqlQueries>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ParsedJqlQueries>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ParsedJqlQueries.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'queries',
  };
}

