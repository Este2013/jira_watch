//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProjectCustomTemplateCreateRequestDTO {
  /// Returns a new [ProjectCustomTemplateCreateRequestDTO] instance.
  ProjectCustomTemplateCreateRequestDTO({
    this.details,
    this.template,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CustomTemplatesProjectDetails? details;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CustomTemplateRequestDTO? template;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProjectCustomTemplateCreateRequestDTO &&
    other.details == details &&
    other.template == template;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (details == null ? 0 : details!.hashCode) +
    (template == null ? 0 : template!.hashCode);

  @override
  String toString() => 'ProjectCustomTemplateCreateRequestDTO[details=$details, template=$template]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.details != null) {
      json[r'details'] = this.details;
    } else {
      json[r'details'] = null;
    }
    if (this.template != null) {
      json[r'template'] = this.template;
    } else {
      json[r'template'] = null;
    }
    return json;
  }

  /// Returns a new [ProjectCustomTemplateCreateRequestDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProjectCustomTemplateCreateRequestDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ProjectCustomTemplateCreateRequestDTO(
        details: CustomTemplatesProjectDetails.fromJson(json[r'details']),
        template: CustomTemplateRequestDTO.fromJson(json[r'template']),
      );
    }
    return null;
  }

  static List<ProjectCustomTemplateCreateRequestDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectCustomTemplateCreateRequestDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectCustomTemplateCreateRequestDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProjectCustomTemplateCreateRequestDTO> mapFromJson(dynamic json) {
    final map = <String, ProjectCustomTemplateCreateRequestDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProjectCustomTemplateCreateRequestDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProjectCustomTemplateCreateRequestDTO-objects as value to a dart map
  static Map<String, List<ProjectCustomTemplateCreateRequestDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProjectCustomTemplateCreateRequestDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProjectCustomTemplateCreateRequestDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

