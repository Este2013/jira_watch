//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class WorkflowSchemeProjectAssociationsApi {
  WorkflowSchemeProjectAssociationsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Assign workflow scheme to project
  ///
  /// Assigns a workflow scheme to a project. This operation is performed only when there are no issues in the project.  Workflow schemes can only be assigned to classic projects.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [WorkflowSchemeProjectAssociation] workflowSchemeProjectAssociation (required):
  Future<Response> assignSchemeToProjectWithHttpInfo(WorkflowSchemeProjectAssociation workflowSchemeProjectAssociation, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflowscheme/project';

    // ignore: prefer_final_locals
    Object? postBody = workflowSchemeProjectAssociation;

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

  /// Assign workflow scheme to project
  ///
  /// Assigns a workflow scheme to a project. This operation is performed only when there are no issues in the project.  Workflow schemes can only be assigned to classic projects.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [WorkflowSchemeProjectAssociation] workflowSchemeProjectAssociation (required):
  Future<Object?> assignSchemeToProject(WorkflowSchemeProjectAssociation workflowSchemeProjectAssociation, { Future<void>? abortTrigger, }) async {
    final response = await assignSchemeToProjectWithHttpInfo(workflowSchemeProjectAssociation, abortTrigger: abortTrigger,);
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

  /// Get workflow scheme project associations
  ///
  /// Returns a list of the workflow schemes associated with a list of projects. Each returned workflow scheme includes a list of the requested projects associated with it. Any team-managed or non-existent projects in the request are ignored and no errors are returned.  If the project is associated with the `Default Workflow Scheme` no ID is returned. This is because the way the `Default Workflow Scheme` is stored means it has no ID.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [List<int>] projectId (required):
  ///   The ID of a project to return the workflow schemes for. To include multiple projects, provide an ampersand-Jim: oneseparated list. For example, `projectId=10000&projectId=10001`.
  Future<Response> getWorkflowSchemeProjectAssociationsWithHttpInfo(List<int> projectId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflowscheme/project';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('multi', 'projectId', projectId));

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

  /// Get workflow scheme project associations
  ///
  /// Returns a list of the workflow schemes associated with a list of projects. Each returned workflow scheme includes a list of the requested projects associated with it. Any team-managed or non-existent projects in the request are ignored and no errors are returned.  If the project is associated with the `Default Workflow Scheme` no ID is returned. This is because the way the `Default Workflow Scheme` is stored means it has no ID.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [List<int>] projectId (required):
  ///   The ID of a project to return the workflow schemes for. To include multiple projects, provide an ampersand-Jim: oneseparated list. For example, `projectId=10000&projectId=10001`.
  Future<ContainerOfWorkflowSchemeAssociations?> getWorkflowSchemeProjectAssociations(List<int> projectId, { Future<void>? abortTrigger, }) async {
    final response = await getWorkflowSchemeProjectAssociationsWithHttpInfo(projectId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ContainerOfWorkflowSchemeAssociations',) as ContainerOfWorkflowSchemeAssociations;
    
    }
    return null;
  }
}
