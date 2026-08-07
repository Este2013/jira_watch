//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class FieldSchemesApi {
  FieldSchemesApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Associate projects to field schemes
  ///
  /// Associate projects to field association schemes.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [Map<String, FieldSchemeToProjectsRequest>] requestBody (required):
  Future<Response> associateProjectsToFieldAssociationSchemesWithHttpInfo(Map<String, FieldSchemeToProjectsRequest> requestBody, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/config/fieldschemes/projects';

    // ignore: prefer_final_locals
    Object? postBody = requestBody;

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

  /// Associate projects to field schemes
  ///
  /// Associate projects to field association schemes.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [Map<String, FieldSchemeToProjectsRequest>] requestBody (required):
  Future<FieldSchemeToProjectsResponse?> associateProjectsToFieldAssociationSchemes(Map<String, FieldSchemeToProjectsRequest> requestBody, { Future<void>? abortTrigger, }) async {
    final response = await associateProjectsToFieldAssociationSchemesWithHttpInfo(requestBody, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'FieldSchemeToProjectsResponse',) as FieldSchemeToProjectsResponse;
    
    }
    return null;
  }

  /// Clone field scheme
  ///
  /// Endpoint for cloning an existing field association scheme into a new one.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the source field association scheme to clone from
  ///
  /// * [CreateFieldAssociationSchemeRequest] createFieldAssociationSchemeRequest (required):
  ///   The request containing the name and description for the new scheme
  Future<Response> cloneFieldAssociationSchemeWithHttpInfo(int id, CreateFieldAssociationSchemeRequest createFieldAssociationSchemeRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/config/fieldschemes/{id}/clone'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = createFieldAssociationSchemeRequest;

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

  /// Clone field scheme
  ///
  /// Endpoint for cloning an existing field association scheme into a new one.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the source field association scheme to clone from
  ///
  /// * [CreateFieldAssociationSchemeRequest] createFieldAssociationSchemeRequest (required):
  ///   The request containing the name and description for the new scheme
  Future<CreateFieldAssociationSchemeResponse?> cloneFieldAssociationScheme(int id, CreateFieldAssociationSchemeRequest createFieldAssociationSchemeRequest, { Future<void>? abortTrigger, }) async {
    final response = await cloneFieldAssociationSchemeWithHttpInfo(id, createFieldAssociationSchemeRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateFieldAssociationSchemeResponse',) as CreateFieldAssociationSchemeResponse;
    
    }
    return null;
  }

  /// Create field scheme
  ///
  /// Endpoint for creating a new field association scheme.  A new scheme is **not** copied from, or based on, any existing field association scheme. Instead, it is initialised with a minimal default set of critical fields sourced from the instance's own *system* and *product* fields (the fields returned by the product's field API), rather than from a scheme you specify.  To create a scheme that is based on an existing one, use the *Clone field scheme* endpoint instead.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateFieldAssociationSchemeRequest] createFieldAssociationSchemeRequest (required):
  ///   The request containing the name and description of the field association scheme
  Future<Response> createFieldAssociationSchemeWithHttpInfo(CreateFieldAssociationSchemeRequest createFieldAssociationSchemeRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/config/fieldschemes';

    // ignore: prefer_final_locals
    Object? postBody = createFieldAssociationSchemeRequest;

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

  /// Create field scheme
  ///
  /// Endpoint for creating a new field association scheme.  A new scheme is **not** copied from, or based on, any existing field association scheme. Instead, it is initialised with a minimal default set of critical fields sourced from the instance's own *system* and *product* fields (the fields returned by the product's field API), rather than from a scheme you specify.  To create a scheme that is based on an existing one, use the *Clone field scheme* endpoint instead.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [CreateFieldAssociationSchemeRequest] createFieldAssociationSchemeRequest (required):
  ///   The request containing the name and description of the field association scheme
  Future<CreateFieldAssociationSchemeResponse?> createFieldAssociationScheme(CreateFieldAssociationSchemeRequest createFieldAssociationSchemeRequest, { Future<void>? abortTrigger, }) async {
    final response = await createFieldAssociationSchemeWithHttpInfo(createFieldAssociationSchemeRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateFieldAssociationSchemeResponse',) as CreateFieldAssociationSchemeResponse;
    
    }
    return null;
  }

  /// Delete a field scheme
  ///
  /// Delete a specified field association scheme  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the field association scheme to delete.
  Future<Response> deleteFieldAssociationSchemeWithHttpInfo(int id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/config/fieldschemes/{id}'
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

  /// Delete a field scheme
  ///
  /// Delete a specified field association scheme  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the field association scheme to delete.
  Future<DeleteFieldAssociationSchemeResponse?> deleteFieldAssociationScheme(int id, { Future<void>? abortTrigger, }) async {
    final response = await deleteFieldAssociationSchemeWithHttpInfo(id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'DeleteFieldAssociationSchemeResponse',) as DeleteFieldAssociationSchemeResponse;
    
    }
    return null;
  }

  /// Get field scheme
  ///
  /// Endpoint for fetching a field association scheme by its ID  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The scheme id to fetch
  Future<Response> getFieldAssociationSchemeByIdWithHttpInfo(int id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/config/fieldschemes/{id}'
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

  /// Get field scheme
  ///
  /// Endpoint for fetching a field association scheme by its ID  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The scheme id to fetch
  Future<GetFieldAssociationSchemeByIdResponse?> getFieldAssociationSchemeById(int id, { Future<void>? abortTrigger, }) async {
    final response = await getFieldAssociationSchemeByIdWithHttpInfo(id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetFieldAssociationSchemeByIdResponse',) as GetFieldAssociationSchemeByIdResponse;
    
    }
    return null;
  }

  /// Get field parameters
  ///
  /// Retrieve field association parameters on a field association scheme  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   the ID of the field association scheme to retrieve parameters for
  ///
  /// * [String] fieldId (required):
  ///   the ID of the field
  Future<Response> getFieldAssociationSchemeItemParametersWithHttpInfo(int id, String fieldId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/config/fieldschemes/{id}/fields/{fieldId}/parameters'
      .replaceAll('{id}', id.toString())
      .replaceAll('{fieldId}', fieldId);

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

  /// Get field parameters
  ///
  /// Retrieve field association parameters on a field association scheme  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   the ID of the field association scheme to retrieve parameters for
  ///
  /// * [String] fieldId (required):
  ///   the ID of the field
  Future<GetFieldAssociationParametersResponse?> getFieldAssociationSchemeItemParameters(int id, String fieldId, { Future<void>? abortTrigger, }) async {
    final response = await getFieldAssociationSchemeItemParametersWithHttpInfo(id, fieldId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetFieldAssociationParametersResponse',) as GetFieldAssociationParametersResponse;
    
    }
    return null;
  }

  /// Get field schemes
  ///
  /// REST endpoint for retrieving a paginated list of field association schemes with optional filtering.  This endpoint allows clients to fetch field association schemes with optional filtering by project IDs and text queries. The response includes scheme details with navigation links and filter metadata when applicable.  Filtering Behavior:   *  When projectId or query parameters are provided, the response includes matchedFilters metadata showing which filters were applied.  *  When no filters are applied, matchedFilters is omitted from individual scheme objects  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [List<int>] projectId:
  ///   (optional) List of project IDs to filter schemes by. If not provided, schemes from all projects are returned.
  ///
  /// * [String] query:
  ///   (optional) Text filter for scheme name or description matching (case-insensitive). If not provided, no text filtering is applied.
  ///
  /// * [int] startAt:
  ///   Zero-based index of the first item to return (default: 0)
  ///
  /// * [int] maxResults:
  ///   Maximum number of items to return per page (default: 50, max: 100)
  Future<Response> getFieldAssociationSchemesWithHttpInfo({ List<int>? projectId, String? query, int? startAt, int? maxResults, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/config/fieldschemes';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (projectId != null) {
      queryParams.addAll(_queryParams('multi', 'projectId', projectId));
    }
    if (query != null) {
      queryParams.addAll(_queryParams('', 'query', query));
    }
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

  /// Get field schemes
  ///
  /// REST endpoint for retrieving a paginated list of field association schemes with optional filtering.  This endpoint allows clients to fetch field association schemes with optional filtering by project IDs and text queries. The response includes scheme details with navigation links and filter metadata when applicable.  Filtering Behavior:   *  When projectId or query parameters are provided, the response includes matchedFilters metadata showing which filters were applied.  *  When no filters are applied, matchedFilters is omitted from individual scheme objects  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [List<int>] projectId:
  ///   (optional) List of project IDs to filter schemes by. If not provided, schemes from all projects are returned.
  ///
  /// * [String] query:
  ///   (optional) Text filter for scheme name or description matching (case-insensitive). If not provided, no text filtering is applied.
  ///
  /// * [int] startAt:
  ///   Zero-based index of the first item to return (default: 0)
  ///
  /// * [int] maxResults:
  ///   Maximum number of items to return per page (default: 50, max: 100)
  Future<PageBean2GetFieldAssociationSchemeResponse?> getFieldAssociationSchemes({ List<int>? projectId, String? query, int? startAt, int? maxResults, Future<void>? abortTrigger, }) async {
    final response = await getFieldAssociationSchemesWithHttpInfo(projectId: projectId, query: query, startAt: startAt, maxResults: maxResults, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBean2GetFieldAssociationSchemeResponse',) as PageBean2GetFieldAssociationSchemeResponse;
    
    }
    return null;
  }

  /// Get projects with field schemes
  ///
  /// Get projects with field association schemes. This will be a temporary API but useful when transitioning from the legacy field configuration APIs to the new ones.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [List<int>] projectId (required):
  ///   List of project ids to filter the results by.
  ///
  /// * [int] startAt:
  ///   The starting index of the returned projects. Base index: 0.
  ///
  /// * [int] maxResults:
  ///   The maximum number of projects to return per page, maximum allowed value is 100.
  Future<Response> getProjectsWithFieldSchemesWithHttpInfo(List<int> projectId, { int? startAt, int? maxResults, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/config/fieldschemes/projects';

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

  /// Get projects with field schemes
  ///
  /// Get projects with field association schemes. This will be a temporary API but useful when transitioning from the legacy field configuration APIs to the new ones.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [List<int>] projectId (required):
  ///   List of project ids to filter the results by.
  ///
  /// * [int] startAt:
  ///   The starting index of the returned projects. Base index: 0.
  ///
  /// * [int] maxResults:
  ///   The maximum number of projects to return per page, maximum allowed value is 100.
  Future<PageBean2GetProjectsWithFieldSchemesResponse?> getProjectsWithFieldSchemes(List<int> projectId, { int? startAt, int? maxResults, Future<void>? abortTrigger, }) async {
    final response = await getProjectsWithFieldSchemesWithHttpInfo(projectId, startAt: startAt, maxResults: maxResults, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBean2GetProjectsWithFieldSchemesResponse',) as PageBean2GetProjectsWithFieldSchemesResponse;
    
    }
    return null;
  }

  /// Remove field parameters
  ///
  /// Remove field association parameters overrides for work types.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [Map<String, List<ParameterRemovalDetails>>] requestBody (required):
  Future<Response> removeFieldAssociationSchemeItemParametersWithHttpInfo(Map<String, List<ParameterRemovalDetails>> requestBody, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/config/fieldschemes/fields/parameters';

    // ignore: prefer_final_locals
    Object? postBody = requestBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


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

  /// Remove field parameters
  ///
  /// Remove field association parameters overrides for work types.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [Map<String, List<ParameterRemovalDetails>>] requestBody (required):
  Future<void> removeFieldAssociationSchemeItemParameters(Map<String, List<ParameterRemovalDetails>> requestBody, { Future<void>? abortTrigger, }) async {
    final response = await removeFieldAssociationSchemeItemParametersWithHttpInfo(requestBody, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Remove fields associated with field schemes
  ///
  /// Remove fields associated with field association schemes.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [Map<String, RemoveFieldAssociationsRequestItem>] requestBody (required):
  ///   The request containing the schemes and fields to be removed.
  Future<Response> removeFieldsAssociatedWithSchemesWithHttpInfo(Map<String, RemoveFieldAssociationsRequestItem> requestBody, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/config/fieldschemes/fields';

    // ignore: prefer_final_locals
    Object? postBody = requestBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


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

  /// Remove fields associated with field schemes
  ///
  /// Remove fields associated with field association schemes.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [Map<String, RemoveFieldAssociationsRequestItem>] requestBody (required):
  ///   The request containing the schemes and fields to be removed.
  Future<MinimalFieldSchemeToFieldsResponse?> removeFieldsAssociatedWithSchemes(Map<String, RemoveFieldAssociationsRequestItem> requestBody, { Future<void>? abortTrigger, }) async {
    final response = await removeFieldsAssociatedWithSchemesWithHttpInfo(requestBody, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MinimalFieldSchemeToFieldsResponse',) as MinimalFieldSchemeToFieldsResponse;
    
    }
    return null;
  }

  /// Search field scheme fields
  ///
  /// Search for fields belonging to a given field association scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The scheme ID to search for child fields
  ///
  /// * [int] startAt:
  ///   The starting index of the returned fields. Base index: 0.
  ///
  /// * [int] maxResults:
  ///   The maximum number of fields to return per page, maximum allowed value is 100.
  ///
  /// * [List<String>] fieldId:
  ///   The field IDs to filter by, if empty then all fields belonging to a field association scheme will be returned
  Future<Response> searchFieldAssociationSchemeFieldsWithHttpInfo(int id, { int? startAt, int? maxResults, List<String>? fieldId, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/config/fieldschemes/{id}/fields'
      .replaceAll('{id}', id.toString());

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
    if (fieldId != null) {
      queryParams.addAll(_queryParams('multi', 'fieldId', fieldId));
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

  /// Search field scheme fields
  ///
  /// Search for fields belonging to a given field association scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The scheme ID to search for child fields
  ///
  /// * [int] startAt:
  ///   The starting index of the returned fields. Base index: 0.
  ///
  /// * [int] maxResults:
  ///   The maximum number of fields to return per page, maximum allowed value is 100.
  ///
  /// * [List<String>] fieldId:
  ///   The field IDs to filter by, if empty then all fields belonging to a field association scheme will be returned
  Future<PageBean2FieldAssociationSchemeFieldSearchResult?> searchFieldAssociationSchemeFields(int id, { int? startAt, int? maxResults, List<String>? fieldId, Future<void>? abortTrigger, }) async {
    final response = await searchFieldAssociationSchemeFieldsWithHttpInfo(id, startAt: startAt, maxResults: maxResults, fieldId: fieldId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBean2FieldAssociationSchemeFieldSearchResult',) as PageBean2FieldAssociationSchemeFieldSearchResult;
    
    }
    return null;
  }

  /// Search field scheme projects
  ///
  /// REST Endpoint for searching for projects belonging to a given field association scheme  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The scheme id to search for associated projects
  ///
  /// * [int] startAt:
  ///   The starting index of the returned projects. Base index: 0.
  ///
  /// * [int] maxResults:
  ///   The maximum number of projects to return per page, maximum allowed value is 100.
  ///
  /// * [List<int>] projectId:
  ///   The project Ids to filter by, if empty then all projects belonging to a field association scheme will be returned
  Future<Response> searchFieldAssociationSchemeProjectsWithHttpInfo(int id, { int? startAt, int? maxResults, List<int>? projectId, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/config/fieldschemes/{id}/projects'
      .replaceAll('{id}', id.toString());

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

  /// Search field scheme projects
  ///
  /// REST Endpoint for searching for projects belonging to a given field association scheme  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The scheme id to search for associated projects
  ///
  /// * [int] startAt:
  ///   The starting index of the returned projects. Base index: 0.
  ///
  /// * [int] maxResults:
  ///   The maximum number of projects to return per page, maximum allowed value is 100.
  ///
  /// * [List<int>] projectId:
  ///   The project Ids to filter by, if empty then all projects belonging to a field association scheme will be returned
  Future<PageBean2FieldAssociationSchemeProjectSearchResult?> searchFieldAssociationSchemeProjects(int id, { int? startAt, int? maxResults, List<int>? projectId, Future<void>? abortTrigger, }) async {
    final response = await searchFieldAssociationSchemeProjectsWithHttpInfo(id, startAt: startAt, maxResults: maxResults, projectId: projectId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBean2FieldAssociationSchemeProjectSearchResult',) as PageBean2FieldAssociationSchemeProjectSearchResult;
    
    }
    return null;
  }

  /// Update field scheme
  ///
  /// Endpoint for updating an existing field association scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///
  /// * [UpdateFieldAssociationSchemeRequest] updateFieldAssociationSchemeRequest (required):
  ///   The request containing the desired updates to the field association scheme
  Future<Response> updateFieldAssociationSchemeWithHttpInfo(int id, UpdateFieldAssociationSchemeRequest updateFieldAssociationSchemeRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/config/fieldschemes/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = updateFieldAssociationSchemeRequest;

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

  /// Update field scheme
  ///
  /// Endpoint for updating an existing field association scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///
  /// * [UpdateFieldAssociationSchemeRequest] updateFieldAssociationSchemeRequest (required):
  ///   The request containing the desired updates to the field association scheme
  Future<UpdateFieldAssociationSchemeResponse?> updateFieldAssociationScheme(int id, UpdateFieldAssociationSchemeRequest updateFieldAssociationSchemeRequest, { Future<void>? abortTrigger, }) async {
    final response = await updateFieldAssociationSchemeWithHttpInfo(id, updateFieldAssociationSchemeRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UpdateFieldAssociationSchemeResponse',) as UpdateFieldAssociationSchemeResponse;
    
    }
    return null;
  }

  /// Update field parameters
  ///
  /// Update field association item parameters in field association schemes.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [Map<String, List<UpdateFieldSchemeParametersRequest>>] requestBody (required):
  ///   The request containing the field association scheme id and the parameters to update.
  Future<Response> updateFieldAssociationSchemeItemParametersWithHttpInfo(Map<String, List<UpdateFieldSchemeParametersRequest>> requestBody, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/config/fieldschemes/fields/parameters';

    // ignore: prefer_final_locals
    Object? postBody = requestBody;

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

  /// Update field parameters
  ///
  /// Update field association item parameters in field association schemes.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [Map<String, List<UpdateFieldSchemeParametersRequest>>] requestBody (required):
  ///   The request containing the field association scheme id and the parameters to update.
  Future<UpdateFieldSchemeParametersResponse?> updateFieldAssociationSchemeItemParameters(Map<String, List<UpdateFieldSchemeParametersRequest>> requestBody, { Future<void>? abortTrigger, }) async {
    final response = await updateFieldAssociationSchemeItemParametersWithHttpInfo(requestBody, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UpdateFieldSchemeParametersResponse',) as UpdateFieldSchemeParametersResponse;
    
    }
    return null;
  }

  /// Update fields associated with field schemes
  ///
  /// Update fields associated with field association schemes.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [Map<String, List<UpdateFieldAssociationsRequestItem>>] requestBody (required):
  ///   The request containing the schemes and work types to associate each field with.
  Future<Response> updateFieldsAssociatedWithSchemesWithHttpInfo(Map<String, List<UpdateFieldAssociationsRequestItem>> requestBody, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/config/fieldschemes/fields';

    // ignore: prefer_final_locals
    Object? postBody = requestBody;

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

  /// Update fields associated with field schemes
  ///
  /// Update fields associated with field association schemes.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [Map<String, List<UpdateFieldAssociationsRequestItem>>] requestBody (required):
  ///   The request containing the schemes and work types to associate each field with.
  Future<FieldSchemeToFieldsResponse?> updateFieldsAssociatedWithSchemes(Map<String, List<UpdateFieldAssociationsRequestItem>> requestBody, { Future<void>? abortTrigger, }) async {
    final response = await updateFieldsAssociatedWithSchemesWithHttpInfo(requestBody, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'FieldSchemeToFieldsResponse',) as FieldSchemeToFieldsResponse;
    
    }
    return null;
  }
}
