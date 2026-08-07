//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SearchWarningLimitDetails {
  /// Returns a new [SearchWarningLimitDetails] instance.
  SearchWarningLimitDetails({
    this.actual,
    this.arguments,
    this.clause,
    this.limit,
  });

  /// The actual number of arguments supplied that exceeded the limit.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? actual;

  /// The arguments passed to the JQL clause.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? arguments;

  /// The JQL clause that triggered the limit, e.g. issueHistory().
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? clause;

  /// The maximum number of arguments allowed for the clause.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? limit;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SearchWarningLimitDetails &&
    other.actual == actual &&
    other.arguments == arguments &&
    other.clause == clause &&
    other.limit == limit;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (actual == null ? 0 : actual!.hashCode) +
    (arguments == null ? 0 : arguments!.hashCode) +
    (clause == null ? 0 : clause!.hashCode) +
    (limit == null ? 0 : limit!.hashCode);

  @override
  String toString() => 'SearchWarningLimitDetails[actual=$actual, arguments=$arguments, clause=$clause, limit=$limit]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.actual != null) {
      json[r'actual'] = this.actual;
    } else {
      json[r'actual'] = null;
    }
    if (this.arguments != null) {
      json[r'arguments'] = this.arguments;
    } else {
      json[r'arguments'] = null;
    }
    if (this.clause != null) {
      json[r'clause'] = this.clause;
    } else {
      json[r'clause'] = null;
    }
    if (this.limit != null) {
      json[r'limit'] = this.limit;
    } else {
      json[r'limit'] = null;
    }
    return json;
  }

  /// Returns a new [SearchWarningLimitDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SearchWarningLimitDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return SearchWarningLimitDetails(
        actual: mapValueOfType<int>(json, r'actual'),
        arguments: mapValueOfType<String>(json, r'arguments'),
        clause: mapValueOfType<String>(json, r'clause'),
        limit: mapValueOfType<int>(json, r'limit'),
      );
    }
    return null;
  }

  static List<SearchWarningLimitDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SearchWarningLimitDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SearchWarningLimitDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SearchWarningLimitDetails> mapFromJson(dynamic json) {
    final map = <String, SearchWarningLimitDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SearchWarningLimitDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SearchWarningLimitDetails-objects as value to a dart map
  static Map<String, List<SearchWarningLimitDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SearchWarningLimitDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SearchWarningLimitDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

