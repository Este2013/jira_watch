//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class DeploymentsApi {
  DeploymentsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Delete a deployment by key
  ///
  /// Delete the currently stored deployment data for the given `pipelineId`, `environmentId` and `deploymentSequenceNumber` combination.  Deletion is performed asynchronously. The `getDeploymentByKey` operation can be used to confirm that data has been deleted successfully (if needed). 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with either a Connect JWT token or OAuth token for an on-premise integration that corresponds to an app installed in Jira.  If the Connect JWT token corresponds to an app that does not define `jiraDeploymentInfoProvider` module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details about Connect JWT tokens. See https://developer.atlassian.com/cloud/jira/software/integrate-jsw-cloud-with-onpremises-tools/ for details about on-premise integrations. 
  ///
  /// * [String] pipelineId (required):
  ///   The ID of the deployment's pipeline. 
  ///
  /// * [String] environmentId (required):
  ///   The ID of the deployment's environment. 
  ///
  /// * [int] deploymentSequenceNumber (required):
  ///   The deployment's deploymentSequenceNumber. 
  ///
  /// * [int] updateSequenceNumber:
  ///   This parameter usage is no longer supported.  An optional `_updateSequenceNumber` to use to control deletion.  Only stored data with an `updateSequenceNumber` less than or equal to that provided will be deleted. This can be used help ensure submit/delete requests are applied correctly if issued close together. 
  Future<Response> deleteDeploymentByKeyWithHttpInfo(String authorization, String pipelineId, String environmentId, int deploymentSequenceNumber, { int? updateSequenceNumber, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/deployments/0.1/pipelines/{pipelineId}/environments/{environmentId}/deployments/{deploymentSequenceNumber}'
      .replaceAll('{pipelineId}', pipelineId)
      .replaceAll('{environmentId}', environmentId)
      .replaceAll('{deploymentSequenceNumber}', deploymentSequenceNumber.toString());

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

  /// Delete a deployment by key
  ///
  /// Delete the currently stored deployment data for the given `pipelineId`, `environmentId` and `deploymentSequenceNumber` combination.  Deletion is performed asynchronously. The `getDeploymentByKey` operation can be used to confirm that data has been deleted successfully (if needed). 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with either a Connect JWT token or OAuth token for an on-premise integration that corresponds to an app installed in Jira.  If the Connect JWT token corresponds to an app that does not define `jiraDeploymentInfoProvider` module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details about Connect JWT tokens. See https://developer.atlassian.com/cloud/jira/software/integrate-jsw-cloud-with-onpremises-tools/ for details about on-premise integrations. 
  ///
  /// * [String] pipelineId (required):
  ///   The ID of the deployment's pipeline. 
  ///
  /// * [String] environmentId (required):
  ///   The ID of the deployment's environment. 
  ///
  /// * [int] deploymentSequenceNumber (required):
  ///   The deployment's deploymentSequenceNumber. 
  ///
  /// * [int] updateSequenceNumber:
  ///   This parameter usage is no longer supported.  An optional `_updateSequenceNumber` to use to control deletion.  Only stored data with an `updateSequenceNumber` less than or equal to that provided will be deleted. This can be used help ensure submit/delete requests are applied correctly if issued close together. 
  Future<void> deleteDeploymentByKey(String authorization, String pipelineId, String environmentId, int deploymentSequenceNumber, { int? updateSequenceNumber, Future<void>? abortTrigger, }) async {
    final response = await deleteDeploymentByKeyWithHttpInfo(authorization, pipelineId, environmentId, deploymentSequenceNumber, updateSequenceNumber: updateSequenceNumber, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Delete deployments by Property
  ///
  /// Bulk delete all deployments that match the given request.  One or more query params must be supplied to specify the Properties to delete by. Optional param `_updateSequenceNumber` is no longer supported. If more than one Property is provided, data will be deleted that matches ALL of the Properties (i.e. treated as AND). See the documentation for the `submitDeployments` operation for more details.  Example operation: DELETE /bulkByProperties?accountId=account-123&createdBy=user-456  Deletion is performed asynchronously. The `getDeploymentByKey` operation can be used to confirm that data has been deleted successfully (if needed). 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with either a Connect JWT token or OAuth token for an on-premise integration that corresponds to an app installed in Jira.  If the Connect JWT token corresponds to an app that does not define `jiraDeploymentInfoProvider` module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details about Connect JWT tokens. See https://developer.atlassian.com/cloud/jira/software/integrate-jsw-cloud-with-onpremises-tools/ for details about on-premise integrations. 
  ///
  /// * [int] updateSequenceNumber:
  ///   This parameter usage is no longer supported.  An optional `updateSequenceNumber` to use to control deletion.  Only stored data with an `updateSequenceNumber` less than or equal to that provided will be deleted. This can be used help ensure submit/delete requests are applied correctly if issued close together.  If not provided, all stored data that matches the request will be deleted. 
  Future<Response> deleteDeploymentsByPropertyWithHttpInfo(String authorization, { int? updateSequenceNumber, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/deployments/0.1/bulkByProperties';

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

  /// Delete deployments by Property
  ///
  /// Bulk delete all deployments that match the given request.  One or more query params must be supplied to specify the Properties to delete by. Optional param `_updateSequenceNumber` is no longer supported. If more than one Property is provided, data will be deleted that matches ALL of the Properties (i.e. treated as AND). See the documentation for the `submitDeployments` operation for more details.  Example operation: DELETE /bulkByProperties?accountId=account-123&createdBy=user-456  Deletion is performed asynchronously. The `getDeploymentByKey` operation can be used to confirm that data has been deleted successfully (if needed). 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with either a Connect JWT token or OAuth token for an on-premise integration that corresponds to an app installed in Jira.  If the Connect JWT token corresponds to an app that does not define `jiraDeploymentInfoProvider` module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details about Connect JWT tokens. See https://developer.atlassian.com/cloud/jira/software/integrate-jsw-cloud-with-onpremises-tools/ for details about on-premise integrations. 
  ///
  /// * [int] updateSequenceNumber:
  ///   This parameter usage is no longer supported.  An optional `updateSequenceNumber` to use to control deletion.  Only stored data with an `updateSequenceNumber` less than or equal to that provided will be deleted. This can be used help ensure submit/delete requests are applied correctly if issued close together.  If not provided, all stored data that matches the request will be deleted. 
  Future<void> deleteDeploymentsByProperty(String authorization, { int? updateSequenceNumber, Future<void>? abortTrigger, }) async {
    final response = await deleteDeploymentsByPropertyWithHttpInfo(authorization, updateSequenceNumber: updateSequenceNumber, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get a deployment by key
  ///
  /// Retrieve the currently stored deployment data for the given `pipelineId`, `environmentId` and `deploymentSequenceNumber` combination.  The result will be what is currently stored, ignoring any pending updates or deletes. 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with either a Connect JWT token or OAuth token for an on-premise integration that corresponds to an app installed in Jira.  If the Connect JWT token corresponds to an app that does not define `jiraDeploymentInfoProvider` module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details about Connect JWT tokens. See https://developer.atlassian.com/cloud/jira/software/integrate-jsw-cloud-with-onpremises-tools/ for details about on-premise integrations. 
  ///
  /// * [String] pipelineId (required):
  ///   The ID of the deployment's pipeline. 
  ///
  /// * [String] environmentId (required):
  ///   The ID of the deployment's environment. 
  ///
  /// * [int] deploymentSequenceNumber (required):
  ///   The deployment's deploymentSequenceNumber. 
  Future<Response> getDeploymentByKeyWithHttpInfo(String authorization, String pipelineId, String environmentId, int deploymentSequenceNumber, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/deployments/0.1/pipelines/{pipelineId}/environments/{environmentId}/deployments/{deploymentSequenceNumber}'
      .replaceAll('{pipelineId}', pipelineId)
      .replaceAll('{environmentId}', environmentId)
      .replaceAll('{deploymentSequenceNumber}', deploymentSequenceNumber.toString());

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

  /// Get a deployment by key
  ///
  /// Retrieve the currently stored deployment data for the given `pipelineId`, `environmentId` and `deploymentSequenceNumber` combination.  The result will be what is currently stored, ignoring any pending updates or deletes. 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with either a Connect JWT token or OAuth token for an on-premise integration that corresponds to an app installed in Jira.  If the Connect JWT token corresponds to an app that does not define `jiraDeploymentInfoProvider` module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details about Connect JWT tokens. See https://developer.atlassian.com/cloud/jira/software/integrate-jsw-cloud-with-onpremises-tools/ for details about on-premise integrations. 
  ///
  /// * [String] pipelineId (required):
  ///   The ID of the deployment's pipeline. 
  ///
  /// * [String] environmentId (required):
  ///   The ID of the deployment's environment. 
  ///
  /// * [int] deploymentSequenceNumber (required):
  ///   The deployment's deploymentSequenceNumber. 
  Future<DeploymentData?> getDeploymentByKey(String authorization, String pipelineId, String environmentId, int deploymentSequenceNumber, { Future<void>? abortTrigger, }) async {
    final response = await getDeploymentByKeyWithHttpInfo(authorization, pipelineId, environmentId, deploymentSequenceNumber, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'DeploymentData',) as DeploymentData;
    
    }
    return null;
  }

  /// Get deployment gating status by key
  ///
  /// Retrieve the  Deployment gating status for the given `pipelineId + environmentId + deploymentSequenceNumber` combination. Only apps that define the `jiraDeploymentInfoProvider` module can access this resource. This resource requires the 'READ' scope. 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] pipelineId (required):
  ///   The ID of the Deployment's pipeline. 
  ///
  /// * [String] environmentId (required):
  ///   The ID of the Deployment's environment. 
  ///
  /// * [int] deploymentSequenceNumber (required):
  ///   The Deployment's deploymentSequenceNumber. 
  Future<Response> getDeploymentGatingStatusByKeyWithHttpInfo(String pipelineId, String environmentId, int deploymentSequenceNumber, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/deployments/0.1/pipelines/{pipelineId}/environments/{environmentId}/deployments/{deploymentSequenceNumber}/gating-status'
      .replaceAll('{pipelineId}', pipelineId)
      .replaceAll('{environmentId}', environmentId)
      .replaceAll('{deploymentSequenceNumber}', deploymentSequenceNumber.toString());

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

  /// Get deployment gating status by key
  ///
  /// Retrieve the  Deployment gating status for the given `pipelineId + environmentId + deploymentSequenceNumber` combination. Only apps that define the `jiraDeploymentInfoProvider` module can access this resource. This resource requires the 'READ' scope. 
  ///
  /// Parameters:
  ///
  /// * [String] pipelineId (required):
  ///   The ID of the Deployment's pipeline. 
  ///
  /// * [String] environmentId (required):
  ///   The ID of the Deployment's environment. 
  ///
  /// * [int] deploymentSequenceNumber (required):
  ///   The Deployment's deploymentSequenceNumber. 
  Future<SubmitDeploymentsResponse1?> getDeploymentGatingStatusByKey(String pipelineId, String environmentId, int deploymentSequenceNumber, { Future<void>? abortTrigger, }) async {
    final response = await getDeploymentGatingStatusByKeyWithHttpInfo(pipelineId, environmentId, deploymentSequenceNumber, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'SubmitDeploymentsResponse1',) as SubmitDeploymentsResponse1;
    
    }
    return null;
  }

  /// Submit deployment data
  ///
  /// Update / insert deployment data.  Deployments are identified by the combination of `pipelineId`, `environmentId` and `deploymentSequenceNumber`, and existing deployment data for the same deployment will be replaced if it exists and the `updateSequenceNumber` of existing data is less than the incoming data.  Submissions are processed asynchronously. Submitted data will eventually be available in Jira. Most updates are available within a short period of time, but may take some time during peak load and/or maintenance times. The `getDeploymentByKey` operation can be used to confirm that data has been stored successfully (if needed).  In the case of multiple deployments being submitted in one request, each is validated individually prior to submission. Details of which deployments failed submission (if any) are available in the response object. 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with either a Connect JWT token or OAuth token for an on-premise integration that corresponds to an app installed in Jira.  If the Connect JWT token corresponds to an app that does not define `jiraDeploymentInfoProvider` module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details about Connect JWT tokens. See https://developer.atlassian.com/cloud/jira/software/integrate-jsw-cloud-with-onpremises-tools/ for details about on-premise integrations. 
  ///
  /// * [SubmitDeploymentRequest] submitDeploymentRequest (required):
  ///   Deployment data to submit. 
  Future<Response> submitDeploymentsWithHttpInfo(String authorization, SubmitDeploymentRequest submitDeploymentRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/deployments/0.1/bulk';

    // ignore: prefer_final_locals
    Object? postBody = submitDeploymentRequest;

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

  /// Submit deployment data
  ///
  /// Update / insert deployment data.  Deployments are identified by the combination of `pipelineId`, `environmentId` and `deploymentSequenceNumber`, and existing deployment data for the same deployment will be replaced if it exists and the `updateSequenceNumber` of existing data is less than the incoming data.  Submissions are processed asynchronously. Submitted data will eventually be available in Jira. Most updates are available within a short period of time, but may take some time during peak load and/or maintenance times. The `getDeploymentByKey` operation can be used to confirm that data has been stored successfully (if needed).  In the case of multiple deployments being submitted in one request, each is validated individually prior to submission. Details of which deployments failed submission (if any) are available in the response object. 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with either a Connect JWT token or OAuth token for an on-premise integration that corresponds to an app installed in Jira.  If the Connect JWT token corresponds to an app that does not define `jiraDeploymentInfoProvider` module it will be rejected with a 403.  See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details about Connect JWT tokens. See https://developer.atlassian.com/cloud/jira/software/integrate-jsw-cloud-with-onpremises-tools/ for details about on-premise integrations. 
  ///
  /// * [SubmitDeploymentRequest] submitDeploymentRequest (required):
  ///   Deployment data to submit. 
  Future<SubmitDeploymentsResponse?> submitDeployments(String authorization, SubmitDeploymentRequest submitDeploymentRequest, { Future<void>? abortTrigger, }) async {
    final response = await submitDeploymentsWithHttpInfo(authorization, submitDeploymentRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'SubmitDeploymentsResponse',) as SubmitDeploymentsResponse;
    
    }
    return null;
  }
}
