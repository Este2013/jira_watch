//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProjectPayload {
  /// Returns a new [ProjectPayload] instance.
  ProjectPayload({
    this.fieldLayoutSchemeId,
    this.issueSecuritySchemeId,
    this.issueTypeSchemeId,
    this.issueTypeScreenSchemeId,
    this.notificationSchemeId,
    this.pcri,
    this.permissionSchemeId,
    this.projectTypeKey,
    this.workflowSchemeId,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectCreateResourceIdentifier? fieldLayoutSchemeId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectCreateResourceIdentifier? issueSecuritySchemeId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectCreateResourceIdentifier? issueTypeSchemeId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectCreateResourceIdentifier? issueTypeScreenSchemeId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectCreateResourceIdentifier? notificationSchemeId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectCreateResourceIdentifier? pcri;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectCreateResourceIdentifier? permissionSchemeId;

  /// The [project type](https://confluence.atlassian.com/x/GwiiLQ#Jiraapplicationsoverview-Productfeaturesandprojecttypes), which defines the application-specific feature set. If you don't specify the project template you have to specify the project type.
  ProjectPayloadProjectTypeKeyEnum? projectTypeKey;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectCreateResourceIdentifier? workflowSchemeId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProjectPayload &&
    other.fieldLayoutSchemeId == fieldLayoutSchemeId &&
    other.issueSecuritySchemeId == issueSecuritySchemeId &&
    other.issueTypeSchemeId == issueTypeSchemeId &&
    other.issueTypeScreenSchemeId == issueTypeScreenSchemeId &&
    other.notificationSchemeId == notificationSchemeId &&
    other.pcri == pcri &&
    other.permissionSchemeId == permissionSchemeId &&
    other.projectTypeKey == projectTypeKey &&
    other.workflowSchemeId == workflowSchemeId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (fieldLayoutSchemeId == null ? 0 : fieldLayoutSchemeId!.hashCode) +
    (issueSecuritySchemeId == null ? 0 : issueSecuritySchemeId!.hashCode) +
    (issueTypeSchemeId == null ? 0 : issueTypeSchemeId!.hashCode) +
    (issueTypeScreenSchemeId == null ? 0 : issueTypeScreenSchemeId!.hashCode) +
    (notificationSchemeId == null ? 0 : notificationSchemeId!.hashCode) +
    (pcri == null ? 0 : pcri!.hashCode) +
    (permissionSchemeId == null ? 0 : permissionSchemeId!.hashCode) +
    (projectTypeKey == null ? 0 : projectTypeKey!.hashCode) +
    (workflowSchemeId == null ? 0 : workflowSchemeId!.hashCode);

  @override
  String toString() => 'ProjectPayload[fieldLayoutSchemeId=$fieldLayoutSchemeId, issueSecuritySchemeId=$issueSecuritySchemeId, issueTypeSchemeId=$issueTypeSchemeId, issueTypeScreenSchemeId=$issueTypeScreenSchemeId, notificationSchemeId=$notificationSchemeId, pcri=$pcri, permissionSchemeId=$permissionSchemeId, projectTypeKey=$projectTypeKey, workflowSchemeId=$workflowSchemeId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.fieldLayoutSchemeId != null) {
      json[r'fieldLayoutSchemeId'] = this.fieldLayoutSchemeId;
    } else {
      json[r'fieldLayoutSchemeId'] = null;
    }
    if (this.issueSecuritySchemeId != null) {
      json[r'issueSecuritySchemeId'] = this.issueSecuritySchemeId;
    } else {
      json[r'issueSecuritySchemeId'] = null;
    }
    if (this.issueTypeSchemeId != null) {
      json[r'issueTypeSchemeId'] = this.issueTypeSchemeId;
    } else {
      json[r'issueTypeSchemeId'] = null;
    }
    if (this.issueTypeScreenSchemeId != null) {
      json[r'issueTypeScreenSchemeId'] = this.issueTypeScreenSchemeId;
    } else {
      json[r'issueTypeScreenSchemeId'] = null;
    }
    if (this.notificationSchemeId != null) {
      json[r'notificationSchemeId'] = this.notificationSchemeId;
    } else {
      json[r'notificationSchemeId'] = null;
    }
    if (this.pcri != null) {
      json[r'pcri'] = this.pcri;
    } else {
      json[r'pcri'] = null;
    }
    if (this.permissionSchemeId != null) {
      json[r'permissionSchemeId'] = this.permissionSchemeId;
    } else {
      json[r'permissionSchemeId'] = null;
    }
    if (this.projectTypeKey != null) {
      json[r'projectTypeKey'] = this.projectTypeKey;
    } else {
      json[r'projectTypeKey'] = null;
    }
    if (this.workflowSchemeId != null) {
      json[r'workflowSchemeId'] = this.workflowSchemeId;
    } else {
      json[r'workflowSchemeId'] = null;
    }
    return json;
  }

  /// Returns a new [ProjectPayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProjectPayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ProjectPayload(
        fieldLayoutSchemeId: ProjectCreateResourceIdentifier.fromJson(json[r'fieldLayoutSchemeId']),
        issueSecuritySchemeId: ProjectCreateResourceIdentifier.fromJson(json[r'issueSecuritySchemeId']),
        issueTypeSchemeId: ProjectCreateResourceIdentifier.fromJson(json[r'issueTypeSchemeId']),
        issueTypeScreenSchemeId: ProjectCreateResourceIdentifier.fromJson(json[r'issueTypeScreenSchemeId']),
        notificationSchemeId: ProjectCreateResourceIdentifier.fromJson(json[r'notificationSchemeId']),
        pcri: ProjectCreateResourceIdentifier.fromJson(json[r'pcri']),
        permissionSchemeId: ProjectCreateResourceIdentifier.fromJson(json[r'permissionSchemeId']),
        projectTypeKey: ProjectPayloadProjectTypeKeyEnum.fromJson(json[r'projectTypeKey']),
        workflowSchemeId: ProjectCreateResourceIdentifier.fromJson(json[r'workflowSchemeId']),
      );
    }
    return null;
  }

  static List<ProjectPayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectPayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectPayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProjectPayload> mapFromJson(dynamic json) {
    final map = <String, ProjectPayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProjectPayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProjectPayload-objects as value to a dart map
  static Map<String, List<ProjectPayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProjectPayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProjectPayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The [project type](https://confluence.atlassian.com/x/GwiiLQ#Jiraapplicationsoverview-Productfeaturesandprojecttypes), which defines the application-specific feature set. If you don't specify the project template you have to specify the project type.
enum ProjectPayloadProjectTypeKeyEnum {
  software._(r'software'),
  business._(r'business'),
  serviceDesk._(r'service_desk'),
  productDiscovery._(r'product_discovery'),
  ;

  /// Instantiate a new enum with the provided value.
  const ProjectPayloadProjectTypeKeyEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ProjectPayloadProjectTypeKeyEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ProjectPayloadProjectTypeKeyEnum? fromJson(dynamic value) => ProjectPayloadProjectTypeKeyEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ProjectPayloadProjectTypeKeyEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ProjectPayloadProjectTypeKeyEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectPayloadProjectTypeKeyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectPayloadProjectTypeKeyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ProjectPayloadProjectTypeKeyEnum] to String,
/// and [decode] dynamic data back to [ProjectPayloadProjectTypeKeyEnum].
class ProjectPayloadProjectTypeKeyEnumTypeTransformer {
  factory ProjectPayloadProjectTypeKeyEnumTypeTransformer() => _instance ??= const ProjectPayloadProjectTypeKeyEnumTypeTransformer._();

  const ProjectPayloadProjectTypeKeyEnumTypeTransformer._();

  String encode(ProjectPayloadProjectTypeKeyEnum data) => data._value;

  /// Returns the instance of [ProjectPayloadProjectTypeKeyEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ProjectPayloadProjectTypeKeyEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is ProjectPayloadProjectTypeKeyEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'software': return ProjectPayloadProjectTypeKeyEnum.software;
        case r'business': return ProjectPayloadProjectTypeKeyEnum.business;
        case r'service_desk': return ProjectPayloadProjectTypeKeyEnum.serviceDesk;
        case r'product_discovery': return ProjectPayloadProjectTypeKeyEnum.productDiscovery;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ProjectPayloadProjectTypeKeyEnumTypeTransformer? _instance;
}


