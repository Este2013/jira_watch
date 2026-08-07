//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class WorkflowSchemeDraftsApi {
  WorkflowSchemeDraftsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create draft workflow scheme
  ///
  /// Create a draft workflow scheme from an active workflow scheme, by copying the active workflow scheme. Note that an active workflow scheme can only have one draft workflow scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the active workflow scheme that the draft is created from.
  Future<Response> createWorkflowSchemeDraftFromParentWithHttpInfo(int id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflowscheme/{id}/createdraft'
      .replaceAll('{id}', id.toString());

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

  /// Create draft workflow scheme
  ///
  /// Create a draft workflow scheme from an active workflow scheme, by copying the active workflow scheme. Note that an active workflow scheme can only have one draft workflow scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the active workflow scheme that the draft is created from.
  Future<WorkflowScheme?> createWorkflowSchemeDraftFromParent(int id, { Future<void>? abortTrigger, }) async {
    final response = await createWorkflowSchemeDraftFromParentWithHttpInfo(id, abortTrigger: abortTrigger,);
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

  /// Delete draft default workflow
  ///
  /// Resets the default workflow for a workflow scheme's draft. That is, the default workflow is set to Jira's system workflow (the *jira* workflow).  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme that the draft belongs to.
  Future<Response> deleteDraftDefaultWorkflowWithHttpInfo(int id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflowscheme/{id}/draft/default'
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

  /// Delete draft default workflow
  ///
  /// Resets the default workflow for a workflow scheme's draft. That is, the default workflow is set to Jira's system workflow (the *jira* workflow).  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme that the draft belongs to.
  Future<WorkflowScheme?> deleteDraftDefaultWorkflow(int id, { Future<void>? abortTrigger, }) async {
    final response = await deleteDraftDefaultWorkflowWithHttpInfo(id, abortTrigger: abortTrigger,);
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

  /// Delete issue types for workflow in draft workflow scheme
  ///
  /// Deletes the workflow-issue type mapping for a workflow in a workflow scheme's draft.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme that the draft belongs to.
  ///
  /// * [String] workflowName (required):
  ///   The name of the workflow.
  Future<Response> deleteDraftWorkflowMappingWithHttpInfo(int id, String workflowName, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflowscheme/{id}/draft/workflow'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'workflowName', workflowName));

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

  /// Delete issue types for workflow in draft workflow scheme
  ///
  /// Deletes the workflow-issue type mapping for a workflow in a workflow scheme's draft.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme that the draft belongs to.
  ///
  /// * [String] workflowName (required):
  ///   The name of the workflow.
  Future<void> deleteDraftWorkflowMapping(int id, String workflowName, { Future<void>? abortTrigger, }) async {
    final response = await deleteDraftWorkflowMappingWithHttpInfo(id, workflowName, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Delete draft workflow scheme
  ///
  /// Deletes a draft workflow scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the active workflow scheme that the draft was created from.
  Future<Response> deleteWorkflowSchemeDraftWithHttpInfo(int id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflowscheme/{id}/draft'
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

  /// Delete draft workflow scheme
  ///
  /// Deletes a draft workflow scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the active workflow scheme that the draft was created from.
  Future<void> deleteWorkflowSchemeDraft(int id, { Future<void>? abortTrigger, }) async {
    final response = await deleteWorkflowSchemeDraftWithHttpInfo(id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Delete workflow for issue type in draft workflow scheme
  ///
  /// Deletes the issue type-workflow mapping for an issue type in a workflow scheme's draft.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme that the draft belongs to.
  ///
  /// * [String] issueType (required):
  ///   The ID of the issue type.
  Future<Response> deleteWorkflowSchemeDraftIssueTypeWithHttpInfo(int id, String issueType, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflowscheme/{id}/draft/issuetype/{issueType}'
      .replaceAll('{id}', id.toString())
      .replaceAll('{issueType}', issueType);

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

  /// Delete workflow for issue type in draft workflow scheme
  ///
  /// Deletes the issue type-workflow mapping for an issue type in a workflow scheme's draft.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme that the draft belongs to.
  ///
  /// * [String] issueType (required):
  ///   The ID of the issue type.
  Future<WorkflowScheme?> deleteWorkflowSchemeDraftIssueType(int id, String issueType, { Future<void>? abortTrigger, }) async {
    final response = await deleteWorkflowSchemeDraftIssueTypeWithHttpInfo(id, issueType, abortTrigger: abortTrigger,);
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

  /// Get draft default workflow
  ///
  /// Returns the default workflow for a workflow scheme's draft. The default workflow is the workflow that is assigned any issue types that have not been mapped to any other workflow. The default workflow has *All Unassigned Issue Types* listed in its issue types for the workflow scheme in Jira.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme that the draft belongs to.
  Future<Response> getDraftDefaultWorkflowWithHttpInfo(int id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflowscheme/{id}/draft/default'
      .replaceAll('{id}', id.toString());

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

  /// Get draft default workflow
  ///
  /// Returns the default workflow for a workflow scheme's draft. The default workflow is the workflow that is assigned any issue types that have not been mapped to any other workflow. The default workflow has *All Unassigned Issue Types* listed in its issue types for the workflow scheme in Jira.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme that the draft belongs to.
  Future<DefaultWorkflow?> getDraftDefaultWorkflow(int id, { Future<void>? abortTrigger, }) async {
    final response = await getDraftDefaultWorkflowWithHttpInfo(id, abortTrigger: abortTrigger,);
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

  /// Get issue types for workflows in draft workflow scheme
  ///
  /// Returns the workflow-issue type mappings for a workflow scheme's draft.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme that the draft belongs to.
  ///
  /// * [String] workflowName:
  ///   The name of a workflow in the scheme. Limits the results to the workflow-issue type mapping for the specified workflow.
  Future<Response> getDraftWorkflowWithHttpInfo(int id, { String? workflowName, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflowscheme/{id}/draft/workflow'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (workflowName != null) {
      queryParams.addAll(_queryParams('', 'workflowName', workflowName));
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

  /// Get issue types for workflows in draft workflow scheme
  ///
  /// Returns the workflow-issue type mappings for a workflow scheme's draft.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme that the draft belongs to.
  ///
  /// * [String] workflowName:
  ///   The name of a workflow in the scheme. Limits the results to the workflow-issue type mapping for the specified workflow.
  Future<IssueTypesWorkflowMapping?> getDraftWorkflow(int id, { String? workflowName, Future<void>? abortTrigger, }) async {
    final response = await getDraftWorkflowWithHttpInfo(id, workflowName: workflowName, abortTrigger: abortTrigger,);
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

  /// Get draft workflow scheme
  ///
  /// Returns the draft workflow scheme for an active workflow scheme. Draft workflow schemes allow changes to be made to the active workflow schemes: When an active workflow scheme is updated, a draft copy is created. The draft is modified, then the changes in the draft are copied back to the active workflow scheme. See [Configuring workflow schemes](https://confluence.atlassian.com/x/tohKLg) for more information.   Note that:   *  Only active workflow schemes can have draft workflow schemes.  *  An active workflow scheme can only have one draft workflow scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the active workflow scheme that the draft was created from.
  Future<Response> getWorkflowSchemeDraftWithHttpInfo(int id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflowscheme/{id}/draft'
      .replaceAll('{id}', id.toString());

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

  /// Get draft workflow scheme
  ///
  /// Returns the draft workflow scheme for an active workflow scheme. Draft workflow schemes allow changes to be made to the active workflow schemes: When an active workflow scheme is updated, a draft copy is created. The draft is modified, then the changes in the draft are copied back to the active workflow scheme. See [Configuring workflow schemes](https://confluence.atlassian.com/x/tohKLg) for more information.   Note that:   *  Only active workflow schemes can have draft workflow schemes.  *  An active workflow scheme can only have one draft workflow scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the active workflow scheme that the draft was created from.
  Future<WorkflowScheme?> getWorkflowSchemeDraft(int id, { Future<void>? abortTrigger, }) async {
    final response = await getWorkflowSchemeDraftWithHttpInfo(id, abortTrigger: abortTrigger,);
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

  /// Get workflow for issue type in draft workflow scheme
  ///
  /// Returns the issue type-workflow mapping for an issue type in a workflow scheme's draft.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme that the draft belongs to.
  ///
  /// * [String] issueType (required):
  ///   The ID of the issue type.
  Future<Response> getWorkflowSchemeDraftIssueTypeWithHttpInfo(int id, String issueType, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflowscheme/{id}/draft/issuetype/{issueType}'
      .replaceAll('{id}', id.toString())
      .replaceAll('{issueType}', issueType);

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

  /// Get workflow for issue type in draft workflow scheme
  ///
  /// Returns the issue type-workflow mapping for an issue type in a workflow scheme's draft.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme that the draft belongs to.
  ///
  /// * [String] issueType (required):
  ///   The ID of the issue type.
  Future<IssueTypeWorkflowMapping?> getWorkflowSchemeDraftIssueType(int id, String issueType, { Future<void>? abortTrigger, }) async {
    final response = await getWorkflowSchemeDraftIssueTypeWithHttpInfo(id, issueType, abortTrigger: abortTrigger,);
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

  /// Publish draft workflow scheme
  ///
  /// Publishes a draft workflow scheme.  Where the draft workflow includes new workflow statuses for an issue type, mappings are provided to update issues with the original workflow status to the new workflow status.  This operation is [asynchronous](#async). Follow the `location` link in the response to determine the status of the task and use [Get task](#api-rest-api-3-task-taskId-get) to obtain updates.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme that the draft belongs to.
  ///
  /// * [PublishDraftWorkflowScheme] publishDraftWorkflowScheme (required):
  ///   Details of the status mappings.
  ///
  /// * [bool] validateOnly:
  ///   Whether the request only performs a validation.
  Future<Response> publishDraftWorkflowSchemeWithHttpInfo(int id, PublishDraftWorkflowScheme publishDraftWorkflowScheme, { bool? validateOnly, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflowscheme/{id}/draft/publish'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = publishDraftWorkflowScheme;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (validateOnly != null) {
      queryParams.addAll(_queryParams('', 'validateOnly', validateOnly));
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

  /// Publish draft workflow scheme
  ///
  /// Publishes a draft workflow scheme.  Where the draft workflow includes new workflow statuses for an issue type, mappings are provided to update issues with the original workflow status to the new workflow status.  This operation is [asynchronous](#async). Follow the `location` link in the response to determine the status of the task and use [Get task](#api-rest-api-3-task-taskId-get) to obtain updates.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme that the draft belongs to.
  ///
  /// * [PublishDraftWorkflowScheme] publishDraftWorkflowScheme (required):
  ///   Details of the status mappings.
  ///
  /// * [bool] validateOnly:
  ///   Whether the request only performs a validation.
  Future<void> publishDraftWorkflowScheme(int id, PublishDraftWorkflowScheme publishDraftWorkflowScheme, { bool? validateOnly, Future<void>? abortTrigger, }) async {
    final response = await publishDraftWorkflowSchemeWithHttpInfo(id, publishDraftWorkflowScheme, validateOnly: validateOnly, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Set workflow for issue type in draft workflow scheme
  ///
  /// Sets the workflow for an issue type in a workflow scheme's draft.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme that the draft belongs to.
  ///
  /// * [String] issueType (required):
  ///   The ID of the issue type.
  ///
  /// * [IssueTypeWorkflowMapping] issueTypeWorkflowMapping (required):
  ///   The issue type-project mapping.
  Future<Response> setWorkflowSchemeDraftIssueTypeWithHttpInfo(int id, String issueType, IssueTypeWorkflowMapping issueTypeWorkflowMapping, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflowscheme/{id}/draft/issuetype/{issueType}'
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

  /// Set workflow for issue type in draft workflow scheme
  ///
  /// Sets the workflow for an issue type in a workflow scheme's draft.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme that the draft belongs to.
  ///
  /// * [String] issueType (required):
  ///   The ID of the issue type.
  ///
  /// * [IssueTypeWorkflowMapping] issueTypeWorkflowMapping (required):
  ///   The issue type-project mapping.
  Future<WorkflowScheme?> setWorkflowSchemeDraftIssueType(int id, String issueType, IssueTypeWorkflowMapping issueTypeWorkflowMapping, { Future<void>? abortTrigger, }) async {
    final response = await setWorkflowSchemeDraftIssueTypeWithHttpInfo(id, issueType, issueTypeWorkflowMapping, abortTrigger: abortTrigger,);
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

  /// Update draft default workflow
  ///
  /// Sets the default workflow for a workflow scheme's draft.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme that the draft belongs to.
  ///
  /// * [DefaultWorkflow] defaultWorkflow (required):
  ///   The object for the new default workflow.
  Future<Response> updateDraftDefaultWorkflowWithHttpInfo(int id, DefaultWorkflow defaultWorkflow, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflowscheme/{id}/draft/default'
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

  /// Update draft default workflow
  ///
  /// Sets the default workflow for a workflow scheme's draft.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme that the draft belongs to.
  ///
  /// * [DefaultWorkflow] defaultWorkflow (required):
  ///   The object for the new default workflow.
  Future<WorkflowScheme?> updateDraftDefaultWorkflow(int id, DefaultWorkflow defaultWorkflow, { Future<void>? abortTrigger, }) async {
    final response = await updateDraftDefaultWorkflowWithHttpInfo(id, defaultWorkflow, abortTrigger: abortTrigger,);
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

  /// Set issue types for workflow in workflow scheme
  ///
  /// Sets the issue types for a workflow in a workflow scheme's draft. The workflow can also be set as the default workflow for the draft workflow scheme. Unmapped issues types are mapped to the default workflow.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme that the draft belongs to.
  ///
  /// * [String] workflowName (required):
  ///   The name of the workflow.
  ///
  /// * [IssueTypesWorkflowMapping] issueTypesWorkflowMapping (required):
  Future<Response> updateDraftWorkflowMappingWithHttpInfo(int id, String workflowName, IssueTypesWorkflowMapping issueTypesWorkflowMapping, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflowscheme/{id}/draft/workflow'
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
  /// Sets the issue types for a workflow in a workflow scheme's draft. The workflow can also be set as the default workflow for the draft workflow scheme. Unmapped issues types are mapped to the default workflow.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the workflow scheme that the draft belongs to.
  ///
  /// * [String] workflowName (required):
  ///   The name of the workflow.
  ///
  /// * [IssueTypesWorkflowMapping] issueTypesWorkflowMapping (required):
  Future<WorkflowScheme?> updateDraftWorkflowMapping(int id, String workflowName, IssueTypesWorkflowMapping issueTypesWorkflowMapping, { Future<void>? abortTrigger, }) async {
    final response = await updateDraftWorkflowMappingWithHttpInfo(id, workflowName, issueTypesWorkflowMapping, abortTrigger: abortTrigger,);
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

  /// Update draft workflow scheme
  ///
  /// Updates a draft workflow scheme. If a draft workflow scheme does not exist for the active workflow scheme, then a draft is created. Note that an active workflow scheme can only have one draft workflow scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the active workflow scheme that the draft was created from.
  ///
  /// * [WorkflowScheme] workflowScheme (required):
  Future<Response> updateWorkflowSchemeDraftWithHttpInfo(int id, WorkflowScheme workflowScheme, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflowscheme/{id}/draft'
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

  /// Update draft workflow scheme
  ///
  /// Updates a draft workflow scheme. If a draft workflow scheme does not exist for the active workflow scheme, then a draft is created. Note that an active workflow scheme can only have one draft workflow scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the active workflow scheme that the draft was created from.
  ///
  /// * [WorkflowScheme] workflowScheme (required):
  Future<WorkflowScheme?> updateWorkflowSchemeDraft(int id, WorkflowScheme workflowScheme, { Future<void>? abortTrigger, }) async {
    final response = await updateWorkflowSchemeDraftWithHttpInfo(id, workflowScheme, abortTrigger: abortTrigger,);
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
