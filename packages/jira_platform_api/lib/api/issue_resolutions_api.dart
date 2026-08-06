//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class IssueResolutionsApi {
  IssueResolutionsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create resolution
  ///
  /// Creates an issue resolution.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateResolutionDetails] createResolutionDetails (required):
  Future<Response> createResolutionWithHttpInfo(CreateResolutionDetails createResolutionDetails, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/resolution';

    // ignore: prefer_final_locals
    Object? postBody = createResolutionDetails;

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

  /// Create resolution
  ///
  /// Creates an issue resolution.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [CreateResolutionDetails] createResolutionDetails (required):
  Future<ResolutionId?> createResolution(CreateResolutionDetails createResolutionDetails, { Future<void>? abortTrigger, }) async {
    final response = await createResolutionWithHttpInfo(createResolutionDetails, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ResolutionId',) as ResolutionId;
    
    }
    return null;
  }

  /// Delete resolution
  ///
  /// Deletes an issue resolution.  This operation is [asynchronous](#async). Follow the `location` link in the response to determine the status of the task and use [Get task](#api-rest-api-3-task-taskId-get) to obtain subsequent updates.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the issue resolution.
  ///
  /// * [String] replaceWith (required):
  ///   The ID of the issue resolution that will replace the currently selected resolution.
  Future<Response> deleteResolutionWithHttpInfo(String id, String replaceWith, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/resolution/{id}'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'replaceWith', replaceWith));

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

  /// Delete resolution
  ///
  /// Deletes an issue resolution.  This operation is [asynchronous](#async). Follow the `location` link in the response to determine the status of the task and use [Get task](#api-rest-api-3-task-taskId-get) to obtain subsequent updates.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the issue resolution.
  ///
  /// * [String] replaceWith (required):
  ///   The ID of the issue resolution that will replace the currently selected resolution.
  Future<void> deleteResolution(String id, String replaceWith, { Future<void>? abortTrigger, }) async {
    final response = await deleteResolutionWithHttpInfo(id, replaceWith, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get resolution
  ///
  /// Returns an issue resolution value.  **[Permissions](#permissions) required:** Permission to access Jira.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the issue resolution value.
  Future<Response> getResolutionWithHttpInfo(String id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/resolution/{id}'
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

  /// Get resolution
  ///
  /// Returns an issue resolution value.  **[Permissions](#permissions) required:** Permission to access Jira.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the issue resolution value.
  Future<Resolution?> getResolution(String id, { Future<void>? abortTrigger, }) async {
    final response = await getResolutionWithHttpInfo(id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Resolution',) as Resolution;
    
    }
    return null;
  }

  /// Get resolutions
  ///
  /// Returns a list of all issue resolution values.  **[Permissions](#permissions) required:** Permission to access Jira.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> getResolutionsWithHttpInfo({ Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/resolution';

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

  /// Get resolutions
  ///
  /// Returns a list of all issue resolution values.  **[Permissions](#permissions) required:** Permission to access Jira.
  Future<List<Resolution>?> getResolutions({ Future<void>? abortTrigger, }) async {
    final response = await getResolutionsWithHttpInfo(abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<Resolution>') as List)
        .cast<Resolution>()
        .toList(growable: false);

    }
    return null;
  }

  /// Move resolutions
  ///
  /// Changes the order of issue resolutions.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [ReorderIssueResolutionsRequest] reorderIssueResolutionsRequest (required):
  Future<Response> moveResolutionsWithHttpInfo(ReorderIssueResolutionsRequest reorderIssueResolutionsRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/resolution/move';

    // ignore: prefer_final_locals
    Object? postBody = reorderIssueResolutionsRequest;

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

  /// Move resolutions
  ///
  /// Changes the order of issue resolutions.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [ReorderIssueResolutionsRequest] reorderIssueResolutionsRequest (required):
  Future<Object?> moveResolutions(ReorderIssueResolutionsRequest reorderIssueResolutionsRequest, { Future<void>? abortTrigger, }) async {
    final response = await moveResolutionsWithHttpInfo(reorderIssueResolutionsRequest, abortTrigger: abortTrigger,);
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

  /// Search resolutions
  ///
  /// Returns a [paginated](#pagination) list of resolutions. The list can contain all resolutions or a subset determined by any combination of these criteria:   *  a list of resolutions IDs.  *  whether the field configuration is a default. This returns resolutions from company-managed (classic) projects only, as there is no concept of default resolutions in team-managed projects.  **[Permissions](#permissions) required:** Permission to access Jira.
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
  ///   The list of resolutions IDs to be filtered out
  ///
  /// * [bool] onlyDefault:
  ///   When set to true, return default only, when IDs provided, if none of them is default, return empty page. Default value is false
  Future<Response> searchResolutionsWithHttpInfo({ String? startAt, String? maxResults, List<String>? id, bool? onlyDefault, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/resolution/search';

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
    if (onlyDefault != null) {
      queryParams.addAll(_queryParams('', 'onlyDefault', onlyDefault));
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

  /// Search resolutions
  ///
  /// Returns a [paginated](#pagination) list of resolutions. The list can contain all resolutions or a subset determined by any combination of these criteria:   *  a list of resolutions IDs.  *  whether the field configuration is a default. This returns resolutions from company-managed (classic) projects only, as there is no concept of default resolutions in team-managed projects.  **[Permissions](#permissions) required:** Permission to access Jira.
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
  ///   The list of resolutions IDs to be filtered out
  ///
  /// * [bool] onlyDefault:
  ///   When set to true, return default only, when IDs provided, if none of them is default, return empty page. Default value is false
  Future<PageBeanResolutionJsonBean?> searchResolutions({ String? startAt, String? maxResults, List<String>? id, bool? onlyDefault, Future<void>? abortTrigger, }) async {
    final response = await searchResolutionsWithHttpInfo(startAt: startAt, maxResults: maxResults, id: id, onlyDefault: onlyDefault, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanResolutionJsonBean',) as PageBeanResolutionJsonBean;
    
    }
    return null;
  }

  /// Set default resolution
  ///
  /// Sets default issue resolution.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [SetDefaultResolutionRequest] setDefaultResolutionRequest (required):
  Future<Response> setDefaultResolutionWithHttpInfo(SetDefaultResolutionRequest setDefaultResolutionRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/resolution/default';

    // ignore: prefer_final_locals
    Object? postBody = setDefaultResolutionRequest;

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

  /// Set default resolution
  ///
  /// Sets default issue resolution.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [SetDefaultResolutionRequest] setDefaultResolutionRequest (required):
  Future<Object?> setDefaultResolution(SetDefaultResolutionRequest setDefaultResolutionRequest, { Future<void>? abortTrigger, }) async {
    final response = await setDefaultResolutionWithHttpInfo(setDefaultResolutionRequest, abortTrigger: abortTrigger,);
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

  /// Update resolution
  ///
  /// Updates an issue resolution.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the issue resolution.
  ///
  /// * [UpdateResolutionDetails] updateResolutionDetails (required):
  Future<Response> updateResolutionWithHttpInfo(String id, UpdateResolutionDetails updateResolutionDetails, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/resolution/{id}'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = updateResolutionDetails;

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

  /// Update resolution
  ///
  /// Updates an issue resolution.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the issue resolution.
  ///
  /// * [UpdateResolutionDetails] updateResolutionDetails (required):
  Future<Object?> updateResolution(String id, UpdateResolutionDetails updateResolutionDetails, { Future<void>? abortTrigger, }) async {
    final response = await updateResolutionWithHttpInfo(id, updateResolutionDetails, abortTrigger: abortTrigger,);
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
