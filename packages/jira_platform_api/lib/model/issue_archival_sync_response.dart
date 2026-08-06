//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueArchivalSyncResponse {
  /// Returns a new [IssueArchivalSyncResponse] instance.
  IssueArchivalSyncResponse({
    this.errors,
    this.numberOfIssuesUpdated,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Errors? errors;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? numberOfIssuesUpdated;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueArchivalSyncResponse &&
    other.errors == errors &&
    other.numberOfIssuesUpdated == numberOfIssuesUpdated;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (errors == null ? 0 : errors!.hashCode) +
    (numberOfIssuesUpdated == null ? 0 : numberOfIssuesUpdated!.hashCode);

  @override
  String toString() => 'IssueArchivalSyncResponse[errors=$errors, numberOfIssuesUpdated=$numberOfIssuesUpdated]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.errors != null) {
      json[r'errors'] = this.errors;
    } else {
      json[r'errors'] = null;
    }
    if (this.numberOfIssuesUpdated != null) {
      json[r'numberOfIssuesUpdated'] = this.numberOfIssuesUpdated;
    } else {
      json[r'numberOfIssuesUpdated'] = null;
    }
    return json;
  }

  /// Returns a new [IssueArchivalSyncResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueArchivalSyncResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return IssueArchivalSyncResponse(
        errors: Errors.fromJson(json[r'errors']),
        numberOfIssuesUpdated: mapValueOfType<int>(json, r'numberOfIssuesUpdated'),
      );
    }
    return null;
  }

  static List<IssueArchivalSyncResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueArchivalSyncResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueArchivalSyncResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueArchivalSyncResponse> mapFromJson(dynamic json) {
    final map = <String, IssueArchivalSyncResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueArchivalSyncResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueArchivalSyncResponse-objects as value to a dart map
  static Map<String, List<IssueArchivalSyncResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueArchivalSyncResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueArchivalSyncResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

