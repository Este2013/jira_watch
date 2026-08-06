//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateProjectDetails {
  /// Returns a new [CreateProjectDetails] instance.
  CreateProjectDetails({
    this.assigneeType,
    this.avatarId,
    this.categoryId,
    this.description,
    this.fieldConfigurationScheme,
    this.fieldScheme,
    this.issueSecurityScheme,
    this.issueTypeScheme,
    this.issueTypeScreenScheme,
    required this.key,
    this.lead,
    this.leadAccountId,
    required this.name,
    this.notificationScheme,
    this.permissionScheme,
    this.projectTemplateKey,
    this.projectTypeKey,
    this.url,
    this.workflowScheme,
  });

  /// The default assignee when creating issues for this project.
  CreateProjectDetailsAssigneeTypeEnum? assigneeType;

  /// An integer value for the project's avatar.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? avatarId;

  /// The ID of the project's category. A complete list of category IDs is found using the [Get all project categories](#api-rest-api-3-projectCategory-get) operation.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? categoryId;

  /// A brief description of the project.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// Deprecated use [fieldScheme](https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-field-schemes/#api-group-field-schemes) instead. The ID of the field configuration scheme for the project. Use the [Get all field configuration schemes](#api-rest-api-3-fieldconfigurationscheme-get) operation to get a list of field configuration scheme IDs. If you specify the field configuration scheme you cannot specify the project template key.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? fieldConfigurationScheme;

  /// The ID of the field scheme for the project. Use the [Get field schemes](#api-rest-api-3-config-fieldschemes-get) operation to get a list of field scheme IDs. If you specify the field scheme you cannot specify the project template key.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? fieldScheme;

  /// The ID of the issue security scheme for the project, which enables you to control who can and cannot view issues. Use the [Get issue security schemes](#api-rest-api-3-issuesecurityschemes-get) resource to get all issue security scheme IDs.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? issueSecurityScheme;

  /// The ID of the issue type scheme for the project. Use the [Get all issue type schemes](#api-rest-api-3-issuetypescheme-get) operation to get a list of issue type scheme IDs. If you specify the issue type scheme you cannot specify the project template key.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? issueTypeScheme;

  /// The ID of the issue type screen scheme for the project. Use the [Get all issue type screen schemes](#api-rest-api-3-issuetypescreenscheme-get) operation to get a list of issue type screen scheme IDs. If you specify the issue type screen scheme you cannot specify the project template key.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? issueTypeScreenScheme;

  /// Project keys must be unique and start with an uppercase letter followed by one or more uppercase alphanumeric characters. The maximum length is 10 characters.
  String key;

  /// This parameter is deprecated because of privacy changes. Use `leadAccountId` instead. See the [migration guide](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details. The user name of the project lead. Either `lead` or `leadAccountId` must be set when creating a project. Cannot be provided with `leadAccountId`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lead;

  /// The account ID of the project lead. Either `lead` or `leadAccountId` must be set when creating a project. Cannot be provided with `lead`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? leadAccountId;

  /// The name of the project.
  String name;

  /// The ID of the notification scheme for the project. Use the [Get notification schemes](#api-rest-api-3-notificationscheme-get) resource to get a list of notification scheme IDs.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? notificationScheme;

  /// The ID of the permission scheme for the project. Use the [Get all permission schemes](#api-rest-api-3-permissionscheme-get) resource to see a list of all permission scheme IDs.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? permissionScheme;

  /// A predefined configuration for a project. The type of the `projectTemplateKey` must match with the type of the `projectTypeKey`.
  CreateProjectDetailsProjectTemplateKeyEnum? projectTemplateKey;

  /// The [project type](https://confluence.atlassian.com/x/GwiiLQ#Jiraapplicationsoverview-Productfeaturesandprojecttypes), which defines the application-specific feature set. If you don't specify the project template you have to specify the project type.
  CreateProjectDetailsProjectTypeKeyEnum? projectTypeKey;

  /// A link to information about this project, such as project documentation
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? url;

  /// The ID of the workflow scheme for the project. Use the [Get all workflow schemes](#api-rest-api-3-workflowscheme-get) operation to get a list of workflow scheme IDs. If you specify the workflow scheme you cannot specify the project template key.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? workflowScheme;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateProjectDetails &&
    other.assigneeType == assigneeType &&
    other.avatarId == avatarId &&
    other.categoryId == categoryId &&
    other.description == description &&
    other.fieldConfigurationScheme == fieldConfigurationScheme &&
    other.fieldScheme == fieldScheme &&
    other.issueSecurityScheme == issueSecurityScheme &&
    other.issueTypeScheme == issueTypeScheme &&
    other.issueTypeScreenScheme == issueTypeScreenScheme &&
    other.key == key &&
    other.lead == lead &&
    other.leadAccountId == leadAccountId &&
    other.name == name &&
    other.notificationScheme == notificationScheme &&
    other.permissionScheme == permissionScheme &&
    other.projectTemplateKey == projectTemplateKey &&
    other.projectTypeKey == projectTypeKey &&
    other.url == url &&
    other.workflowScheme == workflowScheme;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (assigneeType == null ? 0 : assigneeType!.hashCode) +
    (avatarId == null ? 0 : avatarId!.hashCode) +
    (categoryId == null ? 0 : categoryId!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (fieldConfigurationScheme == null ? 0 : fieldConfigurationScheme!.hashCode) +
    (fieldScheme == null ? 0 : fieldScheme!.hashCode) +
    (issueSecurityScheme == null ? 0 : issueSecurityScheme!.hashCode) +
    (issueTypeScheme == null ? 0 : issueTypeScheme!.hashCode) +
    (issueTypeScreenScheme == null ? 0 : issueTypeScreenScheme!.hashCode) +
    (key.hashCode) +
    (lead == null ? 0 : lead!.hashCode) +
    (leadAccountId == null ? 0 : leadAccountId!.hashCode) +
    (name.hashCode) +
    (notificationScheme == null ? 0 : notificationScheme!.hashCode) +
    (permissionScheme == null ? 0 : permissionScheme!.hashCode) +
    (projectTemplateKey == null ? 0 : projectTemplateKey!.hashCode) +
    (projectTypeKey == null ? 0 : projectTypeKey!.hashCode) +
    (url == null ? 0 : url!.hashCode) +
    (workflowScheme == null ? 0 : workflowScheme!.hashCode);

  @override
  String toString() => 'CreateProjectDetails[assigneeType=$assigneeType, avatarId=$avatarId, categoryId=$categoryId, description=$description, fieldConfigurationScheme=$fieldConfigurationScheme, fieldScheme=$fieldScheme, issueSecurityScheme=$issueSecurityScheme, issueTypeScheme=$issueTypeScheme, issueTypeScreenScheme=$issueTypeScreenScheme, key=$key, lead=$lead, leadAccountId=$leadAccountId, name=$name, notificationScheme=$notificationScheme, permissionScheme=$permissionScheme, projectTemplateKey=$projectTemplateKey, projectTypeKey=$projectTypeKey, url=$url, workflowScheme=$workflowScheme]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.assigneeType != null) {
      json[r'assigneeType'] = this.assigneeType;
    } else {
      json[r'assigneeType'] = null;
    }
    if (this.avatarId != null) {
      json[r'avatarId'] = this.avatarId;
    } else {
      json[r'avatarId'] = null;
    }
    if (this.categoryId != null) {
      json[r'categoryId'] = this.categoryId;
    } else {
      json[r'categoryId'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.fieldConfigurationScheme != null) {
      json[r'fieldConfigurationScheme'] = this.fieldConfigurationScheme;
    } else {
      json[r'fieldConfigurationScheme'] = null;
    }
    if (this.fieldScheme != null) {
      json[r'fieldScheme'] = this.fieldScheme;
    } else {
      json[r'fieldScheme'] = null;
    }
    if (this.issueSecurityScheme != null) {
      json[r'issueSecurityScheme'] = this.issueSecurityScheme;
    } else {
      json[r'issueSecurityScheme'] = null;
    }
    if (this.issueTypeScheme != null) {
      json[r'issueTypeScheme'] = this.issueTypeScheme;
    } else {
      json[r'issueTypeScheme'] = null;
    }
    if (this.issueTypeScreenScheme != null) {
      json[r'issueTypeScreenScheme'] = this.issueTypeScreenScheme;
    } else {
      json[r'issueTypeScreenScheme'] = null;
    }
      json[r'key'] = this.key;
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
      json[r'name'] = this.name;
    if (this.notificationScheme != null) {
      json[r'notificationScheme'] = this.notificationScheme;
    } else {
      json[r'notificationScheme'] = null;
    }
    if (this.permissionScheme != null) {
      json[r'permissionScheme'] = this.permissionScheme;
    } else {
      json[r'permissionScheme'] = null;
    }
    if (this.projectTemplateKey != null) {
      json[r'projectTemplateKey'] = this.projectTemplateKey;
    } else {
      json[r'projectTemplateKey'] = null;
    }
    if (this.projectTypeKey != null) {
      json[r'projectTypeKey'] = this.projectTypeKey;
    } else {
      json[r'projectTypeKey'] = null;
    }
    if (this.url != null) {
      json[r'url'] = this.url;
    } else {
      json[r'url'] = null;
    }
    if (this.workflowScheme != null) {
      json[r'workflowScheme'] = this.workflowScheme;
    } else {
      json[r'workflowScheme'] = null;
    }
    return json;
  }

  /// Returns a new [CreateProjectDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateProjectDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'key'), 'Required key "CreateProjectDetails[key]" is missing from JSON.');
        assert(json[r'key'] != null, 'Required key "CreateProjectDetails[key]" has a null value in JSON.');
        assert(json.containsKey(r'name'), 'Required key "CreateProjectDetails[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "CreateProjectDetails[name]" has a null value in JSON.');
        return true;
      }());

      return CreateProjectDetails(
        assigneeType: CreateProjectDetailsAssigneeTypeEnum.fromJson(json[r'assigneeType']),
        avatarId: mapValueOfType<int>(json, r'avatarId'),
        categoryId: mapValueOfType<int>(json, r'categoryId'),
        description: mapValueOfType<String>(json, r'description'),
        fieldConfigurationScheme: mapValueOfType<int>(json, r'fieldConfigurationScheme'),
        fieldScheme: mapValueOfType<int>(json, r'fieldScheme'),
        issueSecurityScheme: mapValueOfType<int>(json, r'issueSecurityScheme'),
        issueTypeScheme: mapValueOfType<int>(json, r'issueTypeScheme'),
        issueTypeScreenScheme: mapValueOfType<int>(json, r'issueTypeScreenScheme'),
        key: mapValueOfType<String>(json, r'key')!,
        lead: mapValueOfType<String>(json, r'lead'),
        leadAccountId: mapValueOfType<String>(json, r'leadAccountId'),
        name: mapValueOfType<String>(json, r'name')!,
        notificationScheme: mapValueOfType<int>(json, r'notificationScheme'),
        permissionScheme: mapValueOfType<int>(json, r'permissionScheme'),
        projectTemplateKey: CreateProjectDetailsProjectTemplateKeyEnum.fromJson(json[r'projectTemplateKey']),
        projectTypeKey: CreateProjectDetailsProjectTypeKeyEnum.fromJson(json[r'projectTypeKey']),
        url: mapValueOfType<String>(json, r'url'),
        workflowScheme: mapValueOfType<int>(json, r'workflowScheme'),
      );
    }
    return null;
  }

  static List<CreateProjectDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateProjectDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateProjectDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateProjectDetails> mapFromJson(dynamic json) {
    final map = <String, CreateProjectDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateProjectDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateProjectDetails-objects as value to a dart map
  static Map<String, List<CreateProjectDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateProjectDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateProjectDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'key',
    'name',
  };
}

