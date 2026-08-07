//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueTypeProjectCreatePayload {
  /// Returns a new [IssueTypeProjectCreatePayload] instance.
  IssueTypeProjectCreatePayload({
    this.issueTypeHierarchy = const [],
    this.issueTypeScheme,
    this.issueTypes = const [],
  });

  /// Defines the issue type hierarhy to be created and used during this project creation. This will only add new levels if there isn't an existing level
  List<IssueTypeHierarchyPayload>? issueTypeHierarchy;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IssueTypeSchemePayload? issueTypeScheme;

  /// Only needed if you want to create issue types, you can otherwise use the ids of issue types in the scheme configuration
  List<IssueTypePayload>? issueTypes;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueTypeProjectCreatePayload &&
    _deepEquality.equals(other.issueTypeHierarchy, issueTypeHierarchy) &&
    other.issueTypeScheme == issueTypeScheme &&
    _deepEquality.equals(other.issueTypes, issueTypes);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (issueTypeHierarchy == null ? 0 : issueTypeHierarchy!.hashCode) +
    (issueTypeScheme == null ? 0 : issueTypeScheme!.hashCode) +
    (issueTypes == null ? 0 : issueTypes!.hashCode);

  @override
  String toString() => 'IssueTypeProjectCreatePayload[issueTypeHierarchy=$issueTypeHierarchy, issueTypeScheme=$issueTypeScheme, issueTypes=$issueTypes]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.issueTypeHierarchy != null) {
      json[r'issueTypeHierarchy'] = this.issueTypeHierarchy;
    } else {
      json[r'issueTypeHierarchy'] = null;
    }
    if (this.issueTypeScheme != null) {
      json[r'issueTypeScheme'] = this.issueTypeScheme;
    } else {
      json[r'issueTypeScheme'] = null;
    }
    if (this.issueTypes != null) {
      json[r'issueTypes'] = this.issueTypes;
    } else {
      json[r'issueTypes'] = null;
    }
    return json;
  }

  /// Returns a new [IssueTypeProjectCreatePayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueTypeProjectCreatePayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return IssueTypeProjectCreatePayload(
        issueTypeHierarchy: IssueTypeHierarchyPayload.listFromJson(json[r'issueTypeHierarchy']),
        issueTypeScheme: IssueTypeSchemePayload.fromJson(json[r'issueTypeScheme']),
        issueTypes: IssueTypePayload.listFromJson(json[r'issueTypes']),
      );
    }
    return null;
  }

  static List<IssueTypeProjectCreatePayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueTypeProjectCreatePayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueTypeProjectCreatePayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueTypeProjectCreatePayload> mapFromJson(dynamic json) {
    final map = <String, IssueTypeProjectCreatePayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueTypeProjectCreatePayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueTypeProjectCreatePayload-objects as value to a dart map
  static Map<String, List<IssueTypeProjectCreatePayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueTypeProjectCreatePayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueTypeProjectCreatePayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

