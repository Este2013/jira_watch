//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdatePrioritySchemeRequestBean {
  /// Returns a new [UpdatePrioritySchemeRequestBean] instance.
  UpdatePrioritySchemeRequestBean({
    this.defaultPriorityId,
    this.description,
    this.mappings,
    this.name,
    this.priorities,
    this.projects,
  });

  /// The default priority of the scheme.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? defaultPriorityId;

  /// The description of the priority scheme.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// Instructions to migrate the priorities of issues.  `in` mappings are used to migrate the priorities of issues to priorities used within the priority scheme.  `out` mappings are used to migrate the priorities of issues to priorities not used within the priority scheme.   *  When **priorities** are **added** to the priority scheme, no mapping needs to be provided as the new priorities are not used by any issues.  *  When **priorities** are **removed** from the priority scheme, issues that are using those priorities must be migrated to new priorities used by the priority scheme.           *  An `in` mapping must be provided for each of these priorities.  *  When **projects** are **added** to the priority scheme, the priorities of issues in those projects might need to be migrated to new priorities used by the priority scheme. This can occur when the current scheme does not use all the priorities in the project(s)' priority scheme(s).           *  An `in` mapping must be provided for each of these priorities.  *  When **projects** are **removed** from the priority scheme, the priorities of issues in those projects might need to be migrated to new priorities within the **Default Priority Scheme** that are not used by the priority scheme. This can occur when the **Default Priority Scheme** does not use all the priorities within the current scheme.           *  An `out` mapping must be provided for each of these priorities.  For more information on `in` and `out` mappings, see the child properties documentation for the `PriorityMapping` object below.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  PriorityMapping? mappings;

  /// The name of the priority scheme. Must be unique.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The priorities in the scheme.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  UpdatePrioritiesInSchemeRequestBean? priorities;

  /// The projects in the scheme.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  UpdateProjectsInSchemeRequestBean? projects;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UpdatePrioritySchemeRequestBean &&
    other.defaultPriorityId == defaultPriorityId &&
    other.description == description &&
    other.mappings == mappings &&
    other.name == name &&
    other.priorities == priorities &&
    other.projects == projects;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (defaultPriorityId == null ? 0 : defaultPriorityId!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (mappings == null ? 0 : mappings!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (priorities == null ? 0 : priorities!.hashCode) +
    (projects == null ? 0 : projects!.hashCode);

  @override
  String toString() => 'UpdatePrioritySchemeRequestBean[defaultPriorityId=$defaultPriorityId, description=$description, mappings=$mappings, name=$name, priorities=$priorities, projects=$projects]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.defaultPriorityId != null) {
      json[r'defaultPriorityId'] = this.defaultPriorityId;
    } else {
      json[r'defaultPriorityId'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.mappings != null) {
      json[r'mappings'] = this.mappings;
    } else {
      json[r'mappings'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.priorities != null) {
      json[r'priorities'] = this.priorities;
    } else {
      json[r'priorities'] = null;
    }
    if (this.projects != null) {
      json[r'projects'] = this.projects;
    } else {
      json[r'projects'] = null;
    }
    return json;
  }

  /// Returns a new [UpdatePrioritySchemeRequestBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdatePrioritySchemeRequestBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return UpdatePrioritySchemeRequestBean(
        defaultPriorityId: mapValueOfType<int>(json, r'defaultPriorityId'),
        description: mapValueOfType<String>(json, r'description'),
        mappings: PriorityMapping.fromJson(json[r'mappings']),
        name: mapValueOfType<String>(json, r'name'),
        priorities: UpdatePrioritiesInSchemeRequestBean.fromJson(json[r'priorities']),
        projects: UpdateProjectsInSchemeRequestBean.fromJson(json[r'projects']),
      );
    }
    return null;
  }

  static List<UpdatePrioritySchemeRequestBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdatePrioritySchemeRequestBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdatePrioritySchemeRequestBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdatePrioritySchemeRequestBean> mapFromJson(dynamic json) {
    final map = <String, UpdatePrioritySchemeRequestBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdatePrioritySchemeRequestBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdatePrioritySchemeRequestBean-objects as value to a dart map
  static Map<String, List<UpdatePrioritySchemeRequestBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UpdatePrioritySchemeRequestBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdatePrioritySchemeRequestBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

