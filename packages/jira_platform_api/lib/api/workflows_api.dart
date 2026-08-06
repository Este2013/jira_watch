//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class WorkflowsApi {
  WorkflowsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Bulk create workflows
  ///
  /// Create workflows and related statuses.  **[Permissions](#permissions) required:**   *  *Administer Jira* project permission to create all, including global-scoped, workflows  *  *Administer projects* project permissions to create project-scoped workflows
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [WorkflowCreateRequest] workflowCreateRequest (required):
  Future<Response> createWorkflowsWithHttpInfo(WorkflowCreateRequest workflowCreateRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflows/create';

    // ignore: prefer_final_locals
    Object? postBody = workflowCreateRequest;

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

  /// Bulk create workflows
  ///
  /// Create workflows and related statuses.  **[Permissions](#permissions) required:**   *  *Administer Jira* project permission to create all, including global-scoped, workflows  *  *Administer projects* project permissions to create project-scoped workflows
  ///
  /// Parameters:
  ///
  /// * [WorkflowCreateRequest] workflowCreateRequest (required):
  Future<WorkflowCreateResponse?> createWorkflows(WorkflowCreateRequest workflowCreateRequest, { Future<void>? abortTrigger, }) async {
    final response = await createWorkflowsWithHttpInfo(workflowCreateRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'WorkflowCreateResponse',) as WorkflowCreateResponse;
    
    }
    return null;
  }

  /// Delete inactive workflow
  ///
  /// Deletes a workflow.  The workflow cannot be deleted if it is:   *  an active workflow.  *  a system workflow.  *  associated with any workflow scheme.  *  associated with any draft workflow scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] entityId (required):
  ///   The entity ID of the workflow.
  Future<Response> deleteInactiveWorkflowWithHttpInfo(String entityId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflow/{entityId}'
      .replaceAll('{entityId}', entityId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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

  /// Delete inactive workflow
  ///
  /// Deletes a workflow.  The workflow cannot be deleted if it is:   *  an active workflow.  *  a system workflow.  *  associated with any workflow scheme.  *  associated with any draft workflow scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] entityId (required):
  ///   The entity ID of the workflow.
  Future<void> deleteInactiveWorkflow(String entityId, { Future<void>? abortTrigger, }) async {
    final response = await deleteInactiveWorkflowWithHttpInfo(entityId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get the user's default workflow editor
  ///
  /// Get the user's default workflow editor. This can be either the new editor or the legacy editor.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> getDefaultEditorWithHttpInfo({ Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflows/defaultEditor';

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

  /// Get the user's default workflow editor
  ///
  /// Get the user's default workflow editor. This can be either the new editor or the legacy editor.
  Future<DefaultWorkflowEditorResponse?> getDefaultEditor({ Future<void>? abortTrigger, }) async {
    final response = await getDefaultEditorWithHttpInfo(abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'DefaultWorkflowEditorResponse',) as DefaultWorkflowEditorResponse;
    
    }
    return null;
  }

  /// Get projects using a given workflow
  ///
  /// Returns a page of projects using a given workflow.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] workflowId (required):
  ///   The workflow ID
  ///
  /// * [String] nextPageToken:
  ///   The cursor for pagination
  ///
  /// * [int] maxResults:
  ///   The maximum number of results to return. Must be an integer between 1 and 200.
  Future<Response> getProjectUsagesForWorkflowWithHttpInfo(String workflowId, { String? nextPageToken, int? maxResults, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflow/{workflowId}/projectUsages'
      .replaceAll('{workflowId}', workflowId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (nextPageToken != null) {
      queryParams.addAll(_queryParams('', 'nextPageToken', nextPageToken));
    }
    if (maxResults != null) {
      queryParams.addAll(_queryParams('', 'maxResults', maxResults));
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

  /// Get projects using a given workflow
  ///
  /// Returns a page of projects using a given workflow.
  ///
  /// Parameters:
  ///
  /// * [String] workflowId (required):
  ///   The workflow ID
  ///
  /// * [String] nextPageToken:
  ///   The cursor for pagination
  ///
  /// * [int] maxResults:
  ///   The maximum number of results to return. Must be an integer between 1 and 200.
  Future<WorkflowProjectUsageDTO?> getProjectUsagesForWorkflow(String workflowId, { String? nextPageToken, int? maxResults, Future<void>? abortTrigger, }) async {
    final response = await getProjectUsagesForWorkflowWithHttpInfo(workflowId, nextPageToken: nextPageToken, maxResults: maxResults, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'WorkflowProjectUsageDTO',) as WorkflowProjectUsageDTO;
    
    }
    return null;
  }

  /// Get issue types in a project that are using a given workflow
  ///
  /// Returns a page of issue types using a given workflow within a project.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] workflowId (required):
  ///   The workflow ID
  ///
  /// * [int] projectId (required):
  ///   The project ID
  ///
  /// * [String] nextPageToken:
  ///   The cursor for pagination
  ///
  /// * [int] maxResults:
  ///   The maximum number of results to return. Must be an integer between 1 and 200.
  Future<Response> getWorkflowProjectIssueTypeUsagesWithHttpInfo(String workflowId, int projectId, { String? nextPageToken, int? maxResults, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflow/{workflowId}/project/{projectId}/issueTypeUsages'
      .replaceAll('{workflowId}', workflowId)
      .replaceAll('{projectId}', projectId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (nextPageToken != null) {
      queryParams.addAll(_queryParams('', 'nextPageToken', nextPageToken));
    }
    if (maxResults != null) {
      queryParams.addAll(_queryParams('', 'maxResults', maxResults));
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

  /// Get issue types in a project that are using a given workflow
  ///
  /// Returns a page of issue types using a given workflow within a project.
  ///
  /// Parameters:
  ///
  /// * [String] workflowId (required):
  ///   The workflow ID
  ///
  /// * [int] projectId (required):
  ///   The project ID
  ///
  /// * [String] nextPageToken:
  ///   The cursor for pagination
  ///
  /// * [int] maxResults:
  ///   The maximum number of results to return. Must be an integer between 1 and 200.
  Future<WorkflowProjectIssueTypeUsageDTO?> getWorkflowProjectIssueTypeUsages(String workflowId, int projectId, { String? nextPageToken, int? maxResults, Future<void>? abortTrigger, }) async {
    final response = await getWorkflowProjectIssueTypeUsagesWithHttpInfo(workflowId, projectId, nextPageToken: nextPageToken, maxResults: maxResults, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'WorkflowProjectIssueTypeUsageDTO',) as WorkflowProjectIssueTypeUsageDTO;
    
    }
    return null;
  }

  /// Get workflow schemes which are using a given workflow
  ///
  /// Returns a page of workflow schemes using a given workflow.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] workflowId (required):
  ///   The workflow ID
  ///
  /// * [String] nextPageToken:
  ///   The cursor for pagination
  ///
  /// * [int] maxResults:
  ///   The maximum number of results to return. Must be an integer between 1 and 200.
  Future<Response> getWorkflowSchemeUsagesForWorkflowWithHttpInfo(String workflowId, { String? nextPageToken, int? maxResults, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflow/{workflowId}/workflowSchemes'
      .replaceAll('{workflowId}', workflowId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (nextPageToken != null) {
      queryParams.addAll(_queryParams('', 'nextPageToken', nextPageToken));
    }
    if (maxResults != null) {
      queryParams.addAll(_queryParams('', 'maxResults', maxResults));
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

  /// Get workflow schemes which are using a given workflow
  ///
  /// Returns a page of workflow schemes using a given workflow.
  ///
  /// Parameters:
  ///
  /// * [String] workflowId (required):
  ///   The workflow ID
  ///
  /// * [String] nextPageToken:
  ///   The cursor for pagination
  ///
  /// * [int] maxResults:
  ///   The maximum number of results to return. Must be an integer between 1 and 200.
  Future<WorkflowSchemeUsageDTO?> getWorkflowSchemeUsagesForWorkflow(String workflowId, { String? nextPageToken, int? maxResults, Future<void>? abortTrigger, }) async {
    final response = await getWorkflowSchemeUsagesForWorkflowWithHttpInfo(workflowId, nextPageToken: nextPageToken, maxResults: maxResults, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'WorkflowSchemeUsageDTO',) as WorkflowSchemeUsageDTO;
    
    }
    return null;
  }

  /// Get workflows paginated
  ///
  /// This will be removed on [June 1, 2026](https://developer.atlassian.com/cloud/jira/platform/changelog/#CHANGE-2569); use [Search workflows](#api-rest-api-3-workflows-search-get) instead.  Returns a [paginated](#pagination) list of published classic workflows. When workflow names are specified, details of those workflows are returned. Otherwise, all published classic workflows are returned.  This operation does not return next-gen workflows.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [List<String>] workflowName:
  ///   The name of a workflow to return. To include multiple workflows, provide an ampersand-separated list. For example, `workflowName=name1&workflowName=name2`.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expand options include:   *  `transitions` For each workflow, returns information about the transitions inside the workflow.  *  `transitions.rules` For each workflow transition, returns information about its rules. Transitions are included automatically if this expand is requested.  *  `transitions.properties` For each workflow transition, returns information about its properties. Transitions are included automatically if this expand is requested.  *  `statuses` For each workflow, returns information about the statuses inside the workflow.  *  `statuses.properties` For each workflow status, returns information about its properties. Statuses are included automatically if this expand is requested.  *  `default` For each workflow, returns information about whether this is the default workflow.  *  `schemes` For each workflow, returns information about the workflow schemes the workflow is assigned to.  *  `projects` For each workflow, returns information about the projects the workflow is assigned to, through workflow schemes.  *  `hasDraftWorkflow` For each workflow, returns information about whether the workflow has a draft version.  *  `operations` For each workflow, returns information about the actions that can be undertaken on the workflow.
  ///
  /// * [String] queryString:
  ///   String used to perform a case-insensitive partial match with workflow name.
  ///
  /// * [String] orderBy:
  ///   [Order](#ordering) the results by a field:   *  `name` Sorts by workflow name.  *  `created` Sorts by create time.  *  `updated` Sorts by update time.
  ///
  /// * [bool] isActive:
  ///   Filters active and inactive workflows.
  Future<Response> getWorkflowsPaginatedWithHttpInfo({ int? startAt, int? maxResults, List<String>? workflowName, String? expand, String? queryString, String? orderBy, bool? isActive, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflow/search';

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
    if (workflowName != null) {
      queryParams.addAll(_queryParams('multi', 'workflowName', workflowName));
    }
    if (expand != null) {
      queryParams.addAll(_queryParams('', 'expand', expand));
    }
    if (queryString != null) {
      queryParams.addAll(_queryParams('', 'queryString', queryString));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'orderBy', orderBy));
    }
    if (isActive != null) {
      queryParams.addAll(_queryParams('', 'isActive', isActive));
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

  /// Get workflows paginated
  ///
  /// This will be removed on [June 1, 2026](https://developer.atlassian.com/cloud/jira/platform/changelog/#CHANGE-2569); use [Search workflows](#api-rest-api-3-workflows-search-get) instead.  Returns a [paginated](#pagination) list of published classic workflows. When workflow names are specified, details of those workflows are returned. Otherwise, all published classic workflows are returned.  This operation does not return next-gen workflows.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [List<String>] workflowName:
  ///   The name of a workflow to return. To include multiple workflows, provide an ampersand-separated list. For example, `workflowName=name1&workflowName=name2`.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expand options include:   *  `transitions` For each workflow, returns information about the transitions inside the workflow.  *  `transitions.rules` For each workflow transition, returns information about its rules. Transitions are included automatically if this expand is requested.  *  `transitions.properties` For each workflow transition, returns information about its properties. Transitions are included automatically if this expand is requested.  *  `statuses` For each workflow, returns information about the statuses inside the workflow.  *  `statuses.properties` For each workflow status, returns information about its properties. Statuses are included automatically if this expand is requested.  *  `default` For each workflow, returns information about whether this is the default workflow.  *  `schemes` For each workflow, returns information about the workflow schemes the workflow is assigned to.  *  `projects` For each workflow, returns information about the projects the workflow is assigned to, through workflow schemes.  *  `hasDraftWorkflow` For each workflow, returns information about whether the workflow has a draft version.  *  `operations` For each workflow, returns information about the actions that can be undertaken on the workflow.
  ///
  /// * [String] queryString:
  ///   String used to perform a case-insensitive partial match with workflow name.
  ///
  /// * [String] orderBy:
  ///   [Order](#ordering) the results by a field:   *  `name` Sorts by workflow name.  *  `created` Sorts by create time.  *  `updated` Sorts by update time.
  ///
  /// * [bool] isActive:
  ///   Filters active and inactive workflows.
  Future<PageBeanWorkflow?> getWorkflowsPaginated({ int? startAt, int? maxResults, List<String>? workflowName, String? expand, String? queryString, String? orderBy, bool? isActive, Future<void>? abortTrigger, }) async {
    final response = await getWorkflowsPaginatedWithHttpInfo(startAt: startAt, maxResults: maxResults, workflowName: workflowName, expand: expand, queryString: queryString, orderBy: orderBy, isActive: isActive, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanWorkflow',) as PageBeanWorkflow;
    
    }
    return null;
  }

  /// List workflow history entries
  ///
  /// Returns a list of workflow history entries for a specified workflow id.  **Note:** Stored workflow data expires after 60 days. Additionally, no data from before the 30th of October 2025 is available.  **[Permissions](#permissions) required:**   *  *Administer Jira* global permission to access all, including project-scoped, workflows  *  At least one of the *Administer projects* and *View (read-only) workflow* project permissions to access project-scoped workflows
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [WorkflowHistoryListRequest] workflowHistoryListRequest (required):
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expand options include:   *  `includeIntermediateWorkflows` Includes intermediate workflow versions that are sometimes created during workflow updates or migrations. By default, these are omitted from the response.
  Future<Response> listWorkflowHistoryWithHttpInfo(WorkflowHistoryListRequest workflowHistoryListRequest, { String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflow/history/list';

    // ignore: prefer_final_locals
    Object? postBody = workflowHistoryListRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (expand != null) {
      queryParams.addAll(_queryParams('', 'expand', expand));
    }

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

  /// List workflow history entries
  ///
  /// Returns a list of workflow history entries for a specified workflow id.  **Note:** Stored workflow data expires after 60 days. Additionally, no data from before the 30th of October 2025 is available.  **[Permissions](#permissions) required:**   *  *Administer Jira* global permission to access all, including project-scoped, workflows  *  At least one of the *Administer projects* and *View (read-only) workflow* project permissions to access project-scoped workflows
  ///
  /// Parameters:
  ///
  /// * [WorkflowHistoryListRequest] workflowHistoryListRequest (required):
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expand options include:   *  `includeIntermediateWorkflows` Includes intermediate workflow versions that are sometimes created during workflow updates or migrations. By default, these are omitted from the response.
  Future<WorkflowHistoryListResponseDTO?> listWorkflowHistory(WorkflowHistoryListRequest workflowHistoryListRequest, { String? expand, Future<void>? abortTrigger, }) async {
    final response = await listWorkflowHistoryWithHttpInfo(workflowHistoryListRequest, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'WorkflowHistoryListResponseDTO',) as WorkflowHistoryListResponseDTO;
    
    }
    return null;
  }

  /// Read workflow version from history
  ///
  /// Returns a workflow and related statuses for a specified workflow id and version number.  **Note:** Stored workflow data expires after 60 days. Additionally, no data from before the 30th of October 2025 is available.  **[Permissions](#permissions) required:**   *  *Administer Jira* global permission to access all, including project-scoped, workflows  *  At least one of the *Administer projects* and *View (read-only) workflow* project permissions to access project-scoped workflows
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [WorkflowHistoryReadRequest] workflowHistoryReadRequest (required):
  Future<Response> readWorkflowFromHistoryWithHttpInfo(WorkflowHistoryReadRequest workflowHistoryReadRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflow/history';

    // ignore: prefer_final_locals
    Object? postBody = workflowHistoryReadRequest;

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

  /// Read workflow version from history
  ///
  /// Returns a workflow and related statuses for a specified workflow id and version number.  **Note:** Stored workflow data expires after 60 days. Additionally, no data from before the 30th of October 2025 is available.  **[Permissions](#permissions) required:**   *  *Administer Jira* global permission to access all, including project-scoped, workflows  *  At least one of the *Administer projects* and *View (read-only) workflow* project permissions to access project-scoped workflows
  ///
  /// Parameters:
  ///
  /// * [WorkflowHistoryReadRequest] workflowHistoryReadRequest (required):
  Future<WorkflowHistoryReadResponseDTO?> readWorkflowFromHistory(WorkflowHistoryReadRequest workflowHistoryReadRequest, { Future<void>? abortTrigger, }) async {
    final response = await readWorkflowFromHistoryWithHttpInfo(workflowHistoryReadRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'WorkflowHistoryReadResponseDTO',) as WorkflowHistoryReadResponseDTO;
    
    }
    return null;
  }

  /// Preview workflow
  ///
  /// Returns a requested workflow within a given project. The response provides a read-only preview of the workflow, omitting full configuration details.  **[Permissions](#permissions) required:**   *  At least one of the *Administer projects* and *View (read-only) workflow* project permissions
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [WorkflowPreviewRequest] workflowPreviewRequest (required):
  Future<Response> readWorkflowPreviewsWithHttpInfo(WorkflowPreviewRequest workflowPreviewRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflows/preview';

    // ignore: prefer_final_locals
    Object? postBody = workflowPreviewRequest;

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

  /// Preview workflow
  ///
  /// Returns a requested workflow within a given project. The response provides a read-only preview of the workflow, omitting full configuration details.  **[Permissions](#permissions) required:**   *  At least one of the *Administer projects* and *View (read-only) workflow* project permissions
  ///
  /// Parameters:
  ///
  /// * [WorkflowPreviewRequest] workflowPreviewRequest (required):
  Future<WorkflowPreviewResponse?> readWorkflowPreviews(WorkflowPreviewRequest workflowPreviewRequest, { Future<void>? abortTrigger, }) async {
    final response = await readWorkflowPreviewsWithHttpInfo(workflowPreviewRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'WorkflowPreviewResponse',) as WorkflowPreviewResponse;
    
    }
    return null;
  }

  /// Bulk get workflows
  ///
  /// Returns a list of workflows and related statuses by providing workflow names, workflow IDs, or project and issue types.  **[Permissions](#permissions) required:**   *  *Administer Jira* global permission to access all, including project-scoped, workflows  *  At least one of the *Administer projects* and *View (read-only) workflow* project permissions to access project-scoped workflows
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [WorkflowReadRequest] workflowReadRequest (required):
  Future<Response> readWorkflowsWithHttpInfo(WorkflowReadRequest workflowReadRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflows';

    // ignore: prefer_final_locals
    Object? postBody = workflowReadRequest;

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

  /// Bulk get workflows
  ///
  /// Returns a list of workflows and related statuses by providing workflow names, workflow IDs, or project and issue types.  **[Permissions](#permissions) required:**   *  *Administer Jira* global permission to access all, including project-scoped, workflows  *  At least one of the *Administer projects* and *View (read-only) workflow* project permissions to access project-scoped workflows
  ///
  /// Parameters:
  ///
  /// * [WorkflowReadRequest] workflowReadRequest (required):
  Future<WorkflowReadResponse?> readWorkflows(WorkflowReadRequest workflowReadRequest, { Future<void>? abortTrigger, }) async {
    final response = await readWorkflowsWithHttpInfo(workflowReadRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'WorkflowReadResponse',) as WorkflowReadResponse;
    
    }
    return null;
  }

  /// Search workflows
  ///
  /// Returns a [paginated](#pagination) list of global and project workflows. If workflow names are specified in the query string, details of those workflows are returned. Otherwise, all workflows are returned.  **[Permissions](#permissions) required:**   *  *Administer Jira* global permission to access all, including project-scoped, workflows  *  At least one of the *Administer projects* and *View (read-only) workflow* project permissions to access project-scoped workflows
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expand options include:   *  `values.transitions` Returns the transitions that each workflow is associated with.
  ///
  /// * [String] queryString:
  ///   String used to perform a case-insensitive partial match with workflow name.
  ///
  /// * [String] orderBy:
  ///   [Order](#ordering) the results by a field:   *  `name` Sorts by workflow name.  *  `created` Sorts by create time.  *  `updated` Sorts by update time.
  ///
  /// * [String] scope:
  ///   The scope of the workflow. Global for company-managed projects and Project for team-managed projects.
  ///
  /// * [bool] isActive:
  ///   Filters active and inactive workflows.
  ///
  /// * [int] projectId:
  ///   The ID of the project to filter the workflows by. Only workflows associated with the given project are returned.
  Future<Response> searchWorkflowsWithHttpInfo({ int? startAt, int? maxResults, String? expand, String? queryString, String? orderBy, String? scope, bool? isActive, int? projectId, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflows/search';

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
    if (expand != null) {
      queryParams.addAll(_queryParams('', 'expand', expand));
    }
    if (queryString != null) {
      queryParams.addAll(_queryParams('', 'queryString', queryString));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'orderBy', orderBy));
    }
    if (scope != null) {
      queryParams.addAll(_queryParams('', 'scope', scope));
    }
    if (isActive != null) {
      queryParams.addAll(_queryParams('', 'isActive', isActive));
    }
    if (projectId != null) {
      queryParams.addAll(_queryParams('', 'projectId', projectId));
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

  /// Search workflows
  ///
  /// Returns a [paginated](#pagination) list of global and project workflows. If workflow names are specified in the query string, details of those workflows are returned. Otherwise, all workflows are returned.  **[Permissions](#permissions) required:**   *  *Administer Jira* global permission to access all, including project-scoped, workflows  *  At least one of the *Administer projects* and *View (read-only) workflow* project permissions to access project-scoped workflows
  ///
  /// Parameters:
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expand options include:   *  `values.transitions` Returns the transitions that each workflow is associated with.
  ///
  /// * [String] queryString:
  ///   String used to perform a case-insensitive partial match with workflow name.
  ///
  /// * [String] orderBy:
  ///   [Order](#ordering) the results by a field:   *  `name` Sorts by workflow name.  *  `created` Sorts by create time.  *  `updated` Sorts by update time.
  ///
  /// * [String] scope:
  ///   The scope of the workflow. Global for company-managed projects and Project for team-managed projects.
  ///
  /// * [bool] isActive:
  ///   Filters active and inactive workflows.
  ///
  /// * [int] projectId:
  ///   The ID of the project to filter the workflows by. Only workflows associated with the given project are returned.
  Future<WorkflowSearchResponse?> searchWorkflows({ int? startAt, int? maxResults, String? expand, String? queryString, String? orderBy, String? scope, bool? isActive, int? projectId, Future<void>? abortTrigger, }) async {
    final response = await searchWorkflowsWithHttpInfo(startAt: startAt, maxResults: maxResults, expand: expand, queryString: queryString, orderBy: orderBy, scope: scope, isActive: isActive, projectId: projectId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'WorkflowSearchResponse',) as WorkflowSearchResponse;
    
    }
    return null;
  }

  /// Bulk update workflows
  ///
  /// Update workflows and related statuses.  **[Permissions](#permissions) required:**   *  *Administer Jira* project permission to create all, including global-scoped, workflows  *  *Administer projects* project permissions to create project-scoped workflows
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [WorkflowUpdateRequest] workflowUpdateRequest (required):
  Future<Response> updateWorkflowsWithHttpInfo(WorkflowUpdateRequest workflowUpdateRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflows/update';

    // ignore: prefer_final_locals
    Object? postBody = workflowUpdateRequest;

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

  /// Bulk update workflows
  ///
  /// Update workflows and related statuses.  **[Permissions](#permissions) required:**   *  *Administer Jira* project permission to create all, including global-scoped, workflows  *  *Administer projects* project permissions to create project-scoped workflows
  ///
  /// Parameters:
  ///
  /// * [WorkflowUpdateRequest] workflowUpdateRequest (required):
  Future<WorkflowUpdateResponse?> updateWorkflows(WorkflowUpdateRequest workflowUpdateRequest, { Future<void>? abortTrigger, }) async {
    final response = await updateWorkflowsWithHttpInfo(workflowUpdateRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'WorkflowUpdateResponse',) as WorkflowUpdateResponse;
    
    }
    return null;
  }

  /// Validate create workflows
  ///
  /// Validate the payload for bulk create workflows.  **[Permissions](#permissions) required:**   *  *Administer Jira* project permission to create all, including global-scoped, workflows  *  *Administer projects* project permissions to create project-scoped workflows
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [WorkflowCreateValidateRequest] workflowCreateValidateRequest (required):
  Future<Response> validateCreateWorkflowsWithHttpInfo(WorkflowCreateValidateRequest workflowCreateValidateRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflows/create/validation';

    // ignore: prefer_final_locals
    Object? postBody = workflowCreateValidateRequest;

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

  /// Validate create workflows
  ///
  /// Validate the payload for bulk create workflows.  **[Permissions](#permissions) required:**   *  *Administer Jira* project permission to create all, including global-scoped, workflows  *  *Administer projects* project permissions to create project-scoped workflows
  ///
  /// Parameters:
  ///
  /// * [WorkflowCreateValidateRequest] workflowCreateValidateRequest (required):
  Future<WorkflowValidationErrorList?> validateCreateWorkflows(WorkflowCreateValidateRequest workflowCreateValidateRequest, { Future<void>? abortTrigger, }) async {
    final response = await validateCreateWorkflowsWithHttpInfo(workflowCreateValidateRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'WorkflowValidationErrorList',) as WorkflowValidationErrorList;
    
    }
    return null;
  }

  /// Validate update workflows
  ///
  /// Validate the payload for bulk update workflows.  **[Permissions](#permissions) required:**   *  *Administer Jira* project permission to create all, including global-scoped, workflows  *  *Administer projects* project permissions to create project-scoped workflows
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [WorkflowUpdateValidateRequestBean] workflowUpdateValidateRequestBean (required):
  Future<Response> validateUpdateWorkflowsWithHttpInfo(WorkflowUpdateValidateRequestBean workflowUpdateValidateRequestBean, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflows/update/validation';

    // ignore: prefer_final_locals
    Object? postBody = workflowUpdateValidateRequestBean;

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

  /// Validate update workflows
  ///
  /// Validate the payload for bulk update workflows.  **[Permissions](#permissions) required:**   *  *Administer Jira* project permission to create all, including global-scoped, workflows  *  *Administer projects* project permissions to create project-scoped workflows
  ///
  /// Parameters:
  ///
  /// * [WorkflowUpdateValidateRequestBean] workflowUpdateValidateRequestBean (required):
  Future<WorkflowValidationErrorList?> validateUpdateWorkflows(WorkflowUpdateValidateRequestBean workflowUpdateValidateRequestBean, { Future<void>? abortTrigger, }) async {
    final response = await validateUpdateWorkflowsWithHttpInfo(workflowUpdateValidateRequestBean, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'WorkflowValidationErrorList',) as WorkflowValidationErrorList;
    
    }
    return null;
  }

  /// Get available workflow capabilities
  ///
  /// Get the list of workflow capabilities for a specific workflow using either the workflow ID, or the project and issue type ID pair. The response includes the scope of the workflow, defined as global/project-based, and a list of project types that the workflow is scoped to. It also includes all rules organised into their broad categories (conditions, validators, actions, triggers, screens) as well as the source location (Atlassian-provided, Connect, Forge).  **[Permissions](#permissions) required:**   *  *Administer Jira* project permission to access all, including global-scoped, workflows  *  *Administer projects* project permissions to access project-scoped workflows  The current list of Atlassian-provided rules:  #### Validators ####  A validator rule that checks if a user has the required permissions to execute the transition in the workflow.  ##### Permission validator #####  A validator rule that checks if a user has the required permissions to execute the transition in the workflow.      {        \"ruleKey\": \"system:check-permission-validator\",        \"parameters\": {          \"permissionKey\": \"ADMINISTER_PROJECTS\"        }      }  Parameters:   *  `permissionKey` The permission required to perform the transition. Allowed values: [built-in Jira permissions](https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-permission-schemes/#built-in-permissions).  ##### Parent or child blocking validator #####  A validator to block the child issue's transition depending on the parent issue's status.      {        \"ruleKey\" : \"system:parent-or-child-blocking-validator\"        \"parameters\" : {          \"blocker\" : \"PARENT\"          \"statusIds\" : \"1,2,3\"        }      }  Parameters:   *  `blocker` currently only supports `PARENT`.  *  `statusIds` a comma-separated list of status IDs.  ##### Previous status validator #####  A validator that checks if an issue has transitioned through specified previous status(es) before allowing the current transition to occur.      {        \"ruleKey\": \"system:previous-status-validator\",        \"parameters\": {          \"previousStatusIds\": \"10014\",          \"mostRecentStatusOnly\": \"true\"        }      }  Parameters:   *  `previousStatusIds` a comma-separated list of status IDs, currently only support one ID.  *  `mostRecentStatusOnly` when `true` only considers the most recent status for the condition evaluation. Allowed values: `true`, `false`.  ##### Validate a field value #####  A validation that ensures a specific field's value meets the defined criteria before allowing an issue to transition in the workflow.  Depending on the rule type, the result will vary:  ###### Field required ######      {        \"ruleKey\": \"system:validate-field-value\",        \"parameters\": {          \"ruleType\": \"fieldRequired\",          \"fieldsRequired\": \"assignee\",          \"ignoreContext\": \"true\",          \"errorMessage\": \"An assignee must be set!\"        }      }  Parameters:   *  `fieldsRequired` the ID of the field that is required. For a custom field, it would look like `customfield_123`.  *  `ignoreContext` controls the impact of context settings on field validation. When set to `true`, the validator doesn't check a required field if its context isn't configured for the current issue. When set to `false`, the validator requires a field even if its context is invalid. Allowed values: `true`, `false`.  *  `errorMessage` is the error message to display if the user does not provide a value during the transition. A default error message will be shown if you don't provide one (Optional).  ###### Field changed ######      {        \"ruleKey\": \"system:validate-field-value\",        \"parameters\": {          \"ruleType\": \"fieldChanged\",          \"groupsExemptFromValidation\": \"6862ac20-8672-4f68-896d-4854f5efb79e\",          \"fieldKey\": \"versions\",          \"errorMessage\": \"Affect versions must be modified before transition\"        }      }  Parameters:   *  `groupsExemptFromValidation` a comma-separated list of group IDs to be exempt from the validation.  *  `fieldKey` the ID of the field that has changed. For a custom field, it would look like `customfield_123`.  *  `errorMessage` the error message to display if the user does not provide a value during the transition. A default error message will be shown if you don't provide one (Optional).  ###### Field has a single value ######      {        \"ruleKey\": \"system:validate-field-value\",        \"parameters\": {          \"ruleType\": \"fieldHasSingleValue\",          \"fieldKey\": \"created\",          \"excludeSubtasks\": \"true\"        }      }  Parameters:   *  `fieldKey` the ID of the field to validate. For a custom field, it would look like `customfield_123`.  *  `excludeSubtasks` Option to exclude values copied from sub-tasks. Allowed values: `true`, `false`.  ###### Field matches regular expression ######      {        \"ruleKey\": \"system:validate-field-value\",        \"parameters\": {          \"ruleType\": \"fieldMatchesRegularExpression\",          \"regexp\": \"[0-9]{4}\",          \"fieldKey\": \"description\"        }      }  Parameters:   *  `regexp` the regular expression used to validate the field\\\\u2019s content.  *  `fieldKey` the ID of the field to validate. For a custom field, it would look like `customfield_123`.  ###### Date field comparison ######      {        \"ruleKey\": \"system:validate-field-value\",        \"parameters\": {          \"ruleType\": \"dateFieldComparison\",          \"date1FieldKey\": \"duedate\",          \"date2FieldKey\": \"customfield_10054\",          \"includeTime\": \"true\",          \"conditionSelected\": \">=\"        }      }  Parameters:   *  `date1FieldKey` the ID of the first field to compare. For a custom field, it would look like `customfield_123`.  *  `date2FieldKey` the ID of the second field to compare. For a custom field, it would look like `customfield_123`.  *  `includeTime` if `true`, compares both date and time. Allowed values: `true`, `false`.  *  `conditionSelected` the condition to compare with. Allowed values: `>`, `>=`, `=`, `<=`, `<`, `!=`.  ###### Date range comparison ######      {        \"ruleKey\": \"system:validate-field-value\",        \"parameters\": {          \"ruleType\": \"windowDateComparison\",          \"date1FieldKey\": \"customfield_10009\",          \"date2FieldKey\": \"customfield_10054\",          \"numberOfDays\": \"3\"        }      }  Parameters:   *  `date1FieldKey` the ID of the first field to compare. For a custom field, it would look like `customfield_123`.  *  `date2FieldKey` the ID of the second field to compare. For a custom field, it would look like `customfield_123`.  *  `numberOfDays` maximum number of days past the reference date (`date2FieldKey`) to pass validation.  This rule is composed by aggregating the following legacy rules:   *  FieldRequiredValidator  *  FieldChangedValidator  *  FieldHasSingleValueValidator  *  RegexpFieldValidator  *  DateFieldValidator  *  WindowsDateValidator  ##### Pro forma: Forms attached validator #####  Validates that one or more forms are attached to the issue.      {        \"ruleKey\" : \"system:proforma-forms-attached\"        \"parameters\" : {}      }  ##### Proforma: Forms submitted validator #####  Validates that all forms attached to the issue have been submitted.      {        \"ruleKey\" : \"system:proforma-forms-submitted\"        \"parameters\" : {}      }  #### Conditions ####  Conditions enable workflow rules that govern whether a transition can execute.  ##### Check field value #####  A condition rule evaluates as true if a specific field's value meets the defined criteria. This rule ensures that an issue can only transition to the next step in the workflow if the field's value matches the desired condition.      {        \"ruleKey\": \"system:check-field-value\",        \"parameters\": {          \"fieldId\": \"description\",          \"fieldValue\": \"[\\\"Done\\\"]\",          \"comparator\": \"=\",          \"comparisonType\": \"STRING\"        }      }  Parameters:   *  `fieldId` The ID of the field to check the value of. For non-system fields, it will look like `customfield_123`. Note: `fieldId` is used interchangeably with the idea of `fieldKey` here, they refer to the same field.  *  `fieldValue` the list of values to check against the field\\\\u2019s value.  *  `comparator` The comparison logic. Allowed values: `>`, `>=`, `=`, `<=`, `<`, `!=`.  *  `comparisonType` The type of data being compared. Allowed values: `STRING`, `NUMBER`, `DATE`, `DATE_WITHOUT_TIME`, `OPTIONID`.  ##### Restrict issue transition #####  This rule ensures that issue transitions are restricted based on user accounts, roles, group memberships, and permissions, maintaining control over who can transition an issue. This condition evaluates as `true` if any of the following criteria is met.      {        \"ruleKey\": \"system:restrict-issue-transition\",        \"parameters\": {          \"accountIds\": \"allow-reporter,5e68ac137d64450d01a77fa0\",          \"roleIds\": \"10002,10004\",          \"groupIds\": \"703ff44a-7dc8-4f4b-9aa6-a65bf3574fa4\",          \"permissionKeys\": \"ADMINISTER_PROJECTS\",          \"groupCustomFields\": \"customfield_10028\",          \"allowUserCustomFields\": \"customfield_10072,customfield_10144,customfield_10007\",          \"denyUserCustomFields\": \"customfield_10107\"        }      }  Parameters:   *  `accountIds` a comma-separated list of the user account IDs. It also allows generic values like: `allow-assignee`, `allow-reporter`, and `accountIds` Note: This is only supported in team-managed projects  *  `roleIds` a comma-separated list of role IDs.  *  `groupIds` a comma-separated list of group IDs.  *  `permissionKeys` a comma-separated list of permission keys. Allowed values: [built-in Jira permissions](https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-permission-schemes/#built-in-permissions).  *  `groupCustomFields` a comma-separated list of group custom field IDs.  *  `allowUserCustomFields` a comma-separated list of user custom field IDs to allow for issue transition.  *  `denyUserCustomFields` a comma-separated list of user custom field IDs to deny for issue transition.  This rule is composed by aggregating the following legacy rules:   *  AllowOnlyAssignee  *  AllowOnlyReporter  *  InAnyProjectRoleCondition  *  InProjectRoleCondition  *  UserInAnyGroupCondition  *  UserInGroupCondition  *  PermissionCondtion  *  InGroupCFCondition  *  UserIsInCustomFieldCondition  ##### Previous status condition #####  A condition that evaluates based on an issue's previous status(es) and specific criteria.      {        \"ruleKey\" : \"system:previous-status-condition\"        \"parameters\" : {          \"previousStatusIds\" : \"10004\",          \"not\": \"true\",          \"mostRecentStatusOnly\" : \"true\",          \"includeCurrentStatus\": \"true\",          \"ignoreLoopTransitions\": \"true\"        }      }  Parameters:   *  `previousStatusIds` a comma-separated list of status IDs, current only support one ID.  *  `not` indicates if the condition should be reversed. When `true` it checks that the issue has not been in the selected statuses. Allowed values: `true`, `false`.  *  `mostRecentStatusOnly` when true only considers the most recent status for the condition evaluation. Allowed values: `true`, `false`.  *  `includeCurrentStatus` includes the current status when evaluating if the issue has been through the selected statuses. Allowed values: `true`, `false`.  *  `ignoreLoopTransitions` ignore loop transitions. Allowed values: `true`, `false`.  ##### Parent or child blocking condition #####  A condition to block the parent\\\\u2019s issue transition depending on the child\\\\u2019s issue status.      {        \"ruleKey\" : \"system:parent-or-child-blocking-condition\"        \"parameters\" : {          \"blocker\" : \"CHILD\",          \"statusIds\" : \"1,2,3\"        }      }  Parameters:   *  `blocker` currently only supports `CHILD`.  *  `statusIds` a comma-separated list of status IDs.  ##### Separation of duties #####  A condition preventing the user from performing, if the user has already performed a transition on the issue.      {        \"ruleKey\": \"system:separation-of-duties\",        \"parameters\": {          \"fromStatusId\": \"10161\",          \"toStatusId\": \"10160\"        }      }  Parameters:   *  `fromStatusId` represents the status ID from which the issue is transitioning. It ensures that the user performing the current transition has not performed any actions when the issue was in the specified status.  *  `toStatusId` represents the status ID to which the issue is transitioning. It ensures that the user performing the current transition is not the same user who has previously transitioned the issue.  ##### Restrict transitions #####  A condition preventing all users from transitioning the issue can also optionally include APIs as well.      {        \"ruleKey\": \"system:restrict-from-all-users\",        \"parameters\": {          \"restrictMode\": \"users\"        }      }  Parameters:   *  `restrictMode` restricts the issue transition including/excluding APIs. Allowed values: `\"users\"`, `\"usersAndAPI\"`.  ##### Jira Service Management block until approved #####  Block an issue transition until approval. Note: This is only supported in team-managed projects.      {        \"ruleKey\": \"system:jsd-approvals-block-until-approved\",        \"parameters\": {          \"approvalConfigurationJson\": \"{\"statusExternalUuid...}\"        }      }  Parameters:   *  `approvalConfigurationJson` a stringified JSON holding the Jira Service Management approval configuration.  ##### Jira Service Management block until rejected #####  Block an issue transition until rejected. Note: This is only supported in team-managed projects.      {        \"ruleKey\": \"system:jsd-approvals-block-until-rejected\",        \"parameters\": {          \"approvalConfigurationJson\": \"{\"statusExternalUuid...}\"        }      }  Parameters:   *  `approvalConfigurationJson` a stringified JSON holding the Jira Service Management approval configuration.  ##### Block in progress approval #####  Condition to block issue transition if there is pending approval. Note: This is only supported in company-managed projects.      {        \"ruleKey\": \"system:block-in-progress-approval\",        \"parameters\": {}      }  #### Post functions ####  Post functions carry out any additional processing required after a workflow transition is executed.  ##### Change assignee #####  A post function rule that changes the assignee of an issue after a transition.      {        \"ruleKey\": \"system:change-assignee\",        \"parameters\": {          \"type\": \"to-selected-user\",          \"accountId\": \"example-account-id\"        }      }  Parameters:   *  `type` the parameter used to determine the new assignee. Allowed values: `to-selected-user`, `to-unassigned`, `to-current-user`, `to-current-user`, `to-default-user`, `to-default-user`  *  `accountId` the account ID of the user to assign the issue to. This parameter is required only when the type is `\"to-selected-user\"`.  ##### Copy field value #####  A post function that automates the process of copying values between fields during a specific transition, ensuring data consistency and reducing manual effort.      {        \"ruleKey\": \"system:copy-value-from-other-field\",        \"parameters\": {          \"sourceFieldKey\": \"description\",          \"targetFieldKey\": \"components\",          \"issueSource\": \"SAME\"        }      }  Parameters:   *  `sourceFieldKey` the field key to copy from. For a custom field, it would look like `customfield_123`  *  `targetFieldKey` the field key to copy to. For a custom field, it would look like `customfield_123`  *  `issueSource` `SAME` or `PARENT`. Defaults to `SAME` if no value is provided.  ##### Update field #####  A post function that updates or appends a specific field with the given value.      {        \"ruleKey\": \"system:update-field\",        \"parameters\": {          \"field\": \"customfield_10056\",          \"value\": \"asdf\",          \"mode\": \"append\"        }      }  Parameters:   *  `field` the ID of the field to update. For a custom field, it would look like `customfield_123`  *  `value` the value to update the field with.  *  `mode` `append` or `replace`. Determines if a value will be appended to the current value, or if the current value will be replaced.  ##### Trigger webhook #####  A post function that automatically triggers a predefined webhook when a transition occurs in the workflow.      {        \"ruleKey\": \"system:trigger-webhook\",        \"parameters\": {          \"webhookId\": \"1\"        }      }  Parameters:   *  `webhookId` the ID of the webhook.  ##### Trigger agent #####  A post function that triggers a Jira AI agent for the issue after the transition runs, using the configured agent and an optional prompt. The agent run is asynchronous: it is scheduled after the transition finishes and does not block the transition.      {        \"ruleKey\": \"system:trigger-agent\",        \"parameters\": {          \"agentId\": \"712020:3c6d3f05-331a-4488-932e-37c34b704720\",          \"promptValue\": \"\"        }      }  Parameters:   *  `agentId` the identifier of the agent to trigger (the Atlassian account ID of the agent).  *  `promptValue` optional text passed to the agent as a user prompt after the transition runs; use an empty string if no extra prompt is needed.  #### Screen ####  ##### Remind people to update fields #####  A screen rule that prompts users to update a specific field when they interact with an issue screen during a transition. This rule is useful for ensuring that users provide or modify necessary information before moving an issue to the next step in the workflow.      {        \"ruleKey\": \"system:remind-people-to-update-fields\",        \"params\": {          \"remindingFieldIds\": \"assignee,customfield_10025\",          \"remindingMessage\": \"The message\",          \"remindingAlwaysAsk\": \"true\"        }      }  Parameters:   *  `remindingFieldIds` a comma-separated list of field IDs. Note: `fieldId` is used interchangeably with the idea of `fieldKey` here, they refer to the same field.  *  `remindingMessage` the message to display when prompting the users to update the fields.  *  `remindingAlwaysAsk` always remind to update fields. Allowed values: `true`, `false`.  ##### Shared transition screen #####  A common screen that is shared between transitions in a workflow.      {        \"ruleKey\": \"system:transition-screen\",        \"params\": {          \"screenId\": \"3\"        }      }  Parameters:   *  `screenId` the ID of the screen.  #### Connect & Forge ####  ##### Connect rules #####  Validator/Condition/Post function for Connect app.      {        \"ruleKey\": \"connect:expression-validator\",        \"parameters\": {          \"appKey\": \"com.atlassian.app\",          \"config\": \"\",          \"id\": \"90ce590f-e90c-4cd3-8281-165ce41f2ac3\",          \"disabled\": \"false\",          \"tag\": \"\"        }      }  Parameters:   *  `ruleKey` Validator: `connect:expression-validator`, Condition: `connect:expression-condition`, and Post function: `connect:remote-workflow-function`  *  `appKey` the reference to the Connect app  *  `config` a JSON payload string describing the configuration  *  `id` the ID of the rule  *  `disabled` determine if the Connect app is disabled. Allowed values: `true`, `false`.  *  `tag` additional tags for the Connect app  ##### Forge rules #####  Validator/Condition/Post function for Forge app.      {        \"ruleKey\": \"forge:expression-validator\",        \"parameters\": {          \"key\": \"ari:cloud:ecosystem::extension/{appId}/{environmentId}/static/{moduleKey}\",          \"config\": \"{\"searchString\":\"workflow validator\"}\",          \"id\": \"a865ddf6-bb3f-4a7b-9540-c2f8b3f9f6c2\",          \"disabled\": \"false\",          \"tag\": \"\"        }      }  Parameters:   *  `ruleKey` Validator: `forge:expression-validator`, Condition: `forge:expression-condition`, and Post function: `forge:workflow-post-function`  *  `key` the identifier for the Forge app  *  `config` the persistent stringified JSON configuration for the Forge rule  *  `id` the ID of the Forge rule  *  `disabled` determine if the Forge app is disabled. Allowed values: `true`, `false`.  *  `tag` additional tags for the Forge app
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] workflowId:
  ///
  /// * [String] projectId:
  ///
  /// * [String] issueTypeId:
  Future<Response> workflowCapabilitiesWithHttpInfo({ String? workflowId, String? projectId, String? issueTypeId, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflows/capabilities';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (workflowId != null) {
      queryParams.addAll(_queryParams('', 'workflowId', workflowId));
    }
    if (projectId != null) {
      queryParams.addAll(_queryParams('', 'projectId', projectId));
    }
    if (issueTypeId != null) {
      queryParams.addAll(_queryParams('', 'issueTypeId', issueTypeId));
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

  /// Get available workflow capabilities
  ///
  /// Get the list of workflow capabilities for a specific workflow using either the workflow ID, or the project and issue type ID pair. The response includes the scope of the workflow, defined as global/project-based, and a list of project types that the workflow is scoped to. It also includes all rules organised into their broad categories (conditions, validators, actions, triggers, screens) as well as the source location (Atlassian-provided, Connect, Forge).  **[Permissions](#permissions) required:**   *  *Administer Jira* project permission to access all, including global-scoped, workflows  *  *Administer projects* project permissions to access project-scoped workflows  The current list of Atlassian-provided rules:  #### Validators ####  A validator rule that checks if a user has the required permissions to execute the transition in the workflow.  ##### Permission validator #####  A validator rule that checks if a user has the required permissions to execute the transition in the workflow.      {        \"ruleKey\": \"system:check-permission-validator\",        \"parameters\": {          \"permissionKey\": \"ADMINISTER_PROJECTS\"        }      }  Parameters:   *  `permissionKey` The permission required to perform the transition. Allowed values: [built-in Jira permissions](https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-permission-schemes/#built-in-permissions).  ##### Parent or child blocking validator #####  A validator to block the child issue's transition depending on the parent issue's status.      {        \"ruleKey\" : \"system:parent-or-child-blocking-validator\"        \"parameters\" : {          \"blocker\" : \"PARENT\"          \"statusIds\" : \"1,2,3\"        }      }  Parameters:   *  `blocker` currently only supports `PARENT`.  *  `statusIds` a comma-separated list of status IDs.  ##### Previous status validator #####  A validator that checks if an issue has transitioned through specified previous status(es) before allowing the current transition to occur.      {        \"ruleKey\": \"system:previous-status-validator\",        \"parameters\": {          \"previousStatusIds\": \"10014\",          \"mostRecentStatusOnly\": \"true\"        }      }  Parameters:   *  `previousStatusIds` a comma-separated list of status IDs, currently only support one ID.  *  `mostRecentStatusOnly` when `true` only considers the most recent status for the condition evaluation. Allowed values: `true`, `false`.  ##### Validate a field value #####  A validation that ensures a specific field's value meets the defined criteria before allowing an issue to transition in the workflow.  Depending on the rule type, the result will vary:  ###### Field required ######      {        \"ruleKey\": \"system:validate-field-value\",        \"parameters\": {          \"ruleType\": \"fieldRequired\",          \"fieldsRequired\": \"assignee\",          \"ignoreContext\": \"true\",          \"errorMessage\": \"An assignee must be set!\"        }      }  Parameters:   *  `fieldsRequired` the ID of the field that is required. For a custom field, it would look like `customfield_123`.  *  `ignoreContext` controls the impact of context settings on field validation. When set to `true`, the validator doesn't check a required field if its context isn't configured for the current issue. When set to `false`, the validator requires a field even if its context is invalid. Allowed values: `true`, `false`.  *  `errorMessage` is the error message to display if the user does not provide a value during the transition. A default error message will be shown if you don't provide one (Optional).  ###### Field changed ######      {        \"ruleKey\": \"system:validate-field-value\",        \"parameters\": {          \"ruleType\": \"fieldChanged\",          \"groupsExemptFromValidation\": \"6862ac20-8672-4f68-896d-4854f5efb79e\",          \"fieldKey\": \"versions\",          \"errorMessage\": \"Affect versions must be modified before transition\"        }      }  Parameters:   *  `groupsExemptFromValidation` a comma-separated list of group IDs to be exempt from the validation.  *  `fieldKey` the ID of the field that has changed. For a custom field, it would look like `customfield_123`.  *  `errorMessage` the error message to display if the user does not provide a value during the transition. A default error message will be shown if you don't provide one (Optional).  ###### Field has a single value ######      {        \"ruleKey\": \"system:validate-field-value\",        \"parameters\": {          \"ruleType\": \"fieldHasSingleValue\",          \"fieldKey\": \"created\",          \"excludeSubtasks\": \"true\"        }      }  Parameters:   *  `fieldKey` the ID of the field to validate. For a custom field, it would look like `customfield_123`.  *  `excludeSubtasks` Option to exclude values copied from sub-tasks. Allowed values: `true`, `false`.  ###### Field matches regular expression ######      {        \"ruleKey\": \"system:validate-field-value\",        \"parameters\": {          \"ruleType\": \"fieldMatchesRegularExpression\",          \"regexp\": \"[0-9]{4}\",          \"fieldKey\": \"description\"        }      }  Parameters:   *  `regexp` the regular expression used to validate the field\\\\u2019s content.  *  `fieldKey` the ID of the field to validate. For a custom field, it would look like `customfield_123`.  ###### Date field comparison ######      {        \"ruleKey\": \"system:validate-field-value\",        \"parameters\": {          \"ruleType\": \"dateFieldComparison\",          \"date1FieldKey\": \"duedate\",          \"date2FieldKey\": \"customfield_10054\",          \"includeTime\": \"true\",          \"conditionSelected\": \">=\"        }      }  Parameters:   *  `date1FieldKey` the ID of the first field to compare. For a custom field, it would look like `customfield_123`.  *  `date2FieldKey` the ID of the second field to compare. For a custom field, it would look like `customfield_123`.  *  `includeTime` if `true`, compares both date and time. Allowed values: `true`, `false`.  *  `conditionSelected` the condition to compare with. Allowed values: `>`, `>=`, `=`, `<=`, `<`, `!=`.  ###### Date range comparison ######      {        \"ruleKey\": \"system:validate-field-value\",        \"parameters\": {          \"ruleType\": \"windowDateComparison\",          \"date1FieldKey\": \"customfield_10009\",          \"date2FieldKey\": \"customfield_10054\",          \"numberOfDays\": \"3\"        }      }  Parameters:   *  `date1FieldKey` the ID of the first field to compare. For a custom field, it would look like `customfield_123`.  *  `date2FieldKey` the ID of the second field to compare. For a custom field, it would look like `customfield_123`.  *  `numberOfDays` maximum number of days past the reference date (`date2FieldKey`) to pass validation.  This rule is composed by aggregating the following legacy rules:   *  FieldRequiredValidator  *  FieldChangedValidator  *  FieldHasSingleValueValidator  *  RegexpFieldValidator  *  DateFieldValidator  *  WindowsDateValidator  ##### Pro forma: Forms attached validator #####  Validates that one or more forms are attached to the issue.      {        \"ruleKey\" : \"system:proforma-forms-attached\"        \"parameters\" : {}      }  ##### Proforma: Forms submitted validator #####  Validates that all forms attached to the issue have been submitted.      {        \"ruleKey\" : \"system:proforma-forms-submitted\"        \"parameters\" : {}      }  #### Conditions ####  Conditions enable workflow rules that govern whether a transition can execute.  ##### Check field value #####  A condition rule evaluates as true if a specific field's value meets the defined criteria. This rule ensures that an issue can only transition to the next step in the workflow if the field's value matches the desired condition.      {        \"ruleKey\": \"system:check-field-value\",        \"parameters\": {          \"fieldId\": \"description\",          \"fieldValue\": \"[\\\"Done\\\"]\",          \"comparator\": \"=\",          \"comparisonType\": \"STRING\"        }      }  Parameters:   *  `fieldId` The ID of the field to check the value of. For non-system fields, it will look like `customfield_123`. Note: `fieldId` is used interchangeably with the idea of `fieldKey` here, they refer to the same field.  *  `fieldValue` the list of values to check against the field\\\\u2019s value.  *  `comparator` The comparison logic. Allowed values: `>`, `>=`, `=`, `<=`, `<`, `!=`.  *  `comparisonType` The type of data being compared. Allowed values: `STRING`, `NUMBER`, `DATE`, `DATE_WITHOUT_TIME`, `OPTIONID`.  ##### Restrict issue transition #####  This rule ensures that issue transitions are restricted based on user accounts, roles, group memberships, and permissions, maintaining control over who can transition an issue. This condition evaluates as `true` if any of the following criteria is met.      {        \"ruleKey\": \"system:restrict-issue-transition\",        \"parameters\": {          \"accountIds\": \"allow-reporter,5e68ac137d64450d01a77fa0\",          \"roleIds\": \"10002,10004\",          \"groupIds\": \"703ff44a-7dc8-4f4b-9aa6-a65bf3574fa4\",          \"permissionKeys\": \"ADMINISTER_PROJECTS\",          \"groupCustomFields\": \"customfield_10028\",          \"allowUserCustomFields\": \"customfield_10072,customfield_10144,customfield_10007\",          \"denyUserCustomFields\": \"customfield_10107\"        }      }  Parameters:   *  `accountIds` a comma-separated list of the user account IDs. It also allows generic values like: `allow-assignee`, `allow-reporter`, and `accountIds` Note: This is only supported in team-managed projects  *  `roleIds` a comma-separated list of role IDs.  *  `groupIds` a comma-separated list of group IDs.  *  `permissionKeys` a comma-separated list of permission keys. Allowed values: [built-in Jira permissions](https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-permission-schemes/#built-in-permissions).  *  `groupCustomFields` a comma-separated list of group custom field IDs.  *  `allowUserCustomFields` a comma-separated list of user custom field IDs to allow for issue transition.  *  `denyUserCustomFields` a comma-separated list of user custom field IDs to deny for issue transition.  This rule is composed by aggregating the following legacy rules:   *  AllowOnlyAssignee  *  AllowOnlyReporter  *  InAnyProjectRoleCondition  *  InProjectRoleCondition  *  UserInAnyGroupCondition  *  UserInGroupCondition  *  PermissionCondtion  *  InGroupCFCondition  *  UserIsInCustomFieldCondition  ##### Previous status condition #####  A condition that evaluates based on an issue's previous status(es) and specific criteria.      {        \"ruleKey\" : \"system:previous-status-condition\"        \"parameters\" : {          \"previousStatusIds\" : \"10004\",          \"not\": \"true\",          \"mostRecentStatusOnly\" : \"true\",          \"includeCurrentStatus\": \"true\",          \"ignoreLoopTransitions\": \"true\"        }      }  Parameters:   *  `previousStatusIds` a comma-separated list of status IDs, current only support one ID.  *  `not` indicates if the condition should be reversed. When `true` it checks that the issue has not been in the selected statuses. Allowed values: `true`, `false`.  *  `mostRecentStatusOnly` when true only considers the most recent status for the condition evaluation. Allowed values: `true`, `false`.  *  `includeCurrentStatus` includes the current status when evaluating if the issue has been through the selected statuses. Allowed values: `true`, `false`.  *  `ignoreLoopTransitions` ignore loop transitions. Allowed values: `true`, `false`.  ##### Parent or child blocking condition #####  A condition to block the parent\\\\u2019s issue transition depending on the child\\\\u2019s issue status.      {        \"ruleKey\" : \"system:parent-or-child-blocking-condition\"        \"parameters\" : {          \"blocker\" : \"CHILD\",          \"statusIds\" : \"1,2,3\"        }      }  Parameters:   *  `blocker` currently only supports `CHILD`.  *  `statusIds` a comma-separated list of status IDs.  ##### Separation of duties #####  A condition preventing the user from performing, if the user has already performed a transition on the issue.      {        \"ruleKey\": \"system:separation-of-duties\",        \"parameters\": {          \"fromStatusId\": \"10161\",          \"toStatusId\": \"10160\"        }      }  Parameters:   *  `fromStatusId` represents the status ID from which the issue is transitioning. It ensures that the user performing the current transition has not performed any actions when the issue was in the specified status.  *  `toStatusId` represents the status ID to which the issue is transitioning. It ensures that the user performing the current transition is not the same user who has previously transitioned the issue.  ##### Restrict transitions #####  A condition preventing all users from transitioning the issue can also optionally include APIs as well.      {        \"ruleKey\": \"system:restrict-from-all-users\",        \"parameters\": {          \"restrictMode\": \"users\"        }      }  Parameters:   *  `restrictMode` restricts the issue transition including/excluding APIs. Allowed values: `\"users\"`, `\"usersAndAPI\"`.  ##### Jira Service Management block until approved #####  Block an issue transition until approval. Note: This is only supported in team-managed projects.      {        \"ruleKey\": \"system:jsd-approvals-block-until-approved\",        \"parameters\": {          \"approvalConfigurationJson\": \"{\"statusExternalUuid...}\"        }      }  Parameters:   *  `approvalConfigurationJson` a stringified JSON holding the Jira Service Management approval configuration.  ##### Jira Service Management block until rejected #####  Block an issue transition until rejected. Note: This is only supported in team-managed projects.      {        \"ruleKey\": \"system:jsd-approvals-block-until-rejected\",        \"parameters\": {          \"approvalConfigurationJson\": \"{\"statusExternalUuid...}\"        }      }  Parameters:   *  `approvalConfigurationJson` a stringified JSON holding the Jira Service Management approval configuration.  ##### Block in progress approval #####  Condition to block issue transition if there is pending approval. Note: This is only supported in company-managed projects.      {        \"ruleKey\": \"system:block-in-progress-approval\",        \"parameters\": {}      }  #### Post functions ####  Post functions carry out any additional processing required after a workflow transition is executed.  ##### Change assignee #####  A post function rule that changes the assignee of an issue after a transition.      {        \"ruleKey\": \"system:change-assignee\",        \"parameters\": {          \"type\": \"to-selected-user\",          \"accountId\": \"example-account-id\"        }      }  Parameters:   *  `type` the parameter used to determine the new assignee. Allowed values: `to-selected-user`, `to-unassigned`, `to-current-user`, `to-current-user`, `to-default-user`, `to-default-user`  *  `accountId` the account ID of the user to assign the issue to. This parameter is required only when the type is `\"to-selected-user\"`.  ##### Copy field value #####  A post function that automates the process of copying values between fields during a specific transition, ensuring data consistency and reducing manual effort.      {        \"ruleKey\": \"system:copy-value-from-other-field\",        \"parameters\": {          \"sourceFieldKey\": \"description\",          \"targetFieldKey\": \"components\",          \"issueSource\": \"SAME\"        }      }  Parameters:   *  `sourceFieldKey` the field key to copy from. For a custom field, it would look like `customfield_123`  *  `targetFieldKey` the field key to copy to. For a custom field, it would look like `customfield_123`  *  `issueSource` `SAME` or `PARENT`. Defaults to `SAME` if no value is provided.  ##### Update field #####  A post function that updates or appends a specific field with the given value.      {        \"ruleKey\": \"system:update-field\",        \"parameters\": {          \"field\": \"customfield_10056\",          \"value\": \"asdf\",          \"mode\": \"append\"        }      }  Parameters:   *  `field` the ID of the field to update. For a custom field, it would look like `customfield_123`  *  `value` the value to update the field with.  *  `mode` `append` or `replace`. Determines if a value will be appended to the current value, or if the current value will be replaced.  ##### Trigger webhook #####  A post function that automatically triggers a predefined webhook when a transition occurs in the workflow.      {        \"ruleKey\": \"system:trigger-webhook\",        \"parameters\": {          \"webhookId\": \"1\"        }      }  Parameters:   *  `webhookId` the ID of the webhook.  ##### Trigger agent #####  A post function that triggers a Jira AI agent for the issue after the transition runs, using the configured agent and an optional prompt. The agent run is asynchronous: it is scheduled after the transition finishes and does not block the transition.      {        \"ruleKey\": \"system:trigger-agent\",        \"parameters\": {          \"agentId\": \"712020:3c6d3f05-331a-4488-932e-37c34b704720\",          \"promptValue\": \"\"        }      }  Parameters:   *  `agentId` the identifier of the agent to trigger (the Atlassian account ID of the agent).  *  `promptValue` optional text passed to the agent as a user prompt after the transition runs; use an empty string if no extra prompt is needed.  #### Screen ####  ##### Remind people to update fields #####  A screen rule that prompts users to update a specific field when they interact with an issue screen during a transition. This rule is useful for ensuring that users provide or modify necessary information before moving an issue to the next step in the workflow.      {        \"ruleKey\": \"system:remind-people-to-update-fields\",        \"params\": {          \"remindingFieldIds\": \"assignee,customfield_10025\",          \"remindingMessage\": \"The message\",          \"remindingAlwaysAsk\": \"true\"        }      }  Parameters:   *  `remindingFieldIds` a comma-separated list of field IDs. Note: `fieldId` is used interchangeably with the idea of `fieldKey` here, they refer to the same field.  *  `remindingMessage` the message to display when prompting the users to update the fields.  *  `remindingAlwaysAsk` always remind to update fields. Allowed values: `true`, `false`.  ##### Shared transition screen #####  A common screen that is shared between transitions in a workflow.      {        \"ruleKey\": \"system:transition-screen\",        \"params\": {          \"screenId\": \"3\"        }      }  Parameters:   *  `screenId` the ID of the screen.  #### Connect & Forge ####  ##### Connect rules #####  Validator/Condition/Post function for Connect app.      {        \"ruleKey\": \"connect:expression-validator\",        \"parameters\": {          \"appKey\": \"com.atlassian.app\",          \"config\": \"\",          \"id\": \"90ce590f-e90c-4cd3-8281-165ce41f2ac3\",          \"disabled\": \"false\",          \"tag\": \"\"        }      }  Parameters:   *  `ruleKey` Validator: `connect:expression-validator`, Condition: `connect:expression-condition`, and Post function: `connect:remote-workflow-function`  *  `appKey` the reference to the Connect app  *  `config` a JSON payload string describing the configuration  *  `id` the ID of the rule  *  `disabled` determine if the Connect app is disabled. Allowed values: `true`, `false`.  *  `tag` additional tags for the Connect app  ##### Forge rules #####  Validator/Condition/Post function for Forge app.      {        \"ruleKey\": \"forge:expression-validator\",        \"parameters\": {          \"key\": \"ari:cloud:ecosystem::extension/{appId}/{environmentId}/static/{moduleKey}\",          \"config\": \"{\"searchString\":\"workflow validator\"}\",          \"id\": \"a865ddf6-bb3f-4a7b-9540-c2f8b3f9f6c2\",          \"disabled\": \"false\",          \"tag\": \"\"        }      }  Parameters:   *  `ruleKey` Validator: `forge:expression-validator`, Condition: `forge:expression-condition`, and Post function: `forge:workflow-post-function`  *  `key` the identifier for the Forge app  *  `config` the persistent stringified JSON configuration for the Forge rule  *  `id` the ID of the Forge rule  *  `disabled` determine if the Forge app is disabled. Allowed values: `true`, `false`.  *  `tag` additional tags for the Forge app
  ///
  /// Parameters:
  ///
  /// * [String] workflowId:
  ///
  /// * [String] projectId:
  ///
  /// * [String] issueTypeId:
  Future<WorkflowCapabilities?> workflowCapabilities({ String? workflowId, String? projectId, String? issueTypeId, Future<void>? abortTrigger, }) async {
    final response = await workflowCapabilitiesWithHttpInfo(workflowId: workflowId, projectId: projectId, issueTypeId: issueTypeId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'WorkflowCapabilities',) as WorkflowCapabilities;
    
    }
    return null;
  }
}
