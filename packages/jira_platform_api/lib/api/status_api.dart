//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class StatusApi {
  StatusApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Bulk create statuses
  ///
  /// Creates statuses for a global or project scope.  **[Permissions](#permissions) required:**   *  *Administer projects* [project permission.](https://confluence.atlassian.com/x/yodKLg)  *  *Administer Jira* [project permission.](https://confluence.atlassian.com/x/yodKLg)
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [StatusCreateRequest] statusCreateRequest (required):
  ///   Details of the statuses being created and their scope.
  Future<Response> createStatusesWithHttpInfo(StatusCreateRequest statusCreateRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/statuses';

    // ignore: prefer_final_locals
    Object? postBody = statusCreateRequest;

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

  /// Bulk create statuses
  ///
  /// Creates statuses for a global or project scope.  **[Permissions](#permissions) required:**   *  *Administer projects* [project permission.](https://confluence.atlassian.com/x/yodKLg)  *  *Administer Jira* [project permission.](https://confluence.atlassian.com/x/yodKLg)
  ///
  /// Parameters:
  ///
  /// * [StatusCreateRequest] statusCreateRequest (required):
  ///   Details of the statuses being created and their scope.
  Future<List<JiraStatus>?> createStatuses(StatusCreateRequest statusCreateRequest, { Future<void>? abortTrigger, }) async {
    final response = await createStatusesWithHttpInfo(statusCreateRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<JiraStatus>') as List)
        .cast<JiraStatus>()
        .toList(growable: false);

    }
    return null;
  }

  /// Bulk delete Statuses
  ///
  /// Deletes statuses by ID.  **[Permissions](#permissions) required:**   *  *Administer projects* [project permission.](https://confluence.atlassian.com/x/yodKLg)  *  *Administer Jira* [project permission.](https://confluence.atlassian.com/x/yodKLg)
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [List<String>] id (required):
  ///   The list of status IDs. To include multiple IDs, provide an ampersand-separated list. For example, id=10000&id=10001.  Min items `1`, Max items `50`
  Future<Response> deleteStatusesByIdWithHttpInfo(List<String> id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/statuses';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('multi', 'id', id));

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

  /// Bulk delete Statuses
  ///
  /// Deletes statuses by ID.  **[Permissions](#permissions) required:**   *  *Administer projects* [project permission.](https://confluence.atlassian.com/x/yodKLg)  *  *Administer Jira* [project permission.](https://confluence.atlassian.com/x/yodKLg)
  ///
  /// Parameters:
  ///
  /// * [List<String>] id (required):
  ///   The list of status IDs. To include multiple IDs, provide an ampersand-separated list. For example, id=10000&id=10001.  Min items `1`, Max items `50`
  Future<Object?> deleteStatusesById(List<String> id, { Future<void>? abortTrigger, }) async {
    final response = await deleteStatusesByIdWithHttpInfo(id, abortTrigger: abortTrigger,);
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

  /// Get issue type usages by status and project
  ///
  /// Returns a page of issue types in a project using a given status.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] statusId (required):
  ///   The statusId to fetch issue type usages for
  ///
  /// * [String] projectId (required):
  ///   The projectId to fetch issue type usages for
  ///
  /// * [String] nextPageToken:
  ///   The cursor for pagination
  ///
  /// * [int] maxResults:
  ///   The maximum number of results to return. Must be an integer between 1 and 200.
  Future<Response> getProjectIssueTypeUsagesForStatusWithHttpInfo(String statusId, String projectId, { String? nextPageToken, int? maxResults, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/statuses/{statusId}/project/{projectId}/issueTypeUsages'
      .replaceAll('{statusId}', statusId)
      .replaceAll('{projectId}', projectId);

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

  /// Get issue type usages by status and project
  ///
  /// Returns a page of issue types in a project using a given status.
  ///
  /// Parameters:
  ///
  /// * [String] statusId (required):
  ///   The statusId to fetch issue type usages for
  ///
  /// * [String] projectId (required):
  ///   The projectId to fetch issue type usages for
  ///
  /// * [String] nextPageToken:
  ///   The cursor for pagination
  ///
  /// * [int] maxResults:
  ///   The maximum number of results to return. Must be an integer between 1 and 200.
  Future<StatusProjectIssueTypeUsageDTO?> getProjectIssueTypeUsagesForStatus(String statusId, String projectId, { String? nextPageToken, int? maxResults, Future<void>? abortTrigger, }) async {
    final response = await getProjectIssueTypeUsagesForStatusWithHttpInfo(statusId, projectId, nextPageToken: nextPageToken, maxResults: maxResults, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'StatusProjectIssueTypeUsageDTO',) as StatusProjectIssueTypeUsageDTO;
    
    }
    return null;
  }

  /// Get project usages by status
  ///
  /// Returns a page of projects using a given status.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] statusId (required):
  ///   The statusId to fetch project usages for
  ///
  /// * [String] nextPageToken:
  ///   The cursor for pagination
  ///
  /// * [int] maxResults:
  ///   The maximum number of results to return. Must be an integer between 1 and 200.
  Future<Response> getProjectUsagesForStatusWithHttpInfo(String statusId, { String? nextPageToken, int? maxResults, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/statuses/{statusId}/projectUsages'
      .replaceAll('{statusId}', statusId);

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

  /// Get project usages by status
  ///
  /// Returns a page of projects using a given status.
  ///
  /// Parameters:
  ///
  /// * [String] statusId (required):
  ///   The statusId to fetch project usages for
  ///
  /// * [String] nextPageToken:
  ///   The cursor for pagination
  ///
  /// * [int] maxResults:
  ///   The maximum number of results to return. Must be an integer between 1 and 200.
  Future<StatusProjectUsageDTO?> getProjectUsagesForStatus(String statusId, { String? nextPageToken, int? maxResults, Future<void>? abortTrigger, }) async {
    final response = await getProjectUsagesForStatusWithHttpInfo(statusId, nextPageToken: nextPageToken, maxResults: maxResults, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'StatusProjectUsageDTO',) as StatusProjectUsageDTO;
    
    }
    return null;
  }

  /// Bulk get statuses
  ///
  /// Returns a list of the statuses specified by one or more status IDs.  **[Permissions](#permissions) required:**   *  *Administer projects* [project permission.](https://confluence.atlassian.com/x/yodKLg)  *  *Administer Jira* [project permission.](https://confluence.atlassian.com/x/yodKLg)
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [List<String>] id (required):
  ///   The list of status IDs. To include multiple IDs, provide an ampersand-separated list. For example, id=10000&id=10001.  Min items `1`, Max items `50`
  Future<Response> getStatusesByIdWithHttpInfo(List<String> id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/statuses';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('multi', 'id', id));

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

  /// Bulk get statuses
  ///
  /// Returns a list of the statuses specified by one or more status IDs.  **[Permissions](#permissions) required:**   *  *Administer projects* [project permission.](https://confluence.atlassian.com/x/yodKLg)  *  *Administer Jira* [project permission.](https://confluence.atlassian.com/x/yodKLg)
  ///
  /// Parameters:
  ///
  /// * [List<String>] id (required):
  ///   The list of status IDs. To include multiple IDs, provide an ampersand-separated list. For example, id=10000&id=10001.  Min items `1`, Max items `50`
  Future<List<JiraStatus>?> getStatusesById(List<String> id, { Future<void>? abortTrigger, }) async {
    final response = await getStatusesByIdWithHttpInfo(id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<JiraStatus>') as List)
        .cast<JiraStatus>()
        .toList(growable: false);

    }
    return null;
  }

  /// Bulk get statuses by name
  ///
  /// Returns a list of the statuses specified by one or more status names.  **[Permissions](#permissions) required:**   *  *Administer projects* [project permission.](https://confluence.atlassian.com/x/yodKLg)  *  *Administer Jira* [project permission.](https://confluence.atlassian.com/x/yodKLg)  *  *Browse projects* [project permission.](https://confluence.atlassian.com/x/yodKLg)
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [List<String>] name (required):
  ///   The list of status names. To include multiple names, provide an ampersand-separated list. For example, name=nameXX&name=nameYY.  Min items `1`, Max items `50`
  ///
  /// * [String] projectId:
  ///   The project the status is part of or null for global statuses.
  Future<Response> getStatusesByNameWithHttpInfo(List<String> name, { String? projectId, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/statuses/byNames';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('multi', 'name', name));
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

  /// Bulk get statuses by name
  ///
  /// Returns a list of the statuses specified by one or more status names.  **[Permissions](#permissions) required:**   *  *Administer projects* [project permission.](https://confluence.atlassian.com/x/yodKLg)  *  *Administer Jira* [project permission.](https://confluence.atlassian.com/x/yodKLg)  *  *Browse projects* [project permission.](https://confluence.atlassian.com/x/yodKLg)
  ///
  /// Parameters:
  ///
  /// * [List<String>] name (required):
  ///   The list of status names. To include multiple names, provide an ampersand-separated list. For example, name=nameXX&name=nameYY.  Min items `1`, Max items `50`
  ///
  /// * [String] projectId:
  ///   The project the status is part of or null for global statuses.
  Future<List<JiraStatus>?> getStatusesByName(List<String> name, { String? projectId, Future<void>? abortTrigger, }) async {
    final response = await getStatusesByNameWithHttpInfo(name, projectId: projectId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<JiraStatus>') as List)
        .cast<JiraStatus>()
        .toList(growable: false);

    }
    return null;
  }

  /// Get workflow usages by status
  ///
  /// Returns a page of workflows using a given status.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] statusId (required):
  ///   The statusId to fetch workflow usages for
  ///
  /// * [String] nextPageToken:
  ///   The cursor for pagination
  ///
  /// * [int] maxResults:
  ///   The maximum number of results to return. Must be an integer between 1 and 200.
  Future<Response> getWorkflowUsagesForStatusWithHttpInfo(String statusId, { String? nextPageToken, int? maxResults, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/statuses/{statusId}/workflowUsages'
      .replaceAll('{statusId}', statusId);

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

  /// Get workflow usages by status
  ///
  /// Returns a page of workflows using a given status.
  ///
  /// Parameters:
  ///
  /// * [String] statusId (required):
  ///   The statusId to fetch workflow usages for
  ///
  /// * [String] nextPageToken:
  ///   The cursor for pagination
  ///
  /// * [int] maxResults:
  ///   The maximum number of results to return. Must be an integer between 1 and 200.
  Future<StatusWorkflowUsageDTO?> getWorkflowUsagesForStatus(String statusId, { String? nextPageToken, int? maxResults, Future<void>? abortTrigger, }) async {
    final response = await getWorkflowUsagesForStatusWithHttpInfo(statusId, nextPageToken: nextPageToken, maxResults: maxResults, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'StatusWorkflowUsageDTO',) as StatusWorkflowUsageDTO;
    
    }
    return null;
  }

  /// Search statuses paginated
  ///
  /// Returns a [paginated](https://developer.atlassian.com/cloud/jira/platform/rest/v3/intro/#pagination) list of statuses that match a search on name or project.  **[Permissions](#permissions) required:**   *  *Administer projects* [project permission.](https://confluence.atlassian.com/x/yodKLg)  *  *Administer Jira* [project permission.](https://confluence.atlassian.com/x/yodKLg)
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] projectId:
  ///   The project the status is part of or null for global statuses.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [String] searchString:
  ///   Term to match status names against or null to search for all statuses in the search scope.
  ///
  /// * [String] statusCategory:
  ///   Category of the status to filter by. The supported values are: `TODO`, `IN_PROGRESS`, and `DONE`.
  ///
  /// * [bool] includeGlobalStatuses:
  ///   Whether to include global statuses (scope = null, not tied to any project) in the response. Defaults to false. Only relevant for project scoped queries.
  Future<Response> searchWithHttpInfo({ String? projectId, int? startAt, int? maxResults, String? searchString, String? statusCategory, bool? includeGlobalStatuses, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/statuses/search';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (projectId != null) {
      queryParams.addAll(_queryParams('', 'projectId', projectId));
    }
    if (startAt != null) {
      queryParams.addAll(_queryParams('', 'startAt', startAt));
    }
    if (maxResults != null) {
      queryParams.addAll(_queryParams('', 'maxResults', maxResults));
    }
    if (searchString != null) {
      queryParams.addAll(_queryParams('', 'searchString', searchString));
    }
    if (statusCategory != null) {
      queryParams.addAll(_queryParams('', 'statusCategory', statusCategory));
    }
    if (includeGlobalStatuses != null) {
      queryParams.addAll(_queryParams('', 'includeGlobalStatuses', includeGlobalStatuses));
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

  /// Search statuses paginated
  ///
  /// Returns a [paginated](https://developer.atlassian.com/cloud/jira/platform/rest/v3/intro/#pagination) list of statuses that match a search on name or project.  **[Permissions](#permissions) required:**   *  *Administer projects* [project permission.](https://confluence.atlassian.com/x/yodKLg)  *  *Administer Jira* [project permission.](https://confluence.atlassian.com/x/yodKLg)
  ///
  /// Parameters:
  ///
  /// * [String] projectId:
  ///   The project the status is part of or null for global statuses.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [String] searchString:
  ///   Term to match status names against or null to search for all statuses in the search scope.
  ///
  /// * [String] statusCategory:
  ///   Category of the status to filter by. The supported values are: `TODO`, `IN_PROGRESS`, and `DONE`.
  ///
  /// * [bool] includeGlobalStatuses:
  ///   Whether to include global statuses (scope = null, not tied to any project) in the response. Defaults to false. Only relevant for project scoped queries.
  Future<PageOfStatuses?> search({ String? projectId, int? startAt, int? maxResults, String? searchString, String? statusCategory, bool? includeGlobalStatuses, Future<void>? abortTrigger, }) async {
    final response = await searchWithHttpInfo(projectId: projectId, startAt: startAt, maxResults: maxResults, searchString: searchString, statusCategory: statusCategory, includeGlobalStatuses: includeGlobalStatuses, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageOfStatuses',) as PageOfStatuses;
    
    }
    return null;
  }

  /// Bulk update statuses
  ///
  /// Updates statuses by ID.  **[Permissions](#permissions) required:**   *  *Administer projects* [project permission.](https://confluence.atlassian.com/x/yodKLg)  *  *Administer Jira* [project permission.](https://confluence.atlassian.com/x/yodKLg)
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [StatusUpdateRequest] statusUpdateRequest (required):
  ///   The list of statuses that will be updated.
  Future<Response> updateStatusesWithHttpInfo(StatusUpdateRequest statusUpdateRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/statuses';

    // ignore: prefer_final_locals
    Object? postBody = statusUpdateRequest;

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

  /// Bulk update statuses
  ///
  /// Updates statuses by ID.  **[Permissions](#permissions) required:**   *  *Administer projects* [project permission.](https://confluence.atlassian.com/x/yodKLg)  *  *Administer Jira* [project permission.](https://confluence.atlassian.com/x/yodKLg)
  ///
  /// Parameters:
  ///
  /// * [StatusUpdateRequest] statusUpdateRequest (required):
  ///   The list of statuses that will be updated.
  Future<Object?> updateStatuses(StatusUpdateRequest statusUpdateRequest, { Future<void>? abortTrigger, }) async {
    final response = await updateStatusesWithHttpInfo(statusUpdateRequest, abortTrigger: abortTrigger,);
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
