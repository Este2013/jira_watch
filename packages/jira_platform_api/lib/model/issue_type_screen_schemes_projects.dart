//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueTypeScreenSchemesProjects {
  /// Returns a new [IssueTypeScreenSchemesProjects] instance.
  IssueTypeScreenSchemesProjects({
    required this.issueTypeScreenScheme,
    this.projectIds = const [],
  });

  /// Details of an issue type screen scheme.
  IssueTypeScreenScheme issueTypeScreenScheme;

  /// The IDs of the projects using the issue type screen scheme.
  List<String> projectIds;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueTypeScreenSchemesProjects &&
    other.issueTypeScreenScheme == issueTypeScreenScheme &&
    _deepEquality.equals(other.projectIds, projectIds);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (issueTypeScreenScheme.hashCode) +
    (projectIds.hashCode);

  @override
  String toString() => 'IssueTypeScreenSchemesProjects[issueTypeScreenScheme=$issueTypeScreenScheme, projectIds=$projectIds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'issueTypeScreenScheme'] = this.issueTypeScreenScheme;
      json[r'projectIds'] = this.projectIds;
    return json;
  }

  /// Returns a new [IssueTypeScreenSchemesProjects] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueTypeScreenSchemesProjects? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'issueTypeScreenScheme'), 'Required key "IssueTypeScreenSchemesProjects[issueTypeScreenScheme]" is missing from JSON.');
        assert(json[r'issueTypeScreenScheme'] != null, 'Required key "IssueTypeScreenSchemesProjects[issueTypeScreenScheme]" has a null value in JSON.');
        assert(json.containsKey(r'projectIds'), 'Required key "IssueTypeScreenSchemesProjects[projectIds]" is missing from JSON.');
        assert(json[r'projectIds'] != null, 'Required key "IssueTypeScreenSchemesProjects[projectIds]" has a null value in JSON.');
        return true;
      }());

      return IssueTypeScreenSchemesProjects(
        issueTypeScreenScheme: IssueTypeScreenScheme.fromJson(json[r'issueTypeScreenScheme'])!,
        projectIds: json[r'projectIds'] is Iterable
            ? (json[r'projectIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<IssueTypeScreenSchemesProjects> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueTypeScreenSchemesProjects>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueTypeScreenSchemesProjects.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueTypeScreenSchemesProjects> mapFromJson(dynamic json) {
    final map = <String, IssueTypeScreenSchemesProjects>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueTypeScreenSchemesProjects.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueTypeScreenSchemesProjects-objects as value to a dart map
  static Map<String, List<IssueTypeScreenSchemesProjects>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueTypeScreenSchemesProjects>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueTypeScreenSchemesProjects.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'issueTypeScreenScheme',
    'projectIds',
  };
}

