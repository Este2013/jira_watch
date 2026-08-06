//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class IssueTypeScreenSchemesApi {
  IssueTypeScreenSchemesApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Append mappings to issue type screen scheme
  ///
  /// Appends issue type to screen scheme mappings to an issue type screen scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] issueTypeScreenSchemeId (required):
  ///   The ID of the issue type screen scheme.
  ///
  /// * [IssueTypeScreenSchemeMappingDetails] issueTypeScreenSchemeMappingDetails (required):
  Future<Response> appendMappingsForIssueTypeScreenSchemeWithHttpInfo(String issueTypeScreenSchemeId, IssueTypeScreenSchemeMappingDetails issueTypeScreenSchemeMappingDetails, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuetypescreenscheme/{issueTypeScreenSchemeId}/mapping'
      .replaceAll('{issueTypeScreenSchemeId}', issueTypeScreenSchemeId);

    // ignore: prefer_final_locals
    Object? postBody = issueTypeScreenSchemeMappingDetails;

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

  /// Append mappings to issue type screen scheme
  ///
  /// Appends issue type to screen scheme mappings to an issue type screen scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] issueTypeScreenSchemeId (required):
  ///   The ID of the issue type screen scheme.
  ///
  /// * [IssueTypeScreenSchemeMappingDetails] issueTypeScreenSchemeMappingDetails (required):
  Future<Object?> appendMappingsForIssueTypeScreenScheme(String issueTypeScreenSchemeId, IssueTypeScreenSchemeMappingDetails issueTypeScreenSchemeMappingDetails, { Future<void>? abortTrigger, }) async {
    final response = await appendMappingsForIssueTypeScreenSchemeWithHttpInfo(issueTypeScreenSchemeId, issueTypeScreenSchemeMappingDetails, abortTrigger: abortTrigger,);
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

  /// Assign issue type screen scheme to project
  ///
  /// Assigns an issue type screen scheme to a project.  Issue type screen schemes can only be assigned to classic projects.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [IssueTypeScreenSchemeProjectAssociation] issueTypeScreenSchemeProjectAssociation (required):
  Future<Response> assignIssueTypeScreenSchemeToProjectWithHttpInfo(IssueTypeScreenSchemeProjectAssociation issueTypeScreenSchemeProjectAssociation, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuetypescreenscheme/project';

    // ignore: prefer_final_locals
    Object? postBody = issueTypeScreenSchemeProjectAssociation;

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

  /// Assign issue type screen scheme to project
  ///
  /// Assigns an issue type screen scheme to a project.  Issue type screen schemes can only be assigned to classic projects.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [IssueTypeScreenSchemeProjectAssociation] issueTypeScreenSchemeProjectAssociation (required):
  Future<Object?> assignIssueTypeScreenSchemeToProject(IssueTypeScreenSchemeProjectAssociation issueTypeScreenSchemeProjectAssociation, { Future<void>? abortTrigger, }) async {
    final response = await assignIssueTypeScreenSchemeToProjectWithHttpInfo(issueTypeScreenSchemeProjectAssociation, abortTrigger: abortTrigger,);
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

  /// Create issue type screen scheme
  ///
  /// Creates an issue type screen scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [IssueTypeScreenSchemeDetails] issueTypeScreenSchemeDetails (required):
  ///   An issue type screen scheme bean.
  Future<Response> createIssueTypeScreenSchemeWithHttpInfo(IssueTypeScreenSchemeDetails issueTypeScreenSchemeDetails, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuetypescreenscheme';

    // ignore: prefer_final_locals
    Object? postBody = issueTypeScreenSchemeDetails;

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

  /// Create issue type screen scheme
  ///
  /// Creates an issue type screen scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [IssueTypeScreenSchemeDetails] issueTypeScreenSchemeDetails (required):
  ///   An issue type screen scheme bean.
  Future<IssueTypeScreenSchemeId?> createIssueTypeScreenScheme(IssueTypeScreenSchemeDetails issueTypeScreenSchemeDetails, { Future<void>? abortTrigger, }) async {
    final response = await createIssueTypeScreenSchemeWithHttpInfo(issueTypeScreenSchemeDetails, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'IssueTypeScreenSchemeId',) as IssueTypeScreenSchemeId;
    
    }
    return null;
  }

  /// Delete issue type screen scheme
  ///
  /// Deletes an issue type screen scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] issueTypeScreenSchemeId (required):
  ///   The ID of the issue type screen scheme.
  Future<Response> deleteIssueTypeScreenSchemeWithHttpInfo(String issueTypeScreenSchemeId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuetypescreenscheme/{issueTypeScreenSchemeId}'
      .replaceAll('{issueTypeScreenSchemeId}', issueTypeScreenSchemeId);

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

  /// Delete issue type screen scheme
  ///
  /// Deletes an issue type screen scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] issueTypeScreenSchemeId (required):
  ///   The ID of the issue type screen scheme.
  Future<Object?> deleteIssueTypeScreenScheme(String issueTypeScreenSchemeId, { Future<void>? abortTrigger, }) async {
    final response = await deleteIssueTypeScreenSchemeWithHttpInfo(issueTypeScreenSchemeId, abortTrigger: abortTrigger,);
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

  /// Get issue type screen scheme items
  ///
  /// Returns a [paginated](#pagination) list of issue type screen scheme items.  Only issue type screen schemes used in classic projects are returned.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
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
  /// * [List<int>] issueTypeScreenSchemeId:
  ///   The list of issue type screen scheme IDs. To include multiple issue type screen schemes, separate IDs with ampersand: `issueTypeScreenSchemeId=10000&issueTypeScreenSchemeId=10001`.
  Future<Response> getIssueTypeScreenSchemeMappingsWithHttpInfo({ int? startAt, int? maxResults, List<int>? issueTypeScreenSchemeId, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuetypescreenscheme/mapping';

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
    if (issueTypeScreenSchemeId != null) {
      queryParams.addAll(_queryParams('multi', 'issueTypeScreenSchemeId', issueTypeScreenSchemeId));
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

  /// Get issue type screen scheme items
  ///
  /// Returns a [paginated](#pagination) list of issue type screen scheme items.  Only issue type screen schemes used in classic projects are returned.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [List<int>] issueTypeScreenSchemeId:
  ///   The list of issue type screen scheme IDs. To include multiple issue type screen schemes, separate IDs with ampersand: `issueTypeScreenSchemeId=10000&issueTypeScreenSchemeId=10001`.
  Future<PageBeanIssueTypeScreenSchemeItem?> getIssueTypeScreenSchemeMappings({ int? startAt, int? maxResults, List<int>? issueTypeScreenSchemeId, Future<void>? abortTrigger, }) async {
    final response = await getIssueTypeScreenSchemeMappingsWithHttpInfo(startAt: startAt, maxResults: maxResults, issueTypeScreenSchemeId: issueTypeScreenSchemeId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanIssueTypeScreenSchemeItem',) as PageBeanIssueTypeScreenSchemeItem;
    
    }
    return null;
  }

  /// Get issue type screen schemes for projects
  ///
  /// Returns a [paginated](#pagination) list of issue type screen schemes and, for each issue type screen scheme, a list of the projects that use it.  Only issue type screen schemes used in classic projects are returned.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [List<int>] projectId (required):
  ///   The list of project IDs. To include multiple projects, separate IDs with ampersand: `projectId=10000&projectId=10001`.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  Future<Response> getIssueTypeScreenSchemeProjectAssociationsWithHttpInfo(List<int> projectId, { int? startAt, int? maxResults, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuetypescreenscheme/project';

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

  /// Get issue type screen schemes for projects
  ///
  /// Returns a [paginated](#pagination) list of issue type screen schemes and, for each issue type screen scheme, a list of the projects that use it.  Only issue type screen schemes used in classic projects are returned.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [List<int>] projectId (required):
  ///   The list of project IDs. To include multiple projects, separate IDs with ampersand: `projectId=10000&projectId=10001`.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  Future<PageBeanIssueTypeScreenSchemesProjects?> getIssueTypeScreenSchemeProjectAssociations(List<int> projectId, { int? startAt, int? maxResults, Future<void>? abortTrigger, }) async {
    final response = await getIssueTypeScreenSchemeProjectAssociationsWithHttpInfo(projectId, startAt: startAt, maxResults: maxResults, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanIssueTypeScreenSchemesProjects',) as PageBeanIssueTypeScreenSchemesProjects;
    
    }
    return null;
  }

  /// Get issue type screen schemes
  ///
  /// Returns a [paginated](#pagination) list of issue type screen schemes.  Only issue type screen schemes used in classic projects are returned.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
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
  ///   The list of issue type screen scheme IDs. To include multiple IDs, provide an ampersand-separated list. For example, `id=10000&id=10001`.
  ///
  /// * [String] queryString:
  ///   String used to perform a case-insensitive partial match with issue type screen scheme name.
  ///
  /// * [String] orderBy:
  ///   [Order](#ordering) the results by a field:   *  `name` Sorts by issue type screen scheme name.  *  `id` Sorts by issue type screen scheme ID.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information in the response. This parameter accepts `projects` that, for each issue type screen schemes, returns information about the projects the issue type screen scheme is assigned to.
  Future<Response> getIssueTypeScreenSchemesWithHttpInfo({ int? startAt, int? maxResults, List<int>? id, String? queryString, String? orderBy, String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuetypescreenscheme';

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
    if (queryString != null) {
      queryParams.addAll(_queryParams('', 'queryString', queryString));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'orderBy', orderBy));
    }
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

  /// Get issue type screen schemes
  ///
  /// Returns a [paginated](#pagination) list of issue type screen schemes.  Only issue type screen schemes used in classic projects are returned.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
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
  ///   The list of issue type screen scheme IDs. To include multiple IDs, provide an ampersand-separated list. For example, `id=10000&id=10001`.
  ///
  /// * [String] queryString:
  ///   String used to perform a case-insensitive partial match with issue type screen scheme name.
  ///
  /// * [String] orderBy:
  ///   [Order](#ordering) the results by a field:   *  `name` Sorts by issue type screen scheme name.  *  `id` Sorts by issue type screen scheme ID.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information in the response. This parameter accepts `projects` that, for each issue type screen schemes, returns information about the projects the issue type screen scheme is assigned to.
  Future<PageBeanIssueTypeScreenScheme?> getIssueTypeScreenSchemes({ int? startAt, int? maxResults, List<int>? id, String? queryString, String? orderBy, String? expand, Future<void>? abortTrigger, }) async {
    final response = await getIssueTypeScreenSchemesWithHttpInfo(startAt: startAt, maxResults: maxResults, id: id, queryString: queryString, orderBy: orderBy, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanIssueTypeScreenScheme',) as PageBeanIssueTypeScreenScheme;
    
    }
    return null;
  }

  /// Get issue type screen scheme projects
  ///
  /// Returns a [paginated](#pagination) list of projects associated with an issue type screen scheme.  Only company-managed projects associated with an issue type screen scheme are returned.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] issueTypeScreenSchemeId (required):
  ///   The ID of the issue type screen scheme.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [String] query:
  Future<Response> getProjectsForIssueTypeScreenSchemeWithHttpInfo(int issueTypeScreenSchemeId, { int? startAt, int? maxResults, String? query, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuetypescreenscheme/{issueTypeScreenSchemeId}/project'
      .replaceAll('{issueTypeScreenSchemeId}', issueTypeScreenSchemeId.toString());

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
    if (query != null) {
      queryParams.addAll(_queryParams('', 'query', query));
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

  /// Get issue type screen scheme projects
  ///
  /// Returns a [paginated](#pagination) list of projects associated with an issue type screen scheme.  Only company-managed projects associated with an issue type screen scheme are returned.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] issueTypeScreenSchemeId (required):
  ///   The ID of the issue type screen scheme.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [String] query:
  Future<PageBeanProjectDetails?> getProjectsForIssueTypeScreenScheme(int issueTypeScreenSchemeId, { int? startAt, int? maxResults, String? query, Future<void>? abortTrigger, }) async {
    final response = await getProjectsForIssueTypeScreenSchemeWithHttpInfo(issueTypeScreenSchemeId, startAt: startAt, maxResults: maxResults, query: query, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanProjectDetails',) as PageBeanProjectDetails;
    
    }
    return null;
  }

  /// Remove mappings from issue type screen scheme
  ///
  /// Removes issue type to screen scheme mappings from an issue type screen scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] issueTypeScreenSchemeId (required):
  ///   The ID of the issue type screen scheme.
  ///
  /// * [IssueTypeIds] issueTypeIds (required):
  Future<Response> removeMappingsFromIssueTypeScreenSchemeWithHttpInfo(String issueTypeScreenSchemeId, IssueTypeIds issueTypeIds, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuetypescreenscheme/{issueTypeScreenSchemeId}/mapping/remove'
      .replaceAll('{issueTypeScreenSchemeId}', issueTypeScreenSchemeId);

    // ignore: prefer_final_locals
    Object? postBody = issueTypeIds;

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

  /// Remove mappings from issue type screen scheme
  ///
  /// Removes issue type to screen scheme mappings from an issue type screen scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] issueTypeScreenSchemeId (required):
  ///   The ID of the issue type screen scheme.
  ///
  /// * [IssueTypeIds] issueTypeIds (required):
  Future<Object?> removeMappingsFromIssueTypeScreenScheme(String issueTypeScreenSchemeId, IssueTypeIds issueTypeIds, { Future<void>? abortTrigger, }) async {
    final response = await removeMappingsFromIssueTypeScreenSchemeWithHttpInfo(issueTypeScreenSchemeId, issueTypeIds, abortTrigger: abortTrigger,);
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

  /// Update issue type screen scheme default screen scheme
  ///
  /// Updates the default screen scheme of an issue type screen scheme. The default screen scheme is used for all unmapped issue types.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] issueTypeScreenSchemeId (required):
  ///   The ID of the issue type screen scheme.
  ///
  /// * [UpdateDefaultScreenScheme] updateDefaultScreenScheme (required):
  Future<Response> updateDefaultScreenSchemeWithHttpInfo(String issueTypeScreenSchemeId, UpdateDefaultScreenScheme updateDefaultScreenScheme, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuetypescreenscheme/{issueTypeScreenSchemeId}/mapping/default'
      .replaceAll('{issueTypeScreenSchemeId}', issueTypeScreenSchemeId);

    // ignore: prefer_final_locals
    Object? postBody = updateDefaultScreenScheme;

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

  /// Update issue type screen scheme default screen scheme
  ///
  /// Updates the default screen scheme of an issue type screen scheme. The default screen scheme is used for all unmapped issue types.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] issueTypeScreenSchemeId (required):
  ///   The ID of the issue type screen scheme.
  ///
  /// * [UpdateDefaultScreenScheme] updateDefaultScreenScheme (required):
  Future<Object?> updateDefaultScreenScheme(String issueTypeScreenSchemeId, UpdateDefaultScreenScheme updateDefaultScreenScheme, { Future<void>? abortTrigger, }) async {
    final response = await updateDefaultScreenSchemeWithHttpInfo(issueTypeScreenSchemeId, updateDefaultScreenScheme, abortTrigger: abortTrigger,);
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

  /// Update issue type screen scheme
  ///
  /// Updates an issue type screen scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] issueTypeScreenSchemeId (required):
  ///   The ID of the issue type screen scheme.
  ///
  /// * [IssueTypeScreenSchemeUpdateDetails] issueTypeScreenSchemeUpdateDetails (required):
  ///   The issue type screen scheme update details.
  Future<Response> updateIssueTypeScreenSchemeWithHttpInfo(String issueTypeScreenSchemeId, IssueTypeScreenSchemeUpdateDetails issueTypeScreenSchemeUpdateDetails, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuetypescreenscheme/{issueTypeScreenSchemeId}'
      .replaceAll('{issueTypeScreenSchemeId}', issueTypeScreenSchemeId);

    // ignore: prefer_final_locals
    Object? postBody = issueTypeScreenSchemeUpdateDetails;

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

  /// Update issue type screen scheme
  ///
  /// Updates an issue type screen scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] issueTypeScreenSchemeId (required):
  ///   The ID of the issue type screen scheme.
  ///
  /// * [IssueTypeScreenSchemeUpdateDetails] issueTypeScreenSchemeUpdateDetails (required):
  ///   The issue type screen scheme update details.
  Future<Object?> updateIssueTypeScreenScheme(String issueTypeScreenSchemeId, IssueTypeScreenSchemeUpdateDetails issueTypeScreenSchemeUpdateDetails, { Future<void>? abortTrigger, }) async {
    final response = await updateIssueTypeScreenSchemeWithHttpInfo(issueTypeScreenSchemeId, issueTypeScreenSchemeUpdateDetails, abortTrigger: abortTrigger,);
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
