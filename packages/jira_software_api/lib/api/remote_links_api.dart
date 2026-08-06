//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class RemoteLinksApi {
  RemoteLinksApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Delete a Remote Link by ID
  ///
  /// Delete the Remote Link data currently stored for the given ID.  Deletion is performed asynchronously. The `getRemoteLinkById` operation can be used to confirm that data has been deleted successfully (if needed). 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with either a Connect JWT token or OAuth token for an on-premise integration that corresponds to an app installed in Jira.  If the Connect JWT token corresponds to an app that does not define `jiraRemoteLinkInfoProvider` module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details about Connect JWT tokens. See https://developer.atlassian.com/cloud/jira/software/integrate-jsw-cloud-with-onpremises-tools/ for details about on-premise integrations. 
  ///
  /// * [String] remoteLinkId (required):
  ///   The ID of the Remote Link to fetch. 
  ///
  /// * [int] updateSequenceNumber:
  ///   This parameter usage is no longer supported.  An optional `_updateSequenceNumber` to use to control deletion.  Only stored data with an `updateSequenceNumber` less than or equal to that provided will be deleted. This can be used help ensure submit/delete requests are applied correctly if issued close together. 
  Future<Response> deleteRemoteLinkByIdWithHttpInfo(String authorization, String remoteLinkId, { int? updateSequenceNumber, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/remotelinks/1.0/remotelink/{remoteLinkId}'
      .replaceAll('{remoteLinkId}', remoteLinkId);

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

  /// Delete a Remote Link by ID
  ///
  /// Delete the Remote Link data currently stored for the given ID.  Deletion is performed asynchronously. The `getRemoteLinkById` operation can be used to confirm that data has been deleted successfully (if needed). 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with either a Connect JWT token or OAuth token for an on-premise integration that corresponds to an app installed in Jira.  If the Connect JWT token corresponds to an app that does not define `jiraRemoteLinkInfoProvider` module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details about Connect JWT tokens. See https://developer.atlassian.com/cloud/jira/software/integrate-jsw-cloud-with-onpremises-tools/ for details about on-premise integrations. 
  ///
  /// * [String] remoteLinkId (required):
  ///   The ID of the Remote Link to fetch. 
  ///
  /// * [int] updateSequenceNumber:
  ///   This parameter usage is no longer supported.  An optional `_updateSequenceNumber` to use to control deletion.  Only stored data with an `updateSequenceNumber` less than or equal to that provided will be deleted. This can be used help ensure submit/delete requests are applied correctly if issued close together. 
  Future<void> deleteRemoteLinkById(String authorization, String remoteLinkId, { int? updateSequenceNumber, Future<void>? abortTrigger, }) async {
    final response = await deleteRemoteLinkByIdWithHttpInfo(authorization, remoteLinkId, updateSequenceNumber: updateSequenceNumber, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Delete Remote Links by Property
  ///
  /// Bulk delete all Remote Links data that match the given request.  One or more query params must be supplied to specify Properties to delete by. Optional param `_updateSequenceNumber` is no longer supported. If more than one Property is provided, data will be deleted that matches ALL of the Properties (e.g. treated as an AND).  See the documentation for the `submitRemoteLinks` operation for more details.  e.g. DELETE /bulkByProperties?accountId=account-123&repoId=repo-345  Deletion is performed asynchronously. The `getRemoteLinkById` operation can be used to confirm that data has been deleted successfully (if needed). 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with either a Connect JWT token or OAuth token for an on-premise integration that corresponds to an app installed in Jira.  If the Connect JWT token corresponds to an app that does not define `jiraRemoteLinkInfoProvider` module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details about Connect JWT tokens. See https://developer.atlassian.com/cloud/jira/software/integrate-jsw-cloud-with-onpremises-tools/ for details about on-premise integrations. 
  ///
  /// * [int] updateSequenceNumber:
  ///   This parameter usage is no longer supported.  An optional `_updateSequenceNumber` to use to control deletion.  Only stored data with an `updateSequenceNumber` less than or equal to that provided will be deleted. This can be used help ensure submit/delete requests are applied correctly if issued close together.  If not provided, all stored data that matches the request will be deleted. 
  ///
  /// * [Object] params:
  ///   Free-form query parameters to specify which properties to delete by. Properties refer to the arbitrary information the provider tagged Remote Links with previously.  For example, if the provider previously tagged a remote link with accountId:   \"properties\": {     \"accountId\": \"account-123\"   }  And now they want to delete Remote Links in bulk by that specific accountId as follows: e.g. DELETE /bulkByProperties?accountId=account-123 
  Future<Response> deleteRemoteLinksByPropertyWithHttpInfo(String authorization, { int? updateSequenceNumber, Object? params, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/remotelinks/1.0/bulkByProperties';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (updateSequenceNumber != null) {
      queryParams.addAll(_queryParams('', '_updateSequenceNumber', updateSequenceNumber));
    }
    if (params != null) {
      queryParams.addAll(_queryParams('', 'params', params));
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

  /// Delete Remote Links by Property
  ///
  /// Bulk delete all Remote Links data that match the given request.  One or more query params must be supplied to specify Properties to delete by. Optional param `_updateSequenceNumber` is no longer supported. If more than one Property is provided, data will be deleted that matches ALL of the Properties (e.g. treated as an AND).  See the documentation for the `submitRemoteLinks` operation for more details.  e.g. DELETE /bulkByProperties?accountId=account-123&repoId=repo-345  Deletion is performed asynchronously. The `getRemoteLinkById` operation can be used to confirm that data has been deleted successfully (if needed). 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with either a Connect JWT token or OAuth token for an on-premise integration that corresponds to an app installed in Jira.  If the Connect JWT token corresponds to an app that does not define `jiraRemoteLinkInfoProvider` module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details about Connect JWT tokens. See https://developer.atlassian.com/cloud/jira/software/integrate-jsw-cloud-with-onpremises-tools/ for details about on-premise integrations. 
  ///
  /// * [int] updateSequenceNumber:
  ///   This parameter usage is no longer supported.  An optional `_updateSequenceNumber` to use to control deletion.  Only stored data with an `updateSequenceNumber` less than or equal to that provided will be deleted. This can be used help ensure submit/delete requests are applied correctly if issued close together.  If not provided, all stored data that matches the request will be deleted. 
  ///
  /// * [Object] params:
  ///   Free-form query parameters to specify which properties to delete by. Properties refer to the arbitrary information the provider tagged Remote Links with previously.  For example, if the provider previously tagged a remote link with accountId:   \"properties\": {     \"accountId\": \"account-123\"   }  And now they want to delete Remote Links in bulk by that specific accountId as follows: e.g. DELETE /bulkByProperties?accountId=account-123 
  Future<void> deleteRemoteLinksByProperty(String authorization, { int? updateSequenceNumber, Object? params, Future<void>? abortTrigger, }) async {
    final response = await deleteRemoteLinksByPropertyWithHttpInfo(authorization, updateSequenceNumber: updateSequenceNumber, params: params, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get a Remote Link by ID
  ///
  /// Retrieve the currently stored Remote Link data for the given ID.  The result will be what is currently stored, ignoring any pending updates or deletes. 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with either a Connect JWT token or OAuth token for an on-premise integration that corresponds to an app installed in Jira.  If the Connect JWT token corresponds to an app that does not define `jiraRemoteLinkInfoProvider` module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details about Connect JWT tokens. See https://developer.atlassian.com/cloud/jira/software/integrate-jsw-cloud-with-onpremises-tools/ for details about on-premise integrations. 
  ///
  /// * [String] remoteLinkId (required):
  ///   The ID of the Remote Link to fetch. 
  Future<Response> getRemoteLinkByIdWithHttpInfo(String authorization, String remoteLinkId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/remotelinks/1.0/remotelink/{remoteLinkId}'
      .replaceAll('{remoteLinkId}', remoteLinkId);

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

  /// Get a Remote Link by ID
  ///
  /// Retrieve the currently stored Remote Link data for the given ID.  The result will be what is currently stored, ignoring any pending updates or deletes. 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with either a Connect JWT token or OAuth token for an on-premise integration that corresponds to an app installed in Jira.  If the Connect JWT token corresponds to an app that does not define `jiraRemoteLinkInfoProvider` module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details about Connect JWT tokens. See https://developer.atlassian.com/cloud/jira/software/integrate-jsw-cloud-with-onpremises-tools/ for details about on-premise integrations. 
  ///
  /// * [String] remoteLinkId (required):
  ///   The ID of the Remote Link to fetch. 
  Future<RemoteLinkData?> getRemoteLinkById(String authorization, String remoteLinkId, { Future<void>? abortTrigger, }) async {
    final response = await getRemoteLinkByIdWithHttpInfo(authorization, remoteLinkId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'RemoteLinkData',) as RemoteLinkData;
    
    }
    return null;
  }

  /// Submit Remote Link data
  ///
  /// Update / insert Remote Link data.  Remote Links are identified by their ID, existing Remote Link data for the same ID will be replaced if it exists and the updateSequenceId of existing data is less than the incoming data.  Submissions are performed asynchronously. Submitted data will eventually be available in Jira; most updates are available within a short period of time, but may take some time during peak load and/or maintenance times. The `getRemoteLinkById` operation can be used to confirm that data has been stored successfully (if needed).  In the case of multiple Remote Links being submitted in one request, each is validated individually prior to submission. Details of which Remote LInk failed submission (if any) are available in the response object. 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with a Connect JWT token that corresponds to an app installed in Jira.  If the Connect JWT token corresponds to an app that does not define `jiraRemoteLinkInfoProvider` module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details about Connect JWT tokens. See https://developer.atlassian.com/cloud/jira/software/integrate-jsw-cloud-with-onpremises-tools/ for details about on-premise integrations. 
  ///
  /// * [SubmitRemoteLinksRequest] submitRemoteLinksRequest (required):
  ///   Remote Links data to submit. 
  Future<Response> submitRemoteLinksWithHttpInfo(String authorization, SubmitRemoteLinksRequest submitRemoteLinksRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/remotelinks/1.0/bulk';

    // ignore: prefer_final_locals
    Object? postBody = submitRemoteLinksRequest;

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

  /// Submit Remote Link data
  ///
  /// Update / insert Remote Link data.  Remote Links are identified by their ID, existing Remote Link data for the same ID will be replaced if it exists and the updateSequenceId of existing data is less than the incoming data.  Submissions are performed asynchronously. Submitted data will eventually be available in Jira; most updates are available within a short period of time, but may take some time during peak load and/or maintenance times. The `getRemoteLinkById` operation can be used to confirm that data has been stored successfully (if needed).  In the case of multiple Remote Links being submitted in one request, each is validated individually prior to submission. Details of which Remote LInk failed submission (if any) are available in the response object. 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with a Connect JWT token that corresponds to an app installed in Jira.  If the Connect JWT token corresponds to an app that does not define `jiraRemoteLinkInfoProvider` module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details about Connect JWT tokens. See https://developer.atlassian.com/cloud/jira/software/integrate-jsw-cloud-with-onpremises-tools/ for details about on-premise integrations. 
  ///
  /// * [SubmitRemoteLinksRequest] submitRemoteLinksRequest (required):
  ///   Remote Links data to submit. 
  Future<SubmitRemoteLinks202Response?> submitRemoteLinks(String authorization, SubmitRemoteLinksRequest submitRemoteLinksRequest, { Future<void>? abortTrigger, }) async {
    final response = await submitRemoteLinksWithHttpInfo(authorization, submitRemoteLinksRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'SubmitRemoteLinks202Response',) as SubmitRemoteLinks202Response;
    
    }
    return null;
  }
}
