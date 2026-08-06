//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class PrioritySchemesApi {
  PrioritySchemesApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create priority scheme
  ///
  /// Creates a new priority scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreatePrioritySchemeDetails] createPrioritySchemeDetails (required):
  Future<Response> createPrioritySchemeWithHttpInfo(CreatePrioritySchemeDetails createPrioritySchemeDetails, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/priorityscheme';

    // ignore: prefer_final_locals
    Object? postBody = createPrioritySchemeDetails;

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

  /// Create priority scheme
  ///
  /// Creates a new priority scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [CreatePrioritySchemeDetails] createPrioritySchemeDetails (required):
  Future<PrioritySchemeId?> createPriorityScheme(CreatePrioritySchemeDetails createPrioritySchemeDetails, { Future<void>? abortTrigger, }) async {
    final response = await createPrioritySchemeWithHttpInfo(createPrioritySchemeDetails, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PrioritySchemeId',) as PrioritySchemeId;
    
    }
    return null;
  }

  /// Delete priority scheme
  ///
  /// Deletes a priority scheme.  This operation is only available for priority schemes without any associated projects. Any associated projects must be removed from the priority scheme before this operation can be performed.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] schemeId (required):
  ///   The priority scheme ID.
  Future<Response> deletePrioritySchemeWithHttpInfo(int schemeId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/priorityscheme/{schemeId}'
      .replaceAll('{schemeId}', schemeId.toString());

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

  /// Delete priority scheme
  ///
  /// Deletes a priority scheme.  This operation is only available for priority schemes without any associated projects. Any associated projects must be removed from the priority scheme before this operation can be performed.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] schemeId (required):
  ///   The priority scheme ID.
  Future<Object?> deletePriorityScheme(int schemeId, { Future<void>? abortTrigger, }) async {
    final response = await deletePrioritySchemeWithHttpInfo(schemeId, abortTrigger: abortTrigger,);
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

  /// Get available priorities by priority scheme
  ///
  /// Returns a [paginated](#pagination) list of priorities available for adding to a priority scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] schemeId (required):
  ///   The priority scheme ID.
  ///
  /// * [String] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [String] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [String] query:
  ///   The string to query priorities on by name.
  ///
  /// * [List<String>] exclude:
  ///   A list of priority IDs to exclude from the results.
  Future<Response> getAvailablePrioritiesByPrioritySchemeWithHttpInfo(String schemeId, { String? startAt, String? maxResults, String? query, List<String>? exclude, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/priorityscheme/priorities/available';

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
      queryParams.addAll(_queryParams('', 'schemeId', schemeId));
    if (exclude != null) {
      queryParams.addAll(_queryParams('multi', 'exclude', exclude));
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

  /// Get available priorities by priority scheme
  ///
  /// Returns a [paginated](#pagination) list of priorities available for adding to a priority scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] schemeId (required):
  ///   The priority scheme ID.
  ///
  /// * [String] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [String] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [String] query:
  ///   The string to query priorities on by name.
  ///
  /// * [List<String>] exclude:
  ///   A list of priority IDs to exclude from the results.
  Future<PageBeanPriorityWithSequence?> getAvailablePrioritiesByPriorityScheme(String schemeId, { String? startAt, String? maxResults, String? query, List<String>? exclude, Future<void>? abortTrigger, }) async {
    final response = await getAvailablePrioritiesByPrioritySchemeWithHttpInfo(schemeId, startAt: startAt, maxResults: maxResults, query: query, exclude: exclude, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanPriorityWithSequence',) as PageBeanPriorityWithSequence;
    
    }
    return null;
  }

  /// Get priorities by priority scheme
  ///
  /// Returns a [paginated](#pagination) list of priorities by scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] schemeId (required):
  ///   The priority scheme ID.
  ///
  /// * [String] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [String] maxResults:
  ///   The maximum number of items to return per page.
  Future<Response> getPrioritiesByPrioritySchemeWithHttpInfo(String schemeId, { String? startAt, String? maxResults, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/priorityscheme/{schemeId}/priorities'
      .replaceAll('{schemeId}', schemeId);

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

  /// Get priorities by priority scheme
  ///
  /// Returns a [paginated](#pagination) list of priorities by scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] schemeId (required):
  ///   The priority scheme ID.
  ///
  /// * [String] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [String] maxResults:
  ///   The maximum number of items to return per page.
  Future<PageBeanPriorityWithSequence?> getPrioritiesByPriorityScheme(String schemeId, { String? startAt, String? maxResults, Future<void>? abortTrigger, }) async {
    final response = await getPrioritiesByPrioritySchemeWithHttpInfo(schemeId, startAt: startAt, maxResults: maxResults, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanPriorityWithSequence',) as PageBeanPriorityWithSequence;
    
    }
    return null;
  }

  /// Get priority schemes
  ///
  /// Returns a [paginated](#pagination) list of priority schemes.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
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
  /// * [List<int>] priorityId:
  ///   A set of priority IDs to filter by. To include multiple IDs, provide an ampersand-separated list. For example, `priorityId=10000&priorityId=10001`.
  ///
  /// * [List<int>] schemeId:
  ///   A set of priority scheme IDs. To include multiple IDs, provide an ampersand-separated list. For example, `schemeId=10000&schemeId=10001`.
  ///
  /// * [String] schemeName:
  ///   The name of scheme to search for.
  ///
  /// * [bool] onlyDefault:
  ///   Whether only the default priority is returned.
  ///
  /// * [String] orderBy:
  ///   The ordering to return the priority schemes by.
  ///
  /// * [String] expand:
  ///   A comma separated list of additional information to return. \"priorities\" will return priorities associated with the priority scheme. \"projects\" will return projects associated with the priority scheme. `expand=priorities,projects`.
  Future<Response> getPrioritySchemesWithHttpInfo({ String? startAt, String? maxResults, List<int>? priorityId, List<int>? schemeId, String? schemeName, bool? onlyDefault, String? orderBy, String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/priorityscheme';

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
    if (priorityId != null) {
      queryParams.addAll(_queryParams('multi', 'priorityId', priorityId));
    }
    if (schemeId != null) {
      queryParams.addAll(_queryParams('multi', 'schemeId', schemeId));
    }
    if (schemeName != null) {
      queryParams.addAll(_queryParams('', 'schemeName', schemeName));
    }
    if (onlyDefault != null) {
      queryParams.addAll(_queryParams('', 'onlyDefault', onlyDefault));
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

  /// Get priority schemes
  ///
  /// Returns a [paginated](#pagination) list of priority schemes.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [String] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [List<int>] priorityId:
  ///   A set of priority IDs to filter by. To include multiple IDs, provide an ampersand-separated list. For example, `priorityId=10000&priorityId=10001`.
  ///
  /// * [List<int>] schemeId:
  ///   A set of priority scheme IDs. To include multiple IDs, provide an ampersand-separated list. For example, `schemeId=10000&schemeId=10001`.
  ///
  /// * [String] schemeName:
  ///   The name of scheme to search for.
  ///
  /// * [bool] onlyDefault:
  ///   Whether only the default priority is returned.
  ///
  /// * [String] orderBy:
  ///   The ordering to return the priority schemes by.
  ///
  /// * [String] expand:
  ///   A comma separated list of additional information to return. \"priorities\" will return priorities associated with the priority scheme. \"projects\" will return projects associated with the priority scheme. `expand=priorities,projects`.
  Future<PageBeanPrioritySchemeWithPaginatedPrioritiesAndProjects?> getPrioritySchemes({ String? startAt, String? maxResults, List<int>? priorityId, List<int>? schemeId, String? schemeName, bool? onlyDefault, String? orderBy, String? expand, Future<void>? abortTrigger, }) async {
    final response = await getPrioritySchemesWithHttpInfo(startAt: startAt, maxResults: maxResults, priorityId: priorityId, schemeId: schemeId, schemeName: schemeName, onlyDefault: onlyDefault, orderBy: orderBy, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanPrioritySchemeWithPaginatedPrioritiesAndProjects',) as PageBeanPrioritySchemeWithPaginatedPrioritiesAndProjects;
    
    }
    return null;
  }

  /// Get projects by priority scheme
  ///
  /// Returns a [paginated](#pagination) list of projects by scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] schemeId (required):
  ///   The priority scheme ID.
  ///
  /// * [String] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [String] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [List<int>] projectId:
  ///   The project IDs to filter by. For example, `projectId=10000&projectId=10001`.
  ///
  /// * [String] query:
  ///   The string to query projects on by name.
  Future<Response> getProjectsByPrioritySchemeWithHttpInfo(String schemeId, { String? startAt, String? maxResults, List<int>? projectId, String? query, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/priorityscheme/{schemeId}/projects'
      .replaceAll('{schemeId}', schemeId);

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
    if (projectId != null) {
      queryParams.addAll(_queryParams('multi', 'projectId', projectId));
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

  /// Get projects by priority scheme
  ///
  /// Returns a [paginated](#pagination) list of projects by scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] schemeId (required):
  ///   The priority scheme ID.
  ///
  /// * [String] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [String] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [List<int>] projectId:
  ///   The project IDs to filter by. For example, `projectId=10000&projectId=10001`.
  ///
  /// * [String] query:
  ///   The string to query projects on by name.
  Future<PageBeanProject?> getProjectsByPriorityScheme(String schemeId, { String? startAt, String? maxResults, List<int>? projectId, String? query, Future<void>? abortTrigger, }) async {
    final response = await getProjectsByPrioritySchemeWithHttpInfo(schemeId, startAt: startAt, maxResults: maxResults, projectId: projectId, query: query, abortTrigger: abortTrigger,);
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

  /// Suggested priorities for mappings
  ///
  /// Returns a [paginated](#pagination) list of priorities that would require mapping, given a change in priorities or projects associated with a priority scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [SuggestedMappingsRequestBean] suggestedMappingsRequestBean (required):
  Future<Response> suggestedPrioritiesForMappingsWithHttpInfo(SuggestedMappingsRequestBean suggestedMappingsRequestBean, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/priorityscheme/mappings';

    // ignore: prefer_final_locals
    Object? postBody = suggestedMappingsRequestBean;

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

  /// Suggested priorities for mappings
  ///
  /// Returns a [paginated](#pagination) list of priorities that would require mapping, given a change in priorities or projects associated with a priority scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [SuggestedMappingsRequestBean] suggestedMappingsRequestBean (required):
  Future<PageBeanPriorityWithSequence?> suggestedPrioritiesForMappings(SuggestedMappingsRequestBean suggestedMappingsRequestBean, { Future<void>? abortTrigger, }) async {
    final response = await suggestedPrioritiesForMappingsWithHttpInfo(suggestedMappingsRequestBean, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanPriorityWithSequence',) as PageBeanPriorityWithSequence;
    
    }
    return null;
  }

  /// Update priority scheme
  ///
  /// Updates a priority scheme. This includes its details, the lists of priorities and projects in it  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] schemeId (required):
  ///   The ID of the priority scheme.
  ///
  /// * [UpdatePrioritySchemeRequestBean] updatePrioritySchemeRequestBean (required):
  Future<Response> updatePrioritySchemeWithHttpInfo(int schemeId, UpdatePrioritySchemeRequestBean updatePrioritySchemeRequestBean, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/priorityscheme/{schemeId}'
      .replaceAll('{schemeId}', schemeId.toString());

    // ignore: prefer_final_locals
    Object? postBody = updatePrioritySchemeRequestBean;

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

  /// Update priority scheme
  ///
  /// Updates a priority scheme. This includes its details, the lists of priorities and projects in it  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] schemeId (required):
  ///   The ID of the priority scheme.
  ///
  /// * [UpdatePrioritySchemeRequestBean] updatePrioritySchemeRequestBean (required):
  Future<UpdatePrioritySchemeResponseBean?> updatePriorityScheme(int schemeId, UpdatePrioritySchemeRequestBean updatePrioritySchemeRequestBean, { Future<void>? abortTrigger, }) async {
    final response = await updatePrioritySchemeWithHttpInfo(schemeId, updatePrioritySchemeRequestBean, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UpdatePrioritySchemeResponseBean',) as UpdatePrioritySchemeResponseBean;
    
    }
    return null;
  }
}
