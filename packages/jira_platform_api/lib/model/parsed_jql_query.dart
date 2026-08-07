//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ParsedJqlQuery {
  /// Returns a new [ParsedJqlQuery] instance.
  ParsedJqlQuery({
    this.errors = const [],
    required this.query,
    this.structure,
    this.warnings = const [],
  });

  /// The list of syntax or validation errors.
  List<String> errors;

  /// The JQL query that was parsed and validated.
  String query;

  /// The syntax tree of the query. Empty if the query was invalid.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  JqlQuery? structure;

  /// The list of warning messages
  List<String> warnings;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ParsedJqlQuery &&
    _deepEquality.equals(other.errors, errors) &&
    other.query == query &&
    other.structure == structure &&
    _deepEquality.equals(other.warnings, warnings);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (errors.hashCode) +
    (query.hashCode) +
    (structure == null ? 0 : structure!.hashCode) +
    (warnings.hashCode);

  @override
  String toString() => 'ParsedJqlQuery[errors=$errors, query=$query, structure=$structure, warnings=$warnings]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'errors'] = this.errors;
      json[r'query'] = this.query;
    if (this.structure != null) {
      json[r'structure'] = this.structure;
    } else {
      json[r'structure'] = null;
    }
      json[r'warnings'] = this.warnings;
    return json;
  }

  /// Returns a new [ParsedJqlQuery] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ParsedJqlQuery? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'query'), 'Required key "ParsedJqlQuery[query]" is missing from JSON.');
        assert(json[r'query'] != null, 'Required key "ParsedJqlQuery[query]" has a null value in JSON.');
        return true;
      }());

      return ParsedJqlQuery(
        errors: json[r'errors'] is Iterable
            ? (json[r'errors'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        query: mapValueOfType<String>(json, r'query')!,
        structure: JqlQuery.fromJson(json[r'structure']),
        warnings: json[r'warnings'] is Iterable
            ? (json[r'warnings'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<ParsedJqlQuery> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ParsedJqlQuery>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ParsedJqlQuery.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ParsedJqlQuery> mapFromJson(dynamic json) {
    final map = <String, ParsedJqlQuery>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ParsedJqlQuery.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ParsedJqlQuery-objects as value to a dart map
  static Map<String, List<ParsedJqlQuery>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ParsedJqlQuery>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ParsedJqlQuery.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'query',
  };
}

