//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RemoveOptionFromIssuesResult {
  /// Returns a new [RemoveOptionFromIssuesResult] instance.
  RemoveOptionFromIssuesResult({
    this.errors,
    this.modifiedIssues = const [],
    this.unmodifiedIssues = const [],
  });

  /// A collection of errors related to unchanged issues. The collection size is limited, which means not all errors may be returned.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  SimpleErrorCollection? errors;

  /// The IDs of the modified issues.
  List<int> modifiedIssues;

  /// The IDs of the unchanged issues, those issues where errors prevent modification.
  List<int> unmodifiedIssues;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RemoveOptionFromIssuesResult &&
    other.errors == errors &&
    _deepEquality.equals(other.modifiedIssues, modifiedIssues) &&
    _deepEquality.equals(other.unmodifiedIssues, unmodifiedIssues);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (errors == null ? 0 : errors!.hashCode) +
    (modifiedIssues.hashCode) +
    (unmodifiedIssues.hashCode);

  @override
  String toString() => 'RemoveOptionFromIssuesResult[errors=$errors, modifiedIssues=$modifiedIssues, unmodifiedIssues=$unmodifiedIssues]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.errors != null) {
      json[r'errors'] = this.errors;
    } else {
      json[r'errors'] = null;
    }
      json[r'modifiedIssues'] = this.modifiedIssues;
      json[r'unmodifiedIssues'] = this.unmodifiedIssues;
    return json;
  }

  /// Returns a new [RemoveOptionFromIssuesResult] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RemoveOptionFromIssuesResult? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return RemoveOptionFromIssuesResult(
        errors: SimpleErrorCollection.fromJson(json[r'errors']),
        modifiedIssues: json[r'modifiedIssues'] is Iterable
            ? (json[r'modifiedIssues'] as Iterable).cast<int>().toList(growable: false)
            : const [],
        unmodifiedIssues: json[r'unmodifiedIssues'] is Iterable
            ? (json[r'unmodifiedIssues'] as Iterable).cast<int>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<RemoveOptionFromIssuesResult> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RemoveOptionFromIssuesResult>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RemoveOptionFromIssuesResult.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RemoveOptionFromIssuesResult> mapFromJson(dynamic json) {
    final map = <String, RemoveOptionFromIssuesResult>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RemoveOptionFromIssuesResult.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RemoveOptionFromIssuesResult-objects as value to a dart map
  static Map<String, List<RemoveOptionFromIssuesResult>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RemoveOptionFromIssuesResult>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RemoveOptionFromIssuesResult.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

