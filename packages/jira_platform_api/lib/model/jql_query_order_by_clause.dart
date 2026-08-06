//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JqlQueryOrderByClause {
  /// Returns a new [JqlQueryOrderByClause] instance.
  JqlQueryOrderByClause({
    this.fields = const [],
  });

  /// The list of order-by clause fields and their ordering directives.
  List<JqlQueryOrderByClauseElement> fields;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JqlQueryOrderByClause &&
    _deepEquality.equals(other.fields, fields);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (fields.hashCode);

  @override
  String toString() => 'JqlQueryOrderByClause[fields=$fields]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'fields'] = this.fields;
    return json;
  }

  /// Returns a new [JqlQueryOrderByClause] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JqlQueryOrderByClause? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'fields'), 'Required key "JqlQueryOrderByClause[fields]" is missing from JSON.');
        assert(json[r'fields'] != null, 'Required key "JqlQueryOrderByClause[fields]" has a null value in JSON.');
        return true;
      }());

      return JqlQueryOrderByClause(
        fields: JqlQueryOrderByClauseElement.listFromJson(json[r'fields']),
      );
    }
    return null;
  }

  static List<JqlQueryOrderByClause> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JqlQueryOrderByClause>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JqlQueryOrderByClause.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JqlQueryOrderByClause> mapFromJson(dynamic json) {
    final map = <String, JqlQueryOrderByClause>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JqlQueryOrderByClause.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JqlQueryOrderByClause-objects as value to a dart map
  static Map<String, List<JqlQueryOrderByClause>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JqlQueryOrderByClause>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JqlQueryOrderByClause.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'fields',
  };
}

