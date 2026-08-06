//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class WorkflowSchemesApi {
  WorkflowSchemesApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create workflow scheme
  ///
  /// Creates a workflow scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [WorkflowScheme] workflowScheme (required):
  Future<Response> createWorkflowSchemeWithHttpInfo(WorkflowScheme workflowScheme, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflowscheme';

    // ignore: prefer_final_locals
    Object? postBody = workflowScheme;

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

  /// Create workflow scheme
  ///
  /// Creates a workflow scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [WorkflowScheme] workflowScheme (required):
  Future<WorkflowScheme?> createWorkflowScheme(WorkflowScheme workflowScheme, { Future<void>? abortTrigger, }) async {
    final response = await createWorkflowSchemeWithHttpInfo(workflowScheme, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'WorkflowScheme',) as WorkflowScheme;
    
    }
    return null;
  }

  /// Delete default workflow
  ///
  /// Resets the default workflow for a workflow scheme. That is, the default workflow is set to Jira's system workflow (the *jira* workflow).  Note that active workflow schemes cannot be edited. If the workflow scheme is active, set `updateDraftIfNeeded` to `true` and a draft workflow scheme is created or updated with the default workflow reset. The draft workflow scheme can be published in Jira.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme.
  ///
  /// * [bool] updateDraftIfNeeded:
  ///   Set to true to create or update the draft of a workflow scheme and delete the mapping from the draft, when the workflow scheme cannot be edited. Defaults to `false`.
  Future<Response> deleteDefaultWorkflowWithHttpInfo(int id, { bool? updateDraftIfNeeded, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflowscheme/{id}/default'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (updateDraftIfNeeded != null) {
      queryParams.addAll(_queryParams('', 'updateDraftIfNeeded', updateDraftIfNeeded));
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

  /// Delete default workflow
  ///
  /// Resets the default workflow for a workflow scheme. That is, the default workflow is set to Jira's system workflow (the *jira* workflow).  Note that active workflow schemes cannot be edited. If the workflow scheme is active, set `updateDraftIfNeeded` to `true` and a draft workflow scheme is created or updated with the default workflow reset. The draft workflow scheme can be published in Jira.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme.
  ///
  /// * [bool] updateDraftIfNeeded:
  ///   Set to true to create or update the draft of a workflow scheme and delete the mapping from the draft, when the workflow scheme cannot be edited. Defaults to `false`.
  Future<WorkflowScheme?> deleteDefaultWorkflow(int id, { bool? updateDraftIfNeeded, Future<void>? abortTrigger, }) async {
    final response = await deleteDefaultWorkflowWithHttpInfo(id, updateDraftIfNeeded: updateDraftIfNeeded, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'WorkflowScheme',) as WorkflowScheme;
    
    }
    return null;
  }

  /// Delete issue types for workflow in workflow scheme
  ///
  /// Deletes the workflow-issue type mapping for a workflow in a workflow scheme.  Note that active workflow schemes cannot be edited. If the workflow scheme is active, set `updateDraftIfNeeded` to `true` and a draft workflow scheme is created or updated with the workflow-issue type mapping deleted. The draft workflow scheme can be published in Jira.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme.
  ///
  /// * [String] workflowName (required):
  ///   The name of the workflow.
  ///
  /// * [bool] updateDraftIfNeeded:
  ///   Set to true to create or update the draft of a workflow scheme and delete the mapping from the draft, when the workflow scheme cannot be edited. Defaults to `false`.
  Future<Response> deleteWorkflowMappingWithHttpInfo(int id, String workflowName, { bool? updateDraftIfNeeded, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflowscheme/{id}/workflow'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'workflowName', workflowName));
    if (updateDraftIfNeeded != null) {
      queryParams.addAll(_queryParams('', 'updateDraftIfNeeded', updateDraftIfNeeded));
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

  /// Delete issue types for workflow in workflow scheme
  ///
  /// Deletes the workflow-issue type mapping for a workflow in a workflow scheme.  Note that active workflow schemes cannot be edited. If the workflow scheme is active, set `updateDraftIfNeeded` to `true` and a draft workflow scheme is created or updated with the workflow-issue type mapping deleted. The draft workflow scheme can be published in Jira.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme.
  ///
  /// * [String] workflowName (required):
  ///   The name of the workflow.
  ///
  /// * [bool] updateDraftIfNeeded:
  ///   Set to true to create or update the draft of a workflow scheme and delete the mapping from the draft, when the workflow scheme cannot be edited. Defaults to `false`.
  Future<void> deleteWorkflowMapping(int id, String workflowName, { bool? updateDraftIfNeeded, Future<void>? abortTrigger, }) async {
    final response = await deleteWorkflowMappingWithHttpInfo(id, workflowName, updateDraftIfNeeded: updateDraftIfNeeded, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Delete workflow scheme
  ///
  /// Deletes a workflow scheme. Note that a workflow scheme cannot be deleted if it is active (that is, being used by at least one project).  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme. Find this ID by editing the desired workflow scheme in Jira. The ID is shown in the URL as `schemeId`. For example, *schemeId=10301*.
  Future<Response> deleteWorkflowSchemeWithHttpInfo(int id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflowscheme/{id}'
      .replaceAll('{id}', id.toString());

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

  /// Delete workflow scheme
  ///
  /// Deletes a workflow scheme. Note that a workflow scheme cannot be deleted if it is active (that is, being used by at least one project).  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme. Find this ID by editing the desired workflow scheme in Jira. The ID is shown in the URL as `schemeId`. For example, *schemeId=10301*.
  Future<Object?> deleteWorkflowScheme(int id, { Future<void>? abortTrigger, }) async {
    final response = await deleteWorkflowSchemeWithHttpInfo(id, abortTrigger: abortTrigger,);
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

  /// Delete workflow for issue type in workflow scheme
  ///
  /// Deletes the issue type-workflow mapping for an issue type in a workflow scheme.  Note that active workflow schemes cannot be edited. If the workflow scheme is active, set `updateDraftIfNeeded` to `true` and a draft workflow scheme is created or updated with the issue type-workflow mapping deleted. The draft workflow scheme can be published in Jira.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme.
  ///
  /// * [String] issueType (required):
  ///   The ID of the issue type.
  ///
  /// * [bool] updateDraftIfNeeded:
  ///   Set to true to create or update the draft of a workflow scheme and update the mapping in the draft, when the workflow scheme cannot be edited. Defaults to `false`.
  Future<Response> deleteWorkflowSchemeIssueTypeWithHttpInfo(int id, String issueType, { bool? updateDraftIfNeeded, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflowscheme/{id}/issuetype/{issueType}'
      .replaceAll('{id}', id.toString())
      .replaceAll('{issueType}', issueType);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (updateDraftIfNeeded != null) {
      queryParams.addAll(_queryParams('', 'updateDraftIfNeeded', updateDraftIfNeeded));
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

  /// Delete workflow for issue type in workflow scheme
  ///
  /// Deletes the issue type-workflow mapping for an issue type in a workflow scheme.  Note that active workflow schemes cannot be edited. If the workflow scheme is active, set `updateDraftIfNeeded` to `true` and a draft workflow scheme is created or updated with the issue type-workflow mapping deleted. The draft workflow scheme can be published in Jira.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme.
  ///
  /// * [String] issueType (required):
  ///   The ID of the issue type.
  ///
  /// * [bool] updateDraftIfNeeded:
  ///   Set to true to create or update the draft of a workflow scheme and update the mapping in the draft, when the workflow scheme cannot be edited. Defaults to `false`.
  Future<WorkflowScheme?> deleteWorkflowSchemeIssueType(int id, String issueType, { bool? updateDraftIfNeeded, Future<void>? abortTrigger, }) async {
    final response = await deleteWorkflowSchemeIssueTypeWithHttpInfo(id, issueType, updateDraftIfNeeded: updateDraftIfNeeded, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'WorkflowScheme',) as WorkflowScheme;
    
    }
    return null;
  }

  /// Get all workflow schemes
  ///
  /// Returns a [paginated](#pagination) list of all workflow schemes, not including draft workflow schemes.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
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
  Future<Response> getAllWorkflowSchemesWithHttpInfo({ int? startAt, int? maxResults, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflowscheme';

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

  /// Get all workflow schemes
  ///
  /// Returns a [paginated](#pagination) list of all workflow schemes, not including draft workflow schemes.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  Future<PageBeanWorkflowScheme?> getAllWorkflowSchemes({ int? startAt, int? maxResults, Future<void>? abortTrigger, }) async {
    final response = await getAllWorkflowSchemesWithHttpInfo(startAt: startAt, maxResults: maxResults, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanWorkflowScheme',) as PageBeanWorkflowScheme;
    
    }
    return null;
  }

  /// Get default workflow
  ///
  /// Returns the default workflow for a workflow scheme. The default workflow is the workflow that is assigned any issue types that have not been mapped to any other workflow. The default workflow has *All Unassigned Issue Types* listed in its issue types for the workflow scheme in Jira.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme.
  ///
  /// * [bool] returnDraftIfExists:
  ///   Set to `true` to return the default workflow for the workflow scheme's draft rather than scheme itself. If the workflow scheme does not have a draft, then the default workflow for the workflow scheme is returned.
  Future<Response> getDefaultWorkflowWithHttpInfo(int id, { bool? returnDraftIfExists, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflowscheme/{id}/default'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (returnDraftIfExists != null) {
      queryParams.addAll(_queryParams('', 'returnDraftIfExists', returnDraftIfExists));
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

  /// Get default workflow
  ///
  /// Returns the default workflow for a workflow scheme. The default workflow is the workflow that is assigned any issue types that have not been mapped to any other workflow. The default workflow has *All Unassigned Issue Types* listed in its issue types for the workflow scheme in Jira.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme.
  ///
  /// * [bool] returnDraftIfExists:
  ///   Set to `true` to return the default workflow for the workflow scheme's draft rather than scheme itself. If the workflow scheme does not have a draft, then the default workflow for the workflow scheme is returned.
  Future<DefaultWorkflow?> getDefaultWorkflow(int id, { bool? returnDraftIfExists, Future<void>? abortTrigger, }) async {
    final response = await getDefaultWorkflowWithHttpInfo(id, returnDraftIfExists: returnDraftIfExists, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'DefaultWorkflow',) as DefaultWorkflow;
    
    }
    return null;
  }

  /// Get projects which are using a given workflow scheme
  ///
  /// Returns a page of projects using a given workflow scheme.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] workflowSchemeId (required):
  ///   The workflow scheme ID
  ///
  /// * [String] nextPageToken:
  ///   The cursor for pagination
  ///
  /// * [int] maxResults:
  ///   The maximum number of results to return. Must be an integer between 1 and 200.
  Future<Response> getProjectUsagesForWorkflowSchemeWithHttpInfo(String workflowSchemeId, { String? nextPageToken, int? maxResults, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflowscheme/{workflowSchemeId}/projectUsages'
      .replaceAll('{workflowSchemeId}', workflowSchemeId);

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

  /// Get projects which are using a given workflow scheme
  ///
  /// Returns a page of projects using a given workflow scheme.
  ///
  /// Parameters:
  ///
  /// * [String] workflowSchemeId (required):
  ///   The workflow scheme ID
  ///
  /// * [String] nextPageToken:
  ///   The cursor for pagination
  ///
  /// * [int] maxResults:
  ///   The maximum number of results to return. Must be an integer between 1 and 200.
  Future<WorkflowSchemeProjectUsageDTO?> getProjectUsagesForWorkflowScheme(String workflowSchemeId, { String? nextPageToken, int? maxResults, Future<void>? abortTrigger, }) async {
    final response = await getProjectUsagesForWorkflowSchemeWithHttpInfo(workflowSchemeId, nextPageToken: nextPageToken, maxResults: maxResults, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'WorkflowSchemeProjectUsageDTO',) as WorkflowSchemeProjectUsageDTO;
    
    }
    return null;
  }

  /// Get required status mappings for workflow scheme update
  ///
  /// Gets the required status mappings for the desired changes to a workflow scheme. The results are provided per issue type and workflow. When updating a workflow scheme, status mappings can be provided per issue type, per workflow, or both.  **[Permissions](#permissions) required:**   *  *Administer Jira* permission to update all, including global-scoped, workflow schemes.  *  *Administer projects* project permission to update project-scoped workflow schemes.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [WorkflowSchemeUpdateRequiredMappingsRequest] workflowSchemeUpdateRequiredMappingsRequest (required):
  Future<Response> getRequiredWorkflowSchemeMappingsWithHttpInfo(WorkflowSchemeUpdateRequiredMappingsRequest workflowSchemeUpdateRequiredMappingsRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflowscheme/update/mappings';

    // ignore: prefer_final_locals
    Object? postBody = workflowSchemeUpdateRequiredMappingsRequest;

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

  /// Get required status mappings for workflow scheme update
  ///
  /// Gets the required status mappings for the desired changes to a workflow scheme. The results are provided per issue type and workflow. When updating a workflow scheme, status mappings can be provided per issue type, per workflow, or both.  **[Permissions](#permissions) required:**   *  *Administer Jira* permission to update all, including global-scoped, workflow schemes.  *  *Administer projects* project permission to update project-scoped workflow schemes.
  ///
  /// Parameters:
  ///
  /// * [WorkflowSchemeUpdateRequiredMappingsRequest] workflowSchemeUpdateRequiredMappingsRequest (required):
  Future<WorkflowSchemeUpdateRequiredMappingsResponse?> getRequiredWorkflowSchemeMappings(WorkflowSchemeUpdateRequiredMappingsRequest workflowSchemeUpdateRequiredMappingsRequest, { Future<void>? abortTrigger, }) async {
    final response = await getRequiredWorkflowSchemeMappingsWithHttpInfo(workflowSchemeUpdateRequiredMappingsRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'WorkflowSchemeUpdateRequiredMappingsResponse',) as WorkflowSchemeUpdateRequiredMappingsResponse;
    
    }
    return null;
  }

  /// Get issue types for workflows in workflow scheme
  ///
  /// Returns the workflow-issue type mappings for a workflow scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme.
  ///
  /// * [String] workflowName:
  ///   The name of a workflow in the scheme. Limits the results to the workflow-issue type mapping for the specified workflow.
  ///
  /// * [bool] returnDraftIfExists:
  ///   Returns the mapping from the workflow scheme's draft rather than the workflow scheme, if set to true. If no draft exists, the mapping from the workflow scheme is returned.
  Future<Response> getWorkflowWithHttpInfo(int id, { String? workflowName, bool? returnDraftIfExists, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflowscheme/{id}/workflow'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (workflowName != null) {
      queryParams.addAll(_queryParams('', 'workflowName', workflowName));
    }
    if (returnDraftIfExists != null) {
      queryParams.addAll(_queryParams('', 'returnDraftIfExists', returnDraftIfExists));
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

  /// Get issue types for workflows in workflow scheme
  ///
  /// Returns the workflow-issue type mappings for a workflow scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme.
  ///
  /// * [String] workflowName:
  ///   The name of a workflow in the scheme. Limits the results to the workflow-issue type mapping for the specified workflow.
  ///
  /// * [bool] returnDraftIfExists:
  ///   Returns the mapping from the workflow scheme's draft rather than the workflow scheme, if set to true. If no draft exists, the mapping from the workflow scheme is returned.
  Future<IssueTypesWorkflowMapping?> getWorkflow(int id, { String? workflowName, bool? returnDraftIfExists, Future<void>? abortTrigger, }) async {
    final response = await getWorkflowWithHttpInfo(id, workflowName: workflowName, returnDraftIfExists: returnDraftIfExists, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'IssueTypesWorkflowMapping',) as IssueTypesWorkflowMapping;
    
    }
    return null;
  }

  /// Get workflow scheme
  ///
  /// Returns a workflow scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme. Find this ID by editing the desired workflow scheme in Jira. The ID is shown in the URL as `schemeId`. For example, *schemeId=10301*.
  ///
  /// * [bool] returnDraftIfExists:
  ///   Returns the workflow scheme's draft rather than scheme itself, if set to true. If the workflow scheme does not have a draft, then the workflow scheme is returned.
  Future<Response> getWorkflowSchemeWithHttpInfo(int id, { bool? returnDraftIfExists, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflowscheme/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (returnDraftIfExists != null) {
      queryParams.addAll(_queryParams('', 'returnDraftIfExists', returnDraftIfExists));
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

  /// Get workflow scheme
  ///
  /// Returns a workflow scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme. Find this ID by editing the desired workflow scheme in Jira. The ID is shown in the URL as `schemeId`. For example, *schemeId=10301*.
  ///
  /// * [bool] returnDraftIfExists:
  ///   Returns the workflow scheme's draft rather than scheme itself, if set to true. If the workflow scheme does not have a draft, then the workflow scheme is returned.
  Future<WorkflowScheme?> getWorkflowScheme(int id, { bool? returnDraftIfExists, Future<void>? abortTrigger, }) async {
    final response = await getWorkflowSchemeWithHttpInfo(id, returnDraftIfExists: returnDraftIfExists, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'WorkflowScheme',) as WorkflowScheme;
    
    }
    return null;
  }

  /// Get workflow for issue type in workflow scheme
  ///
  /// Returns the issue type-workflow mapping for an issue type in a workflow scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme.
  ///
  /// * [String] issueType (required):
  ///   The ID of the issue type.
  ///
  /// * [bool] returnDraftIfExists:
  ///   Returns the mapping from the workflow scheme's draft rather than the workflow scheme, if set to true. If no draft exists, the mapping from the workflow scheme is returned.
  Future<Response> getWorkflowSchemeIssueTypeWithHttpInfo(int id, String issueType, { bool? returnDraftIfExists, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflowscheme/{id}/issuetype/{issueType}'
      .replaceAll('{id}', id.toString())
      .replaceAll('{issueType}', issueType);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (returnDraftIfExists != null) {
      queryParams.addAll(_queryParams('', 'returnDraftIfExists', returnDraftIfExists));
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

  /// Get workflow for issue type in workflow scheme
  ///
  /// Returns the issue type-workflow mapping for an issue type in a workflow scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme.
  ///
  /// * [String] issueType (required):
  ///   The ID of the issue type.
  ///
  /// * [bool] returnDraftIfExists:
  ///   Returns the mapping from the workflow scheme's draft rather than the workflow scheme, if set to true. If no draft exists, the mapping from the workflow scheme is returned.
  Future<IssueTypeWorkflowMapping?> getWorkflowSchemeIssueType(int id, String issueType, { bool? returnDraftIfExists, Future<void>? abortTrigger, }) async {
    final response = await getWorkflowSchemeIssueTypeWithHttpInfo(id, issueType, returnDraftIfExists: returnDraftIfExists, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'IssueTypeWorkflowMapping',) as IssueTypeWorkflowMapping;
    
    }
    return null;
  }

  /// Bulk get workflow schemes
  ///
  /// Returns a list of workflow schemes by providing workflow scheme IDs or project IDs.  **[Permissions](#permissions) required:**   *  *Administer Jira* global permission to access all, including project-scoped, workflow schemes  *  *Administer projects* project permissions to access project-scoped workflow schemes
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [WorkflowSchemeReadRequest] workflowSchemeReadRequest (required):
  Future<Response> readWorkflowSchemesWithHttpInfo(WorkflowSchemeReadRequest workflowSchemeReadRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflowscheme/read';

    // ignore: prefer_final_locals
    Object? postBody = workflowSchemeReadRequest;

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

  /// Bulk get workflow schemes
  ///
  /// Returns a list of workflow schemes by providing workflow scheme IDs or project IDs.  **[Permissions](#permissions) required:**   *  *Administer Jira* global permission to access all, including project-scoped, workflow schemes  *  *Administer projects* project permissions to access project-scoped workflow schemes
  ///
  /// Parameters:
  ///
  /// * [WorkflowSchemeReadRequest] workflowSchemeReadRequest (required):
  Future<List<WorkflowSchemeReadResponse>?> readWorkflowSchemes(WorkflowSchemeReadRequest workflowSchemeReadRequest, { Future<void>? abortTrigger, }) async {
    final response = await readWorkflowSchemesWithHttpInfo(workflowSchemeReadRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<WorkflowSchemeReadResponse>') as List)
        .cast<WorkflowSchemeReadResponse>()
        .toList(growable: false);

    }
    return null;
  }

  /// Set workflow for issue type in workflow scheme
  ///
  /// Sets the workflow for an issue type in a workflow scheme.  Note that active workflow schemes cannot be edited. If the workflow scheme is active, set `updateDraftIfNeeded` to `true` in the request body and a draft workflow scheme is created or updated with the new issue type-workflow mapping. The draft workflow scheme can be published in Jira.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme.
  ///
  /// * [String] issueType (required):
  ///   The ID of the issue type.
  ///
  /// * [IssueTypeWorkflowMapping] issueTypeWorkflowMapping (required):
  ///   The issue type-project mapping.
  Future<Response> setWorkflowSchemeIssueTypeWithHttpInfo(int id, String issueType, IssueTypeWorkflowMapping issueTypeWorkflowMapping, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflowscheme/{id}/issuetype/{issueType}'
      .replaceAll('{id}', id.toString())
      .replaceAll('{issueType}', issueType);

    // ignore: prefer_final_locals
    Object? postBody = issueTypeWorkflowMapping;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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

  /// Set workflow for issue type in workflow scheme
  ///
  /// Sets the workflow for an issue type in a workflow scheme.  Note that active workflow schemes cannot be edited. If the workflow scheme is active, set `updateDraftIfNeeded` to `true` in the request body and a draft workflow scheme is created or updated with the new issue type-workflow mapping. The draft workflow scheme can be published in Jira.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme.
  ///
  /// * [String] issueType (required):
  ///   The ID of the issue type.
  ///
  /// * [IssueTypeWorkflowMapping] issueTypeWorkflowMapping (required):
  ///   The issue type-project mapping.
  Future<WorkflowScheme?> setWorkflowSchemeIssueType(int id, String issueType, IssueTypeWorkflowMapping issueTypeWorkflowMapping, { Future<void>? abortTrigger, }) async {
    final response = await setWorkflowSchemeIssueTypeWithHttpInfo(id, issueType, issueTypeWorkflowMapping, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'WorkflowScheme',) as WorkflowScheme;
    
    }
    return null;
  }

  /// Switch workflow scheme for project
  ///
  /// Switches a workflow scheme for a project.  Workflow schemes can only be assigned to classic projects.  **Calculating required mappings:** If statuses from the current workflow scheme won't exist in the target workflow scheme, you must provide `mappingsByIssueTypeOverride` to specify how issues with those statuses should be migrated. Use [the required workflow scheme mappings API](#api-rest-api-3-workflowscheme-update-mappings-post) to determine which statuses and issue types require mappings.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [WorkflowSchemeProjectSwitchBean] workflowSchemeProjectSwitchBean (required):
  ///   The request containing project ID, target scheme ID, and any issue type mappings.
  Future<Response> switchWorkflowSchemeForProjectWithHttpInfo(WorkflowSchemeProjectSwitchBean workflowSchemeProjectSwitchBean, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflowscheme/project/switch';

    // ignore: prefer_final_locals
    Object? postBody = workflowSchemeProjectSwitchBean;

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

  /// Switch workflow scheme for project
  ///
  /// Switches a workflow scheme for a project.  Workflow schemes can only be assigned to classic projects.  **Calculating required mappings:** If statuses from the current workflow scheme won't exist in the target workflow scheme, you must provide `mappingsByIssueTypeOverride` to specify how issues with those statuses should be migrated. Use [the required workflow scheme mappings API](#api-rest-api-3-workflowscheme-update-mappings-post) to determine which statuses and issue types require mappings.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [WorkflowSchemeProjectSwitchBean] workflowSchemeProjectSwitchBean (required):
  ///   The request containing project ID, target scheme ID, and any issue type mappings.
  Future<void> switchWorkflowSchemeForProject(WorkflowSchemeProjectSwitchBean workflowSchemeProjectSwitchBean, { Future<void>? abortTrigger, }) async {
    final response = await switchWorkflowSchemeForProjectWithHttpInfo(workflowSchemeProjectSwitchBean, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Update default workflow
  ///
  /// Sets the default workflow for a workflow scheme.  Note that active workflow schemes cannot be edited. If the workflow scheme is active, set `updateDraftIfNeeded` to `true` in the request object and a draft workflow scheme is created or updated with the new default workflow. The draft workflow scheme can be published in Jira.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme.
  ///
  /// * [DefaultWorkflow] defaultWorkflow (required):
  ///   The new default workflow.
  Future<Response> updateDefaultWorkflowWithHttpInfo(int id, DefaultWorkflow defaultWorkflow, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflowscheme/{id}/default'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = defaultWorkflow;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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

  /// Update default workflow
  ///
  /// Sets the default workflow for a workflow scheme.  Note that active workflow schemes cannot be edited. If the workflow scheme is active, set `updateDraftIfNeeded` to `true` in the request object and a draft workflow scheme is created or updated with the new default workflow. The draft workflow scheme can be published in Jira.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme.
  ///
  /// * [DefaultWorkflow] defaultWorkflow (required):
  ///   The new default workflow.
  Future<WorkflowScheme?> updateDefaultWorkflow(int id, DefaultWorkflow defaultWorkflow, { Future<void>? abortTrigger, }) async {
    final response = await updateDefaultWorkflowWithHttpInfo(id, defaultWorkflow, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'WorkflowScheme',) as WorkflowScheme;
    
    }
    return null;
  }

  /// Update workflow scheme
  ///
  /// Updates company-managed and team-managed project workflow schemes. This API doesn't have a concept of draft, so any changes made to a workflow scheme are immediately available. When changing the available statuses for issue types, an [asynchronous task](#async) migrates the issues as defined in the provided mappings.  **[Permissions](#permissions) required:**   *  *Administer Jira* project permission to update all, including global-scoped, workflow schemes.  *  *Administer projects* project permission to update project-scoped workflow schemes.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [WorkflowSchemeUpdateRequest] workflowSchemeUpdateRequest (required):
  Future<Response> updateSchemesWithHttpInfo(WorkflowSchemeUpdateRequest workflowSchemeUpdateRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflowscheme/update';

    // ignore: prefer_final_locals
    Object? postBody = workflowSchemeUpdateRequest;

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

  /// Update workflow scheme
  ///
  /// Updates company-managed and team-managed project workflow schemes. This API doesn't have a concept of draft, so any changes made to a workflow scheme are immediately available. When changing the available statuses for issue types, an [asynchronous task](#async) migrates the issues as defined in the provided mappings.  **[Permissions](#permissions) required:**   *  *Administer Jira* project permission to update all, including global-scoped, workflow schemes.  *  *Administer projects* project permission to update project-scoped workflow schemes.
  ///
  /// Parameters:
  ///
  /// * [WorkflowSchemeUpdateRequest] workflowSchemeUpdateRequest (required):
  Future<Object?> updateSchemes(WorkflowSchemeUpdateRequest workflowSchemeUpdateRequest, { Future<void>? abortTrigger, }) async {
    final response = await updateSchemesWithHttpInfo(workflowSchemeUpdateRequest, abortTrigger: abortTrigger,);
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

  /// Set issue types for workflow in workflow scheme
  ///
  /// Sets the issue types for a workflow in a workflow scheme. The workflow can also be set as the default workflow for the workflow scheme. Unmapped issues types are mapped to the default workflow.  Note that active workflow schemes cannot be edited. If the workflow scheme is active, set `updateDraftIfNeeded` to `true` in the request body and a draft workflow scheme is created or updated with the new workflow-issue types mappings. The draft workflow scheme can be published in Jira.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme.
  ///
  /// * [String] workflowName (required):
  ///   The name of the workflow.
  ///
  /// * [IssueTypesWorkflowMapping] issueTypesWorkflowMapping (required):
  Future<Response> updateWorkflowMappingWithHttpInfo(int id, String workflowName, IssueTypesWorkflowMapping issueTypesWorkflowMapping, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflowscheme/{id}/workflow'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = issueTypesWorkflowMapping;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'workflowName', workflowName));

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

  /// Set issue types for workflow in workflow scheme
  ///
  /// Sets the issue types for a workflow in a workflow scheme. The workflow can also be set as the default workflow for the workflow scheme. Unmapped issues types are mapped to the default workflow.  Note that active workflow schemes cannot be edited. If the workflow scheme is active, set `updateDraftIfNeeded` to `true` in the request body and a draft workflow scheme is created or updated with the new workflow-issue types mappings. The draft workflow scheme can be published in Jira.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme.
  ///
  /// * [String] workflowName (required):
  ///   The name of the workflow.
  ///
  /// * [IssueTypesWorkflowMapping] issueTypesWorkflowMapping (required):
  Future<WorkflowScheme?> updateWorkflowMapping(int id, String workflowName, IssueTypesWorkflowMapping issueTypesWorkflowMapping, { Future<void>? abortTrigger, }) async {
    final response = await updateWorkflowMappingWithHttpInfo(id, workflowName, issueTypesWorkflowMapping, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'WorkflowScheme',) as WorkflowScheme;
    
    }
    return null;
  }

  /// Classic update workflow scheme
  ///
  /// Updates a company-manged project workflow scheme, including the name, default workflow, issue type to project mappings, and more. If the workflow scheme is active (that is, being used by at least one project), then a draft workflow scheme is created or updated instead, provided that `updateDraftIfNeeded` is set to `true`.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme. Find this ID by editing the desired workflow scheme in Jira. The ID is shown in the URL as `schemeId`. For example, *schemeId=10301*.
  ///
  /// * [WorkflowScheme] workflowScheme (required):
  Future<Response> updateWorkflowSchemeWithHttpInfo(int id, WorkflowScheme workflowScheme, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflowscheme/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = workflowScheme;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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

  /// Classic update workflow scheme
  ///
  /// Updates a company-manged project workflow scheme, including the name, default workflow, issue type to project mappings, and more. If the workflow scheme is active (that is, being used by at least one project), then a draft workflow scheme is created or updated instead, provided that `updateDraftIfNeeded` is set to `true`.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme. Find this ID by editing the desired workflow scheme in Jira. The ID is shown in the URL as `schemeId`. For example, *schemeId=10301*.
  ///
  /// * [WorkflowScheme] workflowScheme (required):
  Future<WorkflowScheme?> updateWorkflowScheme(int id, WorkflowScheme workflowScheme, { Future<void>? abortTrigger, }) async {
    final response = await updateWorkflowSchemeWithHttpInfo(id, workflowScheme, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'WorkflowScheme',) as WorkflowScheme;
    
    }
    return null;
  }
}
