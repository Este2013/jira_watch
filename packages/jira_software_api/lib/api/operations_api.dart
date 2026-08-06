//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class OperationsApi {
  OperationsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Delete Incidents or Review by Property
  ///
  /// Bulk delete all Entties that match the given request.  One or more query params must be supplied to specify Properties to delete by. If more than one Property is provided, data will be deleted that matches ALL of the Properties (e.g. treated as an AND). See the documentation for the submitEntity operation for more details.  e.g. DELETE /bulkByProperties?accountId=account-123&createdBy=user-456  Deletion is performed asynchronously. The getIncidentById operation can be used to confirm that data has been deleted successfully (if needed).  Only Connect apps that define the `jiraOperationsInfoProvider` module can access this resource. This resource requires the 'DELETE' scope for Connect apps. 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with a Connect JWT token that corresponds to the Provider app installed in Jira.  If the JWT token corresponds to an app that does not define Operations Information module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details. 
  Future<Response> deleteEntityByPropertyWithHttpInfo(String authorization, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/operations/1.0/bulkByProperties';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    headerParams[r'Authorization'] = parameterToString(authorization);

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

  /// Delete Incidents or Review by Property
  ///
  /// Bulk delete all Entties that match the given request.  One or more query params must be supplied to specify Properties to delete by. If more than one Property is provided, data will be deleted that matches ALL of the Properties (e.g. treated as an AND). See the documentation for the submitEntity operation for more details.  e.g. DELETE /bulkByProperties?accountId=account-123&createdBy=user-456  Deletion is performed asynchronously. The getIncidentById operation can be used to confirm that data has been deleted successfully (if needed).  Only Connect apps that define the `jiraOperationsInfoProvider` module can access this resource. This resource requires the 'DELETE' scope for Connect apps. 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with a Connect JWT token that corresponds to the Provider app installed in Jira.  If the JWT token corresponds to an app that does not define Operations Information module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details. 
  Future<void> deleteEntityByProperty(String authorization, { Future<void>? abortTrigger, }) async {
    final response = await deleteEntityByPropertyWithHttpInfo(authorization, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Delete a Incident by ID
  ///
  /// Delete the Incident data currently stored for the given ID.  Deletion is performed asynchronously. The getIncidentById operation can be used to confirm that data has been deleted successfully (if needed).  Only Connect apps that define the `jiraOperationsInfoProvider` module can access this resource. This resource requires the 'DELETE' scope for Connect apps. 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with a Connect JWT token that corresponds to the Provider app installed in Jira.  If the JWT token corresponds to an app that does not define Operations Information module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details. 
  ///
  /// * [String] incidentId (required):
  ///   The ID of the Incident to delete. 
  Future<Response> deleteIncidentByIdWithHttpInfo(String authorization, String incidentId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/operations/1.0/incidents/{incidentId}'
      .replaceAll('{incidentId}', incidentId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    headerParams[r'Authorization'] = parameterToString(authorization);

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

  /// Delete a Incident by ID
  ///
  /// Delete the Incident data currently stored for the given ID.  Deletion is performed asynchronously. The getIncidentById operation can be used to confirm that data has been deleted successfully (if needed).  Only Connect apps that define the `jiraOperationsInfoProvider` module can access this resource. This resource requires the 'DELETE' scope for Connect apps. 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with a Connect JWT token that corresponds to the Provider app installed in Jira.  If the JWT token corresponds to an app that does not define Operations Information module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details. 
  ///
  /// * [String] incidentId (required):
  ///   The ID of the Incident to delete. 
  Future<void> deleteIncidentById(String authorization, String incidentId, { Future<void>? abortTrigger, }) async {
    final response = await deleteIncidentByIdWithHttpInfo(authorization, incidentId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Delete a Review by ID
  ///
  /// Delete the Review data currently stored for the given ID.  Deletion is performed asynchronously. The getReviewById operation can be used to confirm that data has been deleted successfully (if needed).  Only Connect apps that define the `jiraOperationsInfoProvider` module can access this resource. This resource requires the 'DELETE' scope for Connect apps. 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with a Connect JWT token that corresponds to the Provider app installed in Jira.  If the JWT token corresponds to an app that does not define Operations Information module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details. 
  ///
  /// * [String] reviewId (required):
  ///   The ID of the Review to delete. 
  Future<Response> deleteReviewByIdWithHttpInfo(String authorization, String reviewId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/operations/1.0/post-incident-reviews/{reviewId}'
      .replaceAll('{reviewId}', reviewId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    headerParams[r'Authorization'] = parameterToString(authorization);

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

  /// Delete a Review by ID
  ///
  /// Delete the Review data currently stored for the given ID.  Deletion is performed asynchronously. The getReviewById operation can be used to confirm that data has been deleted successfully (if needed).  Only Connect apps that define the `jiraOperationsInfoProvider` module can access this resource. This resource requires the 'DELETE' scope for Connect apps. 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with a Connect JWT token that corresponds to the Provider app installed in Jira.  If the JWT token corresponds to an app that does not define Operations Information module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details. 
  ///
  /// * [String] reviewId (required):
  ///   The ID of the Review to delete. 
  Future<void> deleteReviewById(String authorization, String reviewId, { Future<void>? abortTrigger, }) async {
    final response = await deleteReviewByIdWithHttpInfo(authorization, reviewId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Delete Operations Workpaces by Id
  ///
  /// Bulk delete all Operations Workspaces that match the given request.  Only Connect apps that define the `jiraOperationsInfoProvider` module can access this resource. This resource requires the 'DELETE' scope for Connect apps.  e.g. DELETE /bulk?workspaceIds=111-222-333,444-555-666 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with a Connect JWT token that corresponds to the Provider app installed in Jira.  If the JWT token corresponds to an app that does not define the Operations module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details. 
  Future<Response> deleteWorkspacesWithHttpInfo(String authorization, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/operations/1.0/linkedWorkspaces/bulk';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    headerParams[r'Authorization'] = parameterToString(authorization);

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

  /// Delete Operations Workpaces by Id
  ///
  /// Bulk delete all Operations Workspaces that match the given request.  Only Connect apps that define the `jiraOperationsInfoProvider` module can access this resource. This resource requires the 'DELETE' scope for Connect apps.  e.g. DELETE /bulk?workspaceIds=111-222-333,444-555-666 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with a Connect JWT token that corresponds to the Provider app installed in Jira.  If the JWT token corresponds to an app that does not define the Operations module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details. 
  Future<void> deleteWorkspaces(String authorization, { Future<void>? abortTrigger, }) async {
    final response = await deleteWorkspacesWithHttpInfo(authorization, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get a Incident by ID
  ///
  /// Retrieve the currently stored Incident data for the given ID.  The result will be what is currently stored, ignoring any pending updates or deletes.  Only Connect apps that define the `jiraOperationsInfoProvider` module can access this resource. This resource requires the 'READ' scope for Connect apps. 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with a Connect JWT token that corresponds to the Provider app installed in Jira.  If the JWT token corresponds to an app that does not define Operations Information module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details. 
  ///
  /// * [String] incidentId (required):
  ///   The ID of the Incident to fetch. 
  Future<Response> getIncidentByIdWithHttpInfo(String authorization, String incidentId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/operations/1.0/incidents/{incidentId}'
      .replaceAll('{incidentId}', incidentId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    headerParams[r'Authorization'] = parameterToString(authorization);

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

  /// Get a Incident by ID
  ///
  /// Retrieve the currently stored Incident data for the given ID.  The result will be what is currently stored, ignoring any pending updates or deletes.  Only Connect apps that define the `jiraOperationsInfoProvider` module can access this resource. This resource requires the 'READ' scope for Connect apps. 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with a Connect JWT token that corresponds to the Provider app installed in Jira.  If the JWT token corresponds to an app that does not define Operations Information module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details. 
  ///
  /// * [String] incidentId (required):
  ///   The ID of the Incident to fetch. 
  Future<GetIncidentById200Response?> getIncidentById(String authorization, String incidentId, { Future<void>? abortTrigger, }) async {
    final response = await getIncidentByIdWithHttpInfo(authorization, incidentId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetIncidentById200Response',) as GetIncidentById200Response;
    
    }
    return null;
  }

  /// Get a Review by ID
  ///
  /// Retrieve the currently stored Review data for the given ID.  The result will be what is currently stored, ignoring any pending updates or deletes.  Only Connect apps that define the `jiraOperationsInfoProvider` module can access this resource. This resource requires the 'READ' scope for Connect apps. 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with a Connect JWT token that corresponds to the Provider app installed in Jira.  If the JWT token corresponds to an app that does not define Operations Information module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details. 
  ///
  /// * [String] reviewId (required):
  ///   The ID of the Review to fetch. 
  Future<Response> getReviewByIdWithHttpInfo(String authorization, String reviewId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/operations/1.0/post-incident-reviews/{reviewId}'
      .replaceAll('{reviewId}', reviewId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    headerParams[r'Authorization'] = parameterToString(authorization);

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

  /// Get a Review by ID
  ///
  /// Retrieve the currently stored Review data for the given ID.  The result will be what is currently stored, ignoring any pending updates or deletes.  Only Connect apps that define the `jiraOperationsInfoProvider` module can access this resource. This resource requires the 'READ' scope for Connect apps. 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with a Connect JWT token that corresponds to the Provider app installed in Jira.  If the JWT token corresponds to an app that does not define Operations Information module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details. 
  ///
  /// * [String] reviewId (required):
  ///   The ID of the Review to fetch. 
  Future<GetReviewById200Response?> getReviewById(String authorization, String reviewId, { Future<void>? abortTrigger, }) async {
    final response = await getReviewByIdWithHttpInfo(authorization, reviewId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetReviewById200Response',) as GetReviewById200Response;
    
    }
    return null;
  }

  /// Get all Operations Workspace IDs or a specific Operations Workspace by ID
  ///
  /// Retrieve the either all Operations Workspace IDs associated with the Jira site or a specific Operations Workspace ID for the given ID.  The result will be what is currently stored, ignoring any pending updates or deletes.  e.g. GET /workspace?workspaceId=111-222-333  Only Connect apps that define the `jiraOperationsInfoProvider` module can access this resource. This resource requires the 'READ' scope for Connect apps. 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with a Connect JWT token that corresponds to the Provider app installed in Jira.  If the JWT token corresponds to an app that does not define the Operations Information module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details. 
  Future<Response> getWorkspacesWithHttpInfo(String authorization, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/operations/1.0/linkedWorkspaces';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    headerParams[r'Authorization'] = parameterToString(authorization);

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

  /// Get all Operations Workspace IDs or a specific Operations Workspace by ID
  ///
  /// Retrieve the either all Operations Workspace IDs associated with the Jira site or a specific Operations Workspace ID for the given ID.  The result will be what is currently stored, ignoring any pending updates or deletes.  e.g. GET /workspace?workspaceId=111-222-333  Only Connect apps that define the `jiraOperationsInfoProvider` module can access this resource. This resource requires the 'READ' scope for Connect apps. 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with a Connect JWT token that corresponds to the Provider app installed in Jira.  If the JWT token corresponds to an app that does not define the Operations Information module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details. 
  Future<OperationsWorkspaceIds?> getWorkspaces(String authorization, { Future<void>? abortTrigger, }) async {
    final response = await getWorkspacesWithHttpInfo(authorization, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'OperationsWorkspaceIds',) as OperationsWorkspaceIds;
    
    }
    return null;
  }

  /// Submit Incident or Review data
  ///
  /// Update / insert Incident or Review data.  Incidents and reviews are identified by their ID, and existing Incident and Review data for the same ID will be replaced if it exists and the updateSequenceNumber of existing data is less than the incoming data.  Submissions are performed asynchronously. Submitted data will eventually be available in Jira; most updates are available within a short period of time, but may take some time during peak load and/or maintenance times. The getIncidentById or getReviewById operation can be used to confirm that data has been stored successfully (if needed).  In the case of multiple Incidents and Reviews being submitted in one request, each is validated individually prior to submission. Details of which entities failed submission (if any) are available in the response object.  A maximum of 1000 incidents can be submitted in one request.  Only Connect apps that define the `jiraOperationsInfoProvider` module can access this resource. This resource requires the 'WRITE' scope for Connect apps. 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with a Connect JWT token that corresponds to the Provider app installed in Jira.  If the JWT token corresponds to an app that does not define the Operations Information module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details. 
  ///
  /// * [SubmitIncidentsRequest] submitIncidentsRequest (required):
  ///   Incident data to submit. 
  Future<Response> submitEntityWithHttpInfo(String authorization, SubmitIncidentsRequest submitIncidentsRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/operations/1.0/bulk';

    // ignore: prefer_final_locals
    Object? postBody = submitIncidentsRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    headerParams[r'Authorization'] = parameterToString(authorization);

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

  /// Submit Incident or Review data
  ///
  /// Update / insert Incident or Review data.  Incidents and reviews are identified by their ID, and existing Incident and Review data for the same ID will be replaced if it exists and the updateSequenceNumber of existing data is less than the incoming data.  Submissions are performed asynchronously. Submitted data will eventually be available in Jira; most updates are available within a short period of time, but may take some time during peak load and/or maintenance times. The getIncidentById or getReviewById operation can be used to confirm that data has been stored successfully (if needed).  In the case of multiple Incidents and Reviews being submitted in one request, each is validated individually prior to submission. Details of which entities failed submission (if any) are available in the response object.  A maximum of 1000 incidents can be submitted in one request.  Only Connect apps that define the `jiraOperationsInfoProvider` module can access this resource. This resource requires the 'WRITE' scope for Connect apps. 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with a Connect JWT token that corresponds to the Provider app installed in Jira.  If the JWT token corresponds to an app that does not define the Operations Information module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details. 
  ///
  /// * [SubmitIncidentsRequest] submitIncidentsRequest (required):
  ///   Incident data to submit. 
  Future<SubmitIncidentsResponse?> submitEntity(String authorization, SubmitIncidentsRequest submitIncidentsRequest, { Future<void>? abortTrigger, }) async {
    final response = await submitEntityWithHttpInfo(authorization, submitIncidentsRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'SubmitIncidentsResponse',) as SubmitIncidentsResponse;
    
    }
    return null;
  }

  /// Submit Operations Workspace Ids
  ///
  /// Insert Operations Workspace IDs to establish a relationship between them and the Jira site the app is installed in. If a relationship between the Workspace ID and Jira already exists then the workspace ID will be ignored and Jira will process the rest of the entries.  Only Connect apps that define the `jiraOperationsInfoProvider` module can access this resource. This resource requires the 'WRITE' scope for Connect apps. 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with a Connect JWT token that corresponds to the Provider app installed in Jira.  If the JWT token corresponds to an app that does not define the Operations module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details. 
  ///
  /// * [SubmitOperationsWorkspacesRequest] submitOperationsWorkspacesRequest (required):
  ///   Operations Workspace ids to submit. 
  Future<Response> submitOperationsWorkspacesWithHttpInfo(String authorization, SubmitOperationsWorkspacesRequest submitOperationsWorkspacesRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/operations/1.0/linkedWorkspaces/bulk';

    // ignore: prefer_final_locals
    Object? postBody = submitOperationsWorkspacesRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    headerParams[r'Authorization'] = parameterToString(authorization);

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

  /// Submit Operations Workspace Ids
  ///
  /// Insert Operations Workspace IDs to establish a relationship between them and the Jira site the app is installed in. If a relationship between the Workspace ID and Jira already exists then the workspace ID will be ignored and Jira will process the rest of the entries.  Only Connect apps that define the `jiraOperationsInfoProvider` module can access this resource. This resource requires the 'WRITE' scope for Connect apps. 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with a Connect JWT token that corresponds to the Provider app installed in Jira.  If the JWT token corresponds to an app that does not define the Operations module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details. 
  ///
  /// * [SubmitOperationsWorkspacesRequest] submitOperationsWorkspacesRequest (required):
  ///   Operations Workspace ids to submit. 
  Future<SubmitOperationsWorkspacesResponse?> submitOperationsWorkspaces(String authorization, SubmitOperationsWorkspacesRequest submitOperationsWorkspacesRequest, { Future<void>? abortTrigger, }) async {
    final response = await submitOperationsWorkspacesWithHttpInfo(authorization, submitOperationsWorkspacesRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'SubmitOperationsWorkspacesResponse',) as SubmitOperationsWorkspacesResponse;
    
    }
    return null;
  }
}
