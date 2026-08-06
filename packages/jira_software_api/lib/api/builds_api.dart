//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class BuildsApi {
  BuildsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Delete a build by key
  ///
  /// Delete the build data currently stored for the given `pipelineId` and `buildNumber` combination.  Deletion is performed asynchronously. The `getBuildByKey` operation can be used to confirm that data has been deleted successfully (if needed). 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with either a Connect JWT token or OAuth token for an on-premise integration that corresponds to an app installed in Jira.  If the Connect JWT token corresponds to an app that does not define `jiraBuildInfoProvider` module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details about Connect JWT tokens. See https://developer.atlassian.com/cloud/jira/software/integrate-jsw-cloud-with-onpremises-tools/ for details about on-premise integrations. 
  ///
  /// * [String] pipelineId (required):
  ///   The `pipelineId` of the build to delete. 
  ///
  /// * [int] buildNumber (required):
  ///   The `buildNumber` of the build to delete. 
  ///
  /// * [int] updateSequenceNumber:
  ///   This parameter usage is no longer supported.  An optional `_updateSequenceNumber` to use to control deletion.  Only stored data with an `updateSequenceNumber` less than or equal to that provided will be deleted. This can be used help ensure submit/delete requests are applied correctly if issued close together. 
  Future<Response> deleteBuildByKeyWithHttpInfo(String authorization, String pipelineId, int buildNumber, { int? updateSequenceNumber, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/builds/0.1/pipelines/{pipelineId}/builds/{buildNumber}'
      .replaceAll('{pipelineId}', pipelineId)
      .replaceAll('{buildNumber}', buildNumber.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (updateSequenceNumber != null) {
      queryParams.addAll(_queryParams('', '_updateSequenceNumber', updateSequenceNumber));
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

  /// Delete a build by key
  ///
  /// Delete the build data currently stored for the given `pipelineId` and `buildNumber` combination.  Deletion is performed asynchronously. The `getBuildByKey` operation can be used to confirm that data has been deleted successfully (if needed). 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with either a Connect JWT token or OAuth token for an on-premise integration that corresponds to an app installed in Jira.  If the Connect JWT token corresponds to an app that does not define `jiraBuildInfoProvider` module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details about Connect JWT tokens. See https://developer.atlassian.com/cloud/jira/software/integrate-jsw-cloud-with-onpremises-tools/ for details about on-premise integrations. 
  ///
  /// * [String] pipelineId (required):
  ///   The `pipelineId` of the build to delete. 
  ///
  /// * [int] buildNumber (required):
  ///   The `buildNumber` of the build to delete. 
  ///
  /// * [int] updateSequenceNumber:
  ///   This parameter usage is no longer supported.  An optional `_updateSequenceNumber` to use to control deletion.  Only stored data with an `updateSequenceNumber` less than or equal to that provided will be deleted. This can be used help ensure submit/delete requests are applied correctly if issued close together. 
  Future<void> deleteBuildByKey(String authorization, String pipelineId, int buildNumber, { int? updateSequenceNumber, Future<void>? abortTrigger, }) async {
    final response = await deleteBuildByKeyWithHttpInfo(authorization, pipelineId, buildNumber, updateSequenceNumber: updateSequenceNumber, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Delete builds by Property
  ///
  /// Bulk delete all builds data that match the given request.  One or more query params must be supplied to specify Properties to delete by. Optional param `_updateSequenceNumber` is no longer supported. If more than one Property is provided, data will be deleted that matches ALL of the Properties (e.g. treated as an AND).  See the documentation for the `submitBuilds` operation for more details.  e.g. DELETE /bulkByProperties?accountId=account-123&repoId=repo-345  Deletion is performed asynchronously. The `getBuildByKey` operation can be used to confirm that data has been deleted successfully (if needed). 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with either a Connect JWT token or OAuth token for an on-premise integration that corresponds to an app installed in Jira.  If the Connect JWT token corresponds to an app that does not define `jiraBuildInfoProvider` module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details about Connect JWT tokens. See https://developer.atlassian.com/cloud/jira/software/integrate-jsw-cloud-with-onpremises-tools/ for details about on-premise integrations. 
  ///
  /// * [int] updateSequenceNumber:
  ///   This parameter usage is no longer supported.  An optional `_updateSequenceNumber` to use to control deletion.  Only stored data with an `updateSequenceNumber` less than or equal to that provided will be deleted. This can be used help ensure submit/delete requests are applied correctly if issued close together.  If not provided, all stored data that matches the request will be deleted. 
  Future<Response> deleteBuildsByPropertyWithHttpInfo(String authorization, { int? updateSequenceNumber, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/builds/0.1/bulkByProperties';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (updateSequenceNumber != null) {
      queryParams.addAll(_queryParams('', '_updateSequenceNumber', updateSequenceNumber));
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

  /// Delete builds by Property
  ///
  /// Bulk delete all builds data that match the given request.  One or more query params must be supplied to specify Properties to delete by. Optional param `_updateSequenceNumber` is no longer supported. If more than one Property is provided, data will be deleted that matches ALL of the Properties (e.g. treated as an AND).  See the documentation for the `submitBuilds` operation for more details.  e.g. DELETE /bulkByProperties?accountId=account-123&repoId=repo-345  Deletion is performed asynchronously. The `getBuildByKey` operation can be used to confirm that data has been deleted successfully (if needed). 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with either a Connect JWT token or OAuth token for an on-premise integration that corresponds to an app installed in Jira.  If the Connect JWT token corresponds to an app that does not define `jiraBuildInfoProvider` module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details about Connect JWT tokens. See https://developer.atlassian.com/cloud/jira/software/integrate-jsw-cloud-with-onpremises-tools/ for details about on-premise integrations. 
  ///
  /// * [int] updateSequenceNumber:
  ///   This parameter usage is no longer supported.  An optional `_updateSequenceNumber` to use to control deletion.  Only stored data with an `updateSequenceNumber` less than or equal to that provided will be deleted. This can be used help ensure submit/delete requests are applied correctly if issued close together.  If not provided, all stored data that matches the request will be deleted. 
  Future<void> deleteBuildsByProperty(String authorization, { int? updateSequenceNumber, Future<void>? abortTrigger, }) async {
    final response = await deleteBuildsByPropertyWithHttpInfo(authorization, updateSequenceNumber: updateSequenceNumber, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get a build by key
  ///
  /// Retrieve the currently stored build data for the given `pipelineId` and `buildNumber` combination.  The result will be what is currently stored, ignoring any pending updates or deletes. 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with either a Connect JWT token or OAuth token for an on-premise integration that corresponds to an app installed in Jira.  If the Connect JWT token corresponds to an app that does not define `jiraBuildInfoProvider` module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details about Connect JWT tokens. See https://developer.atlassian.com/cloud/jira/software/integrate-jsw-cloud-with-onpremises-tools/ for details about on-premise integrations. 
  ///
  /// * [String] pipelineId (required):
  ///   The `pipelineId` of the build. 
  ///
  /// * [int] buildNumber (required):
  ///   The `buildNumber` of the build. 
  Future<Response> getBuildByKeyWithHttpInfo(String authorization, String pipelineId, int buildNumber, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/builds/0.1/pipelines/{pipelineId}/builds/{buildNumber}'
      .replaceAll('{pipelineId}', pipelineId)
      .replaceAll('{buildNumber}', buildNumber.toString());

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

  /// Get a build by key
  ///
  /// Retrieve the currently stored build data for the given `pipelineId` and `buildNumber` combination.  The result will be what is currently stored, ignoring any pending updates or deletes. 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with either a Connect JWT token or OAuth token for an on-premise integration that corresponds to an app installed in Jira.  If the Connect JWT token corresponds to an app that does not define `jiraBuildInfoProvider` module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details about Connect JWT tokens. See https://developer.atlassian.com/cloud/jira/software/integrate-jsw-cloud-with-onpremises-tools/ for details about on-premise integrations. 
  ///
  /// * [String] pipelineId (required):
  ///   The `pipelineId` of the build. 
  ///
  /// * [int] buildNumber (required):
  ///   The `buildNumber` of the build. 
  Future<BuildData?> getBuildByKey(String authorization, String pipelineId, int buildNumber, { Future<void>? abortTrigger, }) async {
    final response = await getBuildByKeyWithHttpInfo(authorization, pipelineId, buildNumber, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'BuildData',) as BuildData;
    
    }
    return null;
  }

  /// Submit build data
  ///
  /// Update / insert builds data.  Builds are identified by the combination of `pipelineId` and `buildNumber`, and existing build data for the same build will be replaced if it exists and the `updateSequenceNumber` of the existing data is less than the incoming data.  Submissions are performed asynchronously. Submitted data will eventually be available in Jira; most updates are available within a short period of time, but may take some time during peak load and/or maintenance times. The `getBuildByKey` operation can be used to confirm that data has been stored successfully (if needed).  In the case of multiple builds being submitted in one request, each is validated individually prior to submission. Details of which build failed submission (if any) are available in the response object. 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with either a Connect JWT token or OAuth token for an on-premise integration that corresponds to an app installed in Jira.  If the Connect JWT token corresponds to an app that does not define `jiraBuildInfoProvider` module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details about Connect JWT tokens. See https://developer.atlassian.com/cloud/jira/software/integrate-jsw-cloud-with-onpremises-tools/ for details about on-premise integrations. 
  ///
  /// * [SubmitBuildsRequest] submitBuildsRequest (required):
  ///   Builds data to submit. 
  Future<Response> submitBuildsWithHttpInfo(String authorization, SubmitBuildsRequest submitBuildsRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/builds/0.1/bulk';

    // ignore: prefer_final_locals
    Object? postBody = submitBuildsRequest;

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

  /// Submit build data
  ///
  /// Update / insert builds data.  Builds are identified by the combination of `pipelineId` and `buildNumber`, and existing build data for the same build will be replaced if it exists and the `updateSequenceNumber` of the existing data is less than the incoming data.  Submissions are performed asynchronously. Submitted data will eventually be available in Jira; most updates are available within a short period of time, but may take some time during peak load and/or maintenance times. The `getBuildByKey` operation can be used to confirm that data has been stored successfully (if needed).  In the case of multiple builds being submitted in one request, each is validated individually prior to submission. Details of which build failed submission (if any) are available in the response object. 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with either a Connect JWT token or OAuth token for an on-premise integration that corresponds to an app installed in Jira.  If the Connect JWT token corresponds to an app that does not define `jiraBuildInfoProvider` module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details about Connect JWT tokens. See https://developer.atlassian.com/cloud/jira/software/integrate-jsw-cloud-with-onpremises-tools/ for details about on-premise integrations. 
  ///
  /// * [SubmitBuildsRequest] submitBuildsRequest (required):
  ///   Builds data to submit. 
  Future<SubmitBuildsResponse?> submitBuilds(String authorization, SubmitBuildsRequest submitBuildsRequest, { Future<void>? abortTrigger, }) async {
    final response = await submitBuildsWithHttpInfo(authorization, submitBuildsRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'SubmitBuildsResponse',) as SubmitBuildsResponse;
    
    }
    return null;
  }
}
