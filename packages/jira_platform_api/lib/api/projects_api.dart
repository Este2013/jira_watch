//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ProjectsApi {
  ProjectsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Archive project
  ///
  /// Archives a project. You can't delete a project if it's archived. To delete an archived project, restore the project and then delete it. To restore a project, use the Jira UI.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The project ID or project key (case sensitive).
  Future<Response> archiveProjectWithHttpInfo(String projectIdOrKey, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/project/{projectIdOrKey}/archive'
      .replaceAll('{projectIdOrKey}', projectIdOrKey);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      abortTrigger: abortTrigger,
    );
  }

  /// Archive project
  ///
  /// Archives a project. You can't delete a project if it's archived. To delete an archived project, restore the project and then delete it. To restore a project, use the Jira UI.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The project ID or project key (case sensitive).
  Future<Object?> archiveProject(String projectIdOrKey, { Future<void>? abortTrigger, }) async {
    final response = await archiveProjectWithHttpInfo(projectIdOrKey, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Object',) as Object;
    
    }
    return null;
  }

  /// Create project
  ///
  /// Creates a project based on a project type template, as shown in the following table:  | Project Type Key | Project Template Key |   |--|--|   | `business` | `com.atlassian.jira-core-project-templates:jira-core-simplified-content-management`, `com.atlassian.jira-core-project-templates:jira-core-simplified-document-approval`, `com.atlassian.jira-core-project-templates:jira-core-simplified-lead-tracking`, `com.atlassian.jira-core-project-templates:jira-core-simplified-process-control`, `com.atlassian.jira-core-project-templates:jira-core-simplified-procurement`, `com.atlassian.jira-core-project-templates:jira-core-simplified-project-management`, `com.atlassian.jira-core-project-templates:jira-core-simplified-recruitment`, `com.atlassian.jira-core-project-templates:jira-core-simplified-task-tracking` |   | `service_desk` | `com.atlassian.servicedesk:simplified-it-service-management`, `com.atlassian.servicedesk:simplified-external-service-desk`, `com.atlassian.servicedesk:simplified-hr-service-desk`, `com.atlassian.servicedesk:simplified-facilities-service-desk`, `com.atlassian.servicedesk:simplified-legal-service-desk`, `com.atlassian.servicedesk:simplified-analytics-service-desk`, `com.atlassian.servicedesk:simplified-marketing-service-desk`, `com.atlassian.servicedesk:simplified-design-service-desk`, `com.atlassian.servicedesk:simplified-sales-service-desk`, `com.atlassian.servicedesk:simplified-finance-service-desk`, `com.atlassian.servicedesk:company-managed-blank-service-project`, `com.atlassian.servicedesk:company-managed-general-service-project`, `com.atlassian.servicedesk:team-managed-general-service-project`, `com.atlassian.servicedesk:next-gen-it-service-desk`, `com.atlassian.servicedesk:next-gen-hr-service-desk`, `com.atlassian.servicedesk:next-gen-legal-service-desk`, `com.atlassian.servicedesk:next-gen-marketing-service-desk`, `com.atlassian.servicedesk:next-gen-facilities-service-desk`, `com.atlassian.servicedesk:next-gen-analytics-service-desk`, `com.atlassian.servicedesk:next-gen-finance-service-desk`, `com.atlassian.servicedesk:next-gen-design-service-desk`, `com.atlassian.servicedesk:next-gen-sales-service-desk` |   | `software` | `com.pyxis.greenhopper.jira:gh-simplified-agility-kanban`, `com.pyxis.greenhopper.jira:gh-simplified-agility-scrum`, `com.pyxis.greenhopper.jira:gh-simplified-basic`, `com.pyxis.greenhopper.jira:gh-simplified-kanban-classic`, `com.pyxis.greenhopper.jira:gh-simplified-scrum-classic` |   | `customer_service` | `com.atlassian.jcs:customer-service-management` |   The project types are available according to the installed Jira features as follows:   *  Jira Core, the default, enables `business` projects.  *  Jira Service Management enables `service_desk` projects.  *  Jira Software enables `software` projects.  To determine which features are installed, go to **Jira settings** > **Apps** > **Manage apps** and review the System Apps list. To add Jira Software or Jira Service Management into a JIRA instance, use **Jira settings** > **Apps** > **Finding new apps**. For more information, see [ Managing add-ons](https://confluence.atlassian.com/x/S31NLg).  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateProjectDetails] createProjectDetails (required):
  ///   The JSON representation of the project being created.
  Future<Response> createProjectWithHttpInfo(CreateProjectDetails createProjectDetails, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/project';

    // ignore: prefer_final_locals
    Object? postBody = createProjectDetails;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      abortTrigger: abortTrigger,
    );
  }

  /// Create project
  ///
  /// Creates a project based on a project type template, as shown in the following table:  | Project Type Key | Project Template Key |   |--|--|   | `business` | `com.atlassian.jira-core-project-templates:jira-core-simplified-content-management`, `com.atlassian.jira-core-project-templates:jira-core-simplified-document-approval`, `com.atlassian.jira-core-project-templates:jira-core-simplified-lead-tracking`, `com.atlassian.jira-core-project-templates:jira-core-simplified-process-control`, `com.atlassian.jira-core-project-templates:jira-core-simplified-procurement`, `com.atlassian.jira-core-project-templates:jira-core-simplified-project-management`, `com.atlassian.jira-core-project-templates:jira-core-simplified-recruitment`, `com.atlassian.jira-core-project-templates:jira-core-simplified-task-tracking` |   | `service_desk` | `com.atlassian.servicedesk:simplified-it-service-management`, `com.atlassian.servicedesk:simplified-external-service-desk`, `com.atlassian.servicedesk:simplified-hr-service-desk`, `com.atlassian.servicedesk:simplified-facilities-service-desk`, `com.atlassian.servicedesk:simplified-legal-service-desk`, `com.atlassian.servicedesk:simplified-analytics-service-desk`, `com.atlassian.servicedesk:simplified-marketing-service-desk`, `com.atlassian.servicedesk:simplified-design-service-desk`, `com.atlassian.servicedesk:simplified-sales-service-desk`, `com.atlassian.servicedesk:simplified-finance-service-desk`, `com.atlassian.servicedesk:company-managed-blank-service-project`, `com.atlassian.servicedesk:company-managed-general-service-project`, `com.atlassian.servicedesk:team-managed-general-service-project`, `com.atlassian.servicedesk:next-gen-it-service-desk`, `com.atlassian.servicedesk:next-gen-hr-service-desk`, `com.atlassian.servicedesk:next-gen-legal-service-desk`, `com.atlassian.servicedesk:next-gen-marketing-service-desk`, `com.atlassian.servicedesk:next-gen-facilities-service-desk`, `com.atlassian.servicedesk:next-gen-analytics-service-desk`, `com.atlassian.servicedesk:next-gen-finance-service-desk`, `com.atlassian.servicedesk:next-gen-design-service-desk`, `com.atlassian.servicedesk:next-gen-sales-service-desk` |   | `software` | `com.pyxis.greenhopper.jira:gh-simplified-agility-kanban`, `com.pyxis.greenhopper.jira:gh-simplified-agility-scrum`, `com.pyxis.greenhopper.jira:gh-simplified-basic`, `com.pyxis.greenhopper.jira:gh-simplified-kanban-classic`, `com.pyxis.greenhopper.jira:gh-simplified-scrum-classic` |   | `customer_service` | `com.atlassian.jcs:customer-service-management` |   The project types are available according to the installed Jira features as follows:   *  Jira Core, the default, enables `business` projects.  *  Jira Service Management enables `service_desk` projects.  *  Jira Software enables `software` projects.  To determine which features are installed, go to **Jira settings** > **Apps** > **Manage apps** and review the System Apps list. To add Jira Software or Jira Service Management into a JIRA instance, use **Jira settings** > **Apps** > **Finding new apps**. For more information, see [ Managing add-ons](https://confluence.atlassian.com/x/S31NLg).  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [CreateProjectDetails] createProjectDetails (required):
  ///   The JSON representation of the project being created.
  Future<ProjectIdentifiers?> createProject(CreateProjectDetails createProjectDetails, { Future<void>? abortTrigger, }) async {
    final response = await createProjectWithHttpInfo(createProjectDetails, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ProjectIdentifiers',) as ProjectIdentifiers;
    
    }
    return null;
  }

  /// Delete project
  ///
  /// Deletes a project.  You can't delete a project if it's archived. To delete an archived project, restore the project and then delete it. To restore a project, use the Jira UI.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The project ID or project key (case sensitive).
  ///
  /// * [bool] enableUndo:
  ///   Whether this project is placed in the Jira recycle bin where it will be available for restoration.
  Future<Response> deleteProjectWithHttpInfo(String projectIdOrKey, { bool? enableUndo, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/project/{projectIdOrKey}'
      .replaceAll('{projectIdOrKey}', projectIdOrKey);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (enableUndo != null) {
      queryParams.addAll(_queryParams('', 'enableUndo', enableUndo));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      abortTrigger: abortTrigger,
    );
  }

  /// Delete project
  ///
  /// Deletes a project.  You can't delete a project if it's archived. To delete an archived project, restore the project and then delete it. To restore a project, use the Jira UI.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The project ID or project key (case sensitive).
  ///
  /// * [bool] enableUndo:
  ///   Whether this project is placed in the Jira recycle bin where it will be available for restoration.
  Future<void> deleteProject(String projectIdOrKey, { bool? enableUndo, Future<void>? abortTrigger, }) async {
    final response = await deleteProjectWithHttpInfo(projectIdOrKey, enableUndo: enableUndo, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Delete project asynchronously
  ///
  /// Deletes a project asynchronously.  This operation is:   *  transactional, that is, if part of the delete fails the project is not deleted.  *  [asynchronous](#async). Follow the `location` link in the response to determine the status of the task and use [Get task](#api-rest-api-3-task-taskId-get) to obtain subsequent updates.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The project ID or project key (case sensitive).
  Future<Response> deleteProjectAsynchronouslyWithHttpInfo(String projectIdOrKey, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/project/{projectIdOrKey}/delete'
      .replaceAll('{projectIdOrKey}', projectIdOrKey);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      abortTrigger: abortTrigger,
    );
  }

  /// Delete project asynchronously
  ///
  /// Deletes a project asynchronously.  This operation is:   *  transactional, that is, if part of the delete fails the project is not deleted.  *  [asynchronous](#async). Follow the `location` link in the response to determine the status of the task and use [Get task](#api-rest-api-3-task-taskId-get) to obtain subsequent updates.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The project ID or project key (case sensitive).
  Future<void> deleteProjectAsynchronously(String projectIdOrKey, { Future<void>? abortTrigger, }) async {
    final response = await deleteProjectAsynchronouslyWithHttpInfo(projectIdOrKey, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get all projects
  ///
  /// Returns all projects visible to the user. Deprecated, use [ Get projects paginated](#api-rest-api-3-project-search-get) that supports search and pagination.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** Projects are returned only where the user has *Browse Projects* or *Administer projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expanded options include:   *  `description` Returns the project description.  *  `issueTypes` Returns all issue types associated with the project.  *  `lead` Returns information about the project lead.  *  `projectKeys` Returns all project keys associated with the project.
  ///
  /// * [int] recent:
  ///   Returns the user's most recently accessed projects. You may specify the number of results to return up to a maximum of 20. If access is anonymous, then the recently accessed projects are based on the current HTTP session.
  ///
  /// * [List<String>] properties:
  ///   A list of project properties to return for the project. This parameter accepts a comma-separated list.
  Future<Response> getAllProjectsWithHttpInfo({ String? expand, int? recent, List<String>? properties, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/project';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (expand != null) {
      queryParams.addAll(_queryParams('', 'expand', expand));
    }
    if (recent != null) {
      queryParams.addAll(_queryParams('', 'recent', recent));
    }
    if (properties != null) {
      queryParams.addAll(_queryParams('multi', 'properties', properties));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      abortTrigger: abortTrigger,
    );
  }

  /// Get all projects
  ///
  /// Returns all projects visible to the user. Deprecated, use [ Get projects paginated](#api-rest-api-3-project-search-get) that supports search and pagination.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** Projects are returned only where the user has *Browse Projects* or *Administer projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.
  ///
  /// Parameters:
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expanded options include:   *  `description` Returns the project description.  *  `issueTypes` Returns all issue types associated with the project.  *  `lead` Returns information about the project lead.  *  `projectKeys` Returns all project keys associated with the project.
  ///
  /// * [int] recent:
  ///   Returns the user's most recently accessed projects. You may specify the number of results to return up to a maximum of 20. If access is anonymous, then the recently accessed projects are based on the current HTTP session.
  ///
  /// * [List<String>] properties:
  ///   A list of project properties to return for the project. This parameter accepts a comma-separated list.
  Future<List<Project>?> getAllProjects({ String? expand, int? recent, List<String>? properties, Future<void>? abortTrigger, }) async {
    final response = await getAllProjectsWithHttpInfo(expand: expand, recent: recent, properties: properties, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<Project>') as List)
        .cast<Project>()
        .toList(growable: false);

    }
    return null;
  }

  /// Get all statuses for project
  ///
  /// Returns the valid statuses for a project. The statuses are grouped by issue type, as each project has a set of valid issue types and each issue type has a set of valid statuses.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The project ID or project key (case sensitive).
  Future<Response> getAllStatusesWithHttpInfo(String projectIdOrKey, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/project/{projectIdOrKey}/statuses'
      .replaceAll('{projectIdOrKey}', projectIdOrKey);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      abortTrigger: abortTrigger,
    );
  }

  /// Get all statuses for project
  ///
  /// Returns the valid statuses for a project. The statuses are grouped by issue type, as each project has a set of valid issue types and each issue type has a set of valid statuses.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The project ID or project key (case sensitive).
  Future<List<IssueTypeWithStatus>?> getAllStatuses(String projectIdOrKey, { Future<void>? abortTrigger, }) async {
    final response = await getAllStatusesWithHttpInfo(projectIdOrKey, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<IssueTypeWithStatus>') as List)
        .cast<IssueTypeWithStatus>()
        .toList(growable: false);

    }
    return null;
  }

  /// Get project issue type hierarchy
  ///
  /// Get the issue type hierarchy for a next-gen project.  The issue type hierarchy for a project consists of:   *  *Epic* at level 1 (optional).  *  One or more issue types at level 0 such as *Story*, *Task*, or *Bug*. Where the issue type *Epic* is defined, these issue types are used to break down the content of an epic.  *  *Subtask* at level -1 (optional). This issue type enables level 0 issue types to be broken down into components. Issues based on a level -1 issue type must have a parent issue.  **[Permissions](#permissions) required:** *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] projectId (required):
  ///   The ID of the project.
  Future<Response> getHierarchyWithHttpInfo(int projectId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/project/{projectId}/hierarchy'
      .replaceAll('{projectId}', projectId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      abortTrigger: abortTrigger,
    );
  }

  /// Get project issue type hierarchy
  ///
  /// Get the issue type hierarchy for a next-gen project.  The issue type hierarchy for a project consists of:   *  *Epic* at level 1 (optional).  *  One or more issue types at level 0 such as *Story*, *Task*, or *Bug*. Where the issue type *Epic* is defined, these issue types are used to break down the content of an epic.  *  *Subtask* at level -1 (optional). This issue type enables level 0 issue types to be broken down into components. Issues based on a level -1 issue type must have a parent issue.  **[Permissions](#permissions) required:** *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.
  ///
  /// Parameters:
  ///
  /// * [int] projectId (required):
  ///   The ID of the project.
  Future<ProjectIssueTypeHierarchy?> getHierarchy(int projectId, { Future<void>? abortTrigger, }) async {
    final response = await getHierarchyWithHttpInfo(projectId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ProjectIssueTypeHierarchy',) as ProjectIssueTypeHierarchy;
    
    }
    return null;
  }

  /// Get project notification scheme
  ///
  /// Gets a [notification scheme](https://confluence.atlassian.com/x/8YdKLg) associated with the project.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) or *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] projectKeyOrId (required):
  ///   The project ID or project key (case sensitive).
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expand options include:   *  `all` Returns all expandable information  *  `field` Returns information about any custom fields assigned to receive an event  *  `group` Returns information about any groups assigned to receive an event  *  `notificationSchemeEvents` Returns a list of event associations. This list is returned for all expandable information  *  `projectRole` Returns information about any project roles assigned to receive an event  *  `user` Returns information about any users assigned to receive an event
  Future<Response> getNotificationSchemeForProjectWithHttpInfo(String projectKeyOrId, { String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/project/{projectKeyOrId}/notificationscheme'
      .replaceAll('{projectKeyOrId}', projectKeyOrId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (expand != null) {
      queryParams.addAll(_queryParams('', 'expand', expand));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      abortTrigger: abortTrigger,
    );
  }

  /// Get project notification scheme
  ///
  /// Gets a [notification scheme](https://confluence.atlassian.com/x/8YdKLg) associated with the project.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) or *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg).
  ///
  /// Parameters:
  ///
  /// * [String] projectKeyOrId (required):
  ///   The project ID or project key (case sensitive).
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expand options include:   *  `all` Returns all expandable information  *  `field` Returns information about any custom fields assigned to receive an event  *  `group` Returns information about any groups assigned to receive an event  *  `notificationSchemeEvents` Returns a list of event associations. This list is returned for all expandable information  *  `projectRole` Returns information about any project roles assigned to receive an event  *  `user` Returns information about any users assigned to receive an event
  Future<NotificationScheme?> getNotificationSchemeForProject(String projectKeyOrId, { String? expand, Future<void>? abortTrigger, }) async {
    final response = await getNotificationSchemeForProjectWithHttpInfo(projectKeyOrId, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'NotificationScheme',) as NotificationScheme;
    
    }
    return null;
  }

  /// Get project
  ///
  /// Returns the [project details](https://confluence.atlassian.com/x/ahLpNw) for a project.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The project ID or project key (case sensitive).
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Note that the project description, issue types, and project lead are included in all responses by default. Expand options include:   *  `description` The project description.  *  `issueTypes` The issue types associated with the project.  *  `lead` The project lead.  *  `projectKeys` All project keys associated with the project.  *  `issueTypeHierarchy` The project issue type hierarchy.
  ///
  /// * [List<String>] properties:
  ///   A list of project properties to return for the project. This parameter accepts a comma-separated list.
  Future<Response> getProjectWithHttpInfo(String projectIdOrKey, { String? expand, List<String>? properties, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/project/{projectIdOrKey}'
      .replaceAll('{projectIdOrKey}', projectIdOrKey);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (expand != null) {
      queryParams.addAll(_queryParams('', 'expand', expand));
    }
    if (properties != null) {
      queryParams.addAll(_queryParams('multi', 'properties', properties));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      abortTrigger: abortTrigger,
    );
  }

  /// Get project
  ///
  /// Returns the [project details](https://confluence.atlassian.com/x/ahLpNw) for a project.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The project ID or project key (case sensitive).
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Note that the project description, issue types, and project lead are included in all responses by default. Expand options include:   *  `description` The project description.  *  `issueTypes` The issue types associated with the project.  *  `lead` The project lead.  *  `projectKeys` All project keys associated with the project.  *  `issueTypeHierarchy` The project issue type hierarchy.
  ///
  /// * [List<String>] properties:
  ///   A list of project properties to return for the project. This parameter accepts a comma-separated list.
  Future<Project?> getProject(String projectIdOrKey, { String? expand, List<String>? properties, Future<void>? abortTrigger, }) async {
    final response = await getProjectWithHttpInfo(projectIdOrKey, expand: expand, properties: properties, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Project',) as Project;
    
    }
    return null;
  }

  /// Get recent projects
  ///
  /// Returns a list of up to 20 projects recently viewed by the user that are still visible to the user.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** Projects are returned only where the user has one of:   *  *Browse Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.  *  *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.  *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expanded options include:   *  `description` Returns the project description.  *  `projectKeys` Returns all project keys associated with a project.  *  `lead` Returns information about the project lead.  *  `issueTypes` Returns all issue types associated with the project.  *  `url` Returns the URL associated with the project.  *  `permissions` Returns the permissions associated with the project.  *  `insight` EXPERIMENTAL. Returns the insight details of total issue count and last issue update time for the project.  *  `*` Returns the project with all available expand options.
  ///
  /// * [List<Object>] properties:
  ///   EXPERIMENTAL. A list of project properties to return for the project. This parameter accepts a comma-separated list. Invalid property names are ignored.
  Future<Response> getRecentWithHttpInfo({ String? expand, List<Object>? properties, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/project/recent';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (expand != null) {
      queryParams.addAll(_queryParams('', 'expand', expand));
    }
    if (properties != null) {
      queryParams.addAll(_queryParams('multi', 'properties', properties));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      abortTrigger: abortTrigger,
    );
  }

  /// Get recent projects
  ///
  /// Returns a list of up to 20 projects recently viewed by the user that are still visible to the user.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** Projects are returned only where the user has one of:   *  *Browse Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.  *  *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.  *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expanded options include:   *  `description` Returns the project description.  *  `projectKeys` Returns all project keys associated with a project.  *  `lead` Returns information about the project lead.  *  `issueTypes` Returns all issue types associated with the project.  *  `url` Returns the URL associated with the project.  *  `permissions` Returns the permissions associated with the project.  *  `insight` EXPERIMENTAL. Returns the insight details of total issue count and last issue update time for the project.  *  `*` Returns the project with all available expand options.
  ///
  /// * [List<Object>] properties:
  ///   EXPERIMENTAL. A list of project properties to return for the project. This parameter accepts a comma-separated list. Invalid property names are ignored.
  Future<List<Project>?> getRecent({ String? expand, List<Object>? properties, Future<void>? abortTrigger, }) async {
    final response = await getRecentWithHttpInfo(expand: expand, properties: properties, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<Project>') as List)
        .cast<Project>()
        .toList(growable: false);

    }
    return null;
  }

  /// Restore deleted or archived project
  ///
  /// Restores a project that has been archived or placed in the Jira recycle bin.  **[Permissions](#permissions) required:**   *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg)for Company managed projects.  *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) or *Administer projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project for Team managed projects.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The project ID or project key (case sensitive).
  Future<Response> restoreWithHttpInfo(String projectIdOrKey, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/project/{projectIdOrKey}/restore'
      .replaceAll('{projectIdOrKey}', projectIdOrKey);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      abortTrigger: abortTrigger,
    );
  }

  /// Restore deleted or archived project
  ///
  /// Restores a project that has been archived or placed in the Jira recycle bin.  **[Permissions](#permissions) required:**   *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg)for Company managed projects.  *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) or *Administer projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project for Team managed projects.
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The project ID or project key (case sensitive).
  Future<Project?> restore(String projectIdOrKey, { Future<void>? abortTrigger, }) async {
    final response = await restoreWithHttpInfo(projectIdOrKey, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Project',) as Project;
    
    }
    return null;
  }

  /// Get projects paginated
  ///
  /// Returns a [paginated](#pagination) list of projects visible to the user.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** Projects are returned only where the user has one of:   *  *Browse Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.  *  *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.  *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page. Must be less than or equal to 100. If a value greater than 100 is provided, the `maxResults` parameter will default to 100.
  ///
  /// * [String] orderBy:
  ///   [Order](#ordering) the results by a field.   *  `category` Sorts by project category. A complete list of category IDs is found using [Get all project categories](#api-rest-api-3-projectCategory-get).  *  `issueCount` Sorts by the total number of issues in each project.  *  `key` Sorts by project key.  *  `lastIssueUpdatedTime` Sorts by the last issue update time.  *  `name` Sorts by project name.  *  `owner` Sorts by project lead.  *  `archivedDate` EXPERIMENTAL. Sorts by project archived date.  *  `deletedDate` EXPERIMENTAL. Sorts by project deleted date.
  ///
  /// * [List<int>] id:
  ///   The project IDs to filter the results by. To include multiple IDs, provide an ampersand-separated list. For example, `id=10000&id=10001`. Up to 50 project IDs can be provided.
  ///
  /// * [List<String>] keys:
  ///   The project keys to filter the results by. To include multiple keys, provide an ampersand-separated list. For example, `keys=PA&keys=PB`. Up to 50 project keys can be provided.
  ///
  /// * [String] query:
  ///   Filter the results using a literal string. Projects with a matching `key` or `name` are returned (case insensitive).
  ///
  /// * [String] typeKey:
  ///   Orders results by the [project type](https://confluence.atlassian.com/x/GwiiLQ#Jiraapplicationsoverview-Productfeaturesandprojecttypes). This parameter accepts a comma-separated list. Valid values are `business`, `service_desk`, and `software`.
  ///
  /// * [int] categoryId:
  ///   The ID of the project's category. A complete list of category IDs is found using the [Get all project categories](#api-rest-api-3-projectCategory-get) operation.
  ///
  /// * [String] action:
  ///   Filter results by projects for which the user can:   *  `view` the project, meaning that they have one of the following permissions:           *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.      *  *Administer projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.      *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).  *  `browse` the project, meaning that they have the *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.  *  `edit` the project, meaning that they have one of the following permissions:           *  *Administer projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.      *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).  *  `create` the project, meaning that they have the *Create issues* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project in which the issue is created.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expanded options include:   *  `description` Returns the project description.  *  `projectKeys` Returns all project keys associated with a project.  *  `lead` Returns information about the project lead.  *  `issueTypes` Returns all issue types associated with the project.  *  `url` Returns the URL associated with the project.  *  `insight` EXPERIMENTAL. Returns the insight details of total issue count and last issue update time for the project.
  ///
  /// * [List<String>] status:
  ///   EXPERIMENTAL. Filter results by project status:   *  `live` Search live projects.  *  `archived` Search archived projects.  *  `deleted` Search deleted projects, those in the recycle bin.
  ///
  /// * [List<Object>] properties:
  ///   EXPERIMENTAL. A list of project properties to return for the project. This parameter accepts a comma-separated list.
  ///
  /// * [String] propertyQuery:
  ///   EXPERIMENTAL. A query string used to search properties. The query string cannot be specified using a JSON object. For example, to search for the value of `nested` from `{\"something\":{\"nested\":1,\"other\":2}}` use `[thepropertykey].something.nested=1`. Note that the propertyQuery key is enclosed in square brackets to enable searching where the propertyQuery key includes dot (.) or equals (=) characters. Note that `thepropertykey` is only returned when included in `properties`.
  Future<Response> searchProjectsWithHttpInfo({ int? startAt, int? maxResults, String? orderBy, List<int>? id, List<String>? keys, String? query, String? typeKey, int? categoryId, String? action, String? expand, List<String>? status, List<Object>? properties, String? propertyQuery, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/project/search';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (startAt != null) {
      queryParams.addAll(_queryParams('', 'startAt', startAt));
    }
    if (maxResults != null) {
      queryParams.addAll(_queryParams('', 'maxResults', maxResults));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'orderBy', orderBy));
    }
    if (id != null) {
      queryParams.addAll(_queryParams('multi', 'id', id));
    }
    if (keys != null) {
      queryParams.addAll(_queryParams('multi', 'keys', keys));
    }
    if (query != null) {
      queryParams.addAll(_queryParams('', 'query', query));
    }
    if (typeKey != null) {
      queryParams.addAll(_queryParams('', 'typeKey', typeKey));
    }
    if (categoryId != null) {
      queryParams.addAll(_queryParams('', 'categoryId', categoryId));
    }
    if (action != null) {
      queryParams.addAll(_queryParams('', 'action', action));
    }
    if (expand != null) {
      queryParams.addAll(_queryParams('', 'expand', expand));
    }
    if (status != null) {
      queryParams.addAll(_queryParams('multi', 'status', status));
    }
    if (properties != null) {
      queryParams.addAll(_queryParams('multi', 'properties', properties));
    }
    if (propertyQuery != null) {
      queryParams.addAll(_queryParams('', 'propertyQuery', propertyQuery));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      abortTrigger: abortTrigger,
    );
  }

  /// Get projects paginated
  ///
  /// Returns a [paginated](#pagination) list of projects visible to the user.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** Projects are returned only where the user has one of:   *  *Browse Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.  *  *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.  *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page. Must be less than or equal to 100. If a value greater than 100 is provided, the `maxResults` parameter will default to 100.
  ///
  /// * [String] orderBy:
  ///   [Order](#ordering) the results by a field.   *  `category` Sorts by project category. A complete list of category IDs is found using [Get all project categories](#api-rest-api-3-projectCategory-get).  *  `issueCount` Sorts by the total number of issues in each project.  *  `key` Sorts by project key.  *  `lastIssueUpdatedTime` Sorts by the last issue update time.  *  `name` Sorts by project name.  *  `owner` Sorts by project lead.  *  `archivedDate` EXPERIMENTAL. Sorts by project archived date.  *  `deletedDate` EXPERIMENTAL. Sorts by project deleted date.
  ///
  /// * [List<int>] id:
  ///   The project IDs to filter the results by. To include multiple IDs, provide an ampersand-separated list. For example, `id=10000&id=10001`. Up to 50 project IDs can be provided.
  ///
  /// * [List<String>] keys:
  ///   The project keys to filter the results by. To include multiple keys, provide an ampersand-separated list. For example, `keys=PA&keys=PB`. Up to 50 project keys can be provided.
  ///
  /// * [String] query:
  ///   Filter the results using a literal string. Projects with a matching `key` or `name` are returned (case insensitive).
  ///
  /// * [String] typeKey:
  ///   Orders results by the [project type](https://confluence.atlassian.com/x/GwiiLQ#Jiraapplicationsoverview-Productfeaturesandprojecttypes). This parameter accepts a comma-separated list. Valid values are `business`, `service_desk`, and `software`.
  ///
  /// * [int] categoryId:
  ///   The ID of the project's category. A complete list of category IDs is found using the [Get all project categories](#api-rest-api-3-projectCategory-get) operation.
  ///
  /// * [String] action:
  ///   Filter results by projects for which the user can:   *  `view` the project, meaning that they have one of the following permissions:           *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.      *  *Administer projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.      *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).  *  `browse` the project, meaning that they have the *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.  *  `edit` the project, meaning that they have one of the following permissions:           *  *Administer projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.      *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).  *  `create` the project, meaning that they have the *Create issues* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project in which the issue is created.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expanded options include:   *  `description` Returns the project description.  *  `projectKeys` Returns all project keys associated with a project.  *  `lead` Returns information about the project lead.  *  `issueTypes` Returns all issue types associated with the project.  *  `url` Returns the URL associated with the project.  *  `insight` EXPERIMENTAL. Returns the insight details of total issue count and last issue update time for the project.
  ///
  /// * [List<String>] status:
  ///   EXPERIMENTAL. Filter results by project status:   *  `live` Search live projects.  *  `archived` Search archived projects.  *  `deleted` Search deleted projects, those in the recycle bin.
  ///
  /// * [List<Object>] properties:
  ///   EXPERIMENTAL. A list of project properties to return for the project. This parameter accepts a comma-separated list.
  ///
  /// * [String] propertyQuery:
  ///   EXPERIMENTAL. A query string used to search properties. The query string cannot be specified using a JSON object. For example, to search for the value of `nested` from `{\"something\":{\"nested\":1,\"other\":2}}` use `[thepropertykey].something.nested=1`. Note that the propertyQuery key is enclosed in square brackets to enable searching where the propertyQuery key includes dot (.) or equals (=) characters. Note that `thepropertykey` is only returned when included in `properties`.
  Future<PageBeanProject?> searchProjects({ int? startAt, int? maxResults, String? orderBy, List<int>? id, List<String>? keys, String? query, String? typeKey, int? categoryId, String? action, String? expand, List<String>? status, List<Object>? properties, String? propertyQuery, Future<void>? abortTrigger, }) async {
    final response = await searchProjectsWithHttpInfo(startAt: startAt, maxResults: maxResults, orderBy: orderBy, id: id, keys: keys, query: query, typeKey: typeKey, categoryId: categoryId, action: action, expand: expand, status: status, properties: properties, propertyQuery: propertyQuery, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanProject',) as PageBeanProject;
    
    }
    return null;
  }

  /// Update project
  ///
  /// Updates the [project details](https://confluence.atlassian.com/x/ahLpNw) of a project.  All parameters are optional in the body of the request. Schemes will only be updated if they are included in the request, any omitted schemes will be left unchanged.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg). is only needed when changing the schemes or project key. Otherwise you will only need *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg)
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The project ID or project key (case sensitive).
  ///
  /// * [UpdateProjectDetails] updateProjectDetails (required):
  ///   The project details to be updated.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Note that the project description, issue types, and project lead are included in all responses by default. Expand options include:   *  `description` The project description.  *  `issueTypes` The issue types associated with the project.  *  `lead` The project lead.  *  `projectKeys` All project keys associated with the project.
  Future<Response> updateProjectWithHttpInfo(String projectIdOrKey, UpdateProjectDetails updateProjectDetails, { String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/project/{projectIdOrKey}'
      .replaceAll('{projectIdOrKey}', projectIdOrKey);

    // ignore: prefer_final_locals
    Object? postBody = updateProjectDetails;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (expand != null) {
      queryParams.addAll(_queryParams('', 'expand', expand));
    }

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      abortTrigger: abortTrigger,
    );
  }

  /// Update project
  ///
  /// Updates the [project details](https://confluence.atlassian.com/x/ahLpNw) of a project.  All parameters are optional in the body of the request. Schemes will only be updated if they are included in the request, any omitted schemes will be left unchanged.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg). is only needed when changing the schemes or project key. Otherwise you will only need *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg)
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The project ID or project key (case sensitive).
  ///
  /// * [UpdateProjectDetails] updateProjectDetails (required):
  ///   The project details to be updated.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Note that the project description, issue types, and project lead are included in all responses by default. Expand options include:   *  `description` The project description.  *  `issueTypes` The issue types associated with the project.  *  `lead` The project lead.  *  `projectKeys` All project keys associated with the project.
  Future<Project?> updateProject(String projectIdOrKey, UpdateProjectDetails updateProjectDetails, { String? expand, Future<void>? abortTrigger, }) async {
    final response = await updateProjectWithHttpInfo(projectIdOrKey, updateProjectDetails, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Project',) as Project;
    
    }
    return null;
  }
}
