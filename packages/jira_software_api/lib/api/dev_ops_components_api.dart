//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class DevOpsComponentsApi {
  DevOpsComponentsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Delete a Component by ID
  ///
  /// Delete the Component data currently stored for the given ID.  Deletion is performed asynchronously. The getComponentById operation can be used to confirm that data has been deleted successfully (if needed).  Only Connect apps that define the `jiraDevOpsComponentProvider` module can access this resource. This resource requires the 'DELETE' scope for Connect apps. 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with a Connect JWT token that corresponds to the Provider app installed in Jira.  If the JWT token corresponds to an app that does not define Operations Information module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details. 
  ///
  /// * [String] componentId (required):
  ///   The ID of the Component to delete. 
  Future<Response> deleteComponentByIdWithHttpInfo(String authorization, String componentId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/devopscomponents/1.0/devopscomponents/{componentId}'
      .replaceAll('{componentId}', componentId);

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

  /// Delete a Component by ID
  ///
  /// Delete the Component data currently stored for the given ID.  Deletion is performed asynchronously. The getComponentById operation can be used to confirm that data has been deleted successfully (if needed).  Only Connect apps that define the `jiraDevOpsComponentProvider` module can access this resource. This resource requires the 'DELETE' scope for Connect apps. 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with a Connect JWT token that corresponds to the Provider app installed in Jira.  If the JWT token corresponds to an app that does not define Operations Information module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details. 
  ///
  /// * [String] componentId (required):
  ///   The ID of the Component to delete. 
  Future<void> deleteComponentById(String authorization, String componentId, { Future<void>? abortTrigger, }) async {
    final response = await deleteComponentByIdWithHttpInfo(authorization, componentId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Delete DevOps Components by Property
  ///
  /// Bulk delete all Components that match the given request.  One or more query params must be supplied to specify Properties to delete by. If more than one Property is provided, data will be deleted that matches ALL of the Properties (e.g. treated as an AND). See the documentation for the submitComponents operation for more details.  e.g. DELETE /bulkByProperties?accountId=account-123&createdBy=user-456  Deletion is performed asynchronously. The getComponentById operation can be used to confirm that data has been deleted successfully (if needed).  Only Connect apps that define the `jiraDevOpsComponentProvider` module can access this resource. This resource requires the 'DELETE' scope for Connect apps. 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with a Connect JWT token that corresponds to the Provider app installed in Jira.  If the JWT token corresponds to an app that does not define the Operations Information module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details. 
  Future<Response> deleteComponentsByPropertyWithHttpInfo(String authorization, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/devopscomponents/1.0/bulkByProperties';

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

  /// Delete DevOps Components by Property
  ///
  /// Bulk delete all Components that match the given request.  One or more query params must be supplied to specify Properties to delete by. If more than one Property is provided, data will be deleted that matches ALL of the Properties (e.g. treated as an AND). See the documentation for the submitComponents operation for more details.  e.g. DELETE /bulkByProperties?accountId=account-123&createdBy=user-456  Deletion is performed asynchronously. The getComponentById operation can be used to confirm that data has been deleted successfully (if needed).  Only Connect apps that define the `jiraDevOpsComponentProvider` module can access this resource. This resource requires the 'DELETE' scope for Connect apps. 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with a Connect JWT token that corresponds to the Provider app installed in Jira.  If the JWT token corresponds to an app that does not define the Operations Information module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details. 
  Future<void> deleteComponentsByProperty(String authorization, { Future<void>? abortTrigger, }) async {
    final response = await deleteComponentsByPropertyWithHttpInfo(authorization, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get a Component by ID
  ///
  /// Retrieve the currently stored Component data for the given ID.  The result will be what is currently stored, ignoring any pending updates or deletes.  Only Connect apps that define the `jiraDevOpsComponentProvider` module can access this resource. This resource requires the 'READ' scope for Connect apps. 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with a Connect JWT token that corresponds to the Provider app installed in Jira.  If the JWT token corresponds to an app that does not define Operations Information module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details. 
  ///
  /// * [String] componentId (required):
  ///   The ID of the Component to fetch. 
  Future<Response> getComponentByIdWithHttpInfo(String authorization, String componentId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/devopscomponents/1.0/devopscomponents/{componentId}'
      .replaceAll('{componentId}', componentId);

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

  /// Get a Component by ID
  ///
  /// Retrieve the currently stored Component data for the given ID.  The result will be what is currently stored, ignoring any pending updates or deletes.  Only Connect apps that define the `jiraDevOpsComponentProvider` module can access this resource. This resource requires the 'READ' scope for Connect apps. 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with a Connect JWT token that corresponds to the Provider app installed in Jira.  If the JWT token corresponds to an app that does not define Operations Information module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details. 
  ///
  /// * [String] componentId (required):
  ///   The ID of the Component to fetch. 
  Future<GetComponentById200Response?> getComponentById(String authorization, String componentId, { Future<void>? abortTrigger, }) async {
    final response = await getComponentByIdWithHttpInfo(authorization, componentId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetComponentById200Response',) as GetComponentById200Response;
    
    }
    return null;
  }

  /// Submit DevOps Components
  ///
  /// Update / insert DevOps Component data.  Components are identified by their ID, and existing Component data for the same ID will be replaced if it exists and the updateSequenceNumber of existing data is less than the incoming data.  Submissions are performed asynchronously. Submitted data will eventually be available in Jira; most updates are available within a short period of time, but may take some time during peak load and/or maintenance times. The getComponentById operation can be used to confirm that data has been stored successfully (if needed).  In the case of multiple Components being submitted in one request, each is validated individually prior to submission. Details of which Components failed submission (if any) are available in the response object.  A maximum of 1000 components can be submitted in one request.  Only Connect apps that define the `jiraDevOpsComponentProvider` module can access this resource. This resource requires the 'WRITE' scope for Connect apps. 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with a Connect JWT token that corresponds to the Provider app installed in Jira.  If the JWT token corresponds to an app that does not define the DevOps Information module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details. 
  ///
  /// * [SubmitDevopsComponentsRequest] submitDevopsComponentsRequest (required):
  ///   DevOps Component data to submit. 
  Future<Response> submitComponentsWithHttpInfo(String authorization, SubmitDevopsComponentsRequest submitDevopsComponentsRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/devopscomponents/1.0/bulk';

    // ignore: prefer_final_locals
    Object? postBody = submitDevopsComponentsRequest;

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

  /// Submit DevOps Components
  ///
  /// Update / insert DevOps Component data.  Components are identified by their ID, and existing Component data for the same ID will be replaced if it exists and the updateSequenceNumber of existing data is less than the incoming data.  Submissions are performed asynchronously. Submitted data will eventually be available in Jira; most updates are available within a short period of time, but may take some time during peak load and/or maintenance times. The getComponentById operation can be used to confirm that data has been stored successfully (if needed).  In the case of multiple Components being submitted in one request, each is validated individually prior to submission. Details of which Components failed submission (if any) are available in the response object.  A maximum of 1000 components can be submitted in one request.  Only Connect apps that define the `jiraDevOpsComponentProvider` module can access this resource. This resource requires the 'WRITE' scope for Connect apps. 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with a Connect JWT token that corresponds to the Provider app installed in Jira.  If the JWT token corresponds to an app that does not define the DevOps Information module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details. 
  ///
  /// * [SubmitDevopsComponentsRequest] submitDevopsComponentsRequest (required):
  ///   DevOps Component data to submit. 
  Future<SubmitDevopsComponentsResponse?> submitComponents(String authorization, SubmitDevopsComponentsRequest submitDevopsComponentsRequest, { Future<void>? abortTrigger, }) async {
    final response = await submitComponentsWithHttpInfo(authorization, submitDevopsComponentsRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'SubmitDevopsComponentsResponse',) as SubmitDevopsComponentsResponse;
    
    }
    return null;
  }
}
