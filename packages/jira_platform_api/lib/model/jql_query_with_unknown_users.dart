//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JQLQueryWithUnknownUsers {
  /// Returns a new [JQLQueryWithUnknownUsers] instance.
  JQLQueryWithUnknownUsers({
    this.convertedQuery,
    this.originalQuery,
  });

  /// The converted query, with accountIDs instead of user identifiers, or 'unknown' for users that could not be found
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? convertedQuery;

  /// The original query, for reference
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? originalQuery;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JQLQueryWithUnknownUsers &&
    other.convertedQuery == convertedQuery &&
    other.originalQuery == originalQuery;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (convertedQuery == null ? 0 : convertedQuery!.hashCode) +
    (originalQuery == null ? 0 : originalQuery!.hashCode);

  @override
  String toString() => 'JQLQueryWithUnknownUsers[convertedQuery=$convertedQuery, originalQuery=$originalQuery]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.convertedQuery != null) {
      json[r'convertedQuery'] = this.convertedQuery;
    } else {
      json[r'convertedQuery'] = null;
    }
    if (this.originalQuery != null) {
      json[r'originalQuery'] = this.originalQuery;
    } else {
      json[r'originalQuery'] = null;
    }
    return json;
  }

  /// Returns a new [JQLQueryWithUnknownUsers] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JQLQueryWithUnknownUsers? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return JQLQueryWithUnknownUsers(
        convertedQuery: mapValueOfType<String>(json, r'convertedQuery'),
        originalQuery: mapValueOfType<String>(json, r'originalQuery'),
      );
    }
    return null;
  }

  static List<JQLQueryWithUnknownUsers> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JQLQueryWithUnknownUsers>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JQLQueryWithUnknownUsers.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JQLQueryWithUnknownUsers> mapFromJson(dynamic json) {
    final map = <String, JQLQueryWithUnknownUsers>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JQLQueryWithUnknownUsers.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JQLQueryWithUnknownUsers-objects as value to a dart map
  static Map<String, List<JQLQueryWithUnknownUsers>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JQLQueryWithUnknownUsers>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JQLQueryWithUnknownUsers.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

