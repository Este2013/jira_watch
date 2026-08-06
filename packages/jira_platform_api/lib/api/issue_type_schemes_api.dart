//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class IssueTypeSchemesApi {
  IssueTypeSchemesApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Add issue types to issue type scheme
  ///
  /// Adds issue types to an issue type scheme.  The added issue types are appended to the issue types list.  If any of the issue types exist in the issue type scheme, the operation fails and no issue types are added.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] issueTypeSchemeId (required):
  ///   The ID of the issue type scheme.
  ///
  /// * [IssueTypeIds] issueTypeIds (required):
  Future<Response> addIssueTypesToIssueTypeSchemeWithHttpInfo(int issueTypeSchemeId, IssueTypeIds issueTypeIds, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuetypescheme/{issueTypeSchemeId}/issuetype'
      .replaceAll('{issueTypeSchemeId}', issueTypeSchemeId.toString());

    // ignore: prefer_final_locals
    Object? postBody = issueTypeIds;

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

  /// Add issue types to issue type scheme
  ///
  /// Adds issue types to an issue type scheme.  The added issue types are appended to the issue types list.  If any of the issue types exist in the issue type scheme, the operation fails and no issue types are added.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] issueTypeSchemeId (required):
  ///   The ID of the issue type scheme.
  ///
  /// * [IssueTypeIds] issueTypeIds (required):
  Future<Object?> addIssueTypesToIssueTypeScheme(int issueTypeSchemeId, IssueTypeIds issueTypeIds, { Future<void>? abortTrigger, }) async {
    final response = await addIssueTypesToIssueTypeSchemeWithHttpInfo(issueTypeSchemeId, issueTypeIds, abortTrigger: abortTrigger,);
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

  /// Assign issue type scheme to project
  ///
  /// Assigns an issue type scheme to a project.  If any issues in the project are assigned issue types not present in the new scheme, the operation will fail. To complete the assignment those issues must be updated to use issue types in the new scheme.  Issue type schemes can only be assigned to classic projects.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [IssueTypeSchemeProjectAssociation] issueTypeSchemeProjectAssociation (required):
  Future<Response> assignIssueTypeSchemeToProjectWithHttpInfo(IssueTypeSchemeProjectAssociation issueTypeSchemeProjectAssociation, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuetypescheme/project';

    // ignore: prefer_final_locals
    Object? postBody = issueTypeSchemeProjectAssociation;

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

  /// Assign issue type scheme to project
  ///
  /// Assigns an issue type scheme to a project.  If any issues in the project are assigned issue types not present in the new scheme, the operation will fail. To complete the assignment those issues must be updated to use issue types in the new scheme.  Issue type schemes can only be assigned to classic projects.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [IssueTypeSchemeProjectAssociation] issueTypeSchemeProjectAssociation (required):
  Future<Object?> assignIssueTypeSchemeToProject(IssueTypeSchemeProjectAssociation issueTypeSchemeProjectAssociation, { Future<void>? abortTrigger, }) async {
    final response = await assignIssueTypeSchemeToProjectWithHttpInfo(issueTypeSchemeProjectAssociation, abortTrigger: abortTrigger,);
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

  /// Create issue type scheme
  ///
  /// Creates an issue type scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [IssueTypeSchemeDetails] issueTypeSchemeDetails (required):
  Future<Response> createIssueTypeSchemeWithHttpInfo(IssueTypeSchemeDetails issueTypeSchemeDetails, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuetypescheme';

    // ignore: prefer_final_locals
    Object? postBody = issueTypeSchemeDetails;

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

  /// Create issue type scheme
  ///
  /// Creates an issue type scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [IssueTypeSchemeDetails] issueTypeSchemeDetails (required):
  Future<IssueTypeSchemeID?> createIssueTypeScheme(IssueTypeSchemeDetails issueTypeSchemeDetails, { Future<void>? abortTrigger, }) async {
    final response = await createIssueTypeSchemeWithHttpInfo(issueTypeSchemeDetails, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'IssueTypeSchemeID',) as IssueTypeSchemeID;
    
    }
    return null;
  }

  /// Delete issue type scheme
  ///
  /// Deletes an issue type scheme.  Only issue type schemes used in classic projects can be deleted. Only issue type schemes not associated with a project can be deleted  A validation error will be returned if the specified scheme is associated with one or more projects. Use [Get issue type scheme API](https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-issue-type-schemes/#api-rest-api-3-issuetypescheme-get) (with the projects expand, and id query parameter) to get a list of projects. Then, use [Assign issue type scheme to project API](https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-issue-type-schemes/#api-rest-api-3-issuetypescheme-project-put) to associate all projects to another scheme before deleting.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] issueTypeSchemeId (required):
  ///   The ID of the issue type scheme.
  Future<Response> deleteIssueTypeSchemeWithHttpInfo(int issueTypeSchemeId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuetypescheme/{issueTypeSchemeId}'
      .replaceAll('{issueTypeSchemeId}', issueTypeSchemeId.toString());

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

  /// Delete issue type scheme
  ///
  /// Deletes an issue type scheme.  Only issue type schemes used in classic projects can be deleted. Only issue type schemes not associated with a project can be deleted  A validation error will be returned if the specified scheme is associated with one or more projects. Use [Get issue type scheme API](https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-issue-type-schemes/#api-rest-api-3-issuetypescheme-get) (with the projects expand, and id query parameter) to get a list of projects. Then, use [Assign issue type scheme to project API](https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-issue-type-schemes/#api-rest-api-3-issuetypescheme-project-put) to associate all projects to another scheme before deleting.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] issueTypeSchemeId (required):
  ///   The ID of the issue type scheme.
  Future<Object?> deleteIssueTypeScheme(int issueTypeSchemeId, { Future<void>? abortTrigger, }) async {
    final response = await deleteIssueTypeSchemeWithHttpInfo(issueTypeSchemeId, abortTrigger: abortTrigger,);
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

  /// Get all issue type schemes
  ///
  /// Returns a [paginated](#pagination) list of issue type schemes.  Only issue type schemes used in classic projects are returned.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
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
  /// * [List<int>] id:
  ///   The list of issue type schemes IDs. To include multiple IDs, provide an ampersand-separated list. For example, `id=10000&id=10001`.
  ///
  /// * [String] orderBy:
  ///   [Order](#ordering) the results by a field:   *  `name` Sorts by issue type scheme name.  *  `id` Sorts by issue type scheme ID.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expand options include:   *  `projects` For each issue type schemes, returns information about the projects the issue type scheme is assigned to.  *  `issueTypes` For each issue type schemes, returns information about the issueTypes the issue type scheme have.
  ///
  /// * [String] queryString:
  ///   String used to perform a case-insensitive partial match with issue type scheme name.
  Future<Response> getAllIssueTypeSchemesWithHttpInfo({ int? startAt, int? maxResults, List<int>? id, String? orderBy, String? expand, String? queryString, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuetypescheme';

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
    if (id != null) {
      queryParams.addAll(_queryParams('multi', 'id', id));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'orderBy', orderBy));
    }
    if (expand != null) {
      queryParams.addAll(_queryParams('', 'expand', expand));
    }
    if (queryString != null) {
      queryParams.addAll(_queryParams('', 'queryString', queryString));
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

  /// Get all issue type schemes
  ///
  /// Returns a [paginated](#pagination) list of issue type schemes.  Only issue type schemes used in classic projects are returned.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [List<int>] id:
  ///   The list of issue type schemes IDs. To include multiple IDs, provide an ampersand-separated list. For example, `id=10000&id=10001`.
  ///
  /// * [String] orderBy:
  ///   [Order](#ordering) the results by a field:   *  `name` Sorts by issue type scheme name.  *  `id` Sorts by issue type scheme ID.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expand options include:   *  `projects` For each issue type schemes, returns information about the projects the issue type scheme is assigned to.  *  `issueTypes` For each issue type schemes, returns information about the issueTypes the issue type scheme have.
  ///
  /// * [String] queryString:
  ///   String used to perform a case-insensitive partial match with issue type scheme name.
  Future<PageBeanIssueTypeScheme?> getAllIssueTypeSchemes({ int? startAt, int? maxResults, List<int>? id, String? orderBy, String? expand, String? queryString, Future<void>? abortTrigger, }) async {
    final response = await getAllIssueTypeSchemesWithHttpInfo(startAt: startAt, maxResults: maxResults, id: id, orderBy: orderBy, expand: expand, queryString: queryString, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanIssueTypeScheme',) as PageBeanIssueTypeScheme;
    
    }
    return null;
  }

  /// Get issue type schemes for projects
  ///
  /// Returns a [paginated](#pagination) list of issue type schemes and, for each issue type scheme, a list of the projects that use it.  Only issue type schemes used in classic projects are returned.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [List<int>] projectId (required):
  ///   The list of project IDs. To include multiple project IDs, provide an ampersand-separated list. For example, `projectId=10000&projectId=10001`.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  Future<Response> getIssueTypeSchemeForProjectsWithHttpInfo(List<int> projectId, { int? startAt, int? maxResults, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuetypescheme/project';

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

  /// Get issue type schemes for projects
  ///
  /// Returns a [paginated](#pagination) list of issue type schemes and, for each issue type scheme, a list of the projects that use it.  Only issue type schemes used in classic projects are returned.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [List<int>] projectId (required):
  ///   The list of project IDs. To include multiple project IDs, provide an ampersand-separated list. For example, `projectId=10000&projectId=10001`.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  Future<PageBeanIssueTypeSchemeProjects?> getIssueTypeSchemeForProjects(List<int> projectId, { int? startAt, int? maxResults, Future<void>? abortTrigger, }) async {
    final response = await getIssueTypeSchemeForProjectsWithHttpInfo(projectId, startAt: startAt, maxResults: maxResults, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanIssueTypeSchemeProjects',) as PageBeanIssueTypeSchemeProjects;
    
    }
    return null;
  }

  /// Get issue type scheme items
  ///
  /// Returns a [paginated](#pagination) list of issue type scheme items.  Only issue type scheme items used in classic projects are returned.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
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
  /// * [List<int>] issueTypeSchemeId:
  ///   The list of issue type scheme IDs. To include multiple IDs, provide an ampersand-separated list. For example, `issueTypeSchemeId=10000&issueTypeSchemeId=10001`.
  Future<Response> getIssueTypeSchemesMappingWithHttpInfo({ int? startAt, int? maxResults, List<int>? issueTypeSchemeId, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuetypescheme/mapping';

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
    if (issueTypeSchemeId != null) {
      queryParams.addAll(_queryParams('multi', 'issueTypeSchemeId', issueTypeSchemeId));
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

  /// Get issue type scheme items
  ///
  /// Returns a [paginated](#pagination) list of issue type scheme items.  Only issue type scheme items used in classic projects are returned.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [List<int>] issueTypeSchemeId:
  ///   The list of issue type scheme IDs. To include multiple IDs, provide an ampersand-separated list. For example, `issueTypeSchemeId=10000&issueTypeSchemeId=10001`.
  Future<PageBeanIssueTypeSchemeMapping?> getIssueTypeSchemesMapping({ int? startAt, int? maxResults, List<int>? issueTypeSchemeId, Future<void>? abortTrigger, }) async {
    final response = await getIssueTypeSchemesMappingWithHttpInfo(startAt: startAt, maxResults: maxResults, issueTypeSchemeId: issueTypeSchemeId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanIssueTypeSchemeMapping',) as PageBeanIssueTypeSchemeMapping;
    
    }
    return null;
  }

  /// Remove issue type from issue type scheme
  ///
  /// Removes an issue type from an issue type scheme.  This operation cannot remove:   *  any issue type used by issues.  *  any issue types from the default issue type scheme.  *  the last standard issue type from an issue type scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] issueTypeSchemeId (required):
  ///   The ID of the issue type scheme.
  ///
  /// * [int] issueTypeId (required):
  ///   The ID of the issue type.
  Future<Response> removeIssueTypeFromIssueTypeSchemeWithHttpInfo(int issueTypeSchemeId, int issueTypeId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuetypescheme/{issueTypeSchemeId}/issuetype/{issueTypeId}'
      .replaceAll('{issueTypeSchemeId}', issueTypeSchemeId.toString())
      .replaceAll('{issueTypeId}', issueTypeId.toString());

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

  /// Remove issue type from issue type scheme
  ///
  /// Removes an issue type from an issue type scheme.  This operation cannot remove:   *  any issue type used by issues.  *  any issue types from the default issue type scheme.  *  the last standard issue type from an issue type scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] issueTypeSchemeId (required):
  ///   The ID of the issue type scheme.
  ///
  /// * [int] issueTypeId (required):
  ///   The ID of the issue type.
  Future<Object?> removeIssueTypeFromIssueTypeScheme(int issueTypeSchemeId, int issueTypeId, { Future<void>? abortTrigger, }) async {
    final response = await removeIssueTypeFromIssueTypeSchemeWithHttpInfo(issueTypeSchemeId, issueTypeId, abortTrigger: abortTrigger,);
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

  /// Change order of issue types
  ///
  /// Changes the order of issue types in an issue type scheme.  The request body parameters must meet the following requirements:   *  all of the issue types must belong to the issue type scheme.  *  either `after` or `position` must be provided.  *  the issue type in `after` must not be in the issue type list.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] issueTypeSchemeId (required):
  ///   The ID of the issue type scheme.
  ///
  /// * [OrderOfIssueTypes] orderOfIssueTypes (required):
  Future<Response> reorderIssueTypesInIssueTypeSchemeWithHttpInfo(int issueTypeSchemeId, OrderOfIssueTypes orderOfIssueTypes, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuetypescheme/{issueTypeSchemeId}/issuetype/move'
      .replaceAll('{issueTypeSchemeId}', issueTypeSchemeId.toString());

    // ignore: prefer_final_locals
    Object? postBody = orderOfIssueTypes;

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

  /// Change order of issue types
  ///
  /// Changes the order of issue types in an issue type scheme.  The request body parameters must meet the following requirements:   *  all of the issue types must belong to the issue type scheme.  *  either `after` or `position` must be provided.  *  the issue type in `after` must not be in the issue type list.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] issueTypeSchemeId (required):
  ///   The ID of the issue type scheme.
  ///
  /// * [OrderOfIssueTypes] orderOfIssueTypes (required):
  Future<Object?> reorderIssueTypesInIssueTypeScheme(int issueTypeSchemeId, OrderOfIssueTypes orderOfIssueTypes, { Future<void>? abortTrigger, }) async {
    final response = await reorderIssueTypesInIssueTypeSchemeWithHttpInfo(issueTypeSchemeId, orderOfIssueTypes, abortTrigger: abortTrigger,);
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

  /// Update issue type scheme
  ///
  /// Updates an issue type scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] issueTypeSchemeId (required):
  ///   The ID of the issue type scheme.
  ///
  /// * [IssueTypeSchemeUpdateDetails] issueTypeSchemeUpdateDetails (required):
  Future<Response> updateIssueTypeSchemeWithHttpInfo(int issueTypeSchemeId, IssueTypeSchemeUpdateDetails issueTypeSchemeUpdateDetails, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuetypescheme/{issueTypeSchemeId}'
      .replaceAll('{issueTypeSchemeId}', issueTypeSchemeId.toString());

    // ignore: prefer_final_locals
    Object? postBody = issueTypeSchemeUpdateDetails;

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

  /// Update issue type scheme
  ///
  /// Updates an issue type scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] issueTypeSchemeId (required):
  ///   The ID of the issue type scheme.
  ///
  /// * [IssueTypeSchemeUpdateDetails] issueTypeSchemeUpdateDetails (required):
  Future<Object?> updateIssueTypeScheme(int issueTypeSchemeId, IssueTypeSchemeUpdateDetails issueTypeSchemeUpdateDetails, { Future<void>? abortTrigger, }) async {
    final response = await updateIssueTypeSchemeWithHttpInfo(issueTypeSchemeId, issueTypeSchemeUpdateDetails, abortTrigger: abortTrigger,);
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
}
