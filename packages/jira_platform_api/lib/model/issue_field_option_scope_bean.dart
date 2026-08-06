//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueFieldOptionScopeBean {
  /// Returns a new [IssueFieldOptionScopeBean] instance.
  IssueFieldOptionScopeBean({
    this.global,
    this.projects = const [],
    this.projects2 = const [],
  });

  /// Defines the behavior of the option within the global context. If this property is set, even if set to an empty object, then the option is available in all projects.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  GlobalScopeBean? global;

  /// DEPRECATED
  List<int> projects;

  /// Defines the projects in which the option is available and the behavior of the option within each project. Specify one object per project. The behavior of the option in a project context overrides the behavior in the global context.
  List<ProjectScopeBean> projects2;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueFieldOptionScopeBean &&
    other.global == global &&
    _deepEquality.equals(other.projects, projects) &&
    _deepEquality.equals(other.projects2, projects2);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (global == null ? 0 : global!.hashCode) +
    (projects.hashCode) +
    (projects2.hashCode);

  @override
  String toString() => 'IssueFieldOptionScopeBean[global=$global, projects=$projects, projects2=$projects2]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.global != null) {
      json[r'global'] = this.global;
    } else {
      json[r'global'] = null;
    }
      json[r'projects'] = this.projects;
      json[r'projects2'] = this.projects2;
    return json;
  }

  /// Returns a new [IssueFieldOptionScopeBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueFieldOptionScopeBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return IssueFieldOptionScopeBean(
        global: GlobalScopeBean.fromJson(json[r'global']),
        projects: json[r'projects'] is Iterable
            ? (json[r'projects'] as Iterable).cast<int>().toList(growable: false)
            : const [],
        projects2: ProjectScopeBean.listFromJson(json[r'projects2']),
      );
    }
    return null;
  }

  static List<IssueFieldOptionScopeBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueFieldOptionScopeBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueFieldOptionScopeBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueFieldOptionScopeBean> mapFromJson(dynamic json) {
    final map = <String, IssueFieldOptionScopeBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueFieldOptionScopeBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueFieldOptionScopeBean-objects as value to a dart map
  static Map<String, List<IssueFieldOptionScopeBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueFieldOptionScopeBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueFieldOptionScopeBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

