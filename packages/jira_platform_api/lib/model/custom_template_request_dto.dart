//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CustomTemplateRequestDTO {
  /// Returns a new [CustomTemplateRequestDTO] instance.
  CustomTemplateRequestDTO({
    this.boardFeatures,
    this.boards,
    this.field,
    this.issueType,
    this.notification,
    this.permissionScheme,
    this.project,
    this.role,
    this.scope,
    this.security,
    this.workflow,
  });

  BoardFeaturesPayload? boardFeatures;

  BoardsPayload? boards;

  FieldCapabilityPayload? field;

  IssueTypeProjectCreatePayload? issueType;

  NotificationSchemePayload? notification;

  PermissionPayloadDTO? permissionScheme;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectPayload? project;

  RolesCapabilityPayload? role;

  ScopePayload? scope;

  SecuritySchemePayload? security;

  WorkflowCapabilityPayload? workflow;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CustomTemplateRequestDTO &&
    other.boardFeatures == boardFeatures &&
    other.boards == boards &&
    other.field == field &&
    other.issueType == issueType &&
    other.notification == notification &&
    other.permissionScheme == permissionScheme &&
    other.project == project &&
    other.role == role &&
    other.scope == scope &&
    other.security == security &&
    other.workflow == workflow;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (boardFeatures == null ? 0 : boardFeatures!.hashCode) +
    (boards == null ? 0 : boards!.hashCode) +
    (field == null ? 0 : field!.hashCode) +
    (issueType == null ? 0 : issueType!.hashCode) +
    (notification == null ? 0 : notification!.hashCode) +
    (permissionScheme == null ? 0 : permissionScheme!.hashCode) +
    (project == null ? 0 : project!.hashCode) +
    (role == null ? 0 : role!.hashCode) +
    (scope == null ? 0 : scope!.hashCode) +
    (security == null ? 0 : security!.hashCode) +
    (workflow == null ? 0 : workflow!.hashCode);

  @override
  String toString() => 'CustomTemplateRequestDTO[boardFeatures=$boardFeatures, boards=$boards, field=$field, issueType=$issueType, notification=$notification, permissionScheme=$permissionScheme, project=$project, role=$role, scope=$scope, security=$security, workflow=$workflow]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.boardFeatures != null) {
      json[r'boardFeatures'] = this.boardFeatures;
    } else {
      json[r'boardFeatures'] = null;
    }
    if (this.boards != null) {
      json[r'boards'] = this.boards;
    } else {
      json[r'boards'] = null;
    }
    if (this.field != null) {
      json[r'field'] = this.field;
    } else {
      json[r'field'] = null;
    }
    if (this.issueType != null) {
      json[r'issueType'] = this.issueType;
    } else {
      json[r'issueType'] = null;
    }
    if (this.notification != null) {
      json[r'notification'] = this.notification;
    } else {
      json[r'notification'] = null;
    }
    if (this.permissionScheme != null) {
      json[r'permissionScheme'] = this.permissionScheme;
    } else {
      json[r'permissionScheme'] = null;
    }
    if (this.project != null) {
      json[r'project'] = this.project;
    } else {
      json[r'project'] = null;
    }
    if (this.role != null) {
      json[r'role'] = this.role;
    } else {
      json[r'role'] = null;
    }
    if (this.scope != null) {
      json[r'scope'] = this.scope;
    } else {
      json[r'scope'] = null;
    }
    if (this.security != null) {
      json[r'security'] = this.security;
    } else {
      json[r'security'] = null;
    }
    if (this.workflow != null) {
      json[r'workflow'] = this.workflow;
    } else {
      json[r'workflow'] = null;
    }
    return json;
  }

  /// Returns a new [CustomTemplateRequestDTO] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CustomTemplateRequestDTO? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return CustomTemplateRequestDTO(
        boardFeatures: BoardFeaturesPayload.fromJson(json[r'boardFeatures']),
        boards: BoardsPayload.fromJson(json[r'boards']),
        field: FieldCapabilityPayload.fromJson(json[r'field']),
        issueType: IssueTypeProjectCreatePayload.fromJson(json[r'issueType']),
        notification: NotificationSchemePayload.fromJson(json[r'notification']),
        permissionScheme: PermissionPayloadDTO.fromJson(json[r'permissionScheme']),
        project: ProjectPayload.fromJson(json[r'project']),
        role: RolesCapabilityPayload.fromJson(json[r'role']),
        scope: ScopePayload.fromJson(json[r'scope']),
        security: SecuritySchemePayload.fromJson(json[r'security']),
        workflow: WorkflowCapabilityPayload.fromJson(json[r'workflow']),
      );
    }
    return null;
  }

  static List<CustomTemplateRequestDTO> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomTemplateRequestDTO>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomTemplateRequestDTO.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CustomTemplateRequestDTO> mapFromJson(dynamic json) {
    final map = <String, CustomTemplateRequestDTO>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CustomTemplateRequestDTO.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CustomTemplateRequestDTO-objects as value to a dart map
  static Map<String, List<CustomTemplateRequestDTO>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CustomTemplateRequestDTO>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CustomTemplateRequestDTO.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

