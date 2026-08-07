//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class SecurityInformationApi {
  SecurityInformationApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Delete linked Security Workspaces
  ///
  /// Bulk delete all linked Security Workspaces that match the given request.  e.g. DELETE /bulk?workspaceIds=111-222-333,444-555-666 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be authenticated as an app — either with a Connect JWT token for Connect apps, or with an OAuth 2.0 access token for Forge and OAuth 2.0 apps — that corresponds to the Provider app installed in Jira.  If the app does not define a security information provider module, or does not have the required scope, the request will be rejected with a 403.  Read [understanding jwt](https://developer.atlassian.com/blog/2015/01/understanding-jwt/) for more details about Connect JWT tokens. 
  Future<Response> deleteLinkedWorkspacesWithHttpInfo(String authorization, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/security/1.0/linkedWorkspaces/bulk';

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

  /// Delete linked Security Workspaces
  ///
  /// Bulk delete all linked Security Workspaces that match the given request.  e.g. DELETE /bulk?workspaceIds=111-222-333,444-555-666 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be authenticated as an app — either with a Connect JWT token for Connect apps, or with an OAuth 2.0 access token for Forge and OAuth 2.0 apps — that corresponds to the Provider app installed in Jira.  If the app does not define a security information provider module, or does not have the required scope, the request will be rejected with a 403.  Read [understanding jwt](https://developer.atlassian.com/blog/2015/01/understanding-jwt/) for more details about Connect JWT tokens. 
  Future<void> deleteLinkedWorkspaces(String authorization, { Future<void>? abortTrigger, }) async {
    final response = await deleteLinkedWorkspacesWithHttpInfo(authorization, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Delete Vulnerabilities by Property
  ///
  /// Bulk delete all Vulnerabilities that match the given request.  One or more query params must be supplied to specify Properties to delete by. If more than one Property is provided, data will be deleted that matches ALL of the Properties (e.g. treated as an AND). Read the POST bulk endpoint documentation for more details.  e.g. DELETE /bulkByProperties?accountId=account-123&createdBy=user-456  Deletion is performed asynchronously. The GET vulnerability endpoint can be used to confirm that data has been deleted successfully (if needed). 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be authenticated as an app — either with a Connect JWT token for Connect apps, or with an OAuth 2.0 access token for Forge and OAuth 2.0 apps — that corresponds to the Provider app installed in Jira.  If the app does not define a security information provider module, or does not have the required scope, the request will be rejected with a 403.  Read [understanding jwt](https://developer.atlassian.com/blog/2015/01/understanding-jwt/) for more details about Connect JWT tokens. 
  Future<Response> deleteVulnerabilitiesByPropertyWithHttpInfo(String authorization, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/security/1.0/bulkByProperties';

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

  /// Delete Vulnerabilities by Property
  ///
  /// Bulk delete all Vulnerabilities that match the given request.  One or more query params must be supplied to specify Properties to delete by. If more than one Property is provided, data will be deleted that matches ALL of the Properties (e.g. treated as an AND). Read the POST bulk endpoint documentation for more details.  e.g. DELETE /bulkByProperties?accountId=account-123&createdBy=user-456  Deletion is performed asynchronously. The GET vulnerability endpoint can be used to confirm that data has been deleted successfully (if needed). 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be authenticated as an app — either with a Connect JWT token for Connect apps, or with an OAuth 2.0 access token for Forge and OAuth 2.0 apps — that corresponds to the Provider app installed in Jira.  If the app does not define a security information provider module, or does not have the required scope, the request will be rejected with a 403.  Read [understanding jwt](https://developer.atlassian.com/blog/2015/01/understanding-jwt/) for more details about Connect JWT tokens. 
  Future<void> deleteVulnerabilitiesByProperty(String authorization, { Future<void>? abortTrigger, }) async {
    final response = await deleteVulnerabilitiesByPropertyWithHttpInfo(authorization, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Delete a Vulnerability by ID
  ///
  /// Delete the Vulnerability data currently stored for the given ID.  Deletion is performed asynchronously. The GET vulnerability endpoint can be used to confirm that data has been deleted successfully (if needed). 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be authenticated as an app — either with a Connect JWT token for Connect apps, or with an OAuth 2.0 access token for Forge and OAuth 2.0 apps — that corresponds to the Provider app installed in Jira.  If the app does not define a security information provider module, or does not have the required scope, the request will be rejected with a 403.  Read [Understanding JWT](https://developer.atlassian.com/blog/2015/01/understanding-jwt/) for more details about Connect JWT tokens. 
  ///
  /// * [String] vulnerabilityId (required):
  ///   The ID of the Vulnerability to delete. 
  Future<Response> deleteVulnerabilityByIdWithHttpInfo(String authorization, String vulnerabilityId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/security/1.0/vulnerability/{vulnerabilityId}'
      .replaceAll('{vulnerabilityId}', vulnerabilityId);

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

  /// Delete a Vulnerability by ID
  ///
  /// Delete the Vulnerability data currently stored for the given ID.  Deletion is performed asynchronously. The GET vulnerability endpoint can be used to confirm that data has been deleted successfully (if needed). 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be authenticated as an app — either with a Connect JWT token for Connect apps, or with an OAuth 2.0 access token for Forge and OAuth 2.0 apps — that corresponds to the Provider app installed in Jira.  If the app does not define a security information provider module, or does not have the required scope, the request will be rejected with a 403.  Read [Understanding JWT](https://developer.atlassian.com/blog/2015/01/understanding-jwt/) for more details about Connect JWT tokens. 
  ///
  /// * [String] vulnerabilityId (required):
  ///   The ID of the Vulnerability to delete. 
  Future<void> deleteVulnerabilityById(String authorization, String vulnerabilityId, { Future<void>? abortTrigger, }) async {
    final response = await deleteVulnerabilityByIdWithHttpInfo(authorization, vulnerabilityId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get a linked Security Workspace by ID
  ///
  /// Retrieve a specific Security Workspace linked to the Jira site for the given workspace ID.  The result will be what is currently stored, ignoring any pending updates or deletes. 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be authenticated as an app — either with a Connect JWT token for Connect apps, or with an OAuth 2.0 access token for Forge and OAuth 2.0 apps — that corresponds to the Provider app installed in Jira.  If the app does not define a security information provider module, or does not have the required scope, the request will be rejected with a 403.  Read [understanding jwt](https://developer.atlassian.com/blog/2015/01/understanding-jwt/) for more details about Connect JWT tokens. 
  ///
  /// * [String] workspaceId (required):
  ///   The ID of the workspace to fetch. 
  Future<Response> getLinkedWorkspaceByIdWithHttpInfo(String authorization, String workspaceId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/security/1.0/linkedWorkspaces/{workspaceId}'
      .replaceAll('{workspaceId}', workspaceId);

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

  /// Get a linked Security Workspace by ID
  ///
  /// Retrieve a specific Security Workspace linked to the Jira site for the given workspace ID.  The result will be what is currently stored, ignoring any pending updates or deletes. 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be authenticated as an app — either with a Connect JWT token for Connect apps, or with an OAuth 2.0 access token for Forge and OAuth 2.0 apps — that corresponds to the Provider app installed in Jira.  If the app does not define a security information provider module, or does not have the required scope, the request will be rejected with a 403.  Read [understanding jwt](https://developer.atlassian.com/blog/2015/01/understanding-jwt/) for more details about Connect JWT tokens. 
  ///
  /// * [String] workspaceId (required):
  ///   The ID of the workspace to fetch. 
  Future<SecurityWorkspaceResponse?> getLinkedWorkspaceById(String authorization, String workspaceId, { Future<void>? abortTrigger, }) async {
    final response = await getLinkedWorkspaceByIdWithHttpInfo(authorization, workspaceId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'SecurityWorkspaceResponse',) as SecurityWorkspaceResponse;
    
    }
    return null;
  }

  /// Get linked Security Workspaces
  ///
  /// Retrieve all Security Workspaces linked with the Jira site.  The result will be what is currently stored, ignoring any pending updates or deletes. 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be authenticated as an app — either with a Connect JWT token for Connect apps, or with an OAuth 2.0 access token for Forge and OAuth 2.0 apps — that corresponds to the Provider app installed in Jira.  If the app does not define a security information provider module, or does not have the required scope, the request will be rejected with a 403.  Read [understanding jwt](https://developer.atlassian.com/blog/2015/01/understanding-jwt/) for more details about Connect JWT tokens. 
  Future<Response> getLinkedWorkspacesWithHttpInfo(String authorization, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/security/1.0/linkedWorkspaces';

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

  /// Get linked Security Workspaces
  ///
  /// Retrieve all Security Workspaces linked with the Jira site.  The result will be what is currently stored, ignoring any pending updates or deletes. 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be authenticated as an app — either with a Connect JWT token for Connect apps, or with an OAuth 2.0 access token for Forge and OAuth 2.0 apps — that corresponds to the Provider app installed in Jira.  If the app does not define a security information provider module, or does not have the required scope, the request will be rejected with a 403.  Read [understanding jwt](https://developer.atlassian.com/blog/2015/01/understanding-jwt/) for more details about Connect JWT tokens. 
  Future<SecurityWorkspaceIds?> getLinkedWorkspaces(String authorization, { Future<void>? abortTrigger, }) async {
    final response = await getLinkedWorkspacesWithHttpInfo(authorization, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'SecurityWorkspaceIds',) as SecurityWorkspaceIds;
    
    }
    return null;
  }

  /// Get a Vulnerability by ID
  ///
  /// Retrieve the currently stored Vulnerability data for the given ID.  The result will be what is currently stored, ignoring any pending updates or deletes. 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be authenticated as an app — either with a Connect JWT token for Connect apps, or with an OAuth 2.0 access token for Forge and OAuth 2.0 apps — that corresponds to the Provider app installed in Jira.  If the app does not define a security information provider module, or does not have the required scope, the request will be rejected with a 403.  Read [Understanding JWT](https://developer.atlassian.com/blog/2015/01/understanding-jwt/) for more details about Connect JWT tokens. 
  ///
  /// * [String] vulnerabilityId (required):
  ///   The ID of the Vulnerability to fetch. 
  Future<Response> getVulnerabilityByIdWithHttpInfo(String authorization, String vulnerabilityId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/security/1.0/vulnerability/{vulnerabilityId}'
      .replaceAll('{vulnerabilityId}', vulnerabilityId);

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

  /// Get a Vulnerability by ID
  ///
  /// Retrieve the currently stored Vulnerability data for the given ID.  The result will be what is currently stored, ignoring any pending updates or deletes. 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be authenticated as an app — either with a Connect JWT token for Connect apps, or with an OAuth 2.0 access token for Forge and OAuth 2.0 apps — that corresponds to the Provider app installed in Jira.  If the app does not define a security information provider module, or does not have the required scope, the request will be rejected with a 403.  Read [Understanding JWT](https://developer.atlassian.com/blog/2015/01/understanding-jwt/) for more details about Connect JWT tokens. 
  ///
  /// * [String] vulnerabilityId (required):
  ///   The ID of the Vulnerability to fetch. 
  Future<VulnerabilityDetails?> getVulnerabilityById(String authorization, String vulnerabilityId, { Future<void>? abortTrigger, }) async {
    final response = await getVulnerabilityByIdWithHttpInfo(authorization, vulnerabilityId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'VulnerabilityDetails',) as VulnerabilityDetails;
    
    }
    return null;
  }

  /// Submit Vulnerability data
  ///
  /// Update / Insert Vulnerability data.  Vulnerabilities are identified by their ID, any existing Vulnerability data with the same ID will be replaced if it exists and the updateSequenceNumber of the existing data is less than the incoming data.  Submissions are performed asynchronously. Most updates are available within a short period of time but may take some time during peak load and/or maintenance times. The GET vulnerability endpoint can be used to confirm that data has been stored successfully (if needed).  In the case of multiple Vulnerabilities being submitted in one request, each is validated individually prior to submission. Details of Vulnerabilities that failed submission (if any) are available in the response object.  A maximum of 1000 vulnerabilities can be submitted in one request. 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be authenticated as an app — either with a Connect JWT token for Connect apps, or with an OAuth 2.0 access token for Forge and OAuth 2.0 apps — that corresponds to the Provider app installed in Jira.  If the app does not define a security information provider module, or does not have the required scope, the request will be rejected with a 403.  Read [understanding jwt](https://developer.atlassian.com/blog/2015/01/understanding-jwt/) for more details about Connect JWT tokens. 
  ///
  /// * [SubmitVulnerabilitiesRequest] submitVulnerabilitiesRequest (required):
  ///   Vulnerability data to submit. 
  Future<Response> submitVulnerabilitiesWithHttpInfo(String authorization, SubmitVulnerabilitiesRequest submitVulnerabilitiesRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/security/1.0/bulk';

    // ignore: prefer_final_locals
    Object? postBody = submitVulnerabilitiesRequest;

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

  /// Submit Vulnerability data
  ///
  /// Update / Insert Vulnerability data.  Vulnerabilities are identified by their ID, any existing Vulnerability data with the same ID will be replaced if it exists and the updateSequenceNumber of the existing data is less than the incoming data.  Submissions are performed asynchronously. Most updates are available within a short period of time but may take some time during peak load and/or maintenance times. The GET vulnerability endpoint can be used to confirm that data has been stored successfully (if needed).  In the case of multiple Vulnerabilities being submitted in one request, each is validated individually prior to submission. Details of Vulnerabilities that failed submission (if any) are available in the response object.  A maximum of 1000 vulnerabilities can be submitted in one request. 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be authenticated as an app — either with a Connect JWT token for Connect apps, or with an OAuth 2.0 access token for Forge and OAuth 2.0 apps — that corresponds to the Provider app installed in Jira.  If the app does not define a security information provider module, or does not have the required scope, the request will be rejected with a 403.  Read [understanding jwt](https://developer.atlassian.com/blog/2015/01/understanding-jwt/) for more details about Connect JWT tokens. 
  ///
  /// * [SubmitVulnerabilitiesRequest] submitVulnerabilitiesRequest (required):
  ///   Vulnerability data to submit. 
  Future<SubmitVulnerabilitiesResponse?> submitVulnerabilities(String authorization, SubmitVulnerabilitiesRequest submitVulnerabilitiesRequest, { Future<void>? abortTrigger, }) async {
    final response = await submitVulnerabilitiesWithHttpInfo(authorization, submitVulnerabilitiesRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'SubmitVulnerabilitiesResponse',) as SubmitVulnerabilitiesResponse;
    
    }
    return null;
  }

  /// Submit Security Workspaces to link
  ///
  /// Insert Security Workspace IDs to establish a relationship between them and the Jira site the app is installed on. If a relationship between the workspace ID and Jira already exists then the workspace ID will be ignored and Jira will process the rest of the entries. 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be authenticated as an app — either with a Connect JWT token for Connect apps, or with an OAuth 2.0 access token for Forge and OAuth 2.0 apps — that corresponds to the Provider app installed in Jira.  If the app does not define a security information provider module, or does not have the required scope, the request will be rejected with a 403.  Read [understanding jwt](https://developer.atlassian.com/blog/2015/01/understanding-jwt/) for more details about Connect JWT tokens. 
  ///
  /// * [SubmitSecurityWorkspacesRequest] submitSecurityWorkspacesRequest (required):
  ///   Security Workspace IDs to submit. 
  Future<Response> submitWorkspacesWithHttpInfo(String authorization, SubmitSecurityWorkspacesRequest submitSecurityWorkspacesRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/security/1.0/linkedWorkspaces/bulk';

    // ignore: prefer_final_locals
    Object? postBody = submitSecurityWorkspacesRequest;

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

  /// Submit Security Workspaces to link
  ///
  /// Insert Security Workspace IDs to establish a relationship between them and the Jira site the app is installed on. If a relationship between the workspace ID and Jira already exists then the workspace ID will be ignored and Jira will process the rest of the entries. 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be authenticated as an app — either with a Connect JWT token for Connect apps, or with an OAuth 2.0 access token for Forge and OAuth 2.0 apps — that corresponds to the Provider app installed in Jira.  If the app does not define a security information provider module, or does not have the required scope, the request will be rejected with a 403.  Read [understanding jwt](https://developer.atlassian.com/blog/2015/01/understanding-jwt/) for more details about Connect JWT tokens. 
  ///
  /// * [SubmitSecurityWorkspacesRequest] submitSecurityWorkspacesRequest (required):
  ///   Security Workspace IDs to submit. 
  Future<void> submitWorkspaces(String authorization, SubmitSecurityWorkspacesRequest submitSecurityWorkspacesRequest, { Future<void>? abortTrigger, }) async {
    final response = await submitWorkspacesWithHttpInfo(authorization, submitSecurityWorkspacesRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