/// The default assignee when creating issues for this project.
enum CreateProjectDetailsAssigneeTypeEnum {
  PROJECT_LEAD._(r'PROJECT_LEAD'),
  UNASSIGNED._(r'UNASSIGNED'),
  ;

  /// Instantiate a new enum with the provided value.
  const CreateProjectDetailsAssigneeTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [CreateProjectDetailsAssigneeTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static CreateProjectDetailsAssigneeTypeEnum? fromJson(dynamic value) => CreateProjectDetailsAssigneeTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [CreateProjectDetailsAssigneeTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<CreateProjectDetailsAssigneeTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateProjectDetailsAssigneeTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateProjectDetailsAssigneeTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CreateProjectDetailsAssigneeTypeEnum] to String,
/// and [decode] dynamic data back to [CreateProjectDetailsAssigneeTypeEnum].
class CreateProjectDetailsAssigneeTypeEnumTypeTransformer {
  factory CreateProjectDetailsAssigneeTypeEnumTypeTransformer() => _instance ??= const CreateProjectDetailsAssigneeTypeEnumTypeTransformer._();

  const CreateProjectDetailsAssigneeTypeEnumTypeTransformer._();

  String encode(CreateProjectDetailsAssigneeTypeEnum data) => data._value;

  /// Returns the instance of [CreateProjectDetailsAssigneeTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CreateProjectDetailsAssigneeTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is CreateProjectDetailsAssigneeTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'PROJECT_LEAD': return CreateProjectDetailsAssigneeTypeEnum.PROJECT_LEAD;
        case r'UNASSIGNED': return CreateProjectDetailsAssigneeTypeEnum.UNASSIGNED;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static CreateProjectDetailsAssigneeTypeEnumTypeTransformer? _instance;
}


/// A predefined configuration for a project. The type of the `projectTemplateKey` must match with the type of the `projectTypeKey`.
enum CreateProjectDetailsProjectTemplateKeyEnum {
  comPeriodPyxisPeriodGreenhopperPeriodJiraColonGhSimplifiedAgilityKanban._(r'com.pyxis.greenhopper.jira:gh-simplified-agility-kanban'),
  comPeriodPyxisPeriodGreenhopperPeriodJiraColonGhSimplifiedAgilityScrum._(r'com.pyxis.greenhopper.jira:gh-simplified-agility-scrum'),
  comPeriodPyxisPeriodGreenhopperPeriodJiraColonGhSimplifiedBasic._(r'com.pyxis.greenhopper.jira:gh-simplified-basic'),
  comPeriodPyxisPeriodGreenhopperPeriodJiraColonGhSimplifiedKanbanClassic._(r'com.pyxis.greenhopper.jira:gh-simplified-kanban-classic'),
  comPeriodPyxisPeriodGreenhopperPeriodJiraColonGhSimplifiedScrumClassic._(r'com.pyxis.greenhopper.jira:gh-simplified-scrum-classic'),
  comPeriodPyxisPeriodGreenhopperPeriodJiraColonGhCrossTeamTemplate._(r'com.pyxis.greenhopper.jira:gh-cross-team-template'),
  comPeriodPyxisPeriodGreenhopperPeriodJiraColonGhCrossTeamPlanningTemplate._(r'com.pyxis.greenhopper.jira:gh-cross-team-planning-template'),
  comPeriodAtlassianPeriodServicedeskColonSimplifiedItServiceManagement._(r'com.atlassian.servicedesk:simplified-it-service-management'),
  comPeriodAtlassianPeriodServicedeskColonSimplifiedItServiceManagementBasic._(r'com.atlassian.servicedesk:simplified-it-service-management-basic'),
  comPeriodAtlassianPeriodServicedeskColonSimplifiedItServiceManagementOperations._(r'com.atlassian.servicedesk:simplified-it-service-management-operations'),
  comPeriodAtlassianPeriodServicedeskColonSimplifiedInternalServiceDesk._(r'com.atlassian.servicedesk:simplified-internal-service-desk'),
  comPeriodAtlassianPeriodServicedeskColonSimplifiedExternalServiceDesk._(r'com.atlassian.servicedesk:simplified-external-service-desk'),
  comPeriodAtlassianPeriodServicedeskColonSimplifiedHrServiceDesk._(r'com.atlassian.servicedesk:simplified-hr-service-desk'),
  comPeriodAtlassianPeriodServicedeskColonSimplifiedFacilitiesServiceDesk._(r'com.atlassian.servicedesk:simplified-facilities-service-desk'),
  comPeriodAtlassianPeriodServicedeskColonSimplifiedLegalServiceDesk._(r'com.atlassian.servicedesk:simplified-legal-service-desk'),
  comPeriodAtlassianPeriodServicedeskColonSimplifiedMarketingServiceDesk._(r'com.atlassian.servicedesk:simplified-marketing-service-desk'),
  comPeriodAtlassianPeriodServicedeskColonSimplifiedFinanceServiceDesk._(r'com.atlassian.servicedesk:simplified-finance-service-desk'),
  comPeriodAtlassianPeriodServicedeskColonSimplifiedAnalyticsServiceDesk._(r'com.atlassian.servicedesk:simplified-analytics-service-desk'),
  comPeriodAtlassianPeriodServicedeskColonSimplifiedDesignServiceDesk._(r'com.atlassian.servicedesk:simplified-design-service-desk'),
  comPeriodAtlassianPeriodServicedeskColonSimplifiedSalesServiceDesk._(r'com.atlassian.servicedesk:simplified-sales-service-desk'),
  comPeriodAtlassianPeriodServicedeskColonSimplifiedHalpServiceDesk._(r'com.atlassian.servicedesk:simplified-halp-service-desk'),
  comPeriodAtlassianPeriodServicedeskColonNextGenItServiceDesk._(r'com.atlassian.servicedesk:next-gen-it-service-desk'),
  comPeriodAtlassianPeriodServicedeskColonNextGenHrServiceDesk._(r'com.atlassian.servicedesk:next-gen-hr-service-desk'),
  comPeriodAtlassianPeriodServicedeskColonNextGenLegalServiceDesk._(r'com.atlassian.servicedesk:next-gen-legal-service-desk'),
  comPeriodAtlassianPeriodServicedeskColonNextGenMarketingServiceDesk._(r'com.atlassian.servicedesk:next-gen-marketing-service-desk'),
  comPeriodAtlassianPeriodServicedeskColonNextGenFacilitiesServiceDesk._(r'com.atlassian.servicedesk:next-gen-facilities-service-desk'),
  comPeriodAtlassianPeriodServicedeskColonNextGenAnalyticsServiceDesk._(r'com.atlassian.servicedesk:next-gen-analytics-service-desk'),
  comPeriodAtlassianPeriodServicedeskColonNextGenFinanceServiceDesk._(r'com.atlassian.servicedesk:next-gen-finance-service-desk'),
  comPeriodAtlassianPeriodServicedeskColonNextGenDesignServiceDesk._(r'com.atlassian.servicedesk:next-gen-design-service-desk'),
  comPeriodAtlassianPeriodServicedeskColonNextGenSalesServiceDesk._(r'com.atlassian.servicedesk:next-gen-sales-service-desk'),
  comPeriodAtlassianPeriodServicedeskColonCompanyManagedBlankServiceProject._(r'com.atlassian.servicedesk:company-managed-blank-service-project'),
  comPeriodAtlassianPeriodServicedeskColonCompanyManagedGeneralServiceProject._(r'com.atlassian.servicedesk:company-managed-general-service-project'),
  comPeriodAtlassianPeriodServicedeskColonTeamManagedGeneralServiceProject._(r'com.atlassian.servicedesk:team-managed-general-service-project'),
  comPeriodAtlassianPeriodJiraCoreProjectTemplatesColonJiraCoreSimplifiedContentManagement._(r'com.atlassian.jira-core-project-templates:jira-core-simplified-content-management'),
  comPeriodAtlassianPeriodJiraCoreProjectTemplatesColonJiraCoreSimplifiedDocumentApproval._(r'com.atlassian.jira-core-project-templates:jira-core-simplified-document-approval'),
  comPeriodAtlassianPeriodJiraCoreProjectTemplatesColonJiraCoreSimplifiedLeadTracking._(r'com.atlassian.jira-core-project-templates:jira-core-simplified-lead-tracking'),
  comPeriodAtlassianPeriodJiraCoreProjectTemplatesColonJiraCoreSimplifiedProcessControl._(r'com.atlassian.jira-core-project-templates:jira-core-simplified-process-control'),
  comPeriodAtlassianPeriodJiraCoreProjectTemplatesColonJiraCoreSimplifiedProcurement._(r'com.atlassian.jira-core-project-templates:jira-core-simplified-procurement'),
  comPeriodAtlassianPeriodJiraCoreProjectTemplatesColonJiraCoreSimplifiedProjectManagement._(r'com.atlassian.jira-core-project-templates:jira-core-simplified-project-management'),
  comPeriodAtlassianPeriodJiraCoreProjectTemplatesColonJiraCoreSimplifiedRecruitment._(r'com.atlassian.jira-core-project-templates:jira-core-simplified-recruitment'),
  comPeriodAtlassianPeriodJiraCoreProjectTemplatesColonJiraCoreSimplifiedTask._(r'com.atlassian.jira-core-project-templates:jira-core-simplified-task-'),
  comPeriodAtlassianPeriodJcsColonCustomerServiceManagement._(r'com.atlassian.jcs:customer-service-management'),
  ;

  /// Instantiate a new enum with the provided value.
  const CreateProjectDetailsProjectTemplateKeyEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [CreateProjectDetailsProjectTemplateKeyEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static CreateProjectDetailsProjectTemplateKeyEnum? fromJson(dynamic value) => CreateProjectDetailsProjectTemplateKeyEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [CreateProjectDetailsProjectTemplateKeyEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<CreateProjectDetailsProjectTemplateKeyEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateProjectDetailsProjectTemplateKeyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateProjectDetailsProjectTemplateKeyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CreateProjectDetailsProjectTemplateKeyEnum] to String,
/// and [decode] dynamic data back to [CreateProjectDetailsProjectTemplateKeyEnum].
class CreateProjectDetailsProjectTemplateKeyEnumTypeTransformer {
  factory CreateProjectDetailsProjectTemplateKeyEnumTypeTransformer() => _instance ??= const CreateProjectDetailsProjectTemplateKeyEnumTypeTransformer._();

  const CreateProjectDetailsProjectTemplateKeyEnumTypeTransformer._();

  String encode(CreateProjectDetailsProjectTemplateKeyEnum data) => data._value;

  /// Returns the instance of [CreateProjectDetailsProjectTemplateKeyEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CreateProjectDetailsProjectTemplateKeyEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is CreateProjectDetailsProjectTemplateKeyEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'com.pyxis.greenhopper.jira:gh-simplified-agility-kanban': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodPyxisPeriodGreenhopperPeriodJiraColonGhSimplifiedAgilityKanban;
        case r'com.pyxis.greenhopper.jira:gh-simplified-agility-scrum': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodPyxisPeriodGreenhopperPeriodJiraColonGhSimplifiedAgilityScrum;
        case r'com.pyxis.greenhopper.jira:gh-simplified-basic': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodPyxisPeriodGreenhopperPeriodJiraColonGhSimplifiedBasic;
        case r'com.pyxis.greenhopper.jira:gh-simplified-kanban-classic': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodPyxisPeriodGreenhopperPeriodJiraColonGhSimplifiedKanbanClassic;
        case r'com.pyxis.greenhopper.jira:gh-simplified-scrum-classic': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodPyxisPeriodGreenhopperPeriodJiraColonGhSimplifiedScrumClassic;
        case r'com.pyxis.greenhopper.jira:gh-cross-team-template': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodPyxisPeriodGreenhopperPeriodJiraColonGhCrossTeamTemplate;
        case r'com.pyxis.greenhopper.jira:gh-cross-team-planning-template': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodPyxisPeriodGreenhopperPeriodJiraColonGhCrossTeamPlanningTemplate;
        case r'com.atlassian.servicedesk:simplified-it-service-management': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodAtlassianPeriodServicedeskColonSimplifiedItServiceManagement;
        case r'com.atlassian.servicedesk:simplified-it-service-management-basic': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodAtlassianPeriodServicedeskColonSimplifiedItServiceManagementBasic;
        case r'com.atlassian.servicedesk:simplified-it-service-management-operations': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodAtlassianPeriodServicedeskColonSimplifiedItServiceManagementOperations;
        case r'com.atlassian.servicedesk:simplified-internal-service-desk': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodAtlassianPeriodServicedeskColonSimplifiedInternalServiceDesk;
        case r'com.atlassian.servicedesk:simplified-external-service-desk': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodAtlassianPeriodServicedeskColonSimplifiedExternalServiceDesk;
        case r'com.atlassian.servicedesk:simplified-hr-service-desk': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodAtlassianPeriodServicedeskColonSimplifiedHrServiceDesk;
        case r'com.atlassian.servicedesk:simplified-facilities-service-desk': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodAtlassianPeriodServicedeskColonSimplifiedFacilitiesServiceDesk;
        case r'com.atlassian.servicedesk:simplified-legal-service-desk': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodAtlassianPeriodServicedeskColonSimplifiedLegalServiceDesk;
        case r'com.atlassian.servicedesk:simplified-marketing-service-desk': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodAtlassianPeriodServicedeskColonSimplifiedMarketingServiceDesk;
        case r'com.atlassian.servicedesk:simplified-finance-service-desk': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodAtlassianPeriodServicedeskColonSimplifiedFinanceServiceDesk;
        case r'com.atlassian.servicedesk:simplified-analytics-service-desk': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodAtlassianPeriodServicedeskColonSimplifiedAnalyticsServiceDesk;
        case r'com.atlassian.servicedesk:simplified-design-service-desk': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodAtlassianPeriodServicedeskColonSimplifiedDesignServiceDesk;
        case r'com.atlassian.servicedesk:simplified-sales-service-desk': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodAtlassianPeriodServicedeskColonSimplifiedSalesServiceDesk;
        case r'com.atlassian.servicedesk:simplified-halp-service-desk': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodAtlassianPeriodServicedeskColonSimplifiedHalpServiceDesk;
        case r'com.atlassian.servicedesk:next-gen-it-service-desk': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodAtlassianPeriodServicedeskColonNextGenItServiceDesk;
        case r'com.atlassian.servicedesk:next-gen-hr-service-desk': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodAtlassianPeriodServicedeskColonNextGenHrServiceDesk;
        case r'com.atlassian.servicedesk:next-gen-legal-service-desk': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodAtlassianPeriodServicedeskColonNextGenLegalServiceDesk;
        case r'com.atlassian.servicedesk:next-gen-marketing-service-desk': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodAtlassianPeriodServicedeskColonNextGenMarketingServiceDesk;
        case r'com.atlassian.servicedesk:next-gen-facilities-service-desk': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodAtlassianPeriodServicedeskColonNextGenFacilitiesServiceDesk;
        case r'com.atlassian.servicedesk:next-gen-analytics-service-desk': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodAtlassianPeriodServicedeskColonNextGenAnalyticsServiceDesk;
        case r'com.atlassian.servicedesk:next-gen-finance-service-desk': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodAtlassianPeriodServicedeskColonNextGenFinanceServiceDesk;
        case r'com.atlassian.servicedesk:next-gen-design-service-desk': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodAtlassianPeriodServicedeskColonNextGenDesignServiceDesk;
        case r'com.atlassian.servicedesk:next-gen-sales-service-desk': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodAtlassianPeriodServicedeskColonNextGenSalesServiceDesk;
        case r'com.atlassian.servicedesk:company-managed-blank-service-project': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodAtlassianPeriodServicedeskColonCompanyManagedBlankServiceProject;
        case r'com.atlassian.servicedesk:company-managed-general-service-project': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodAtlassianPeriodServicedeskColonCompanyManagedGeneralServiceProject;
        case r'com.atlassian.servicedesk:team-managed-general-service-project': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodAtlassianPeriodServicedeskColonTeamManagedGeneralServiceProject;
        case r'com.atlassian.jira-core-project-templates:jira-core-simplified-content-management': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodAtlassianPeriodJiraCoreProjectTemplatesColonJiraCoreSimplifiedContentManagement;
        case r'com.atlassian.jira-core-project-templates:jira-core-simplified-document-approval': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodAtlassianPeriodJiraCoreProjectTemplatesColonJiraCoreSimplifiedDocumentApproval;
        case r'com.atlassian.jira-core-project-templates:jira-core-simplified-lead-tracking': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodAtlassianPeriodJiraCoreProjectTemplatesColonJiraCoreSimplifiedLeadTracking;
        case r'com.atlassian.jira-core-project-templates:jira-core-simplified-process-control': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodAtlassianPeriodJiraCoreProjectTemplatesColonJiraCoreSimplifiedProcessControl;
        case r'com.atlassian.jira-core-project-templates:jira-core-simplified-procurement': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodAtlassianPeriodJiraCoreProjectTemplatesColonJiraCoreSimplifiedProcurement;
        case r'com.atlassian.jira-core-project-templates:jira-core-simplified-project-management': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodAtlassianPeriodJiraCoreProjectTemplatesColonJiraCoreSimplifiedProjectManagement;
        case r'com.atlassian.jira-core-project-templates:jira-core-simplified-recruitment': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodAtlassianPeriodJiraCoreProjectTemplatesColonJiraCoreSimplifiedRecruitment;
        case r'com.atlassian.jira-core-project-templates:jira-core-simplified-task-': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodAtlassianPeriodJiraCoreProjectTemplatesColonJiraCoreSimplifiedTask;
        case r'com.atlassian.jcs:customer-service-management': return CreateProjectDetailsProjectTemplateKeyEnum.comPeriodAtlassianPeriodJcsColonCustomerServiceManagement;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static CreateProjectDetailsProjectTemplateKeyEnumTypeTransformer? _instance;
}


/// The [project type](https://confluence.atlassian.com/x/GwiiLQ#Jiraapplicationsoverview-Productfeaturesandprojecttypes), which defines the application-specific feature set. If you don't specify the project template you have to specify the project type.
enum CreateProjectDetailsProjectTypeKeyEnum {
  software._(r'software'),
  serviceDesk._(r'service_desk'),
  business._(r'business'),
  ;

  /// Instantiate a new enum with the provided value.
  const CreateProjectDetailsProjectTypeKeyEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [CreateProjectDetailsProjectTypeKeyEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static CreateProjectDetailsProjectTypeKeyEnum? fromJson(dynamic value) => CreateProjectDetailsProjectTypeKeyEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [CreateProjectDetailsProjectTypeKeyEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<CreateProjectDetailsProjectTypeKeyEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateProjectDetailsProjectTypeKeyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateProjectDetailsProjectTypeKeyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CreateProjectDetailsProjectTypeKeyEnum] to String,
/// and [decode] dynamic data back to [CreateProjectDetailsProjectTypeKeyEnum].
class CreateProjectDetailsProjectTypeKeyEnumTypeTransformer {
  factory CreateProjectDetailsProjectTypeKeyEnumTypeTransformer() => _instance ??= const CreateProjectDetailsProjectTypeKeyEnumTypeTransformer._();

  const CreateProjectDetailsProjectTypeKeyEnumTypeTransformer._();

  String encode(CreateProjectDetailsProjectTypeKeyEnum data) => data._value;

  /// Returns the instance of [CreateProjectDetailsProjectTypeKeyEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CreateProjectDetailsProjectTypeKeyEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is CreateProjectDetailsProjectTypeKeyEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'software': return CreateProjectDetailsProjectTypeKeyEnum.software;
        case r'service_desk': return CreateProjectDetailsProjectTypeKeyEnum.serviceDesk;
        case r'business': return CreateProjectDetailsProjectTypeKeyEnum.business;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static CreateProjectDetailsProjectTypeKeyEnumTypeTransformer? _instance;
}


