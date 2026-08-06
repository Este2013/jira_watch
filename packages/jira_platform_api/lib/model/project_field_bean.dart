//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProjectFieldBean {
  /// Returns a new [ProjectFieldBean] instance.
  ProjectFieldBean({
    this.description,
    this.fieldId,
    this.isRequired,
    this.projectId,
    this.workTypeId,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? fieldId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isRequired;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? projectId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? workTypeId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProjectFieldBean &&
    other.description == description &&
    other.fieldId == fieldId &&
    other.isRequired == isRequired &&
    other.projectId == projectId &&
    other.workTypeId == workTypeId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (fieldId == null ? 0 : fieldId!.hashCode) +
    (isRequired == null ? 0 : isRequired!.hashCode) +
    (projectId == null ? 0 : projectId!.hashCode) +
    (workTypeId == null ? 0 : workTypeId!.hashCode);

  @override
  String toString() => 'ProjectFieldBean[description=$description, fieldId=$fieldId, isRequired=$isRequired, projectId=$projectId, workTypeId=$workTypeId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.fieldId != null) {
      json[r'fieldId'] = this.fieldId;
    } else {
      json[r'fieldId'] = null;
    }
    if (this.isRequired != null) {
      json[r'isRequired'] = this.isRequired;
    } else {
      json[r'isRequired'] = null;
    }
    if (this.projectId != null) {
      json[r'projectId'] = this.projectId;
    } else {
      json[r'projectId'] = null;
    }
    if (this.workTypeId != null) {
      json[r'workTypeId'] = this.workTypeId;
    } else {
      json[r'workTypeId'] = null;
    }
    return json;
  }

  /// Returns a new [ProjectFieldBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProjectFieldBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ProjectFieldBean(
        description: mapValueOfType<String>(json, r'description'),
        fieldId: mapValueOfType<String>(json, r'fieldId'),
        isRequired: mapValueOfType<bool>(json, r'isRequired'),
        projectId: mapValueOfType<int>(json, r'projectId'),
        workTypeId: mapValueOfType<int>(json, r'workTypeId'),
      );
    }
    return null;
  }

  static List<ProjectFieldBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectFieldBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectFieldBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProjectFieldBean> mapFromJson(dynamic json) {
    final map = <String, ProjectFieldBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProjectFieldBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProjectFieldBean-objects as value to a dart map
  static Map<String, List<ProjectFieldBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProjectFieldBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProjectFieldBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

