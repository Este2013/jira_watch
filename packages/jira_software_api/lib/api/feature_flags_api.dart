//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class FeatureFlagsApi {
  FeatureFlagsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Delete a Feature Flag by ID
  ///
  /// Delete the Feature Flag data currently stored for the given ID.  Deletion is performed asynchronously. The getFeatureFlagById operation can be used to confirm that data has been deleted successfully (if needed). 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with a Connect JWT token that corresponds to the Provider app installed in Jira.  If the JWT token corresponds to an app that does not define Feature Flags module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details. 
  ///
  /// * [String] featureFlagId (required):
  ///   The ID of the Feature Flag to delete. 
  ///
  /// * [int] updateSequenceId:
  ///   This parameter usage is no longer supported.  An optional `_updateSequenceId` to use to control deletion.  Only stored data with an `updateSequenceId` less than or equal to that provided will be deleted. This can be used help ensure submit/delete requests are applied correctly if issued close together. 
  Future<Response> deleteFeatureFlagByIdWithHttpInfo(String authorization, String featureFlagId, { int? updateSequenceId, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/featureflags/0.1/flag/{featureFlagId}'
      .replaceAll('{featureFlagId}', featureFlagId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (updateSequenceId != null) {
      queryParams.addAll(_queryParams('', '_updateSequenceId', updateSequenceId));
    }

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

  /// Delete a Feature Flag by ID
  ///
  /// Delete the Feature Flag data currently stored for the given ID.  Deletion is performed asynchronously. The getFeatureFlagById operation can be used to confirm that data has been deleted successfully (if needed). 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with a Connect JWT token that corresponds to the Provider app installed in Jira.  If the JWT token corresponds to an app that does not define Feature Flags module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details. 
  ///
  /// * [String] featureFlagId (required):
  ///   The ID of the Feature Flag to delete. 
  ///
  /// * [int] updateSequenceId:
  ///   This parameter usage is no longer supported.  An optional `_updateSequenceId` to use to control deletion.  Only stored data with an `updateSequenceId` less than or equal to that provided will be deleted. This can be used help ensure submit/delete requests are applied correctly if issued close together. 
  Future<void> deleteFeatureFlagById(String authorization, String featureFlagId, { int? updateSequenceId, Future<void>? abortTrigger, }) async {
    final response = await deleteFeatureFlagByIdWithHttpInfo(authorization, featureFlagId, updateSequenceId: updateSequenceId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Delete Feature Flags by Property
  ///
  /// Bulk delete all Feature Flags that match the given request.  One or more query params must be supplied to specify Properties to delete by. Optional param `_updateSequenceId` is no longer supported. If more than one Property is provided, data will be deleted that matches ALL of the Properties (e.g. treated as an AND). See the documentation for the submitFeatureFlags operation for more details.  e.g. DELETE /bulkByProperties?accountId=account-123&createdBy=user-456  Deletion is performed asynchronously. The getFeatureFlagById operation can be used to confirm that data has been deleted successfully (if needed). 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with a Connect JWT token that corresponds to the Provider app installed in Jira.  If the JWT token corresponds to an app that does not define Feature Flags module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details. 
  ///
  /// * [int] updateSequenceId:
  ///   This parameter usage is no longer supported.  An optional `_updateSequenceId` to use to control deletion.  Only stored data with an `updateSequenceId` less than or equal to that provided will be deleted. This can be used help ensure submit/delete requests are applied correctly if issued close together.  If not provided, all stored data that matches the request will be deleted. 
  Future<Response> deleteFeatureFlagsByPropertyWithHttpInfo(String authorization, { int? updateSequenceId, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/featureflags/0.1/bulkByProperties';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (updateSequenceId != null) {
      queryParams.addAll(_queryParams('', '_updateSequenceId', updateSequenceId));
    }

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

  /// Delete Feature Flags by Property
  ///
  /// Bulk delete all Feature Flags that match the given request.  One or more query params must be supplied to specify Properties to delete by. Optional param `_updateSequenceId` is no longer supported. If more than one Property is provided, data will be deleted that matches ALL of the Properties (e.g. treated as an AND). See the documentation for the submitFeatureFlags operation for more details.  e.g. DELETE /bulkByProperties?accountId=account-123&createdBy=user-456  Deletion is performed asynchronously. The getFeatureFlagById operation can be used to confirm that data has been deleted successfully (if needed). 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with a Connect JWT token that corresponds to the Provider app installed in Jira.  If the JWT token corresponds to an app that does not define Feature Flags module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details. 
  ///
  /// * [int] updateSequenceId:
  ///   This parameter usage is no longer supported.  An optional `_updateSequenceId` to use to control deletion.  Only stored data with an `updateSequenceId` less than or equal to that provided will be deleted. This can be used help ensure submit/delete requests are applied correctly if issued close together.  If not provided, all stored data that matches the request will be deleted. 
  Future<void> deleteFeatureFlagsByProperty(String authorization, { int? updateSequenceId, Future<void>? abortTrigger, }) async {
    final response = await deleteFeatureFlagsByPropertyWithHttpInfo(authorization, updateSequenceId: updateSequenceId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get a Feature Flag by ID
  ///
  /// Retrieve the currently stored Feature Flag data for the given ID.  The result will be what is currently stored, ignoring any pending updates or deletes. 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with a Connect JWT token that corresponds to the Provider app installed in Jira.  If the JWT token corresponds to an app that does not define Feature Flags module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details. 
  ///
  /// * [String] featureFlagId (required):
  ///   The ID of the Feature Flag to fetch. 
  Future<Response> getFeatureFlagByIdWithHttpInfo(String authorization, String featureFlagId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/featureflags/0.1/flag/{featureFlagId}'
      .replaceAll('{featureFlagId}', featureFlagId);

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

  /// Get a Feature Flag by ID
  ///
  /// Retrieve the currently stored Feature Flag data for the given ID.  The result will be what is currently stored, ignoring any pending updates or deletes. 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with a Connect JWT token that corresponds to the Provider app installed in Jira.  If the JWT token corresponds to an app that does not define Feature Flags module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details. 
  ///
  /// * [String] featureFlagId (required):
  ///   The ID of the Feature Flag to fetch. 
  Future<FeatureFlagData?> getFeatureFlagById(String authorization, String featureFlagId, { Future<void>? abortTrigger, }) async {
    final response = await getFeatureFlagByIdWithHttpInfo(authorization, featureFlagId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'FeatureFlagData',) as FeatureFlagData;
    
    }
    return null;
  }

  /// Submit Feature Flag data
  ///
  /// Update / insert Feature Flag data.  Feature Flags are identified by their ID, and existing Feature Flag data for the same ID will be replaced if it exists and the updateSequenceId of existing data is less than the incoming data.  Submissions are performed asynchronously. Submitted data will eventually be available in Jira; most updates are available within a short period of time, but may take some time during peak load and/or maintenance times. The getFeatureFlagById operation can be used to confirm that data has been stored successfully (if needed).  In the case of multiple Feature Flags being submitted in one request, each is validated individually prior to submission. Details of which Feature Flags failed submission (if any) are available in the response object. 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with a Connect JWT token that corresponds to the Provider app installed in Jira.  If the JWT token corresponds to an app that does not define Feature Flags module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details. 
  ///
  /// * [SubmitFeatureFlagRequest] submitFeatureFlagRequest (required):
  ///   Feature Flag data to submit. 
  Future<Response> submitFeatureFlagsWithHttpInfo(String authorization, SubmitFeatureFlagRequest submitFeatureFlagRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/featureflags/0.1/bulk';

    // ignore: prefer_final_locals
    Object? postBody = submitFeatureFlagRequest;

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

  /// Submit Feature Flag data
  ///
  /// Update / insert Feature Flag data.  Feature Flags are identified by their ID, and existing Feature Flag data for the same ID will be replaced if it exists and the updateSequenceId of existing data is less than the incoming data.  Submissions are performed asynchronously. Submitted data will eventually be available in Jira; most updates are available within a short period of time, but may take some time during peak load and/or maintenance times. The getFeatureFlagById operation can be used to confirm that data has been stored successfully (if needed).  In the case of multiple Feature Flags being submitted in one request, each is validated individually prior to submission. Details of which Feature Flags failed submission (if any) are available in the response object. 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with a Connect JWT token that corresponds to the Provider app installed in Jira.  If the JWT token corresponds to an app that does not define Feature Flags module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details. 
  ///
  /// * [SubmitFeatureFlagRequest] submitFeatureFlagRequest (required):
  ///   Feature Flag data to submit. 
  Future<SubmitFeatureFlagsResponse?> submitFeatureFlags(String authorization, SubmitFeatureFlagRequest submitFeatureFlagRequest, { Future<void>? abortTrigger, }) async {
    final response = await submitFeatureFlagsWithHttpInfo(authorization, submitFeatureFlagRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'SubmitFeatureFlagsResponse',) as SubmitFeatureFlagsResponse;
    
    }
    return null;
  }
}
