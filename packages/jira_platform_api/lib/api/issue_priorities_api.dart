//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class IssuePrioritiesApi {
  IssuePrioritiesApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create priority
  ///
  /// Creates an issue priority.  **Deprecation notice:** The `iconUrl` parameter was sunset on 16th Mar 2025, and replaced with `avatarId`. See [CHANGE-1525](https://developer.atlassian.com/changelog/#CHANGE-1525).  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreatePriorityDetails] createPriorityDetails (required):
  Future<Response> createPriorityWithHttpInfo(CreatePriorityDetails createPriorityDetails, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/priority';

    // ignore: prefer_final_locals
    Object? postBody = createPriorityDetails;

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

  /// Create priority
  ///
  /// Creates an issue priority.  **Deprecation notice:** The `iconUrl` parameter was sunset on 16th Mar 2025, and replaced with `avatarId`. See [CHANGE-1525](https://developer.atlassian.com/changelog/#CHANGE-1525).  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [CreatePriorityDetails] createPriorityDetails (required):
  Future<PriorityId?> createPriority(CreatePriorityDetails createPriorityDetails, { Future<void>? abortTrigger, }) async {
    final response = await createPriorityWithHttpInfo(createPriorityDetails, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PriorityId',) as PriorityId;
    
    }
    return null;
  }

  /// Delete priority
  ///
  /// Deletes an issue priority.  This operation is [asynchronous](#async). Follow the `location` link in the response to determine the status of the task and use [Get task](#api-rest-api-3-task-taskId-get) to obtain subsequent updates.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the issue priority.
  Future<Response> deletePriorityWithHttpInfo(String id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/priority/{id}'
      .replaceAll('{id}', id);

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

  /// Delete priority
  ///
  /// Deletes an issue priority.  This operation is [asynchronous](#async). Follow the `location` link in the response to determine the status of the task and use [Get task](#api-rest-api-3-task-taskId-get) to obtain subsequent updates.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the issue priority.
  Future<void> deletePriority(String id, { Future<void>? abortTrigger, }) async {
    final response = await deletePriorityWithHttpInfo(id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get priorities
  ///
  /// Returns the list of all issue priorities.  **Deprecated:** Use [Search priorities](#api-rest-api-3-priority-search-get) instead. **[Permissions](#permissions) required:** Permission to access Jira.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> getPrioritiesWithHttpInfo({ Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/priority';

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

  /// Get priorities
  ///
  /// Returns the list of all issue priorities.  **Deprecated:** Use [Search priorities](#api-rest-api-3-priority-search-get) instead. **[Permissions](#permissions) required:** Permission to access Jira.
  Future<List<Priority>?> getPriorities({ Future<void>? abortTrigger, }) async {
    final response = await getPrioritiesWithHttpInfo(abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<Priority>') as List)
        .cast<Priority>()
        .toList(growable: false);

    }
    return null;
  }

  /// Get priority
  ///
  /// Returns an issue priority. To fetch multiple priorities at once, use [Search priorities](#api-rest-api-3-priority-search-get) instead.  **[Permissions](#permissions) required:** Permission to access Jira.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the issue priority.
  Future<Response> getPriorityWithHttpInfo(String id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/priority/{id}'
      .replaceAll('{id}', id);

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

  /// Get priority
  ///
  /// Returns an issue priority. To fetch multiple priorities at once, use [Search priorities](#api-rest-api-3-priority-search-get) instead.  **[Permissions](#permissions) required:** Permission to access Jira.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the issue priority.
  Future<Priority?> getPriority(String id, { Future<void>? abortTrigger, }) async {
    final response = await getPriorityWithHttpInfo(id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Priority',) as Priority;
    
    }
    return null;
  }

  /// Move priorities
  ///
  /// Changes the order of issue priorities.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [ReorderIssuePriorities] reorderIssuePriorities (required):
  Future<Response> movePrioritiesWithHttpInfo(ReorderIssuePriorities reorderIssuePriorities, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/priority/move';

    // ignore: prefer_final_locals
    Object? postBody = reorderIssuePriorities;

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

  /// Move priorities
  ///
  /// Changes the order of issue priorities.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [ReorderIssuePriorities] reorderIssuePriorities (required):
  Future<Object?> movePriorities(ReorderIssuePriorities reorderIssuePriorities, { Future<void>? abortTrigger, }) async {
    final response = await movePrioritiesWithHttpInfo(reorderIssuePriorities, abortTrigger: abortTrigger,);
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

  /// Search priorities
  ///
  /// Returns a [paginated](#pagination) list of priorities. The list can contain all priorities or a subset determined by any combination of these criteria:   *  a list of priority IDs. Any invalid priority IDs are ignored.  *  a list of project IDs. Only priorities that are available in these projects will be returned. Any invalid project IDs are ignored.  *  whether the field configuration is a default. This returns priorities from company-managed (classic) projects only, as there is no concept of default priorities in team-managed projects.  **Deprecation notice:** The `onlyDefault` parameter is deprecated and will be removed at a later date. See [CHANGE-1655](https://developer.atlassian.com/cloud/jira/platform/changelog/#CHANGE-1655).  **Deprecation notice:** The `isDefault` property of priorities is deprecated and will be removed at a later date. See [CHANGE-1655](https://developer.atlassian.com/cloud/jira/platform/changelog/#CHANGE-1655).  **[Permissions](#permissions) required:** Permission to access Jira.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [String] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [List<String>] id:
  ///   The list of priority IDs. To include multiple IDs, provide an ampersand-separated list. For example, `id=2&id=3`.
  ///
  /// * [List<String>] projectId:
  ///   The list of projects IDs. To include multiple IDs, provide an ampersand-separated list. For example, `projectId=10010&projectId=10111`.
  ///
  /// * [String] priorityName:
  ///   The name of priority to search for.
  ///
  /// * [bool] onlyDefault:
  ///   Whether only the default priority is returned.
  ///
  /// * [String] expand:
  ///   Use `schemes` to return the associated priority schemes for each priority. Limited to returning first 15 priority schemes per priority.
  Future<Response> searchPrioritiesWithHttpInfo({ String? startAt, String? maxResults, List<String>? id, List<String>? projectId, String? priorityName, bool? onlyDefault, String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/priority/search';

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
    if (projectId != null) {
      queryParams.addAll(_queryParams('multi', 'projectId', projectId));
    }
    if (priorityName != null) {
      queryParams.addAll(_queryParams('', 'priorityName', priorityName));
    }
    if (onlyDefault != null) {
      queryParams.addAll(_queryParams('', 'onlyDefault', onlyDefault));
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

  /// Search priorities
  ///
  /// Returns a [paginated](#pagination) list of priorities. The list can contain all priorities or a subset determined by any combination of these criteria:   *  a list of priority IDs. Any invalid priority IDs are ignored.  *  a list of project IDs. Only priorities that are available in these projects will be returned. Any invalid project IDs are ignored.  *  whether the field configuration is a default. This returns priorities from company-managed (classic) projects only, as there is no concept of default priorities in team-managed projects.  **Deprecation notice:** The `onlyDefault` parameter is deprecated and will be removed at a later date. See [CHANGE-1655](https://developer.atlassian.com/cloud/jira/platform/changelog/#CHANGE-1655).  **Deprecation notice:** The `isDefault` property of priorities is deprecated and will be removed at a later date. See [CHANGE-1655](https://developer.atlassian.com/cloud/jira/platform/changelog/#CHANGE-1655).  **[Permissions](#permissions) required:** Permission to access Jira.
  ///
  /// Parameters:
  ///
  /// * [String] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [String] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [List<String>] id:
  ///   The list of priority IDs. To include multiple IDs, provide an ampersand-separated list. For example, `id=2&id=3`.
  ///
  /// * [List<String>] projectId:
  ///   The list of projects IDs. To include multiple IDs, provide an ampersand-separated list. For example, `projectId=10010&projectId=10111`.
  ///
  /// * [String] priorityName:
  ///   The name of priority to search for.
  ///
  /// * [bool] onlyDefault:
  ///   Whether only the default priority is returned.
  ///
  /// * [String] expand:
  ///   Use `schemes` to return the associated priority schemes for each priority. Limited to returning first 15 priority schemes per priority.
  Future<PageBeanPriority?> searchPriorities({ String? startAt, String? maxResults, List<String>? id, List<String>? projectId, String? priorityName, bool? onlyDefault, String? expand, Future<void>? abortTrigger, }) async {
    final response = await searchPrioritiesWithHttpInfo(startAt: startAt, maxResults: maxResults, id: id, projectId: projectId, priorityName: priorityName, onlyDefault: onlyDefault, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanPriority',) as PageBeanPriority;
    
    }
    return null;
  }

  /// Set default priority
  ///
  /// Sets default issue priority.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [SetDefaultPriorityRequest] setDefaultPriorityRequest (required):
  Future<Response> setDefaultPriorityWithHttpInfo(SetDefaultPriorityRequest setDefaultPriorityRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/priority/default';

    // ignore: prefer_final_locals
    Object? postBody = setDefaultPriorityRequest;

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

  /// Set default priority
  ///
  /// Sets default issue priority.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [SetDefaultPriorityRequest] setDefaultPriorityRequest (required):
  Future<Object?> setDefaultPriority(SetDefaultPriorityRequest setDefaultPriorityRequest, { Future<void>? abortTrigger, }) async {
    final response = await setDefaultPriorityWithHttpInfo(setDefaultPriorityRequest, abortTrigger: abortTrigger,);
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

  /// Update priority
  ///
  /// Updates an issue priority.  At least one request body parameter must be defined.  **Deprecation notice:** The `iconUrl` parameter was sunset on 16th Mar 2025, and replaced with `avatarId`. See [CHANGE-1525](https://developer.atlassian.com/changelog/#CHANGE-1525).  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the issue priority.
  ///
  /// * [UpdatePriorityDetails] updatePriorityDetails (required):
  Future<Response> updatePriorityWithHttpInfo(String id, UpdatePriorityDetails updatePriorityDetails, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/priority/{id}'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = updatePriorityDetails;

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

  /// Update priority
  ///
  /// Updates an issue priority.  At least one request body parameter must be defined.  **Deprecation notice:** The `iconUrl` parameter was sunset on 16th Mar 2025, and replaced with `avatarId`. See [CHANGE-1525](https://developer.atlassian.com/changelog/#CHANGE-1525).  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the issue priority.
  ///
  /// * [UpdatePriorityDetails] updatePriorityDetails (required):
  Future<Object?> updatePriority(String id, UpdatePriorityDetails updatePriorityDetails, { Future<void>? abortTrigger, }) async {
    final response = await updatePriorityWithHttpInfo(id, updatePriorityDetails, abortTrigger: abortTrigger,);
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
