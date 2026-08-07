//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueMatchesForJQL {
  /// Returns a new [IssueMatchesForJQL] instance.
  IssueMatchesForJQL({
    this.errors = const [],
    this.matchedIssues = const [],
  });

  /// A list of errors.
  List<String> errors;

  /// A list of issue IDs.
  List<int> matchedIssues;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueMatchesForJQL &&
    _deepEquality.equals(other.errors, errors) &&
    _deepEquality.equals(other.matchedIssues, matchedIssues);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (errors.hashCode) +
    (matchedIssues.hashCode);

  @override
  String toString() => 'IssueMatchesForJQL[errors=$errors, matchedIssues=$matchedIssues]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'errors'] = this.errors;
      json[r'matchedIssues'] = this.matchedIssues;
    return json;
  }

  /// Returns a new [IssueMatchesForJQL] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueMatchesForJQL? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'errors'), 'Required key "IssueMatchesForJQL[errors]" is missing from JSON.');
        assert(json[r'errors'] != null, 'Required key "IssueMatchesForJQL[errors]" has a null value in JSON.');
        assert(json.containsKey(r'matchedIssues'), 'Required key "IssueMatchesForJQL[matchedIssues]" is missing from JSON.');
        assert(json[r'matchedIssues'] != null, 'Required key "IssueMatchesForJQL[matchedIssues]" has a null value in JSON.');
        return true;
      }());

      return IssueMatchesForJQL(
        errors: json[r'errors'] is Iterable
            ? (json[r'errors'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        matchedIssues: json[r'matchedIssues'] is Iterable
            ? (json[r'matchedIssues'] as Iterable).cast<int>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<IssueMatchesForJQL> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueMatchesForJQL>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueMatchesForJQL.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueMatchesForJQL> mapFromJson(dynamic json) {
    final map = <String, IssueMatchesForJQL>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueMatchesForJQL.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueMatchesForJQL-objects as value to a dart map
  static Map<String, List<IssueMatchesForJQL>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueMatchesForJQL>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueMatchesForJQL.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'errors',
    'matchedIssues',
  };
}

