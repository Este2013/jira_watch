//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SanitizedJqlQuery {
  /// Returns a new [SanitizedJqlQuery] instance.
  SanitizedJqlQuery({
    this.accountId,
    this.errors,
    this.initialQuery,
    this.sanitizedQuery,
  });

  /// The account ID of the user for whom sanitization was performed.
  String? accountId;

  /// The list of errors.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ErrorCollection? errors;

  /// The initial query.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? initialQuery;

  /// The sanitized query, if there were no errors.
  String? sanitizedQuery;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SanitizedJqlQuery &&
    other.accountId == accountId &&
    other.errors == errors &&
    other.initialQuery == initialQuery &&
    other.sanitizedQuery == sanitizedQuery;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (accountId == null ? 0 : accountId!.hashCode) +
    (errors == null ? 0 : errors!.hashCode) +
    (initialQuery == null ? 0 : initialQuery!.hashCode) +
    (sanitizedQuery == null ? 0 : sanitizedQuery!.hashCode);

  @override
  String toString() => 'SanitizedJqlQuery[accountId=$accountId, errors=$errors, initialQuery=$initialQuery, sanitizedQuery=$sanitizedQuery]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.accountId != null) {
      json[r'accountId'] = this.accountId;
    } else {
      json[r'accountId'] = null;
    }
    if (this.errors != null) {
      json[r'errors'] = this.errors;
    } else {
      json[r'errors'] = null;
    }
    if (this.initialQuery != null) {
      json[r'initialQuery'] = this.initialQuery;
    } else {
      json[r'initialQuery'] = null;
    }
    if (this.sanitizedQuery != null) {
      json[r'sanitizedQuery'] = this.sanitizedQuery;
    } else {
      json[r'sanitizedQuery'] = null;
    }
    return json;
  }

  /// Returns a new [SanitizedJqlQuery] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SanitizedJqlQuery? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return SanitizedJqlQuery(
        accountId: mapValueOfType<String>(json, r'accountId'),
        errors: ErrorCollection.fromJson(json[r'errors']),
        initialQuery: mapValueOfType<String>(json, r'initialQuery'),
        sanitizedQuery: mapValueOfType<String>(json, r'sanitizedQuery'),
      );
    }
    return null;
  }

  static List<SanitizedJqlQuery> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SanitizedJqlQuery>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SanitizedJqlQuery.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SanitizedJqlQuery> mapFromJson(dynamic json) {
    final map = <String, SanitizedJqlQuery>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SanitizedJqlQuery.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SanitizedJqlQuery-objects as value to a dart map
  static Map<String, List<SanitizedJqlQuery>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SanitizedJqlQuery>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SanitizedJqlQuery.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

