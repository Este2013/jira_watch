//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JqlQueriesToParse {
  /// Returns a new [JqlQueriesToParse] instance.
  JqlQueriesToParse({
    this.queries = const [],
  });

  /// A list of queries to parse.
  List<String> queries;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JqlQueriesToParse &&
    _deepEquality.equals(other.queries, queries);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (queries.hashCode);

  @override
  String toString() => 'JqlQueriesToParse[queries=$queries]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'queries'] = this.queries;
    return json;
  }

  /// Returns a new [JqlQueriesToParse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JqlQueriesToParse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'queries'), 'Required key "JqlQueriesToParse[queries]" is missing from JSON.');
        assert(json[r'queries'] != null, 'Required key "JqlQueriesToParse[queries]" has a null value in JSON.');
        return true;
      }());

      return JqlQueriesToParse(
        queries: json[r'queries'] is Iterable
            ? (json[r'queries'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<JqlQueriesToParse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JqlQueriesToParse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JqlQueriesToParse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JqlQueriesToParse> mapFromJson(dynamic json) {
    final map = <String, JqlQueriesToParse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JqlQueriesToParse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JqlQueriesToParse-objects as value to a dart map
  static Map<String, List<JqlQueriesToParse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JqlQueriesToParse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JqlQueriesToParse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'queries',
  };
}

