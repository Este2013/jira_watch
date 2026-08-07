//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Project {
  /// Returns a new [Project] instance.
  Project({
    this.archived,
    this.archivedBy,
    this.archivedDate,
    this.assigneeType,
    this.avatarUrls,
    this.components = const [],
    this.deleted,
    this.deletedBy,
    this.deletedDate,
    this.description,
    this.email,
    this.expand,
    this.favourite,
    this.id,
    this.insight,
    this.isPrivate,
    this.issueTypeHierarchy,
    this.issueTypes = const [],
    this.key,
    this.landingPageInfo,
    this.lead,
    this.name,
    this.permissions,
    this.projectCategory,
    this.projectTypeKey,
    this.properties = const {},
    this.retentionTillDate,
    this.roles = const {},
    this.self,
    this.simplified,
    this.style,
    this.url,
    this.uuid,
    this.versions = const [],
  });

  /// Whether the project is archived.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? archived;

  /// The user who archived the project.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  User? archivedBy;

  /// The date when the project was archived.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? archivedDate;

  /// The default assignee when creating issues for this project.
  ProjectAssigneeTypeEnum? assigneeType;

  /// The URLs of the project's avatars.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  AvatarUrlsBean? avatarUrls;

  /// List of the components contained in the project.
  List<ProjectComponent> components;

  /// Whether the project is marked as deleted.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? deleted;

  /// The user who marked the project as deleted.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  User? deletedBy;

  /// The date when the project was marked as deleted.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? deletedDate;

  /// A brief description of the project.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// An email address associated with the project.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? email;

  /// Expand options that include additional project details in the response.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? expand;

  /// Whether the project is selected as a favorite.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? favourite;

  /// The ID of the project.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// Insights about the project.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectInsight? insight;

  /// Whether the project is private from the user's perspective. This means the user can't see the project or any associated issues.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isPrivate;

  /// The issue type hierarchy for the project.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Hierarchy? issueTypeHierarchy;

  /// List of the issue types available in the project.
  List<IssueTypeDetails> issueTypes;

  /// The key of the project.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? key;

  /// The project landing page info.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectLandingPageInfo? landingPageInfo;

  /// The username of the project lead.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  User? lead;

  /// The name of the project.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// User permissions on the project
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectPermissions? permissions;

  /// The category the project belongs to.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectCategory? projectCategory;

  /// The [project type](https://confluence.atlassian.com/x/GwiiLQ#Jiraapplicationsoverview-Productfeaturesandprojecttypes) of the project.
  ProjectProjectTypeKeyEnum? projectTypeKey;

  /// Map of project properties
  Map<String, Object> properties;

  /// The date when the project is deleted permanently.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? retentionTillDate;

  /// The name and self URL for each role defined in the project. For more information, see [Create project role](#api-rest-api-3-role-post).
  Map<String, String> roles;

  /// The URL of the project details.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? self;

  /// Whether the project is simplified.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? simplified;

  /// The type of the project.
  ProjectStyleEnum? style;

  /// A link to information about this project, such as project documentation.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? url;

  /// Unique ID for next-gen projects.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? uuid;

  /// The versions defined in the project. For more information, see [Create version](#api-rest-api-3-version-post).
  List<Version> versions;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Project &&
    other.archived == archived &&
    other.archivedBy == archivedBy &&
    other.archivedDate == archivedDate &&
    other.assigneeType == assigneeType &&
    other.avatarUrls == avatarUrls &&
    _deepEquality.equals(other.components, components) &&
    other.deleted == deleted &&
    other.deletedBy == deletedBy &&
    other.deletedDate == deletedDate &&
    other.description == description &&
    other.email == email &&
    other.expand == expand &&
    other.favourite == favourite &&
    other.id == id &&
    other.insight == insight &&
    other.isPrivate == isPrivate &&
    other.issueTypeHierarchy == issueTypeHierarchy &&
    _deepEquality.equals(other.issueTypes, issueTypes) &&
    other.key == key &&
    other.landingPageInfo == landingPageInfo &&
    other.lead == lead &&
    other.name == name &&
    other.permissions == permissions &&
    other.projectCategory == projectCategory &&
    other.projectTypeKey == projectTypeKey &&
    _deepEquality.equals(other.properties, properties) &&
    other.retentionTillDate == retentionTillDate &&
    _deepEquality.equals(other.roles, roles) &&
    other.self == self &&
    other.simplified == simplified &&
    other.style == style &&
    other.url == url &&
    other.uuid == uuid &&
    _deepEquality.equals(other.versions, versions);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (archived == null ? 0 : archived!.hashCode) +
    (archivedBy == null ? 0 : archivedBy!.hashCode) +
    (archivedDate == null ? 0 : archivedDate!.hashCode) +
    (assigneeType == null ? 0 : assigneeType!.hashCode) +
    (avatarUrls == null ? 0 : avatarUrls!.hashCode) +
    (components.hashCode) +
    (deleted == null ? 0 : deleted!.hashCode) +
    (deletedBy == null ? 0 : deletedBy!.hashCode) +
    (deletedDate == null ? 0 : deletedDate!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (email == null ? 0 : email!.hashCode) +
    (expand == null ? 0 : expand!.hashCode) +
    (favourite == null ? 0 : favourite!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (insight == null ? 0 : insight!.hashCode) +
    (isPrivate == null ? 0 : isPrivate!.hashCode) +
    (issueTypeHierarchy == null ? 0 : issueTypeHierarchy!.hashCode) +
    (issueTypes.hashCode) +
    (key == null ? 0 : key!.hashCode) +
    (landingPageInfo == null ? 0 : landingPageInfo!.hashCode) +
    (lead == null ? 0 : lead!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (permissions == null ? 0 : permissions!.hashCode) +
    (projectCategory == null ? 0 : projectCategory!.hashCode) +
    (projectTypeKey == null ? 0 : projectTypeKey!.hashCode) +
    (properties.hashCode) +
    (retentionTillDate == null ? 0 : retentionTillDate!.hashCode) +
    (roles.hashCode) +
    (self == null ? 0 : self!.hashCode) +
    (simplified == null ? 0 : simplified!.hashCode) +
    (style == null ? 0 : style!.hashCode) +
    (url == null ? 0 : url!.hashCode) +
    (uuid == null ? 0 : uuid!.hashCode) +
    (versions.hashCode);

  @override
  String toString() => 'Project[archived=$archived, archivedBy=$archivedBy, archivedDate=$archivedDate, assigneeType=$assigneeType, avatarUrls=$avatarUrls, components=$components, deleted=$deleted, deletedBy=$deletedBy, deletedDate=$deletedDate, description=$description, email=$email, expand=$expand, favourite=$favourite, id=$id, insight=$insight, isPrivate=$isPrivate, issueTypeHierarchy=$issueTypeHierarchy, issueTypes=$issueTypes, key=$key, landingPageInfo=$landingPageInfo, lead=$lead, name=$name, permissions=$permissions, projectCategory=$projectCategory, projectTypeKey=$projectTypeKey, properties=$properties, retentionTillDate=$retentionTillDate, roles=$roles, self=$self, simplified=$simplified, style=$style, url=$url, uuid=$uuid, versions=$versions]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.archived != null) {
      json[r'archived'] = this.archived;
    } else {
      json[r'archived'] = null;
    }
    if (this.archivedBy != null) {
      json[r'archivedBy'] = this.archivedBy;
    } else {
      json[r'archivedBy'] = null;
    }
    if (this.archivedDate != null) {
      json[r'archivedDate'] = this.archivedDate!.toUtc().toIso8601String();
    } else {
      json[r'archivedDate'] = null;
    }
    if (this.assigneeType != null) {
      json[r'assigneeType'] = this.assigneeType;
    } else {
      json[r'assigneeType'] = null;
    }
    if (this.avatarUrls != null) {
      json[r'avatarUrls'] = this.avatarUrls;
    } else {
      json[r'avatarUrls'] = null;
    }
      json[r'components'] = this.components;
    if (this.deleted != null) {
      json[r'deleted'] = this.deleted;
    } else {
      json[r'deleted'] = null;
    }
    if (this.deletedBy != null) {
      json[r'deletedBy'] = this.deletedBy;
    } else {
      json[r'deletedBy'] = null;
    }
    if (this.deletedDate != null) {
      json[r'deletedDate'] = this.deletedDate!.toUtc().toIso8601String();
    } else {
      json[r'deletedDate'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.email != null) {
      json[r'email'] = this.email;
    } else {
      json[r'email'] = null;
    }
    if (this.expand != null) {
      json[r'expand'] = this.expand;
    } else {
      json[r'expand'] = null;
    }
    if (this.favourite != null) {
      json[r'favourite'] = this.favourite;
    } else {
      json[r'favourite'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.insight != null) {
      json[r'insight'] = this.insight;
    } else {
      json[r'insight'] = null;
    }
    if (this.isPrivate != null) {
      json[r'isPrivate'] = this.isPrivate;
    } else {
      json[r'isPrivate'] = null;
    }
    if (this.issueTypeHierarchy != null) {
      json[r'issueTypeHierarchy'] = this.issueTypeHierarchy;
    } else {
      json[r'issueTypeHierarchy'] = null;
    }
      json[r'issueTypes'] = this.issueTypes;
    if (this.key != null) {
      json[r'key'] = this.key;
    } else {
      json[r'key'] = null;
    }
    if (this.landingPageInfo != null) {
      json[r'landingPageInfo'] = this.landingPageInfo;
    } else {
      json[r'landingPageInfo'] = null;
    }
    if (this.lead != null) {
      json[r'lead'] = this.lead;
    } else {
      json[r'lead'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.permissions != null) {
      json[r'permissions'] = this.permissions;
    } else {
      json[r'permissions'] = null;
    }
    if (this.projectCategory != null) {
      json[r'projectCategory'] = this.projectCategory;
    } else {
      json[r'projectCategory'] = null;
    }
    if (this.projectTypeKey != null) {
      json[r'projectTypeKey'] = this.projectTypeKey;
    } else {
      json[r'projectTypeKey'] = null;
    }
      json[r'properties'] = this.properties;
    if (this.retentionTillDate != null) {
      json[r'retentionTillDate'] = this.retentionTillDate!.toUtc().toIso8601String();
    } else {
      json[r'retentionTillDate'] = null;
    }
      json[r'roles'] = this.roles;
    if (this.self != null) {
      json[r'self'] = this.self;
    } else {
      json[r'self'] = null;
    }
    if (this.simplified != null) {
      json[r'simplified'] = this.simplified;
    } else {
      json[r'simplified'] = null;
    }
    if (this.style != null) {
      json[r'style'] = this.style;
    } else {
      json[r'style'] = null;
    }
    if (this.url != null) {
      json[r'url'] = this.url;
    } else {
      json[r'url'] = null;
    }
    if (this.uuid != null) {
      json[r'uuid'] = this.uuid;
    } else {
      json[r'uuid'] = null;
    }
      json[r'versions'] = this.versions;
    return json;
  }

  /// Returns a new [Project] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Project? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return Project(
        archived: mapValueOfType<bool>(json, r'archived'),
        archivedBy: User.fromJson(json[r'archivedBy']),
        archivedDate: mapDateTime(json, r'archivedDate', r''),
        assigneeType: ProjectAssigneeTypeEnum.fromJson(json[r'assigneeType']),
        avatarUrls: AvatarUrlsBean.fromJson(json[r'avatarUrls']),
        components: ProjectComponent.listFromJson(json[r'components']),
        deleted: mapValueOfType<bool>(json, r'deleted'),
        deletedBy: User.fromJson(json[r'deletedBy']),
        deletedDate: mapDateTime(json, r'deletedDate', r''),
        description: mapValueOfType<String>(json, r'description'),
        email: mapValueOfType<String>(json, r'email'),
        expand: mapValueOfType<String>(json, r'expand'),
        favourite: mapValueOfType<bool>(json, r'favourite'),
        id: mapValueOfType<String>(json, r'id'),
        insight: ProjectInsight.fromJson(json[r'insight']),
        isPrivate: mapValueOfType<bool>(json, r'isPrivate'),
        issueTypeHierarchy: Hierarchy.fromJson(json[r'issueTypeHierarchy']),
        issueTypes: IssueTypeDetails.listFromJson(json[r'issueTypes']),
        key: mapValueOfType<String>(json, r'key'),
        landingPageInfo: ProjectLandingPageInfo.fromJson(json[r'landingPageInfo']),
        lead: User.fromJson(json[r'lead']),
        name: mapValueOfType<String>(json, r'name'),
        permissions: ProjectPermissions.fromJson(json[r'permissions']),
        projectCategory: ProjectCategory.fromJson(json[r'projectCategory']),
        projectTypeKey: ProjectProjectTypeKeyEnum.fromJson(json[r'projectTypeKey']),
        properties: mapCastOfType<String, Object>(json, r'properties') ?? const {},
        retentionTillDate: mapDateTime(json, r'retentionTillDate', r''),
        roles: mapCastOfType<String, String>(json, r'roles') ?? const {},
        self: mapValueOfType<String>(json, r'self'),
        simplified: mapValueOfType<bool>(json, r'simplified'),
        style: ProjectStyleEnum.fromJson(json[r'style']),
        url: mapValueOfType<String>(json, r'url'),
        uuid: mapValueOfType<String>(json, r'uuid'),
        versions: Version.listFromJson(json[r'versions']),
      );
    }
    return null;
  }

  static List<Project> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Project>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Project.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Project> mapFromJson(dynamic json) {
    final map = <String, Project>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Project.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Project-objects as value to a dart map
  static Map<String, List<Project>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Project>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Project.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The default assignee when creating issues for this project.
enum ProjectAssigneeTypeEnum {
  PROJECT_LEAD._(r'PROJECT_LEAD'),
  UNASSIGNED._(r'UNASSIGNED'),
  ;

  /// Instantiate a new enum with the provided value.
  const ProjectAssigneeTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ProjectAssigneeTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ProjectAssigneeTypeEnum? fromJson(dynamic value) => ProjectAssigneeTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ProjectAssigneeTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ProjectAssigneeTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectAssigneeTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectAssigneeTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ProjectAssigneeTypeEnum] to String,
/// and [decode] dynamic data back to [ProjectAssigneeTypeEnum].
class ProjectAssigneeTypeEnumTypeTransformer {
  factory ProjectAssigneeTypeEnumTypeTransformer() => _instance ??= const ProjectAssigneeTypeEnumTypeTransformer._();

  const ProjectAssigneeTypeEnumTypeTransformer._();

  String encode(ProjectAssigneeTypeEnum data) => data._value;

  /// Returns the instance of [ProjectAssigneeTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ProjectAssigneeTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is ProjectAssigneeTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'PROJECT_LEAD': return ProjectAssigneeTypeEnum.PROJECT_LEAD;
        case r'UNASSIGNED': return ProjectAssigneeTypeEnum.UNASSIGNED;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ProjectAssigneeTypeEnumTypeTransformer? _instance;
}


/// The [project type](https://confluence.atlassian.com/x/GwiiLQ#Jiraapplicationsoverview-Productfeaturesandprojecttypes) of the project.
enum ProjectProjectTypeKeyEnum {
  software._(r'software'),
  serviceDesk._(r'service_desk'),
  business._(r'business'),
  ;

  /// Instantiate a new enum with the provided value.
  const ProjectProjectTypeKeyEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ProjectProjectTypeKeyEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ProjectProjectTypeKeyEnum? fromJson(dynamic value) => ProjectProjectTypeKeyEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ProjectProjectTypeKeyEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ProjectProjectTypeKeyEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectProjectTypeKeyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectProjectTypeKeyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ProjectProjectTypeKeyEnum] to String,
/// and [decode] dynamic data back to [ProjectProjectTypeKeyEnum].
class ProjectProjectTypeKeyEnumTypeTransformer {
  factory ProjectProjectTypeKeyEnumTypeTransformer() => _instance ??= const ProjectProjectTypeKeyEnumTypeTransformer._();

  const ProjectProjectTypeKeyEnumTypeTransformer._();

  String encode(ProjectProjectTypeKeyEnum data) => data._value;

  /// Returns the instance of [ProjectProjectTypeKeyEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ProjectProjectTypeKeyEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is ProjectProjectTypeKeyEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'software': return ProjectProjectTypeKeyEnum.software;
        case r'service_desk': return ProjectProjectTypeKeyEnum.serviceDesk;
        case r'business': return ProjectProjectTypeKeyEnum.business;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ProjectProjectTypeKeyEnumTypeTransformer? _instance;
}


/// The type of the project.
enum ProjectStyleEnum {
  classic._(r'classic'),
  nextGen._(r'next-gen'),
  ;

  /// Instantiate a new enum with the provided value.
  const ProjectStyleEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ProjectStyleEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ProjectStyleEnum? fromJson(dynamic value) => ProjectStyleEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ProjectStyleEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ProjectStyleEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectStyleEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectStyleEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ProjectStyleEnum] to String,
/// and [decode] dynamic data back to [ProjectStyleEnum].
class ProjectStyleEnumTypeTransformer {
  factory ProjectStyleEnumTypeTransformer() => _instance ??= const ProjectStyleEnumTypeTransformer._();

  const ProjectStyleEnumTypeTransformer._();

  String encode(ProjectStyleEnum data) => data._value;

  /// Returns the instance of [ProjectStyleEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ProjectStyleEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is ProjectStyleEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'classic': return ProjectStyleEnum.classic;
        case r'next-gen': return ProjectStyleEnum.nextGen;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ProjectStyleEnumTypeTransformer? _instance;
}


