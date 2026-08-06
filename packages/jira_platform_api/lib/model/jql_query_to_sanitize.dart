//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JqlQueryToSanitize {
  /// Returns a new [JqlQueryToSanitize] instance.
  JqlQueryToSanitize({
    this.accountId,
    required this.query,
  });

  /// The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*.
  String? accountId;

  /// The query to sanitize.
  String query;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JqlQueryToSanitize &&
    other.accountId == accountId &&
    other.query == query;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (accountId == null ? 0 : accountId!.hashCode) +
    (query.hashCode);

  @override
  String toString() => 'JqlQueryToSanitize[accountId=$accountId, query=$query]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.accountId != null) {
      json[r'accountId'] = this.accountId;
    } else {
      json[r'accountId'] = null;
    }
      json[r'query'] = this.query;
    return json;
  }

  /// Returns a new [JqlQueryToSanitize] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JqlQueryToSanitize? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'query'), 'Required key "JqlQueryToSanitize[query]" is missing from JSON.');
        assert(json[r'query'] != null, 'Required key "JqlQueryToSanitize[query]" has a null value in JSON.');
        return true;
      }());

      return JqlQueryToSanitize(
        accountId: mapValueOfType<String>(json, r'accountId'),
        query: mapValueOfType<String>(json, r'query')!,
      );
    }
    return null;
  }

  static List<JqlQueryToSanitize> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JqlQueryToSanitize>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JqlQueryToSanitize.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JqlQueryToSanitize> mapFromJson(dynamic json) {
    final map = <String, JqlQueryToSanitize>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JqlQueryToSanitize.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JqlQueryToSanitize-objects as value to a dart map
  static Map<String, List<JqlQueryToSanitize>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JqlQueryToSanitize>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JqlQueryToSanitize.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'query',
  };
}

