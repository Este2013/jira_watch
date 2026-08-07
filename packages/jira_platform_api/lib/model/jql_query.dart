//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JqlQuery {
  /// Returns a new [JqlQuery] instance.
  JqlQuery({
    this.orderBy,
    this.where,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  JqlQueryOrderByClause? orderBy;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  JqlQueryClause? where;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JqlQuery &&
    other.orderBy == orderBy &&
    other.where == where;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (orderBy == null ? 0 : orderBy!.hashCode) +
    (where == null ? 0 : where!.hashCode);

  @override
  String toString() => 'JqlQuery[orderBy=$orderBy, where=$where]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.orderBy != null) {
      json[r'orderBy'] = this.orderBy;
    } else {
      json[r'orderBy'] = null;
    }
    if (this.where != null) {
      json[r'where'] = this.where;
    } else {
      json[r'where'] = null;
    }
    return json;
  }

  /// Returns a new [JqlQuery] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JqlQuery? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return JqlQuery(
        orderBy: JqlQueryOrderByClause.fromJson(json[r'orderBy']),
        where: JqlQueryClause.fromJson(json[r'where']),
      );
    }
    return null;
  }

  static List<JqlQuery> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JqlQuery>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JqlQuery.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JqlQuery> mapFromJson(dynamic json) {
    final map = <String, JqlQuery>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JqlQuery.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JqlQuery-objects as value to a dart map
  static Map<String, List<JqlQuery>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JqlQuery>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JqlQuery.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

