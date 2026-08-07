//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProjectComponent {
  /// Returns a new [ProjectComponent] instance.
  ProjectComponent({
    this.ari,
    this.assignee,
    this.assigneeType,
    this.description,
    this.id,
    this.isAssigneeTypeValid,
    this.lead,
    this.leadAccountId,
    this.leadUserName,
    this.metadata = const {},
    this.name,
    this.project,
    this.projectId,
    this.realAssignee,
    this.realAssigneeType,
    this.self,
  });

  /// Compass component's ID. Can't be updated. Not required for creating a Project Component.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? ari;

  /// The details of the user associated with `assigneeType`, if any. See `realAssignee` for details of the user assigned to issues created with this component.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  User? assignee;

  /// The nominal user type used to determine the assignee for issues created with this component. See `realAssigneeType` for details on how the type of the user, and hence the user, assigned to issues is determined. Can take the following values:   *  `PROJECT_LEAD` the assignee to any issues created with this component is nominally the lead for the project the component is in.  *  `COMPONENT_LEAD` the assignee to any issues created with this component is nominally the lead for the component.  *  `UNASSIGNED` an assignee is not set for issues created with this component.  *  `PROJECT_DEFAULT` the assignee to any issues created with this component is nominally the default assignee for the project that the component is in.  Default value: `PROJECT_DEFAULT`.   Optional when creating or updating a component.
  ProjectComponentAssigneeTypeEnum? assigneeType;

  /// The description for the component. Optional when creating or updating a component.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The unique identifier for the component.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// Whether a user is associated with `assigneeType`. For example, if the `assigneeType` is set to `COMPONENT_LEAD` but the component lead is not set, then `false` is returned.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isAssigneeTypeValid;

  /// The user details for the component's lead user.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  User? lead;

  /// The accountId of the component's lead user. The accountId uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? leadAccountId;

  /// This property is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? leadUserName;

  /// Compass component's metadata. Can't be updated. Not required for creating a Project Component.
  Map<String, String> metadata;

  /// The unique name for the component in the project. Required when creating a component. Optional when updating a component. The maximum length is 255 characters.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The key of the project the component is assigned to. Required when creating a component. Can't be updated.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? project;

  /// The ID of the project the component is assigned to.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? projectId;

  /// The user assigned to issues created with this component, when `assigneeType` does not identify a valid assignee.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  User? realAssignee;

  /// The type of the assignee that is assigned to issues created with this component, when an assignee cannot be set from the `assigneeType`. For example, `assigneeType` is set to `COMPONENT_LEAD` but no component lead is set. This property is set to one of the following values:   *  `PROJECT_LEAD` when `assigneeType` is `PROJECT_LEAD` and the project lead has permission to be assigned issues in the project that the component is in.  *  `COMPONENT_LEAD` when `assignee`Type is `COMPONENT_LEAD` and the component lead has permission to be assigned issues in the project that the component is in.  *  `UNASSIGNED` when `assigneeType` is `UNASSIGNED` and Jira is configured to allow unassigned issues.  *  `PROJECT_DEFAULT` when none of the preceding cases are true.
  ProjectComponentRealAssigneeTypeEnum? realAssigneeType;

  /// The URL of the component.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? self;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProjectComponent &&
    other.ari == ari &&
    other.assignee == assignee &&
    other.assigneeType == assigneeType &&
    other.description == description &&
    other.id == id &&
    other.isAssigneeTypeValid == isAssigneeTypeValid &&
    other.lead == lead &&
    other.leadAccountId == leadAccountId &&
    other.leadUserName == leadUserName &&
    _deepEquality.equals(other.metadata, metadata) &&
    other.name == name &&
    other.project == project &&
    other.projectId == projectId &&
    other.realAssignee == realAssignee &&
    other.realAssigneeType == realAssigneeType &&
    other.self == self;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (ari == null ? 0 : ari!.hashCode) +
    (assignee == null ? 0 : assignee!.hashCode) +
    (assigneeType == null ? 0 : assigneeType!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (isAssigneeTypeValid == null ? 0 : isAssigneeTypeValid!.hashCode) +
    (lead == null ? 0 : lead!.hashCode) +
    (leadAccountId == null ? 0 : leadAccountId!.hashCode) +
    (leadUserName == null ? 0 : leadUserName!.hashCode) +
    (metadata.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (project == null ? 0 : project!.hashCode) +
    (projectId == null ? 0 : projectId!.hashCode) +
    (realAssignee == null ? 0 : realAssignee!.hashCode) +
    (realAssigneeType == null ? 0 : realAssigneeType!.hashCode) +
    (self == null ? 0 : self!.hashCode);

  @override
  String toString() => 'ProjectComponent[ari=$ari, assignee=$assignee, assigneeType=$assigneeType, description=$description, id=$id, isAssigneeTypeValid=$isAssigneeTypeValid, lead=$lead, leadAccountId=$leadAccountId, leadUserName=$leadUserName, metadata=$metadata, name=$name, project=$project, projectId=$projectId, realAssignee=$realAssignee, realAssigneeType=$realAssigneeType, self=$self]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.ari != null) {
      json[r'ari'] = this.ari;
    } else {
      json[r'ari'] = null;
    }
    if (this.assignee != null) {
      json[r'assignee'] = this.assignee;
    } else {
      json[r'assignee'] = null;
    }
    if (this.assigneeType != null) {
      json[r'assigneeType'] = this.assigneeType;
    } else {
      json[r'assigneeType'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.isAssigneeTypeValid != null) {
      json[r'isAssigneeTypeValid'] = this.isAssigneeTypeValid;
    } else {
      json[r'isAssigneeTypeValid'] = null;
    }
    if (this.lead != null) {
      json[r'lead'] = this.lead;
    } else {
      json[r'lead'] = null;
    }
    if (this.leadAccountId != null) {
      json[r'leadAccountId'] = this.leadAccountId;
    } else {
      json[r'leadAccountId'] = null;
    }
    if (this.leadUserName != null) {
      json[r'leadUserName'] = this.leadUserName;
    } else {
      json[r'leadUserName'] = null;
    }
      json[r'metadata'] = this.metadata;
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.project != null) {
      json[r'project'] = this.project;
    } else {
      json[r'project'] = null;
    }
    if (this.projectId != null) {
      json[r'projectId'] = this.projectId;
    } else {
      json[r'projectId'] = null;
    }
    if (this.realAssignee != null) {
      json[r'realAssignee'] = this.realAssignee;
    } else {
      json[r'realAssignee'] = null;
    }
    if (this.realAssigneeType != null) {
      json[r'realAssigneeType'] = this.realAssigneeType;
    } else {
      json[r'realAssigneeType'] = null;
    }
    if (this.self != null) {
      json[r'self'] = this.self;
    } else {
      json[r'self'] = null;
    }
    return json;
  }

  /// Returns a new [ProjectComponent] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProjectComponent? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ProjectComponent(
        ari: mapValueOfType<String>(json, r'ari'),
        assignee: User.fromJson(json[r'assignee']),
        assigneeType: ProjectComponentAssigneeTypeEnum.fromJson(json[r'assigneeType']),
        description: mapValueOfType<String>(json, r'description'),
        id: mapValueOfType<String>(json, r'id'),
        isAssigneeTypeValid: mapValueOfType<bool>(json, r'isAssigneeTypeValid'),
        lead: User.fromJson(json[r'lead']),
        leadAccountId: mapValueOfType<String>(json, r'leadAccountId'),
        leadUserName: mapValueOfType<String>(json, r'leadUserName'),
        metadata: mapCastOfType<String, String>(json, r'metadata') ?? const {},
        name: mapValueOfType<String>(json, r'name'),
        project: mapValueOfType<String>(json, r'project'),
        projectId: mapValueOfType<int>(json, r'projectId'),
        realAssignee: User.fromJson(json[r'realAssignee']),
        realAssigneeType: ProjectComponentRealAssigneeTypeEnum.fromJson(json[r'realAssigneeType']),
        self: mapValueOfType<String>(json, r'self'),
      );
    }
    return null;
  }

  static List<ProjectComponent> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectComponent>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectComponent.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProjectComponent> mapFromJson(dynamic json) {
    final map = <String, ProjectComponent>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProjectComponent.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProjectComponent-objects as value to a dart map
  static Map<String, List<ProjectComponent>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProjectComponent>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProjectComponent.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The nominal user type used to determine the assignee for issues created with this component. See `realAssigneeType` for details on how the type of the user, and hence the user, assigned to issues is determined. Can take the following values:   *  `PROJECT_LEAD` the assignee to any issues created with this component is nominally the lead for the project the component is in.  *  `COMPONENT_LEAD` the assignee to any issues created with this component is nominally the lead for the component.  *  `UNASSIGNED` an assignee is not set for issues created with this component.  *  `PROJECT_DEFAULT` the assignee to any issues created with this component is nominally the default assignee for the project that the component is in.  Default value: `PROJECT_DEFAULT`.   Optional when creating or updating a component.
enum ProjectComponentAssigneeTypeEnum {
  PROJECT_DEFAULT._(r'PROJECT_DEFAULT'),
  COMPONENT_LEAD._(r'COMPONENT_LEAD'),
  PROJECT_LEAD._(r'PROJECT_LEAD'),
  UNASSIGNED._(r'UNASSIGNED'),
  ;

  /// Instantiate a new enum with the provided value.
  const ProjectComponentAssigneeTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ProjectComponentAssigneeTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ProjectComponentAssigneeTypeEnum? fromJson(dynamic value) => ProjectComponentAssigneeTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ProjectComponentAssigneeTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ProjectComponentAssigneeTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectComponentAssigneeTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectComponentAssigneeTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ProjectComponentAssigneeTypeEnum] to String,
/// and [decode] dynamic data back to [ProjectComponentAssigneeTypeEnum].
class ProjectComponentAssigneeTypeEnumTypeTransformer {
  factory ProjectComponentAssigneeTypeEnumTypeTransformer() => _instance ??= const ProjectComponentAssigneeTypeEnumTypeTransformer._();

  const ProjectComponentAssigneeTypeEnumTypeTransformer._();

  String encode(ProjectComponentAssigneeTypeEnum data) => data._value;

  /// Returns the instance of [ProjectComponentAssigneeTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ProjectComponentAssigneeTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is ProjectComponentAssigneeTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'PROJECT_DEFAULT': return ProjectComponentAssigneeTypeEnum.PROJECT_DEFAULT;
        case r'COMPONENT_LEAD': return ProjectComponentAssigneeTypeEnum.COMPONENT_LEAD;
        case r'PROJECT_LEAD': return ProjectComponentAssigneeTypeEnum.PROJECT_LEAD;
        case r'UNASSIGNED': return ProjectComponentAssigneeTypeEnum.UNASSIGNED;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ProjectComponentAssigneeTypeEnumTypeTransformer? _instance;
}


/// The type of the assignee that is assigned to issues created with this component, when an assignee cannot be set from the `assigneeType`. For example, `assigneeType` is set to `COMPONENT_LEAD` but no component lead is set. This property is set to one of the following values:   *  `PROJECT_LEAD` when `assigneeType` is `PROJECT_LEAD` and the project lead has permission to be assigned issues in the project that the component is in.  *  `COMPONENT_LEAD` when `assignee`Type is `COMPONENT_LEAD` and the component lead has permission to be assigned issues in the project that the component is in.  *  `UNASSIGNED` when `assigneeType` is `UNASSIGNED` and Jira is configured to allow unassigned issues.  *  `PROJECT_DEFAULT` when none of the preceding cases are true.
enum ProjectComponentRealAssigneeTypeEnum {
  PROJECT_DEFAULT._(r'PROJECT_DEFAULT'),
  COMPONENT_LEAD._(r'COMPONENT_LEAD'),
  PROJECT_LEAD._(r'PROJECT_LEAD'),
  UNASSIGNED._(r'UNASSIGNED'),
  ;

  /// Instantiate a new enum with the provided value.
  const ProjectComponentRealAssigneeTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ProjectComponentRealAssigneeTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ProjectComponentRealAssigneeTypeEnum? fromJson(dynamic value) => ProjectComponentRealAssigneeTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ProjectComponentRealAssigneeTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ProjectComponentRealAssigneeTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectComponentRealAssigneeTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectComponentRealAssigneeTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ProjectComponentRealAssigneeTypeEnum] to String,
/// and [decode] dynamic data back to [ProjectComponentRealAssigneeTypeEnum].
class ProjectComponentRealAssigneeTypeEnumTypeTransformer {
  factory ProjectComponentRealAssigneeTypeEnumTypeTransformer() => _instance ??= const ProjectComponentRealAssigneeTypeEnumTypeTransformer._();

  const ProjectComponentRealAssigneeTypeEnumTypeTransformer._();

  String encode(ProjectComponentRealAssigneeTypeEnum data) => data._value;

  /// Returns the instance of [ProjectComponentRealAssigneeTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ProjectComponentRealAssigneeTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is ProjectComponentRealAssigneeTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'PROJECT_DEFAULT': return ProjectComponentRealAssigneeTypeEnum.PROJECT_DEFAULT;
        case r'COMPONENT_LEAD': return ProjectComponentRealAssigneeTypeEnum.COMPONENT_LEAD;
        case r'PROJECT_LEAD': return ProjectComponentRealAssigneeTypeEnum.PROJECT_LEAD;
        case r'UNASSIGNED': return ProjectComponentRealAssigneeTypeEnum.UNASSIGNED;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ProjectComponentRealAssigneeTypeEnumTypeTransformer? _instance;
}


